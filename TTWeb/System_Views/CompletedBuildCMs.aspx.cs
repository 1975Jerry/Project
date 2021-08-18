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
    public partial class CompletedBuildCMs : System.Web.UI.Page
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
                    if (Global.CustomSession["CompletedBuildCMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCompletedBuildCMs.DataSource = Global.CustomSession["CompletedBuildCMsTable"];
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
                    if (Global.CustomSession["CompletedBuildCMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCompletedBuildCMs.DataSource = Global.CustomSession["CompletedBuildCMsTable"];
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
            ASPxGridViewCompletedBuildCMs.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Implementation & Supplementary Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewCompletedBuildCMs.DataSource = Global.ExecuteStoredProcedure("BU_CM_Completed_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["CompletedBuildCMsTable"] = ASPxGridViewCompletedBuildCMs.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("CompletedBuildCMsTable");
            ASPxGridViewCompletedBuildCMs.DataBind();
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
            ASPxGridViewCompletedBuildCMs.Columns["CANCELLED"].Visible = !show;
            //ASPxGridViewCompletedBuildCMs.Columns["Priority"].Visible = !show;
            //ASPxGridViewCompletedBuildCMs.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewCompletedBuildCMs.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewCompletedBuildCMs.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewCompletedBuildCMs.Columns["Response_Freeze"].Visible = !show;
        }



        protected void ASPxGridViewCompletedBuildCMs_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("WORK_ORDER") != null)
            {
                e.Row.ToolTip = e.GetValue("WORK_ORDER").ToString();
            }
        }


        

    }
}


 
	