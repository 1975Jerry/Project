using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using System.Diagnostics;
using System.Globalization;

namespace TTWeb
{
    public partial class ActiveFixedTickets : System.Web.UI.Page
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
                    //if (Global.CustomSession["ActiveFixedTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewActiveFixedTickets.DataSource = Global.CustomSession["ActiveFixedTicketsTable"];
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
                   // if (Global.CustomSession["ActiveFixedTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewActiveFixedTickets.DataSource = Global.CustomSession["ActiveFixedTicketsTable"];
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
            ASPxGridViewActiveFixedTickets.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Ticket?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewActiveFixedTickets.DataSource = Global.ExecuteStoredProcedure("Fixed_Ticket_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActiveFixedTicketsTable"] = ASPxGridViewActiveFixedTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActiveFixedTicketsTable");
            ASPxGridViewActiveFixedTickets.DataBind();
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
            //ASPxGridViewActiveFixedTickets.Columns["Attention"].Visible = !show;
            //ASPxGridViewActiveFixedTickets.Columns["Priority"].Visible = !show;
            //ASPxGridViewActiveFixedTickets.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewActiveFixedTickets.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewActiveFixedTickets.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewActiveFixedTickets.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemAddWindSite = mASPxMenu.Items.FindByName("AddTicket");
            if (!mRoles.Contains("Fixed Tickets Editor"))
            {
                mItemAddWindSite.Enabled = false;
            }
            else
            {
                mItemAddWindSite.Enabled = true;
            }
        }

        protected void ASPxGridViewActiveFixedTickets_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Fixed_Ticket_Update_Insert", new string[11] { "@ID", "@TICKET_ID", "@ISSUE_DATE", "@SLA", "@NAME", "@PHONE", "@ADDRESS", "@AREA", "@ISSUE", "@COMMENTS", "@UPDATED_BY" },

            new Object[11] { System.DBNull.Value, e.NewValues["TICKET_ID"], e.NewValues["ISSUE_DATE"], e.NewValues["SLA"], e.NewValues["NAME"], e.NewValues["PHONE"], e.NewValues["ADDRESS"], e.NewValues["AREA"], e.NewValues["ISSUE"], e.NewValues["COMMENTS"], Global.CustomSession["UserId"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveFixedTickets_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Fixed_Ticket_Update_Insert", new string[11] { "@ID", "@TICKET_ID", "@ISSUE_DATE", "@SLA", "@NAME", "@PHONE", "@ADDRESS", "@AREA", "@ISSUE", "@COMMENTS", "@UPDATED_BY" },

             new Object[11] { e.Keys[0], e.NewValues["TICKET_ID"], e.NewValues["ISSUE_DATE"], e.NewValues["SLA"], e.NewValues["NAME"], e.NewValues["PHONE"], e.NewValues["ADDRESS"], e.NewValues["AREA"], e.NewValues["ISSUE"], e.NewValues["COMMENTS"], Global.CustomSession["UserId"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveFixedTickets_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Fixed_Ticket_Delete", new string[1] { "@id" }, new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveFixedTickets_Load(object sender, EventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            mGrid.Columns[0].Visible = mRoles.Contains("Fixed Tickets Editor");
        }


        protected void ASPxGridViewActiveFixedTickets_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

            switch (e.Column.FieldName)
            {
                case "ISSUE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Fixed_Issues_Lookup", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Issue"].ToString(), mDataTable.Rows[i]["Issue"]);
                        }
                    }
                    break;

                case "SLA":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Fixed_SLAs_Lookup", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["SLA"].ToString(), mDataTable.Rows[i]["SLA"]);
                        }
                    }
                    break;

                case "AREA":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Fixed_Areas_Lookup", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Area"].ToString(), mDataTable.Rows[i]["Area"]);
                        }
                    }
                    break;

                case "TICKET_ID":
                    {
                        ASPxGridView mGrid = sender as ASPxGridView;
                        e.Editor.ReadOnly = !mGrid.IsNewRowEditing;
                    }
                    break;

                case "ISSUE_DATE":
                    {
                        ASPxGridView mGrid = sender as ASPxGridView;
                        DateTime now = DateTime.Now;
                        e.Editor.Value = now;
                    }
                    break;



            }
          }

       

        protected void ASPxGridViewActiveFixedTickets_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

        protected void ASPxGridViewAppointments_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            //string[] keyValues = keyValue.ToString().Split('|');

            detailGrid.DataSource = Global.ExecuteStoredProcedure("Fixed_Appointments_per_Ticket", new string[1] { "@Ticket_id" }, new Object[1] { keyValue });

        }


    }
}


 
	