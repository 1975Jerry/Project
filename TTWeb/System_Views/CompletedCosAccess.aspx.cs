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
    public partial class CompletedCosAccess : System.Web.UI.Page
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
                    if (Global.CustomSession["CompletedCosAccessTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCompletedCosAccess.DataSource = Global.CustomSession["CompletedCosAccessTable"];
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
                    if (Global.CustomSession["CompletedCosAccessTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCompletedCosAccess.DataSource = Global.CustomSession["CompletedCosAccessTable"];
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
            ASPxGridViewCompletedCosAccess.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Access Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewCompletedCosAccess.DataSource = Global.ExecuteStoredProcedure("Cos_Access_Completed_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["CompletedCosAccessTable"] = ASPxGridViewCompletedCosAccess.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("CompletedCosAccessTable");
            ASPxGridViewCompletedCosAccess.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewCompletedCosAccess.AddNewRow();
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
            //ASPxGridViewCompletedCosAccess.Columns["CANCELLED"].Visible = !show;
            //ASPxGridViewCompletedCosAccess.Columns["Priority"].Visible = !show;
            //ASPxGridViewCompletedCosAccess.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewCompletedCosAccess.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewCompletedCosAccess.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewCompletedCosAccess.Columns["Response_Freeze"].Visible = !show;
        }



        protected void ASPxGridViewCompletedCosAccess_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


 




    }
}


 
	