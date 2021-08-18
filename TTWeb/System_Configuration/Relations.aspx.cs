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
    public partial class Relations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewRelations.DataSource = Global.CustomSession["RelationTypesTable"];
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
                    ASPxGridViewRelations.DataSource = Global.CustomSession["RelationTypesTable"];
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
                MasterDataBind();
            }

            ASPxGridViewRelations.SettingsText.ConfirmDelete = "Delete specific CI's Relation?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewRelations.DataSource = Global.ExecuteStoredProcedure("Config_Admin_TT_System_Rel_List_All ", new string[0] { }, new Object[0] { });
            Global.CustomSession["RelationTypesTable"] = ASPxGridViewRelations.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("RelationTypesTable");
            ASPxGridViewRelations.DataBind();
        }



        protected void ASPxGridViewRelations_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.Name == "Rel_type" & ((ASPxGridView)sender).IsNewRowEditing == true)
            {
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_TT_Rel_Type_List_Active", null, null);
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["Type"].ToString(), mDataTable.Rows[i]["Hidden_id"]);
                }
            }


            if (e.Column.Name == "System_A" & ((ASPxGridView)sender).IsNewRowEditing == true)
            {
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_TT_System_SystemGroup_Lookup", null, null);
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["System"].ToString(), mDataTable.Rows[i]["ID"]);
                }
            }


            if (e.Column.Name == "System_B" & ((ASPxGridView)sender).IsNewRowEditing == true)
            {
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_TT_System_SystemGroup_Lookup", null, null);
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["System"].ToString(), mDataTable.Rows[i]["ID"]);
                }
            }
        }

        protected void ASPxGridViewRelations_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Rel_Delete", new string[3] { "@A_ID", "@B_ID", "@REL_TYPE_ID" }, new Object[3] { e.Keys[0], e.Keys[1], e.Keys[2] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            ((ASPxGridView)sender).DataBind();
            MasterDataBind();
        }

        protected void ASPxGridViewRelations_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {


                Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Rel_Insert", new string[5] { "@A_ID", "@B_ID", "@REL_TYPE_ID", "@DEPEND_ON", "@INFO" },
                                                        new Object[5] { e.NewValues[0], e.NewValues[2], e.NewValues[1], e.NewValues[3], e.NewValues[4] });
           

            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            ((ASPxGridView)sender).DataBind();

            MasterDataBind();
        }

        protected void ASPxGridViewRelations_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

                Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Rel_Update", new string[5] { "@A_ID", "@B_ID", "@REL_TYPE_ID", "@DEPEND_ON", "@INFO" },
                                             new Object[5] { e.Keys[0], e.Keys[1], e.Keys[2], e.NewValues[3], e.NewValues[4] });
           
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            ((ASPxGridView)sender).DataBind();

            MasterDataBind();
        }

       

       
    }
}