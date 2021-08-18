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
    public partial class CompletedWindPMs : System.Web.UI.Page
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
                    if (Global.CustomSession["CompletedWindPMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCompletedWindPMs.DataSource = Global.CustomSession["CompletedWindPMsTable"];
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
                    if (Global.CustomSession["CompletedWindPMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCompletedWindPMs.DataSource = Global.CustomSession["CompletedWindPMsTable"];
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
            ASPxGridViewCompletedWindPMs.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific PM definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewCompletedWindPMs.DataSource = Global.ExecuteStoredProcedure("W_PM_Completed_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["CompletedWindPMsTable"] = ASPxGridViewCompletedWindPMs.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("CompletedWindPMsTable");
            ASPxGridViewCompletedWindPMs.DataBind();
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
            //ASPxGridViewCompletedWindPMs.Columns["Attention"].Visible = !show;
            //ASPxGridViewCompletedWindPMs.Columns["Priority"].Visible = !show;
            //ASPxGridViewCompletedWindPMs.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewCompletedWindPMs.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewCompletedWindPMs.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewCompletedWindPMs.Columns["Response_Freeze"].Visible = !show;
        }



        protected void ASPxGridViewCompletedWindPMs_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
          if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


    }
}


 
	