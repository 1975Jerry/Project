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
    public partial class ActiveWindPMs : System.Web.UI.Page
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
                    if (Global.CustomSession["ActiveWindPMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveWindPMs.DataSource = Global.CustomSession["ActiveWindPMsTable"];
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
                    if (Global.CustomSession["ActiveWindPMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveWindPMs.DataSource = Global.CustomSession["ActiveWindPMsTable"];
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
            ASPxGridViewActiveWindPMs.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific PM definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewActiveWindPMs.DataSource = Global.ExecuteStoredProcedure("W_PM_Active_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActiveWindPMsTable"] = ASPxGridViewActiveWindPMs.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActiveWindPMsTable");
            ASPxGridViewActiveWindPMs.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewActiveWindPMs.AddNewRow();
        }

 
        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_W_PM", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewActiveWindPMs;
            //string[] mstrs = new string[2];
            //mstrs[0] = "SRI";
            //mstrs[1] = "TT_Id";
            //object[] res = (object[])mGrid.GetRowValuesByKeyValue(e.Parameter, mstrs);
            //e.Result = res[0].ToString() + ";" + res[1].ToString() + ";" + dberror;
            e.Result = mDataTable.Rows[0][0].ToString() + ";" + e.Parameter.ToString() + ";" + dberror;
            MasterDataBind();
        }

        //protected void ASPxGridViewActiveWindPMs_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
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



       
        //protected void ASPxGridViewActiveWindPMs_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
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
            //ASPxGridViewActiveWindPMs.Columns["Attention"].Visible = !show;
            //ASPxGridViewActiveWindPMs.Columns["Priority"].Visible = !show;
            //ASPxGridViewActiveWindPMs.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewActiveWindPMs.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewActiveWindPMs.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewActiveWindPMs.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            DevExpress.Web.MenuItem mItemAddPM = mASPxMenu.Items.FindByName("AddPM");

            if (!mRoles.Contains("SRI Wind PM Creator"))
            {
                mItemCreateSRI.Enabled = false;
            }
            else
            {
                mItemCreateSRI.Enabled = true;
            }

            if (!mRoles.Contains("Wind PM Editor"))
            {
                mItemAddPM.Enabled = false;
            }
            else
            {
                mItemAddPM.Enabled = true;
            }


        }

        protected void ASPxGridViewActiveWindPMs_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
          if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


        protected void ASPxGridViewActiveWindPMs_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("W_PM_Insert_Update", new string[14] { "@PM_ID", "@SRI", "@SiteNo", "@Site", "@Type", "@SiteCateg", "@Region", "@PM_YEAR", "@VISIT_DATE", "@Comments", "@USER_ID", "@ToBeScheduled", "PM_Type", "SOURCE_ID" },
                                           new Object[14] { System.DBNull.Value, System.DBNull.Value, e.NewValues["SiteNo"], e.NewValues["Site"], e.NewValues["TYPE"], e.NewValues["SiteCateg"], e.NewValues["Region"], e.NewValues["PM_YEAR"], e.NewValues["VISIT_DATE"], e.NewValues["Comments"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"], e.NewValues["PM_Type"], e.NewValues["SOURCE_ID"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveWindPMs_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("W_PM_Insert_Update", new string[14] { "@PM_ID", "@SRI", "@SiteNo", "@Site", "@Type", "@SiteCateg", "@Region", "@PM_YEAR", "@VISIT_DATE", "@Comments", "@USER_ID", "@ToBeScheduled", "PM_Type", "SOURCE_ID" },
                                           new Object[14] { e.Keys[0], e.NewValues["SRI"], e.NewValues["SiteNo"], e.NewValues["Site"], e.NewValues["TYPE"], e.NewValues["SiteCateg"], e.NewValues["Region"], e.NewValues["PM_YEAR"], e.NewValues["VISIT_DATE"], e.NewValues["Comments"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"], e.NewValues["PM_Type"], e.NewValues["SOURCE_ID"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveWindPMs_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("W_PM_Delete", new string[1] { "@TT_ID"},
                               new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveWindPMs_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
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

                case "Site":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("W_Lookup_Site", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Object"].ToString(), mDataTable.Rows[i]["Object"]);
                        }
                    }

                    break;

                case "PM_YEAR":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("W_PM_Lookup_Year", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Year"].ToString(), mDataTable.Rows[i]["Year"]);
                        }
                    }
                    break;

                case "SiteCateg":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("W_PM_Lookup_SiteCateg", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["SiteCateg"].ToString(), mDataTable.Rows[i]["SiteCateg"]);
                        }
                    }
                    break;

                case "TYPE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("W_PM_Lookup_Type", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Type"].ToString(), mDataTable.Rows[i]["Type"]);
                        }
                    }
                    break;

                case "PM_Type":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("W_PM_Lookup_PMType", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["PM_Type"].ToString(), mDataTable.Rows[i]["PM_Type"]);
                        }
                    }
                    break;
            
            }
        }

        //protected void ASPxGridViewActiveWindPMs_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        //{
        //    if (e.ButtonType == ColumnCommandButtonType.Edit || e.ButtonType == ColumnCommandButtonType.Delete)
        //    {
        //        List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
        //        e.Visible = mRoles.Contains("PM Editor");
        //    }
        //}

        protected void ASPxGridViewActiveWindPMs_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;
                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("Wind PM Editor");
        }
    }
}


 
	