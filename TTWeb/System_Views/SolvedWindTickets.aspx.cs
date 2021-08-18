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
    public partial class SolvedWindTickets : System.Web.UI.Page
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
                    if (Global.CustomSession["SolvedWindTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewSolvedWindTickets.DataSource = Global.CustomSession["SolvedWindTicketsTable"];
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
                    if (Global.CustomSession["SolvedWindTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewSolvedWindTickets.DataSource = Global.CustomSession["SolvedWindTicketsTable"];
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
            ASPxGridViewSolvedWindTickets.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific WindTicket PM definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewSolvedWindTickets.DataSource = Global.ExecuteStoredProcedure("SolvedWTickets_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["SolvedWindTicketsTable"] = ASPxGridViewSolvedWindTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("SolvedWindTicketsTable");
            ASPxGridViewSolvedWindTickets.DataBind();
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
            //ASPxGridViewSolvedWindTickets.Columns["Attention"].Visible = !show;
            ASPxGridViewSolvedWindTickets.Columns["Priority"].Visible = !show;
            //ASPxGridViewSolvedWindTickets.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewSolvedWindTickets.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewSolvedWindTickets.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewSolvedWindTickets.Columns["Response_Freeze"].Visible = !show;
        }



        protected void ASPxGridViewSolvedWindTickets_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
          if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

        protected void ASPxGridViewSolvedWindTickets_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.Name == "Priority")
            {
                e.Cell.ToolTip = e.CellValue.ToString();
            }
        }



    }
}


 
	