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
    public partial class ActiveSuppls : System.Web.UI.Page
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
                    if (Global.CustomSession["ActiveSupplsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveSuppls.DataSource = Global.CustomSession["ActiveSupplsTable"];
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
                    if (Global.CustomSession["ActiveSupplsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveSuppls.DataSource = Global.CustomSession["ActiveSupplsTable"];
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
            ASPxGridViewActiveSuppls.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Implementation & Supplementary Ticket definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewActiveSuppls.DataSource = Global.ExecuteStoredProcedure("Suppl_Active_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActiveSupplsTable"] = ASPxGridViewActiveSuppls.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActiveSupplsTable");
            ASPxGridViewActiveSuppls.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewActiveSuppls.AddNewRow();
        }

        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_Suppl", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewActiveSuppls;

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
            //ASPxGridViewActiveSuppls.Columns["Attention"].Visible = !show;
            //ASPxGridViewActiveSuppls.Columns["Priority"].Visible = !show;
            //ASPxGridViewActiveSuppls.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewActiveSuppls.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewActiveSuppls.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewActiveSuppls.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            DevExpress.Web.MenuItem mItemAddSuppl = mASPxMenu.Items.FindByName("AddSuppl");

            if (!mRoles.Contains("SRI Implem & Supplem Creator"))
            {
                mItemCreateSRI.Enabled = false;
            }
            else
            {
                mItemCreateSRI.Enabled = true;
            }

            if (!mRoles.Contains("Implem & Supplem Editor"))
            {
                mItemAddSuppl.Enabled = false;
            }
            else
            {
                mItemAddSuppl.Enabled = true;
            }


        }

        protected void ASPxGridViewActiveSuppls_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
          if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

        protected void ASPxGridViewActiveSuppls_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Suppl_Insert_Update", new string[25] 
                { "@SUP_ID","@SRI","@VF_CODE","@SITE_NO","@LOCATION_ID","@NAME","@SAP_ORDER",
                "@CATEGORY","@ACTIVITY","@ORDER_DESCRIPTION","@RESPONSIBLE_PERSON","@FOCAL_PERSON",
                "@REQUEST_DATE","@DEAD_LINE","@FOR_DATE","@EXECUTE_DATE","@TYPE","@STATUS",
                "@COMMENTS_VF","@COMMENTS_TBSP","@VF_NOTIF_MAIL_DATE","@TBSP_CONTR_NOTIF_DATE","@RESPONSIBLE","@USER_ID", "@ToBeScheduled"},

                new Object[25] 
                { System.DBNull.Value, e.NewValues["SRI"], e.NewValues["VF_CODE"], e.NewValues["SITE_NO"], System.DBNull.Value, e.NewValues["NAME"], 
                    e.NewValues["SAP_ORDER"], e.NewValues["CATEGORY"], e.NewValues["ACTIVITY"], e.NewValues["ORDER_DESCRIPTION"], e.NewValues["RESPONSIBLE_PERSON"],
                    e.NewValues["FOCAL_PERSON"], e.NewValues["REQUEST_DATE"], e.NewValues["DEAD_LINE"], e.NewValues["FOR_DATE"], e.NewValues["EXECUTE_DATE"], e.NewValues["TYPE"], 
                    e.NewValues["STATUS"], e.NewValues["COMMENTS_VF"], e.NewValues["COMMENTS_TBSP"], e.NewValues["VF_NOTIF_MAIL_DATE"], e.NewValues["TBSP_CONTR_NOTIF_DATE"], e.NewValues["RESPONSIBLE"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveSuppls_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            

            Global.ExecuteStoredProcedureNoResults("Suppl_Insert_Update", new string[25] 
                { "@SUP_ID","@SRI","@VF_CODE","@SITE_NO","@LOCATION_ID","@NAME","@SAP_ORDER",
                "@CATEGORY","@ACTIVITY","@ORDER_DESCRIPTION","@RESPONSIBLE_PERSON","@FOCAL_PERSON",
                "@REQUEST_DATE","@DEAD_LINE","@FOR_DATE","@EXECUTE_DATE","@TYPE","@STATUS",
                "@COMMENTS_VF","@COMMENTS_TBSP","@VF_NOTIF_MAIL_DATE","@TBSP_CONTR_NOTIF_DATE","@RESPONSIBLE","@USER_ID","@ToBeScheduled"},

                new Object[25] 
                { e.Keys[0], e.NewValues["SRI"], e.NewValues["VF_CODE"], e.NewValues["SITE_NO"], System.DBNull.Value, e.NewValues["NAME"], 
                    e.NewValues["SAP_ORDER"], e.NewValues["CATEGORY"], e.NewValues["ACTIVITY"], e.NewValues["ORDER_DESCRIPTION"], e.NewValues["RESPONSIBLE_PERSON"],
                    e.NewValues["FOCAL_PERSON"], e.NewValues["REQUEST_DATE"], e.NewValues["DEAD_LINE"], e.NewValues["FOR_DATE"], e.NewValues["EXECUTE_DATE"], e.NewValues["TYPE"], 
                    e.NewValues["STATUS"], e.NewValues["COMMENTS_VF"], e.NewValues["COMMENTS_TBSP"], e.NewValues["VF_NOTIF_MAIL_DATE"], e.NewValues["TBSP_CONTR_NOTIF_DATE"], e.NewValues["RESPONSIBLE"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveSuppls_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Suppl_Delete", new string[1] { "@TT_ID"},
                               new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveSuppls_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            switch (e.Column.FieldName)
            {
                //case "Region":
                //    {
                //        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                //        DataTable mDataTable = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
                //        for (int i = 0; i < mDataTable.Rows.Count; i++)
                //        {
                //            mCombobox.Items.Add(mDataTable.Rows[i]["Region"].ToString(), mDataTable.Rows[i]["Region"]);
                //        }
                //    }
                //    break;

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
            }
        }

        //protected void ASPxGridViewActiveSuppls_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        //{
        //    if (e.ButtonType == ColumnCommandButtonType.Edit || e.ButtonType == ColumnCommandButtonType.Delete)
        //    {
        //        List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
        //        e.Visible = mRoles.Contains("Suppl Editor");
        //    }
        //}

        protected void ASPxGridViewActiveSuppls_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;

                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("Implem & Supplem Editor");;

        }

        protected void ASPxGridViewActiveSuppls_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            (sender as ASPxGridView).DetailRows.CollapseAllRows();
        }

        protected void ASPxGridViewActiveSuppls_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {
             if (e.RowType == GridViewRowType.EditForm)
            {

                ASPxComboBox comboLoc = (sender as ASPxGridView).FindEditFormTemplateControl("Location") as ASPxComboBox;
                if (comboLoc != null)
                {
                    DataTable tableLoc = Global.ExecuteStoredProcedure("Nodes_Lookup_Sites", null, null);
                    comboLoc.DataSource = tableLoc;
                    comboLoc.ValueField = "SITE";
                    comboLoc.TextField = "SITE";
                    comboLoc.ValueType = typeof(string);
                    comboLoc.DataBindItems();
                }

                ASPxComboBox comboCat = (sender as ASPxGridView).FindEditFormTemplateControl("Category") as ASPxComboBox;
                if (comboCat != null)
                {
                    DataTable tableCat = Global.ExecuteStoredProcedure("Suppl_Lookup_Category", null, null);
                    comboCat.DataSource = tableCat;
                    comboCat.ValueField = "Category";
                    comboCat.TextField = "Category";
                    comboCat.ValueType = typeof(string);
                    comboCat.DataBindItems();
                }


                ASPxComboBox comboResp = (sender as ASPxGridView).FindEditFormTemplateControl("Responsible") as ASPxComboBox;
                if (comboCat != null)
                {
                    DataTable tableResp = Global.ExecuteStoredProcedure("Suppl_Lookup_Responsible", null, null);
                    comboResp.DataSource = tableResp;
                    comboResp.ValueField = "Responsible";
                    comboResp.TextField = "Responsible";
                    comboResp.ValueType = typeof(string);
                    comboResp.DataBindItems();
                }                

                if (((ASPxGridView)sender).IsNewRowEditing == true)
                {
                    comboLoc.SelectedIndex = 0;
                    comboCat.SelectedIndex = 0;
                    comboResp.SelectedIndex = 0;
                }
            }
        }
    }
}


 
	