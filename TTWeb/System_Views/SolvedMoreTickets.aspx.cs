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
    public partial class SolvedMoreTickets : System.Web.UI.Page
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
                    if (Global.CustomSession["SolvedMoreTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewSolvedMoreTickets.DataSource = Global.CustomSession["SolvedMoreTicketsTable"];
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
                    if (Global.CustomSession["SolvedMoreTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewSolvedMoreTickets.DataSource = Global.CustomSession["SolvedMoreTicketsTable"];
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
            ASPxGridViewSolvedMoreTickets.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewSolvedMoreTickets.DataSource = Global.ExecuteStoredProcedure("MORE_Tickets_Completed_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["SolvedMoreTicketsTable"] = ASPxGridViewSolvedMoreTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("SolvedMoreTicketsTable");
            ASPxGridViewSolvedMoreTickets.DataBind();
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
            //ASPxGridViewSolvedMoreTickets.Columns["CANCELLED"].Visible = !show;
            //ASPxGridViewSolvedMoreTickets.Columns["Priority"].Visible = !show;
            //ASPxGridViewSolvedMoreTickets.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewSolvedMoreTickets.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewSolvedMoreTickets.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewSolvedMoreTickets.Columns["Response_Freeze"].Visible = !show;
        }

      

        protected void ASPxGridViewSolvedMoreTickets_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


 
        
        protected void ASPxGridViewSolvedMoreTickets_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;

                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("More Tickets Editor");;

        }

       

        
    }
}


 
	