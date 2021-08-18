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
    public partial class ActivePMs : System.Web.UI.Page
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
                    if (Global.CustomSession["ActivePMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActivePMs.DataSource = Global.CustomSession["ActivePMsTable"];
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
                    if (Global.CustomSession["ActivePMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActivePMs.DataSource = Global.CustomSession["ActivePMsTable"];
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
            ASPxGridViewActivePMs.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific PM definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewActivePMs.DataSource = Global.ExecuteStoredProcedure("PM_Active_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActivePMsTable"] = ASPxGridViewActivePMs.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActivePMsTable");
            ASPxGridViewActivePMs.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewActivePMs.AddNewRow();
        }

 
        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_PM", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewActivePMs;
            //string[] mstrs = new string[2];
            //mstrs[0] = "SRI";
            //mstrs[1] = "TT_Id";
            //object[] res = (object[])mGrid.GetRowValuesByKeyValue(e.Parameter, mstrs);
            //e.Result = res[0].ToString() + ";" + res[1].ToString() + ";" + dberror;
            e.Result = mDataTable.Rows[0][0].ToString() + ";" + e.Parameter.ToString() + ";" + dberror;
            MasterDataBind();
        }

        //protected void ASPxGridViewActivePMs_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        //{
        //    ASPxGridView mGrid = (ASPxGridView)sender;
        //    if (e.Expanded)
        //    {
        //        object TTID = mGrid.GetDataRow(e.VisibleIndex)["TT_Id"];
        //        Global.CustomSession["PM_ID"] = TTID;
        //        Global.CustomSession["ExpandedPM"] = true;
        //    }
        //    else
        //    {
        //        Global.CustomSession.Remove("ExpandedPM");
        //    }
        //}



       
        //protected void ASPxGridViewActivePMs_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        //{
        //    if (e.DataColumn.Name == "Priority")
        //    {
        //        e.Cell.ToolTip =  e.CellValue.ToString();

        //    }
        //}

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
            //ASPxGridViewActivePMs.Columns["Attention"].Visible = !show;
            //ASPxGridViewActivePMs.Columns["Priority"].Visible = !show;
            //ASPxGridViewActivePMs.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewActivePMs.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewActivePMs.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewActivePMs.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            DevExpress.Web.MenuItem mItemAddPM = mASPxMenu.Items.FindByName("AddPM");

            if (!mRoles.Contains("SRI PM Creator"))
            {
                mItemCreateSRI.Enabled = false;
            }
            else
            {
                mItemCreateSRI.Enabled = true;
            }

            if (!mRoles.Contains("PM Editor"))
            {
                mItemAddPM.Enabled = false;
            }
            else
            {
                mItemAddPM.Enabled = true;
            }


        }

        protected void ASPxGridViewActivePMs_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
          if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


        protected void ASPxGridViewActivePMs_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("PM_Insert_Update", new string[12] { "@PM_ID", "@SRI", "@Node_ID", "@NAME", "@CRITICALITY", "@PM_TYPE", "@Region", "@PM_YEAR", "@VISIT_DATE", "@USER_ID", "@ToBeScheduled", "@SOURCE_ID" },
                                           new Object[12] { System.DBNull.Value, System.DBNull.Value, e.NewValues["Node_ID"], e.NewValues["NAME"], e.NewValues["CRITICALITY"], e.NewValues["PM_TYPE"], e.NewValues["Region"], e.NewValues["PM_YEAR"], e.NewValues["VISIT_DATE"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"], e.NewValues["SOURCE_ID"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActivePMs_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("PM_Insert_Update", new string[12] { "@PM_ID", "@SRI", "@Node_ID", "@NAME", "@CRITICALITY", "@PM_TYPE", "@Region", "@PM_YEAR", "@VISIT_DATE", "@USER_ID", "@ToBeScheduled", "@SOURCE_ID" },
                                           new Object[12] { e.Keys[0], e.NewValues["SRI"], e.NewValues["Node_ID"], e.NewValues["NAME"], e.NewValues["CRITICALITY"], e.NewValues["PM_TYPE"], e.NewValues["Region"], e.NewValues["PM_YEAR"], e.NewValues["VISIT_DATE"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"], e.NewValues["SOURCE_ID"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActivePMs_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("PM_Delete", new string[1] { "@TT_ID"},
                               new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActivePMs_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            switch (e.Column.FieldName)
            {
                case "Region":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Region"].ToString(), mDataTable.Rows[i]["Region"]);
                        }
                    }
                    break;

                case "NAME":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Nodes_Lookup_Sites", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["SITE"].ToString(), mDataTable.Rows[i]["SITE"]);
                        }
                    }

                    break;

                case "CRITICALITY":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("PM_Lookup_Criticality", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["CRITICALITY"].ToString(), mDataTable.Rows[i]["CRITICALITY"]);
                        }
                    }
                    break;
            }
        }

        //protected void ASPxGridViewActivePMs_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        //{
        //    if (e.ButtonType == ColumnCommandButtonType.Edit || e.ButtonType == ColumnCommandButtonType.Delete)
        //    {
        //        List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
        //        e.Visible = mRoles.Contains("PM Editor");
        //    }
        //}

        protected void ASPxGridViewActivePMs_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;
                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("PM Editor");
        }
    }
}


 
	