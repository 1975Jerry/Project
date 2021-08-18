﻿using System;
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
    public partial class VisitsLastMonth : System.Web.UI.Page
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

                    if (mdel[mdel.Length - 1].EndsWith("ASPxGridViewAllVisits"))
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
                //Global.UpdateTitle(ASPxRoundPanel1);
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
            //Global.UpdateTitle(ASPxRoundPanel1);
            ASPxGridViewAllVisits.DataSource = Global.ExecuteStoredProcedure("View_SCH_Visits_Performed_Last_Month", new string[1] { "@USER_ID" }, new Object[1] { Global.CustomSession["UserId"] });
            Global.CustomSession["AllVisitsLastMonthTable"] = ASPxGridViewAllVisits.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("AllVisitsLastMonthTable");
            Global.CustomSession["Grid"] = "ASPxGridViewAllVisits";
            ASPxGridViewAllVisits.DataBind();
        }

        private int index = 0; 

        protected void ASPxGridViewAllVisits_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.FieldName == "Status")
            {
                e.Cell.ToolTip = e.CellValue.ToString();

            }
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter2.WriteXlsToResponse();
        }

        protected void btnPdfExport_Click(object sender, EventArgs e)
        {
             ASPxGridViewExporter2.WritePdfToResponse();
        }

        protected void ASPxGridViewAllVisits_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

        protected void ASPxMenu2_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
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
            ASPxGridViewAllVisits.Columns["StatusIcon"].Visible = !show;
        }
    }
}