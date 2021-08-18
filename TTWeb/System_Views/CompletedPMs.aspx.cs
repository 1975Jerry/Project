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
    public partial class CompletedPMs : System.Web.UI.Page
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
                    if (Global.CustomSession["CompletedPMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCompletedPMs.DataSource = Global.CustomSession["CompletedPMsTable"];
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
                    if (Global.CustomSession["CompletedPMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCompletedPMs.DataSource = Global.CustomSession["CompletedPMsTable"];
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
            ASPxGridViewCompletedPMs.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific PM definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewCompletedPMs.DataSource = Global.ExecuteStoredProcedure("PM_Completed_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["CompletedPMsTable"] = ASPxGridViewCompletedPMs.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("CompletedPMsTable");
            ASPxGridViewCompletedPMs.DataBind();
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
            //ASPxGridViewCompletedPMs.Columns["Attention"].Visible = !show;
            //ASPxGridViewCompletedPMs.Columns["Priority"].Visible = !show;
            //ASPxGridViewCompletedPMs.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewCompletedPMs.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewCompletedPMs.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewCompletedPMs.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxGridViewCompletedPMs_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
          if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }
    }
}


 
	