using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;

namespace TTWeb
{
    public partial class ConfigurationList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewConfigurationValue.DataSource = Global.CustomSession["ConfigurationValueTable"];
                }
                else
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
            }
            else if (Page.IsPostBack)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewConfigurationValue.DataSource = Global.CustomSession["ConfigurationValueTable"];
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
            ASPxGridViewConfigurationValue.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Configuration Value?";
        }

        private void MasterDataBind()
        {
            DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_Configuration_Category_List", null, null);
            Global.CustomSession["ValueTable"] = mDataTable;
            DataRow mRow = null;
            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                mRow = mDataTable.Rows[i];
                ASPxListBoxCategory.Items.Add((string)mRow[0]/*, mRow[0]*/);
            }

            mRow = mDataTable.Rows[0];
            if (ASPxListBoxCategory.SelectedIndex == -1)
            {
                ASPxListBoxCategory.SelectedIndex = 0;
            }
            
            ASPxGridViewConfigurationValue.DataSource = Global.ExecuteStoredProcedure("Config_Admin_Configuration_Value", new string[0] { }, new Object[0] { });
            Global.CustomSession["ConfigurationValueTable"] = ASPxGridViewConfigurationValue.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ConfigurationValueTable");
            ASPxGridViewConfigurationValue.DataBind();
            ASPxGridViewConfigurationValue.FilterExpression = "[Configuration_Category] = '" + ASPxListBoxCategory.Value + "'";
        }

        protected void ASPxGridViewConfigurationValue_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_Configuration_Value_Delete", new string[1] { "@ID" }, new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewConfigurationValue_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_Configuration_Value_Update_Insert", new string[3] { "@Configuration_Category", "@Configuration_Value", "@ID" },
                                                      new Object[3] { ASPxListBoxCategory.Value, e.NewValues[0], null });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewConfigurationValue_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            switch (e.Column.FieldName)
            {
                case "Configuration_Category":
                    {
                        ASPxComboBox mCombo = (ASPxComboBox)e.Editor;
                        //if (e.Value == null)
                        {
                            DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_Configuration_Category_List", null, null);
                            Global.CustomSession["ValueTable"] = mDataTable;
                            DataRow mRow = null;
                            for (int i = 0; i < mDataTable.Rows.Count; i++)
                            {
                                mRow = mDataTable.Rows[i];
                                mCombo.Items.Add((string)mRow[0]/*, mRow[0]*/);
                            }
                        }
                    }
                    break;
            }
        }

        protected void ASPxListBoxCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            ASPxGridViewConfigurationValue.FilterExpression = "[Configuration_Category] = '" + ASPxListBoxCategory.Value + "'";  
        }
    }
}