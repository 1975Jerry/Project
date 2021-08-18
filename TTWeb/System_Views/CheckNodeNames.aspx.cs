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
    public partial class CheckNodeNames : System.Web.UI.Page
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
                    if (Global.CustomSession["CheckNodeNamesTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCheckNodeNames.DataSource = Global.CustomSession["CheckNodeNamesTable"];
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
                    if (Global.CustomSession["CheckNodeNamesTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCheckNodeNames.DataSource = Global.CustomSession["CheckNodeNamesTable"];
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
            ASPxGridViewCheckNodeNames.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific PM definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewCheckNodeNames.DataSource = Global.ExecuteStoredProcedure("Nodes_Check_Ticket_Names", new string[0] { }, new Object[0] { });
            Global.CustomSession["CheckNodeNamesTable"] = ASPxGridViewCheckNodeNames.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("CheckNodeNamesTable");
            ASPxGridViewCheckNodeNames.DataBind();
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
            //ASPxGridViewCheckNodeNames.Columns["Attention"].Visible = !show;
            //ASPxGridViewCheckNodeNames.Columns["Priority"].Visible = !show;
            //ASPxGridViewCheckNodeNames.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewCheckNodeNames.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewCheckNodeNames.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewCheckNodeNames.Columns["Response_Freeze"].Visible = !show;
        }
    }
}


 
	