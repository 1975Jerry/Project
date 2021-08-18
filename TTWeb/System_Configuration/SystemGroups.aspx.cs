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
    public partial class SystemGroups : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewSystemGroups.DataSource = Global.CustomSession["SystemGroupsTable"];
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
                    ASPxGridViewSystemGroups.DataSource = Global.CustomSession["SystemGroupsTable"];
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

            ASPxGridViewSystemGroups.SettingsText.ConfirmDelete = "Are you sure that you want to permanently delete the selected Configuration Item Group and its Associations?";

        }

        private void MasterDataBind()
        {
            ASPxGridViewSystemGroups.DataSource = Global.ExecuteStoredProcedure("Config_Admin_TT_System_Group_List ", new string[0] { }, new Object[0] { });
            Global.CustomSession["SystemGroupsTable"] = ASPxGridViewSystemGroups.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("SystemGroupsTable");
            ASPxGridViewSystemGroups.DataBind();
        }



        protected void ASPxGridViewPendingtypes_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.Name == "Process")
            {
                ASPxDropDownEdit mDropDownEdit = (ASPxDropDownEdit)e.Editor;
                ASPxListBox mListBox = (ASPxListBox)mDropDownEdit.FindControl("listBox");
                DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_Process_List", null, null);
                int count = mDataTable.Rows.Count;
                DataRow mRow;
                if (e.Value != null)
                {
                    string[] mChecked = e.Value.ToString().Split(new char[1] { ';' });
                    for (int i = 0; i < count; i++)
                    {
                        mListBox.Items.Add(mDataTable.Rows[i]["Process"].ToString(), mDataTable.Rows[i]["Process"]);
                        for (int k = 0; k < mChecked.Length; k++)
                        {
                            if (mChecked[k] == mListBox.Items[i + 1].ToString())
                            {
                                mListBox.Items[i + 1].Selected = true;
                            }
                        }
                    }
                }
                else
                {
                    for (int i = 0; i < count; i++)
                    {
                        mListBox.Items.Add(mDataTable.Rows[i]["Process"].ToString(), mDataTable.Rows[i]["Process"]);
                    }
                }
            }
        }




        protected void ASPxGridViewPendingtypes_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Group_List_Delete", new string[1] { "@Hidden_id" },
                                                                  new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewPendingtypes_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Group_List_Update_Insert", new string[3] { "@System_Group", "@Process", "@Hidden_id" },
                                                                  new Object[3] { e.NewValues[0], e.NewValues[1], 0 });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewPendingtypes_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Group_List_Update_Insert", new string[3] { "@System_Group", "@Process", "@Hidden_id" },
                                                                 new Object[3] { e.NewValues[0], e.NewValues[1], e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }



        protected void ASPxGridViewSystemProblemGroups_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            detailGrid.DataSource = Global.ExecuteStoredProcedure("Config_Admin_TT_SG_to_PG_List", new string[1] { "@id" }, new Object[1] { keyValue });
        }



        protected void ASPxGridViewGroupSystems_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            detailGrid.DataSource = Global.ExecuteStoredProcedure("Config_Admin_TT_System_Group_to_Problem_Group_Systems_List", new string[1] { "@ID" }, new Object[1] { keyValue });
        }

        protected void ASPxGridViewGroupProblems_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            detailGrid.DataSource = Global.ExecuteStoredProcedure("Config_Admin_TT_System_Group_to_Problem_Group_Problems_List", new string[1] { "@ID" }, new Object[1] { keyValue });
        }



        protected void ASPxGridViewSystemProblemGroups_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

            if (e.Column.Name == "Problem_Group")
            {
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                //DataTable mDataTable = Global.ExecuteQuery("select * from dbo.TT_PROBLEM_GROUP");
                DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_Lookup_Problem_Group", new string[1] { "@System_Group" }, new Object[1] { Global.CustomSession["mSystemGroup"]});
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["PROBLEM_GROUP"].ToString(), mDataTable.Rows[i]["PROBLEM_GROUP"]);
                }
            }
        }

        protected void ASPxGridViewSystemProblemGroups_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Group_to_Problem_Group_List_Delete", new string[1] { "@ID" },
                                                                  new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewSystemProblemGroups_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Group_to_Problem_Group_List_Update_Insert", new string[3] { "@SYSTEM_GROUP", "@PROBLEM_GROUP", "@ID" },
                                                                  new Object[3] { Global.CustomSession["mSystemGroup"], e.NewValues[0], 0 });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewSystemProblemGroups_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Group_to_Problem_Group_List_Update_Insert", new string[3] { "@SYSTEM_GROUP", "@PROBLEM_GROUP", "@ID" },
                                                                 new Object[3] { Global.CustomSession["mSystemGroup"], e.NewValues[0], e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }



        protected void ASPxGridViewSystemGroups_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        {
            
            if (e.Expanded)
            {
                ASPxGridView mGrid = sender as ASPxGridView;
                int index = e.VisibleIndex;
                String mSystemGroup = (String)mGrid.GetRowValues(index, new string[1] { "System_Group" });
                Global.CustomSession["mSystemGroup"] = mSystemGroup.ToString();
            }
        }

        protected void ASPxGridViewSystemProblemGroups_AutoFilterCellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {


            if (e.Column.Name == "Problem_Group")
            {
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_TT_Lookup_Problem_Group", null, null);
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["PROBLEM_GROUP"].ToString());
                }
            }
        }
    }
}