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
    public partial class ActiveBuildings : System.Web.UI.Page
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
                    if (Global.CustomSession["ActiveBuildingsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveBuildings.DataSource = Global.CustomSession["ActiveBuildingsTable"];
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
                    if (Global.CustomSession["ActiveBuildingsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveBuildings.DataSource = Global.CustomSession["ActiveBuildingsTable"];
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
            ASPxGridViewActiveBuildings.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Building PM definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewActiveBuildings.DataSource = Global.ExecuteStoredProcedure("BU_Active_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActiveBuildingsTable"] = ASPxGridViewActiveBuildings.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActiveBuildingsTable");
            ASPxGridViewActiveBuildings.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewActiveBuildings.AddNewRow();
        }

 
        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_BU", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewActiveBuildings;
            //string[] mstrs = new string[2];
            //mstrs[0] = "SRI";
            //mstrs[1] = "TT_Id";
            //object[] res = (object[])mGrid.GetRowValuesByKeyValue(e.Parameter, mstrs);
            //e.Result = res[0].ToString() + ";" + res[1].ToString() + ";" + dberror;
            e.Result = mDataTable.Rows[0][0].ToString() + ";" + e.Parameter.ToString() + ";" + dberror;
            MasterDataBind();
        }

        //protected void ASPxGridViewActiveBuildings_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        //{
        //    ASPxGridView mGrid = (ASPxGridView)sender;
        //    if (e.Expanded)
        //    {
        //        object TTID = mGrid.GetDataRow(e.VisibleIndex)["TT_Id"];
        //        Global.CustomSession["Building_ID"] = TTID;
        //        Global.CustomSession["ExpandedBuilding"] = true;
        //    }
        //    else
        //    {
        //        Global.CustomSession.Remove("ExpandedBuilding");
        //    }
        //}



       
        //protected void ASPxGridViewActiveBuildings_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
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
            //ASPxGridViewActiveBuildings.Columns["Attention"].Visible = !show;
            //ASPxGridViewActiveBuildings.Columns["Priority"].Visible = !show;
            //ASPxGridViewActiveBuildings.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewActiveBuildings.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewActiveBuildings.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewActiveBuildings.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            DevExpress.Web.MenuItem mItemAddBuilding = mASPxMenu.Items.FindByName("AddBuilding");

            if (!mRoles.Contains("SRI Building Creator"))
            {
                mItemCreateSRI.Enabled = false;
            }
            else
            {
                mItemCreateSRI.Enabled = true;
            }

            if (!mRoles.Contains("Building Editor"))
            {
                mItemAddBuilding.Enabled = false;
            }
            else
            {
                mItemAddBuilding.Enabled = true;
            }


        }

        protected void ASPxGridViewActiveBuildings_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
          if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


        protected void ASPxGridViewActiveBuildings_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("BU_Insert_Update", new string[12] { "@BU_ID", "@SRI", "@BUILDING", "@TYPE", "@ISSUE", "@Region", "@SCHEDULED_ON", "@COMPLETED_ON", "@COMMENTS", "@USER_ID", "@ToBeScheduled", "@BLD_CODE" },
                                           new Object[12] { System.DBNull.Value, e.NewValues["SRI"], e.NewValues["BUILDING"], e.NewValues["TYPE"], e.NewValues["ISSUE"], e.NewValues["REGION"], e.NewValues["SCHEDULED_ON"], e.NewValues["COMPLETED_ON"], e.NewValues["COMMENTS"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"], e.NewValues["BLD_CODE"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveBuildings_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("BU_Insert_Update", new string[12] { "@BU_ID", "@SRI", "@BUILDING", "@TYPE", "@ISSUE", "@Region", "@SCHEDULED_ON", "@COMPLETED_ON", "@COMMENTS", "@USER_ID", "@ToBeScheduled", "@BLD_CODE" },
                                           new Object[12] { e.Keys[0], e.NewValues["SRI"], e.NewValues["BUILDING"], e.NewValues["TYPE"], e.NewValues["ISSUE"], e.NewValues["REGION"], e.NewValues["SCHEDULED_ON"], e.NewValues["COMPLETED_ON"], e.NewValues["COMMENTS"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"], e.NewValues["BLD_CODE"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveBuildings_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("BU_Delete", new string[1] { "@tt_id"},
                               new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveBuildings_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            switch (e.Column.FieldName)
            {
                case "REGION":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Region"].ToString(), mDataTable.Rows[i]["Region"]);
                        }
                    }
                    break;

                case "BUILDING":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("BU_Lookup_Buildings", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Building"].ToString(), mDataTable.Rows[i]["Building"]);
                        }
                    }

                    break;

                case "TYPE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("BU_Lookup_Type", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Type"].ToString(), mDataTable.Rows[i]["Type"]);
                        }
                    }

                    break;

                case "ISSUE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("BU_Lookup_Issue", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Issue"].ToString(), mDataTable.Rows[i]["Issue"]);
                        }
                    }

                    break;

            }
        }

        //protected void ASPxGridViewActiveBuildings_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        //{
        //    if (e.ButtonType == ColumnCommandButtonType.Edit || e.ButtonType == ColumnCommandButtonType.Delete)
        //    {
        //        List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
        //        e.Visible = mRoles.Contains("Building Editor");
        //    }
        //}

        protected void ASPxGridViewActiveBuildings_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;
                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("Building Editor");
        }
    }
}


 
	