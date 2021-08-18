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
    public partial class CompletedCosTelemg : System.Web.UI.Page
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
                    if (Global.CustomSession["CompletedCosTelemgTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCompletedCosTelemg.DataSource = Global.CustomSession["CompletedCosTelemgTable"];
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
                    if (Global.CustomSession["CompletedCosTelemgTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCompletedCosTelemg.DataSource = Global.CustomSession["CompletedCosTelemgTable"];
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
            ASPxGridViewCompletedCosTelemg.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Telemg Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewCompletedCosTelemg.DataSource = Global.ExecuteStoredProcedure("Cos_Telemg_Completed_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["CompletedCosTelemgTable"] = ASPxGridViewCompletedCosTelemg.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("CompletedCosTelemgTable");
            ASPxGridViewCompletedCosTelemg.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewCompletedCosTelemg.AddNewRow();
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
            //ASPxGridViewCompletedCosTelemg.Columns["CANCELLED"].Visible = !show;
            //ASPxGridViewCompletedCosTelemg.Columns["Priority"].Visible = !show;
            //ASPxGridViewCompletedCosTelemg.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewCompletedCosTelemg.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewCompletedCosTelemg.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewCompletedCosTelemg.Columns["Response_Freeze"].Visible = !show;
        }



        protected void ASPxGridViewCompletedCosTelemg_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


 




    }
}


 
	