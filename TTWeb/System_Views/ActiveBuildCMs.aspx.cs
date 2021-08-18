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
    public partial class ActiveBuildCMs : System.Web.UI.Page
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
                    if (Global.CustomSession["ActiveBuildCMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveBuildCMs.DataSource = Global.CustomSession["ActiveBuildCMsTable"];
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

                    if (Global.CustomSession["ActiveBuildCMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveBuildCMs.DataSource = Global.CustomSession["ActiveBuildCMsTable"];
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
            ASPxGridViewActiveBuildCMs.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific VF Building CM Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewActiveBuildCMs.DataSource = Global.ExecuteStoredProcedure("BU_CM_Active_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActiveBuildCMsTable"] = ASPxGridViewActiveBuildCMs.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActiveBuildCMsTable");
            ASPxGridViewActiveBuildCMs.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewActiveBuildCMs.AddNewRow();
        }

 
        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_BU_CM", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewActiveBuildCMs;

            e.Result = mDataTable.Rows[0][0].ToString() + ";" + e.Parameter.ToString() + ";" + dberror;
            MasterDataBind();
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
            ASPxGridViewActiveBuildCMs.Columns["CANCELLED"].Visible = !show;
            //ASPxGridViewActiveBuildCMs.Columns["Priority"].Visible = !show;
            //ASPxGridViewActiveBuildCMs.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewActiveBuildCMs.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewActiveBuildCMs.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewActiveBuildCMs.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            DevExpress.Web.MenuItem mItemAddSuppl = mASPxMenu.Items.FindByName("AddSuppl");

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
                mItemAddSuppl.Enabled = false;
            }
            else
            {
                mItemAddSuppl.Enabled = true;
            }


        }

        protected void ASPxGridViewActiveBuildCMs_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("WORK_ORDER") != null)
            {
                e.Row.ToolTip = e.GetValue("WORK_ORDER").ToString();
            }
        }


        protected void ASPxGridViewActiveBuildCMs_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("BU_CM_Insert_Update", new string[13] { "@BU_ID", "@SRI", "@NOTIFICATION_DATE", "@SITE", "@PRIORITY", "@CATEGORY", "@WORK_ORDER", "@JUSTIFICATION", "@CANCELLED", "@COMPLETED_ON", "@REGION", "@USER_ID", "@ToBeScheduled" },

                new Object[13] { System.DBNull.Value, e.NewValues["SRI"], e.NewValues["NOTIFICATION_DATE"], e.NewValues["SITE"], e.NewValues["PRIORITY"], e.NewValues["CATEGORY"], e.NewValues["WORK_ORDER"], e.NewValues["JUSTIFICATION"], e.NewValues["CANCELLED"], e.NewValues["COMPLETED_ON"], e.NewValues["REGION"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }





        protected void ASPxGridViewActiveBuildCMs_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            

            Global.ExecuteStoredProcedureNoResults("BU_CM_Insert_Update", new string[13] { "@BU_ID", "@SRI", "@NOTIFICATION_DATE", "@SITE", "@PRIORITY", "@CATEGORY", "@WORK_ORDER", "@JUSTIFICATION", "@CANCELLED", "@COMPLETED_ON", "@REGION", "@USER_ID", "@ToBeScheduled" },

                new Object[13] { e.Keys[0], e.NewValues["SRI"], e.NewValues["NOTIFICATION_DATE"], e.NewValues["SITE"], e.NewValues["PRIORITY"], e.NewValues["CATEGORY"], e.NewValues["WORK_ORDER"], e.NewValues["JUSTIFICATION"], e.NewValues["CANCELLED"], e.NewValues["COMPLETED_ON"], e.NewValues["REGION"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveBuildCMs_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("BU_CM_Delete", new string[1] { "@TT_ID" },
                               new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        //protected void ASPxGridViewActiveBuildCMs_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        //{
        //    switch (e.Column.FieldName)
        //    {
        //        //case "Region":
        //        //    {
        //        //        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
        //        //        DataTable mDataTable = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
        //        //        for (int i = 0; i < mDataTable.Rows.Count; i++)
        //        //        {
        //        //            mCombobox.Items.Add(mDataTable.Rows[i]["Region"].ToString(), mDataTable.Rows[i]["Region"]);
        //        //        }
        //        //    }
        //        //    break;

        //        case "NAME":
        //            {
        //                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
        //                DataTable mDataTable = Global.ExecuteStoredProcedure("Nodes_Lookup_Sites", null, null);
        //                for (int i = 0; i < mDataTable.Rows.Count; i++)
        //                {
        //                    mCombobox.Items.Add(mDataTable.Rows[i]["SITE"].ToString(), mDataTable.Rows[i]["SITE"]);
        //                }
        //            }

        //            break;
        //    }
        //}

        //protected void ASPxGridViewActiveBuildCMs_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        //{
        //    if (e.ButtonType == ColumnCommandButtonType.Edit || e.ButtonType == ColumnCommandButtonType.Delete)
        //    {
        //        List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
        //        e.Visible = mRoles.Contains("Suppl Editor");
        //    }
        //}

        protected void ASPxGridViewActiveBuildCMs_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;

                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("Building Editor");;

        }

        protected void ASPxGridViewActiveBuildCMs_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            (sender as ASPxGridView).DetailRows.CollapseAllRows();
        }



        protected void ASPxGridViewActiveBuildCMs_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {
             if (e.RowType == GridViewRowType.EditForm)
            {

                ASPxComboBox comboLoc = (sender as ASPxGridView).FindEditFormTemplateControl("Location") as ASPxComboBox;
                if (comboLoc != null)
                {
                    DataTable tableLoc = Global.ExecuteStoredProcedure("BU_CM_Lookup_Site", null, null);
                    comboLoc.DataSource = tableLoc;
                    comboLoc.ValueField = "Site";
                    comboLoc.TextField = "Site";
                    comboLoc.ValueType = typeof(string);
                    comboLoc.DataBindItems();
                }

                ASPxComboBox comboCat = (sender as ASPxGridView).FindEditFormTemplateControl("Category") as ASPxComboBox;
                if (comboCat != null)
                {
                    DataTable tableCat = Global.ExecuteStoredProcedure("BU_CM_Lookup_Category", null, null);
                    comboCat.DataSource = tableCat;
                    comboCat.ValueField = "CATEGORY";
                    comboCat.TextField = "CATEGORY";
                    comboCat.ValueType = typeof(string);
                    comboCat.DataBindItems();
                }


                ASPxComboBox comboResp = (sender as ASPxGridView).FindEditFormTemplateControl("Justification") as ASPxComboBox;
                if (comboCat != null)
                {
                    DataTable tableResp = Global.ExecuteStoredProcedure("BU_CM_Lookup_Justification", null, null);
                    comboResp.DataSource = tableResp;
                    comboResp.ValueField = "JUSTIFICATION";
                    comboResp.TextField = "JUSTIFICATION";
                    comboResp.ValueType = typeof(string);
                    comboResp.DataBindItems();
                }


                ASPxComboBox comboRegion = (sender as ASPxGridView).FindEditFormTemplateControl("Region") as ASPxComboBox;
                if (comboCat != null)
                {
                    DataTable tableRegion = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
                    comboRegion.DataSource = tableRegion;
                    comboRegion.ValueField = "Region";
                    comboRegion.TextField = "Region";
                    comboRegion.ValueType = typeof(string);
                    comboRegion.DataBindItems();
                }  

                //if (((ASPxGridView)sender).IsNewRowEditing == true)
                //{
                //    comboLoc.SelectedIndex = 0;
                //    comboCat.SelectedIndex = 0;
                //    comboResp.SelectedIndex = 0;
                //}
            }
        }


    }
}


 
	