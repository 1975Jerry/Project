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
    public partial class CompletedBuildings : System.Web.UI.Page
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
                    if (Global.CustomSession["CompletedBuildingsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCompletedBuildings.DataSource = Global.CustomSession["CompletedBuildingsTable"];
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
                    if (Global.CustomSession["CompletedBuildingsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCompletedBuildings.DataSource = Global.CustomSession["CompletedBuildingsTable"];
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
            ASPxGridViewCompletedBuildings.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Building definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewCompletedBuildings.DataSource = Global.ExecuteStoredProcedure("BU_Completed_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["CompletedBuildingsTable"] = ASPxGridViewCompletedBuildings.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("CompletedBuildingsTable");
            ASPxGridViewCompletedBuildings.DataBind();
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
            //ASPxGridViewCompletedBuildings.Columns["Attention"].Visible = !show;
            //ASPxGridViewCompletedBuildings.Columns["Priority"].Visible = !show;
            //ASPxGridViewCompletedBuildings.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewCompletedBuildings.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewCompletedBuildings.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewCompletedBuildings.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxGridViewCompletedBuildings_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
          if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }
    }
}


 
	