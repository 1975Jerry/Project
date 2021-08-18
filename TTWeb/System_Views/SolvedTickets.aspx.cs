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
    public partial class SolvedTickets : System.Web.UI.Page
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
                    if (Global.CustomSession["SolvedTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewSolvedTickets.DataSource = Global.CustomSession["SolvedTicketsTable"];
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
                    if (Global.CustomSession["SolvedTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewSolvedTickets.DataSource = Global.CustomSession["SolvedTicketsTable"];
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
            ASPxGridViewSolvedTickets.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Head Office definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewSolvedTickets.DataSource = Global.ExecuteStoredProcedure("SolvedTickets_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["SolvedTicketsTable"] = ASPxGridViewSolvedTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("SolvedTicketsTable");
            ASPxGridViewSolvedTickets.DataBind();
        }

        protected void ASPxGridViewSolvedTickets_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            if (e.Expanded)
            {
                object TTID = mGrid.GetDataRow(e.VisibleIndex)["TT_Id"];
                Global.CustomSession["Ticket_ID"] = TTID;
                Global.CustomSession["ExpandedTicket"] = true;
            }
            else
            {
                Global.CustomSession.Remove("ExpandedTicket");
            }
        }
       
        protected void ASPxGridViewSolvedTickets_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.Name == "Priority")
            {
                e.Cell.ToolTip =  e.CellValue.ToString();
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
            ASPxGridViewSolvedTickets.Columns["Attention"].Visible = !show;
            ASPxGridViewSolvedTickets.Columns["Priority"].Visible = !show;
            ASPxGridViewSolvedTickets.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            ASPxGridViewSolvedTickets.Columns["Freeze_Flag"].Visible = !show;
            ASPxGridViewSolvedTickets.Columns["Restore_Freeze"].Visible = !show;
            ASPxGridViewSolvedTickets.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxGridViewSolvedTickets_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Tickets_ToBeScheduled_Update", new string[3] { "@tt_id", "@user_id", "@ToBeScheduled" },
                               new Object[3] { e.Keys[0], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewSolvedTickets_Load(object sender, EventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            mGrid.Columns[0].Visible = mRoles.Contains("TT Editor");
        }
    }
}