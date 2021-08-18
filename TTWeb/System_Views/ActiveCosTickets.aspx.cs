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
    public partial class ActiveCosTickets : System.Web.UI.Page
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
                    if (Global.CustomSession["ActiveCosTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveCosTickets.DataSource = Global.CustomSession["ActiveCosTicketsTable"];
                    }
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
                    if (Global.CustomSession["ActiveCosTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveCosTickets.DataSource = Global.CustomSession["ActiveCosTicketsTable"];
                    }
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
            ASPxGridViewActiveCosTickets.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewActiveCosTickets.DataSource = Global.ExecuteStoredProcedure("Cos_Tickets_Active_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActiveCosTicketsTable"] = ASPxGridViewActiveCosTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActiveCosTicketsTable");
            ASPxGridViewActiveCosTickets.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewActiveCosTickets.AddNewRow();
        }

 
        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_COS_TICKET", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewActiveCosTickets;

            e.Result = mDataTable.Rows[0][0].ToString() + ";" + e.Parameter.ToString() + ";" + dberror;
            MasterDataBind();
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
            //ASPxGridViewActiveCosTickets.Columns["CANCELLED"].Visible = !show;
            //ASPxGridViewActiveCosTickets.Columns["Priority"].Visible = !show;
            //ASPxGridViewActiveCosTickets.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewActiveCosTickets.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewActiveCosTickets.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewActiveCosTickets.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            DevExpress.Web.MenuItem mItemAddSuppl = mASPxMenu.Items.FindByName("AddSuppl");

            if (!mRoles.Contains("SRI Cosmote Tickets Creator"))
            {
                mItemCreateSRI.Enabled = false;
            }
            else
            {
                mItemCreateSRI.Enabled = true;
            }

            if (!mRoles.Contains("Cosmote Tickets Editor"))
            {
                mItemAddSuppl.Enabled = false;
            }
            else
            {
                mItemAddSuppl.Enabled = true;
            }


        }

        protected void ASPxGridViewActiveCosTickets_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


        protected void ASPxGridViewActiveCosTickets_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("COS_Ticket_Insert_Update", new string[12] { "@ID", "@COS_TICKET_ID", "@SRI", "@SITE", "@STATUS", "@SEVERITY", "@Region", "@PROBLEM", "@EVENT_DATE", "@SOLVED_DATE", "@USER_ID", "@ToBeScheduled" },

                new Object[12] { System.DBNull.Value, e.NewValues["COS_TICKET_ID"], e.NewValues["SRI"], e.NewValues["SITE"], e.NewValues["STATUS"], e.NewValues["SEVERITY"], e.NewValues["Region"], e.NewValues["PROBLEM"], e.NewValues["EVENT_DATE"], e.NewValues["SOLVED_DATE"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }





        protected void ASPxGridViewActiveCosTickets_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {


            Global.ExecuteStoredProcedureNoResults("COS_Ticket_Insert_Update", new string[12] { "@ID", "@COS_TICKET_ID", "@SRI", "@SITE", "@STATUS", "@SEVERITY", "@Region", "@PROBLEM", "@EVENT_DATE", "@SOLVED_DATE", "@USER_ID", "@ToBeScheduled" },

                new Object[12] { e.Keys[0], e.NewValues["COS_TICKET_ID"], e.NewValues["SRI"], e.NewValues["SITE"], e.NewValues["STATUS"], e.NewValues["SEVERITY"], e.NewValues["Region"], e.NewValues["PROBLEM"], e.NewValues["EVENT_DATE"], e.NewValues["SOLVED_DATE"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveCosTickets_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Cos_Tickets_Delete", new string[1] { "@TT_ID" },
                               new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        //protected void ASPxGridViewActiveCosTickets_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        //{
        //    switch (e.Column.FieldName)
        //    {
        //        //case "Region":
        //        //    {
        //        //        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
        //        //        DataTable mDataTable = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
        //        //        for (int i = 0; i < mDataTable.Rows.Count; i++)
        //        //        {
        //        //            mCombobox.Items.Add(mDataTable.Rows[i]["Region"].ToString(), mDataTable.Rows[i]["Region"]);
        //        //        }
        //        //    }
        //        //    break;

        //        case "NAME":
        //            {
        //                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
        //                DataTable mDataTable = Global.ExecuteStoredProcedure("Nodes_Lookup_Sites", null, null);
        //                for (int i = 0; i < mDataTable.Rows.Count; i++)
        //                {
        //                    mCombobox.Items.Add(mDataTable.Rows[i]["SITE"].ToString(), mDataTable.Rows[i]["SITE"]);
        //                }
        //            }

        //            break;
        //    }
        //}

        //protected void ASPxGridViewActiveCosTickets_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        //{
        //    if (e.ButtonType == ColumnCommandButtonType.Edit || e.ButtonType == ColumnCommandButtonType.Delete)
        //    {
        //        List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
        //        e.Visible = mRoles.Contains("Suppl Editor");
        //    }
        //}

        protected void ASPxGridViewActiveCosTickets_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;

                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("Cosmote Tickets Editor");;

        }

        protected void ASPxGridViewActiveCosTickets_CellEditorInitialize1(object sender, ASPxGridViewEditorEventArgs e)
        {
            switch (e.Column.FieldName)
            {
                case "STATUS":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Cos_Ticket_Lookup_Status", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["STATUS"].ToString(), mDataTable.Rows[i]["STATUS"]);
                        }
                    }
                    break;

                case "SEVERITY":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Cos_Ticket_Lookup_Severity", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["SEVERITY"].ToString(), mDataTable.Rows[i]["SEVERITY"]);
                        }
                    }
                    break;

                case "SITE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Cos_Lookup_Sites", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Site"].ToString(), mDataTable.Rows[i]["Site"]);
                        }
                    }
                    break;

                case "PROBLEM":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Cos_Ticket_Lookup_Problem", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["PROBLEM"].ToString(), mDataTable.Rows[i]["PROBLEM"]);
                        }
                    }
                    break;

                case "Region":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Region"].ToString(), mDataTable.Rows[i]["Region"]);
                        }
                    }
                    break;
            }

        }





    }
}


 
	