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
    public partial class AddedTickets : System.Web.UI.Page
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
                    //if (Global.CustomSession["AddedTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewAddedTickets.DataSource = Global.CustomSession["AddedTicketsTable"];
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
                    //if (Global.CustomSession["AddedTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewAddedTickets.DataSource = Global.CustomSession["AddedTicketsTable"];
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
            ASPxGridViewAddedTickets.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Ticket definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewAddedTickets.DataSource = Global.ExecuteStoredProcedure("AddedTickets_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["AddedTicketsTable"] = ASPxGridViewAddedTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("AddedTicketsTable");
            ASPxGridViewAddedTickets.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewAddedTickets.AddNewRow();
        }
         
        protected void ASPxGridViewAddedTickets_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.Name == "Priority")
            {
                e.Cell.ToolTip =  e.CellValue.ToString();

            }

            else
            if (e.GetValue("Tooltip") != null)
            {
                e.Cell.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

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
            ASPxGridViewAddedTickets.Columns["Priority"].Visible = !show;
            ASPxGridViewAddedTickets.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            ASPxGridViewAddedTickets.Columns["Freeze_Flag"].Visible = !show;
            ASPxGridViewAddedTickets.Columns["Cancellation_Flag"].Visible = !show;

        }

        protected void ASPxGridViewAddedTickets_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Ticket_Add", 
                new string[16] { "@TT_Id", "@Send_to_Vendor_Datetime", "@Location", "@Priority", "@Short_Description", 
                                    "@Ticket_Type", "@Status", "@Current_Owner", "@Cancellation_Flag", "@Resolution_Datetime", "@Response_Datetime", "@Kintec_Rejection_Status_Flag", "@Freeze_Flag", "@user_id", "@INC_Start_Datetime", "@INC_End_Datetime"},

                new Object[16] { e.NewValues["TT_Id"], e.NewValues["Send_to_Vendor_Datetime"], e.NewValues["Location"], e.NewValues["Priority"], e.NewValues["Short_Description"], 
                                    e.NewValues["Ticket_Type"], e.NewValues["Status"], System.DBNull.Value, e.NewValues["Cancellation_Flag"], e.NewValues["Resolution_Datetime"], e.NewValues["Response_Datetime"],
                                    e.NewValues["Kintec_Rejection_Status_Flag"], e.NewValues["Freeze_Flag"], Global.CustomSession["UserId"], e.NewValues["INC_Start_Datetime"], e.NewValues["INC_End_Datetime"]});
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewAddedTickets_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            ASPxTextBox mTTId = mGrid.FindEditFormTemplateControl("TTId") as ASPxTextBox;
            Global.ExecuteStoredProcedureNoResults("Ticket_Update",
                new string[17] { "@TT_Id", "@Send_to_Vendor_Datetime", "@Location", "@Priority", "@Short_Description", 
                                    "@Ticket_Type", "@Status", "@Current_Owner", "@Cancellation_Flag", "@Resolution_Datetime", "@Response_Datetime", "@Kintec_Rejection_Status_Flag", "@Freeze_Flag", "@user_id", "@INC_Start_Datetime", "@INC_End_Datetime", "@New_TT_Id"},
                new Object[17] { e.Keys[0], e.NewValues["Send_to_Vendor_Datetime"], e.NewValues["Location"], e.NewValues["Priority"], e.NewValues["Short_Description"], 
                                    e.NewValues["Ticket_Type"], e.NewValues["Status"], System.DBNull.Value, e.NewValues["Cancellation_Flag"], e.NewValues["Resolution_Datetime"], e.NewValues["Response_Datetime"],
                                    e.NewValues["Kintec_Rejection_Status_Flag"], e.NewValues["Freeze_Flag"], Global.CustomSession["UserId"], e.NewValues["INC_Start_Datetime"], e.NewValues["INC_End_Datetime"], mTTId.Text});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewAddedTickets_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Ticket_Delete",new string[1] { "@TT_Id"}, new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewAddedTickets_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.EditForm)
            {
                ASPxComboBox combo = (sender as ASPxGridView).FindEditFormTemplateControl("TicketType") as ASPxComboBox;
                if (combo != null)
                {
                    DataTable table = Global.ExecuteStoredProcedure("Config_Admin_SRI_Category_List", null, null);
                    combo.DataSource = table;
                    combo.ValueField = "SRI_Category";
                    combo.TextField = "SRI_Category";
                    combo.ValueType = typeof(string);
                    combo.DataBindItems();
                }

                ASPxComboBox comboLoc = (sender as ASPxGridView).FindEditFormTemplateControl("Location") as ASPxComboBox;
                if (comboLoc != null)
                {
                    DataTable tableLoc = Global.ExecuteStoredProcedure("Nodes_Lookup_Sites", null, null);
                    comboLoc.DataSource = tableLoc;
                    comboLoc.ValueField = "SITE";
                    comboLoc.TextField = "SITE";
                    comboLoc.ValueType = typeof(string);
                    comboLoc.DataBindItems();
                }

                if (((ASPxGridView)sender).IsNewRowEditing == true)
                {
                    combo.SelectedIndex = 0;
                    comboLoc.SelectedIndex = 0;
                }
            }
        }


    }
}

