using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
using DevExpress.Web;
using System.Diagnostics;



namespace TTWeb
{
    public partial class CompletedSchedules : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            string mReason = HttpContext.Current.Request.Params["__CALLBACKPARAM"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    string mCallbackId = (string)Request.Params["__CALLBACKID"];
                    string[] mdel = mCallbackId.Split(new char[1] { '$' });

                    if (mdel[mdel.Length - 1].EndsWith("ASPxGridViewAllSCHs"))
                    {
                        ((SessionResourceTracker)mSessionResourceTracker).CleanupSessionObjects();
                        MasterDataBind();
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
                if (mSessionResourceTracker == null)
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
                
                MasterDataBind();
            }
            else
            {
                if (mSessionResourceTracker == null)
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
                ((SessionResourceTracker)mSessionResourceTracker).CleanupSessionObjects();
                //Global.UpdateTitle(ASPxRoundPanel1);
                MasterDataBind();
            }
        }

        protected override void OnUnload(EventArgs e)
        {
            base.OnUnload(e);
        }

        private void MasterDataBind()
        {
            
            ASPxGridViewAllSCHs.DataSource = Global.ExecuteStoredProcedure("View_All_Completed_SCHs", new string[1] { "@USER_ID" }, new Object[1] { Global.CustomSession["UserId"] });
            Global.CustomSession["AllCompletedSchedulesTable"] = ASPxGridViewAllSCHs.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("AllCompletedSchedulesTable");
            Global.CustomSession["Grid"] = "ASPxGridViewAllSCHs";
            ASPxGridViewAllSCHs.DataBind();
        }

        private int index = 0; 

        protected void ASPxGridViewAllSCHs_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "Status")
            {
                e.Cell.ToolTip = e.CellValue.ToString();

            }

            if ((e.GetValue("Tooltip") != null) && (e.DataColumn.FieldName == "Description"))
            {
                e.Cell.ToolTip = e.GetValue("Tooltip").ToString();
            }

        }

        protected void ASPxGridViewAllSCHs_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            if (e.Expanded)
            {
                object TTID = mGrid.GetDataRow(e.VisibleIndex)["Hidden_id"];
                Global.CustomSession["TTID"] = TTID;
                Global.CustomSession["Expanded"] = true;
            }
            else
            {
                Global.CustomSession.Remove("Expanded");
            }
        }

        protected void ASPxGridViewAllSCHs_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
           
        }


        protected void ASPxMenu1_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
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
            ASPxGridViewAllSCHs.Columns["StatusIcon"].Visible = !show;
        }

    }
}