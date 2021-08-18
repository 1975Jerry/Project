using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using System.Diagnostics;
using System.Text;
using System.Collections;


namespace TTWeb
{
    public partial class ManagementTicketsReport : System.Web.UI.Page
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
                    //if (Global.CustomSession["ManagementTicketsReportTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewManagementTicketsReport.DataSource = Global.CustomSession["ManagementTicketsReportTable"];
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
                   // if (Global.CustomSession["ManagementTicketsReportTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewManagementTicketsReport.DataSource = Global.CustomSession["ManagementTicketsReportTable"];
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
            ASPxGridViewManagementTicketsReport.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            DateTime mdate;

            if (ASPxDateEdit1.Value == null)
            {
                DataTable mDataTable = Global.ExecuteStoredProcedure("Management_Report_Lookup_Date", null, null);
                mdate = (DateTime)mDataTable.Rows[0]["Schedule_date"];
            }
            else
            {
                mdate = (DateTime)ASPxDateEdit1.Value;
            }

            ASPxGridViewManagementTicketsReport.DataSource = Global.ExecuteStoredProcedure("Management_Report_List", new string[1] { "@FROM_DATE" }, new Object[1] { mdate });
            Global.CustomSession["ManagementTicketsReportTable"] = ASPxGridViewManagementTicketsReport.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ManagementTicketsReportTable");
            ASPxGridViewManagementTicketsReport.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewManagementTicketsReport.AddNewRow();
        }

 

        protected void ASPxMenu3_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
        {
            string mName = e.Item.Name;

            HideColumns(true);

            if (mName == "xls")
            {
                ASPxGridViewManagementTicketsReport.Columns["SCHEDULE_DATE"].Visible = true; 
                ASPxGridViewManagementTicketsReport.DataBind();
                ASPxGridViewExporter2.WriteXlsToResponse();
                ASPxGridViewManagementTicketsReport.Columns["SCHEDULE_DATE"].Visible = false; 
            
            }


            HideColumns(false);
        }


        void HideColumns(bool show)
        {
            //ASPxGridViewManagementTicketsReport.Columns["CANCELLED"].Visible = !show;
            //ASPxGridViewManagementTicketsReport.Columns["Priority"].Visible = !show;
            //ASPxGridViewManagementTicketsReport.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewManagementTicketsReport.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewManagementTicketsReport.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewManagementTicketsReport.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            //ASPxMenu mASPxMenu = (ASPxMenu)sender;
            //List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            //DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            //DevExpress.Web.MenuItem mItemAddSuppl = mASPxMenu.Items.FindByName("AddSuppl");

            //if (!mRoles.Contains("SRI More Tickets Creator"))
            //{
            //    mItemCreateSRI.Enabled = false;
            //}
            //else
            //{
            //    mItemCreateSRI.Enabled = true;
            //}

            //if (!mRoles.Contains("More Tickets Editor"))
            //{
            //    mItemAddSuppl.Enabled = false;
            //}
            //else
            //{
            //    mItemAddSuppl.Enabled = true;
            //}


        }

        protected void ASPxGridViewManagementTicketsReport_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


        protected void ASPxGridViewManagementTicketsReport_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Management_Report_Update_Insert",
                new string[27] { "@SCH_ITEM_TICKET_ID", "@SCHEDULE_DATE", "@ID", "@TEAM", "@ENGINEER", "@ENGINEER2", "@ENGINEER3", "@ENGINEER4", "@TT_ID", "@TICKET_SOURCE", "@SITE", "@PRIORITY", "@STATUS", "@TICKET_TYPE", "@GEOGRAPHICAL_LOCATION", "@VISIT", "@SITE_COMMENTS", "@EVENT", "@SOLVED", "@ENGINEER_COMMENTS", "@Updated_by", "@TA", "@SITE_CELL", "@ACCESS", "@LEASED_LINES", "@SPARES", "@SUBCO" },
                new Object[27] { System.DBNull.Value, ASPxDateEdit1.Value, e.NewValues["ID"], e.NewValues["TEAM"], e.NewValues["ENGINEER"], e.NewValues["ENGINEER2"], e.NewValues["ENGINEER3"], e.NewValues["ENGINEER4"], e.NewValues["TT_ID"], e.NewValues["TICKET_SOURCE"], e.NewValues["SITE"], e.NewValues["PRIORITY"], e.NewValues["STATUS"], e.NewValues["TICKET_TYPE"], e.NewValues["GEOGRAPHICAL_LOCATION"], e.NewValues["VISIT"], e.NewValues["SITE_COMMENTS"], e.NewValues["EVENT"], e.NewValues["SOLVED"], e.NewValues["ENGINEER_COMMENTS"], Global.CustomSession["UserId"], e.NewValues["TA"], e.NewValues["SITE_CELL"], e.NewValues["ACCESS"], e.NewValues["LEASED_LINES"], e.NewValues["SPARES"], e.NewValues["SUBCO"] });
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        

        protected void ASPxGridViewManagementTicketsReport_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {


            Global.ExecuteStoredProcedureNoResults("Management_Report_Update_Insert",
                new string[27] { "@SCH_ITEM_TICKET_ID", "@SCHEDULE_DATE", "@ID", "@TEAM", "@ENGINEER", "@ENGINEER2", "@ENGINEER3", "@ENGINEER4", "@TT_ID", "@TICKET_SOURCE", "@SITE", "@PRIORITY", "@STATUS", "@TICKET_TYPE", "@GEOGRAPHICAL_LOCATION", "@VISIT", "@SITE_COMMENTS", "@EVENT", "@SOLVED", "@ENGINEER_COMMENTS", "@Updated_by", "@TA", "@SITE_CELL", "@ACCESS", "@LEASED_LINES", "@SPARES", "@SUBCO" },
                new Object[27] { e.Keys[0], ASPxDateEdit1.Value, e.NewValues["ID"], e.NewValues["TEAM"], e.NewValues["ENGINEER"], e.NewValues["ENGINEER2"], e.NewValues["ENGINEER3"], e.NewValues["ENGINEER4"], e.NewValues["TT_ID"], e.NewValues["TICKET_SOURCE"], e.NewValues["SITE"], e.NewValues["PRIORITY"], e.NewValues["STATUS"], e.NewValues["TICKET_TYPE"], e.NewValues["GEOGRAPHICAL_LOCATION"], e.NewValues["VISIT"], e.NewValues["SITE_COMMENTS"], e.NewValues["EVENT"], e.NewValues["SOLVED"], e.NewValues["ENGINEER_COMMENTS"], Global.CustomSession["UserId"], e.NewValues["TA"], e.NewValues["SITE_CELL"], e.NewValues["ACCESS"], e.NewValues["LEASED_LINES"], e.NewValues["SPARES"], e.NewValues["SUBCO"] });
                    
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewManagementTicketsReport_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Management_Report_Delete", new string[1] { "@id"},
                               new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }


        protected void ASPxGridViewManagementTicketsReport_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;

                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("More Tickets Editor");;

        }

        protected void ASPxGridViewManagementTicketsReport_CellEditorInitialize1(object sender, ASPxGridViewEditorEventArgs e)
        {


            //ASPxGridView grid = sender as ASPxGridView;

            switch (e.Column.FieldName)
            {
                case "TEAM":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Teams_Lookup", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Team"].ToString(), mDataTable.Rows[i]["Team"]);
                        }
                    }
                    break;

                case "ENGINEER":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("All_Users_Lookup", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["TT_USER"].ToString(), mDataTable.Rows[i]["TT_USER"]);
                        }
                    }
                    break;

                case "ENGINEER2":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("All_Users_Lookup", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["TT_USER"].ToString(), mDataTable.Rows[i]["TT_USER"]);
                        }
                    }
                    break;

                case "ENGINEER3":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("All_Users_Lookup", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["TT_USER"].ToString(), mDataTable.Rows[i]["TT_USER"]);
                        }
                    }
                    break;

                case "ENGINEER4":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("All_Users_Lookup", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["TT_USER"].ToString(), mDataTable.Rows[i]["TT_USER"]);
                        }
                    }
                    break;

                case "TICKET_SOURCE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Lookup_Manag_Report_Ticket_Source", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["TICKET_SOURCE"].ToString(), mDataTable.Rows[i]["TICKET_SOURCE"]);
                        }
                    }
                    break;

                case "PRIORITY":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Lookup_Manag_Report_Priority", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["PRIORITY"].ToString(), mDataTable.Rows[i]["PRIORITY"]);
                        }
                    }
                    break;

                case "STATUS":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Lookup_Manag_Report_Status", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["STATUS"].ToString(), mDataTable.Rows[i]["STATUS"]);
                        }
                    }
                    break;

                case "TICKET_TYPE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Lookup_Manag_Report_Ticket_Type", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["TICKET_TYPE"].ToString(), mDataTable.Rows[i]["TICKET_TYPE"]);
                        }
                    }
                    break;

                case "GEOGRAPHICAL_LOCATION":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Lookup_Manag_Report_Geogr_Location", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["GEOGRAPHICAL_LOCATION"].ToString(), mDataTable.Rows[i]["GEOGRAPHICAL_LOCATION"]);
                        }
                    }
                    break;

                case "SUBCO":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Lookup_Manag_Report_Subco", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["SUBCO"].ToString(), mDataTable.Rows[i]["SUBCO"]);
                        }
                    }
                    break;                    
           }


        }



        protected void ASPxDateEdit1_Init(object sender, EventArgs e)
        {

            ASPxDateEdit mASPxDateEdit1 = (ASPxDateEdit)sender;

            DataTable mDataTable = Global.ExecuteStoredProcedure("Management_Report_Lookup_Date", null, null);

            mASPxDateEdit1.Value = mDataTable.Rows[0]["Schedule_date"];            

        }

        protected void ASPxGridViewManagementTicketsReport_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            
            ASPxGridView grid = (ASPxGridView)sender;
            string[] mres = e.Parameters.Split(new char[1] { ';' });
            string date = mres[0];
            DateTime mdate = DateTime.ParseExact(date, "yyyy-M-d", null);

            if (mres[1] == "UP")
            {
                Global.ExecuteStoredProcedure("Management_Report_Refresh", new string[2] { "@FROM_DATE", "@user_id" }, new Object[2] { mdate, Global.CustomSession["UserId"]});
            }


            ASPxGridViewManagementTicketsReport.DataSource = Global.ExecuteStoredProcedure("Management_Report_List", new string[1] { "@FROM_DATE" }, new Object[1] { mdate });
            Global.CustomSession["ManagementTicketsReportTable"] = ASPxGridViewManagementTicketsReport.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ManagementTicketsReportTable");
            ASPxGridViewManagementTicketsReport.DataBind();


        }

        protected void ASPxGridViewManagementTicketsReport_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName != "TT_ID") return;

            ASPxGridView mGrid = (ASPxGridView)sender;

            Int32 value = (Int32)mGrid.GetRowValues(e.VisibleIndex, "Updated");

            if (value == 1)
            {
                e.Cell.ForeColor = System.Drawing.Color.Blue;
                e.Cell.Font.Bold = true;
            }
        }


                
    }
}


 
	