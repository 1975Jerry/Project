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
    public partial class RouterSchedules : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            string mReason = HttpContext.Current.Request.Params["__CALLBACKPARAM"];
            string mCallbackId = (string)Request.Params["__CALLBACKID"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    if (mReason.Contains("PAGER"))
                    {
                        MasterDataBind(false);
                        return;
                    }
                    string[] mdel = mCallbackId.Split(new char[1] { '$' });
                    if (mdel[mdel.Length - 1].EndsWith("ASPxGridViewRouteSCHs"))
                    {
                        //((SessionResourceTracker)mSessionResourceTracker).CleanupSessionObjects();
                        MasterDataBind(true);
                    }
                    if (ASPxCallbackRouteSelected.IsCallback)
                    {
                        return;
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
                MasterDataBind(true);
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
                MasterDataBind(true);
            }
        }

        protected override void OnUnload(EventArgs e)
        {
            base.OnUnload(e);
        }

        private void MasterDataBind(bool ClearSelection)
        {
            //Global.UpdateTitle(ASPxRoundPanel1);
            ASPxGridViewRouteSCHs.DataSource = Global.ExecuteStoredProcedure("View_Router_SCHs", new string[2] { "@USER_ID", "@TEAM" }, new Object[2] { Global.CustomSession["UserId"], ASPxComboBoxFrom.SelectedItem.Text });
            //Global.CustomSession["ASPxGridViewRouteSCHsTable"] = ASPxGridViewRouteSCHs.DataSource;
            //((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ASPxGridViewRouteSCHsTable");
            //Global.CustomSession["Grid"] = "ASPxGridViewRouteSCHs";
            ASPxGridViewRouteSCHs.DataBind();
            if (ClearSelection)
            {
                ASPxGridViewRouteSCHs.Selection.UnselectAll();
            }
        }

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

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter2.WriteXlsToResponse();
        }

        protected void btnPdfExport_Click(object sender, EventArgs e)
        {
             ASPxGridViewExporter2.WritePdfToResponse();
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
            ASPxGridViewRouteSCHs.Columns["StatusIcon"].Visible = !show;
        }

        protected void ASPxComboBoxFrom_Init(object sender, EventArgs e)
        {
            ASPxComboBox mCombo = (sender as ASPxComboBox);
            mCombo.ValueField = "TEAM";
            mCombo.TextField = "TEAM";
            //if (Global.CustomSession["Edit_SCH_InterventionType_list"] == null)
            {
                mCombo.DataSource = Global.ExecuteStoredProcedure("Lookup_Router_Roles", new string[1] { "@USER_ID" }, new Object[1] { Global.CustomSession["UserId"] });
                mCombo.DataBind();
            }
            if (mCombo.Items.Count != 0)
            {
                mCombo.SelectedIndex = 0;
            }
        }

        protected void ASPxComboBoxTo_Init(object sender, EventArgs e)
        {
            ASPxComboBox mCombo = (sender as ASPxComboBox);
            mCombo.ValueField = "TO_TEAM";
            mCombo.TextField = "TO_TEAM";
            //if (Global.CustomSession["Edit_SCH_InterventionType_list"] == null)
            {
                mCombo.DataSource = Global.ExecuteStoredProcedure("Lookup_Router_Role_Destinations", new string[1] { "@TEAM" }, new Object[1] { ASPxComboBoxFrom.SelectedItem.Text });
                mCombo.DataBind();
            }
            if (mCombo.Items.Count != 0)
            {
                mCombo.SelectedIndex = 0;
            }
        }

        protected void ASPxComboBoxTo_Callback(object sender, CallbackEventArgsBase e)
        {
            ASPxComboBox mCombo = (sender as ASPxComboBox);
            mCombo.ValueField = "TO_TEAM";
            mCombo.TextField = "TO_TEAM";
            //if (Global.CustomSession["Edit_SCH_InterventionType_list"] == null)
            {
                mCombo.DataSource = Global.ExecuteStoredProcedure("Lookup_Router_Role_Destinations", new string[1] { "@TEAM" }, new Object[1] { ASPxComboBoxFrom.SelectedItem.Text });
                mCombo.DataBind();
            }
            if (mCombo.Items.Count != 0)
            {
                mCombo.SelectedIndex = 0;
            }
        }

        protected void ASPxCallbackRouteSelected_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            List<object> mSelectedValues = ASPxGridViewRouteSCHs.GetSelectedFieldValues(new string[] { "Hidden_id", "Stamp" });            
            //string[] mIds = e.Parameter.Split(new char[1] { ',' });
            for (int n = 0; n < mSelectedValues.Count; n++)
            {
                Global.ExecuteStoredProcedureNoResults("Multi_Release_SCHs", new string[4] { "@tt_id", "@team_to_send", "@user_id", "@stamp" }, new Object[4] { Guid.Parse(((object[])mSelectedValues[n])[0].ToString()), e.Parameter, Global.CustomSession["UserId"], ((object[])mSelectedValues[n])[1].ToString() });
            }
        }
    }
}