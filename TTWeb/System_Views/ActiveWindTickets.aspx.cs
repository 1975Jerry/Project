using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using System.Diagnostics;

namespace TTWeb
{
    public partial class ActiveWindTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker =  Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                Debug.WriteLine("CALLBACKPARAM: " + HttpContext.Current.Request.Params["__CALLBACKPARAM"]);
                Debug.WriteLine("CALLBACKID: " + Page.Request.Params["__CALLBACKID"]);
                if (mSessionResourceTracker != null)
                {
                   // if (Global.CustomSession["ActiveWindTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewActiveWindTickets.DataSource = Global.CustomSession["ActiveWindTicketsTable"];
                    //}
                }
                else
                {
                    DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/DeadSession.aspx");
                    return;
                }
            }
            else if (Page.IsPostBack)
            {
                if (mSessionResourceTracker != null)
                {
                    //if (Global.CustomSession["ActiveWindTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewActiveWindTickets.DataSource = Global.CustomSession["ActiveWindTicketsTable"];
                    //}
                }
            }
            else
            {
                if (mSessionResourceTracker == null)
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
                ((SessionResourceTracker)mSessionResourceTracker).CleanupSessionObjects();
                MasterDataBind();
            }
            ASPxGridViewActiveWindTickets.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific WindTicket PM definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewActiveWindTickets.DataSource = Global.ExecuteStoredProcedure("ActiveWTickets_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActiveWindTicketsTable"] = ASPxGridViewActiveWindTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActiveWindTicketsTable");
            ASPxGridViewActiveWindTickets.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewActiveWindTickets.AddNewRow();
        }

 
        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_W", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewActiveWindTickets;
            //string[] mstrs = new string[2];
            //mstrs[0] = "SRI";
            //mstrs[1] = "TT_Id";
            //object[] res = (object[])mGrid.GetRowValuesByKeyValue(e.Parameter, mstrs);
            //e.Result = res[0].ToString() + ";" + res[1].ToString() + ";" + dberror;
            e.Result = mDataTable.Rows[0][0].ToString() + ";" + e.Parameter.ToString() + ";" + dberror;
            MasterDataBind();
        }

        //protected void ASPxGridViewActiveWindTickets_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        //{
        //    ASPxGridView mGrid = (ASPxGridView)sender;
        //    if (e.Expanded)
        //    {
        //        object TTID = mGrid.GetDataRow(e.VisibleIndex)["TT_Id"];
        //        Global.CustomSession["WindTicket_ID"] = TTID;
        //        Global.CustomSession["ExpandedWindTicket"] = true;
        //    }
        //    else
        //    {
        //        Global.CustomSession.Remove("ExpandedWindTicket");
        //    }
        //}



       
        //protected void ASPxGridViewActiveWindTickets_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        //{
        //    if (e.DataColumn.Name == "Priority")
        //    {
        //        e.Cell.ToolTip =  e.CellValue.ToString();

        //    }
        //}

        protected void ASPxMenu3_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
        {
            string mName = e.Item.Name;

            HideColumns(true);

            if (mName == "xls")
            { ASPxGridViewExporter2.WriteXlsToResponse(); }
            if (mName == "pdf")
            { ASPxGridViewExporter2.WritePdfToResponse(); }

            HideColumns(false);
        }


        void HideColumns(bool show)
        {
            //ASPxGridViewActiveWindTickets.Columns["Attention"].Visible = !show;
            ASPxGridViewActiveWindTickets.Columns["Priority"].Visible = !show;
            //ASPxGridViewActiveWindTickets.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewActiveWindTickets.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewActiveWindTickets.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewActiveWindTickets.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            DevExpress.Web.MenuItem mItemAddWindTicket = mASPxMenu.Items.FindByName("AddWindTicket");

            if (!mRoles.Contains("SRI Wind Ticket Creator"))
            {
                mItemCreateSRI.Enabled = false;
            }
            else
            {
                mItemCreateSRI.Enabled = true;
            }



        }

        protected void ASPxGridViewActiveWindTickets_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
          if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


        protected void ASPxGridViewActiveWindTickets_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("W_Ticket_Update_Insert", new string[19] { "@TT_Id", "@SRI", "@Status", "@Priority", "@Event_time", "@BSC", "@Object", "@Region", "@Zone", "@Problem", "@Comments", "@TT_receive_time", "@Repair_time", "@user_id", "@ToBeScheduled", "@ID", "@Submit_date", "@Vendor_resolution_date", "@Actual_resolution_date" },
                                           new Object[19] { e.NewValues["TT_Id"], e.NewValues["SRI"], e.NewValues["Status"], e.NewValues["Priority"], e.NewValues["Event_time"], e.NewValues["BSC"], e.NewValues["Object"], e.NewValues["Region"], e.NewValues["Zone"], e.NewValues["Problem"], e.NewValues["Comments"], e.NewValues["TT_receive_time"], e.NewValues["Repair_time"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"], System.DBNull.Value, e.NewValues["Submit_date"], e.NewValues["Vendor_resolution_date"], e.NewValues["Actual_resolution_date"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveWindTickets_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("W_Ticket_Update_Insert", new string[19] { "@TT_Id", "@SRI", "@Status", "@Priority", "@Event_time", "@BSC", "@Object", "@Region", "@Zone", "@Problem", "@Comments", "@TT_receive_time", "@Repair_time", "@user_id", "@ToBeScheduled", "@ID", "@Submit_date", "@Vendor_resolution_date", "@Actual_resolution_date" },
                                           new Object[19] { e.NewValues["TT_Id"], e.NewValues["SRI"], e.NewValues["Status"], e.NewValues["Priority"], e.NewValues["Event_time"], e.NewValues["BSC"], e.NewValues["Object"], e.NewValues["Region"], e.NewValues["Zone"], e.NewValues["Problem"], e.NewValues["Comments"], e.NewValues["TT_receive_time"], e.NewValues["Repair_time"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"], e.Keys[0], e.NewValues["Submit_date"], e.NewValues["Vendor_resolution_date"], e.NewValues["Actual_resolution_date"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveWindTickets_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("W_Ticket_Delete", new string[1] { "@ID" },
                               new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        

        protected void ASPxGridViewActiveWindTickets_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;
                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("Wind Ticket Editor");
        }

        protected void ASPxGridViewActiveWindTickets_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.Name == "Priority")
            {
                e.Cell.ToolTip = e.CellValue.ToString();
            }
        }

        //protected void ASPxGridViewActiveWindTickets_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        //{
        //    if (e.RowType == GridViewRowType.EditForm)
        //    {
        //        ASPxComboBox comboRegionNew = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxComboBoxBSC") as ASPxComboBox;
        //        if (comboRegionNew != null)
        //        {
        //            DataTable tableRegion = Global.ExecuteStoredProcedure("W_Lookup_BSC", null, null);
        //            comboRegionNew.DataSource = tableRegion;
        //            comboRegionNew.ValueField = "BSC";
        //            comboRegionNew.TextField = "BSC";
        //            comboRegionNew.ValueType = typeof(string);
        //            comboRegionNew.DataBindItems();
        //        }

        //        ASPxComboBox comboSite = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxComboBoxSite") as ASPxComboBox;
        //        if (comboSite != null)
        //        {
        //            DataTable tableSite = Global.ExecuteStoredProcedure("W_Lookup_Site", null, null);
        //            comboSite.DataSource = tableSite;
        //            comboSite.ValueField = "Object";
        //            comboSite.TextField = "Object";
        //            comboSite.ValueType = typeof(string);
        //            comboSite.DataBindItems();
        //        }

        //        ASPxComboBox comboProblem = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxComboBoxProblem") as ASPxComboBox;
        //        if (comboProblem != null)
        //        {
        //            DataTable tableProblem = Global.ExecuteStoredProcedure("W_Lookup_Problem", null, null);
        //            comboProblem.DataSource = tableProblem;
        //            comboProblem.ValueField = "Problem";
        //            comboProblem.TextField = "Problem";
        //            comboProblem.ValueType = typeof(string);
        //            comboProblem.DataBindItems();
        //        }


        //        ASPxComboBox comboRegion = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxComboBoxRegion") as ASPxComboBox;
        //        if (comboRegion != null)
        //        {
        //            DataTable tableRegion = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
        //            comboRegion.DataSource = tableRegion;
        //            comboRegion.ValueField = "Region";
        //            comboRegion.TextField = "Region";
        //            comboRegion.ValueType = typeof(string);
        //            comboRegion.DataBindItems();
        //        }

        //    }
        //}

       
    }
}


 
	