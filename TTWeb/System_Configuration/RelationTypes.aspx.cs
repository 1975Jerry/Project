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
    public partial class RelationTypes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewRelationTypes.DataSource = Global.CustomSession["RelationTypesConfigurationTable"];    
                }
                else
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
            }
            else if (Page.IsPostBack)
            {
                ASPxGridViewRelationTypes.DataSource = Global.CustomSession["RelationTypesConfigurationTable"];
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

            ASPxGridViewRelationTypes.SettingsText.ConfirmDelete = "Delete Systems' Relation Type?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewRelationTypes.DataSource = Global.ExecuteStoredProcedure("Config_Admin_TT_Rel_Type_List_all", new string[0] { }, new Object[0] { });
            Global.CustomSession["RelationTypesConfigurationTable"] = ASPxGridViewRelationTypes.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("RelationTypesConfigurationTable");
            ASPxGridViewRelationTypes.DataBind();
        }

        protected void ASPxGridViewRelationTypes_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_Rel_Type_List_Delete", new string[1] { "@ID" },
                                                                   new Object[1] { e.Keys[0]} );
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewRelationTypes_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_Rel_Type_List_Update_Insert", new string[3] { "@TYPE_A_B", "@TYPE_B_A", "@ID" },
                                                                   new Object[3] { e.NewValues[0], e.NewValues[1], 0 });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewRelationTypes_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_Rel_Type_List_Update_Insert", new string[3] { "@TYPE_A_B", "@TYPE_B_A", "@ID" },
                                                       new Object[3] { e.NewValues[0], e.NewValues[1], e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewRelationTypes_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            DataTable mDataTable = (DataTable)ASPxGridViewRelationTypes.DataSource;
            e.Properties["cpRowCount"] = mDataTable == null ? 0 : mDataTable.Rows.Count;
        }
    }
}