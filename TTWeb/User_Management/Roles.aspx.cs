using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using System.Data.Common;

namespace TTWeb
{
    public partial class Roles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewRoles.DataSource = Global.CustomSession["RolesListTable"];
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
                    ASPxGridViewRoles.DataSource = Global.CustomSession["RolesListTable"];
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

            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            if (!mRoles.Contains("User Admin"))
            {
                (ASPxGridViewRoles.Columns["EditButtons"] as GridViewCommandColumn).ShowEditButton = false;
                (ASPxGridViewRoles.Columns["EditButtons"] as GridViewCommandColumn).ShowDeleteButton = false;
                (ASPxGridViewRoles.Columns["EditButtons"] as GridViewCommandColumn).ShowNewButton = false;
                (ASPxGridViewRoles.Columns["EditButtons"] as GridViewColumn).Visible = false;
            }
            else
            {
                (ASPxGridViewRoles.Columns["EditButtons"] as GridViewColumn).Visible = true;
            }
            ASPxGridViewRoles.SettingsText.ConfirmDelete = "Are you sure that you want to permanently delete the selected role?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewRoles.DataSource = Global.ExecuteStoredProcedure("User_Admin_Role_List", new string[1] { "@USER_ID" }, new Object[1] { Global.CustomSession["UserId"] });
            Global.CustomSession["RolesListTable"] = ASPxGridViewRoles.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("RolesListTable");
            ASPxGridViewRoles.DataBind();
        }

        protected void ASPxGridViewRoles_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            int hidden_role_id = (int)ASPxGridViewRoles.GetRowValuesByKeyValue(e.Keys[0], new string[1] { "Hidden_role_id" });
            Global.ExecuteStoredProcedureNoResults("User_Admin_Role_Update_Insert", new string[6] { "@ROLE", "@VALID_FLG", "@USER_CREATE", "@CREATION_DATE", "@ROLE_ID", "@TEAM_ID"},
                new Object[6] { e.NewValues[0], e.NewValues[2], Global.CustomSession["UserName"], e.NewValues[3], hidden_role_id, e.NewValues[1] == null ? System.DBNull.Value : e.NewValues[1] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewRoles_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("User_Admin_Role_Update_Insert", new string[6] { "@ROLE", "@VALID_FLG", "@USER_CREATE", "@CREATION_DATE", "@ROLE_ID", "@TEAM_ID" },
                new Object[6] { e.NewValues[0], e.NewValues[2] == null ? false : e.NewValues[2], Global.CustomSession["UserName"], e.NewValues[3], 0, e.NewValues[1] == null ? System.DBNull.Value : e.NewValues[1] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewRoles_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int hidden_role_id = (int)ASPxGridViewRoles.GetRowValuesByKeyValue(e.Keys[0], new string[1] { "Hidden_role_id" });
            Global.ExecuteStoredProcedureNoResults("User_Admin_Role_Delete", new string[1] { "@TEAM_ID" }, new Object[1] { hidden_role_id });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewRoles_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["Created_on"] = DateTime.Now;
        }

        protected void ASPxGridViewRoles_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.Name == "Team_role")
            {
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                DataTable mDataTable = Global.ExecuteStoredProcedure("User_Admin_Team_and_Role_List", new string[0], new Object[0] );
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["Team"].ToString(), mDataTable.Rows[i]["Hidden_team_id"]);
                }
                mCombobox.SelectedItem = mCombobox.Items.FindByText(mCombobox.Text);
            }
        }

        protected void ASPxGridViewRoleUsers_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            Global.CustomSession["cpExpandedRow"] = keyValue;
            detailGrid.DataSource = Global.ExecuteStoredProcedure("User_Admin_Role_Users_List", new string[2] { "@ROLE_ID", "@USER_ID" }, new Object[2] { keyValue, Global.CustomSession["UserId"] });
        }

        protected void ASPxGridViewSystemDetails_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            Global.CustomSession["cpExpandedRow"] = keyValue;
            detailGrid.DataSource = Global.ExecuteStoredProcedure("Config_Admin_Team_to_System_Groups_List", new string[1] { "@TEAM_ID" }, new Object[1] { keyValue });
        }

        protected void ASPxGridViewRoleDetails_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.Name == "Read_only")
            {
                ASPxCheckBox mCheckBox = (ASPxCheckBox)e.Editor;
                if (mCheckBox.Value == null)
                {
                    mCheckBox.Value = false;
                }
            }
        }

        protected void ASPxGridViewRoleUsers_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.Name == "User_name")
            {
                ASPxGridView mGrid = (ASPxGridView)sender;
                Int32 mRoleID = (Int32)mGrid.GetMasterRowKeyValue();
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                DataTable mDataTable = Global.ExecuteStoredProcedure("User_Admin_Role_Users_List_to_Add", new string[2] { "@ROLE_ID", "@USER_ID" }, new Object[2] { mRoleID, Global.CustomSession["UserId"] });
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["User_name"].ToString(), mDataTable.Rows[i]["Hidden_user_id"]);
                }
            }
        }

        protected void ASPxGridViewRoleUsers_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView ASPxGridViewRoleUsers = (ASPxGridView)sender;
            Int32 mRoleID = (Int32)ASPxGridViewRoleUsers.GetMasterRowKeyValue();
            Global.ExecuteStoredProcedureNoResults("User_Admin_Role_Users_List_Update_Insert", new string[3] { "@Checked", "@USER_ID", "@ROLE_ID" }, new Object[3] { 1, e.NewValues[0], mRoleID });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewRoleUsers_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxGridView ASPxGridViewRoleUsers = (ASPxGridView)sender;
            Int32 mRoleID = (Int32)ASPxGridViewRoleUsers.GetMasterRowKeyValue();
            Global.ExecuteStoredProcedureNoResults("User_Admin_Role_Users_List_Update_Insert", new string[3] { "@Checked", "@USER_ID", "@ROLE_ID" }, new Object[3] { 0, e.Keys[0], mRoleID });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewSystemDetails_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            Int32 mTeamID = (Int32)mGrid.GetMasterRowKeyValue();
            if (e.Column.Name == "System_Group" & ((ASPxGridView)sender).IsNewRowEditing == true)
            {
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_Team_to_System_Groups_List_Add_New_List", new string[1] { "@TEAM_ID" }, new Object[1] { mTeamID });
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["System_Group"].ToString(), mDataTable.Rows[i]["System_Group"]);
                }
            }
        }

        protected void ASPxGridViewSystemDetails_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView ASPxGridViewSystemteams = (ASPxGridView)sender;
            Int32 mTeamID = (Int32)ASPxGridViewSystemteams.GetMasterRowKeyValue();
            Global.ExecuteStoredProcedureNoResults("Config_Admin_Team_to_System_Groups_Update", new string[3] { "@System_Group", "@Monitored_by_team", "@TEAM_ID" }, new Object[3] { e.NewValues[0], 1, mTeamID });
            ASPxGridViewSystemteams.CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewSystemDetails_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxGridView ASPxGridViewSystemteams = (ASPxGridView)sender;
            Int32 mTeamID = (Int32)ASPxGridViewSystemteams.GetMasterRowKeyValue();
            Global.ExecuteStoredProcedureNoResults("Config_Admin_Team_to_System_Groups_Update", new string[3] { "@System_Group", "@Monitored_by_team", "@TEAM_ID" }, new Object[3] { e.Keys[0], 0, mTeamID });
            ASPxGridViewSystemteams.CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewSystemDetails_Load(object sender, EventArgs e)
        {
            ASPxGridView ASPxGridViewSystemteams = (ASPxGridView)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            if (!mRoles.Contains("User Admin"))
            {
                //(ASPxGridViewSystemteams.Columns["EditButtons"] as GridViewCommandColumn).NewButton.Visible = false;
                (ASPxGridViewSystemteams.Columns["EditButtons"] as GridViewColumn).Visible = false;
            }
            else
            {
                //(ASPxGridViewSystemteams.Columns["EditButtons"] as GridViewCommandColumn).NewButton.Visible = true;
                (ASPxGridViewSystemteams.Columns["EditButtons"] as GridViewColumn).Visible = true;
            }
        }

        protected void ASPxMenu1_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            if (!mRoles.Contains("User Admin"))
            {
                mASPxMenu.Enabled = false;
            }
            else
            {
                mASPxMenu.Enabled = true;
            }
        }

        protected void ASPxMenu3_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            if (!mRoles.Contains("User Admin"))
            {
                mASPxMenu.Enabled = false;
            }
            else
            {
                mASPxMenu.Enabled = true;
            }
        }

        protected void ASPxGridViewRoleReplacementUsers_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            Global.CustomSession["cpExpandedRow"] = keyValue;
            detailGrid.DataSource = Global.ExecuteStoredProcedure("User_Admin_Role_Replacement_Users_List", new string[2] { "@ROLE_ID", "@USER_ID" }, new Object[2] { keyValue, Global.CustomSession["UserId"] });
        }

        protected void ASPxGridViewRoleReplacementUsers_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.Name == "User_name")
            {
                ASPxGridView mGrid = (ASPxGridView)sender;
                Int32 mRoleID = (Int32)mGrid.GetMasterRowKeyValue();
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                DataTable mDataTable = Global.ExecuteStoredProcedure("User_Admin_Role_Replacement_Users_List_to_Add", new string[2] { "@ROLE_ID", "@USER_ID" }, new Object[2] { mRoleID, Global.CustomSession["UserId"] });
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["User_name"].ToString(), mDataTable.Rows[i]["Hidden_user_id"]);
                }
            }
        }

        protected void ASPxGridViewRoleReplacementUsers_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxGridView ASPxGridViewRoleReplacementUsers = (ASPxGridView)sender;
            Global.ExecuteStoredProcedureNoResults("User_Admin_Role_Replacement_Users_List_Delete", new string[1] { "@Hidden_id" }, new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();

        }

        protected void ASPxGridViewRoleReplacementUsers_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView ASPxGridViewRoleReplacementUsers = (ASPxGridView)sender;
            Int32 mRoleID = (Int32)ASPxGridViewRoleReplacementUsers.GetMasterRowKeyValue();
            Global.ExecuteStoredProcedureNoResults("User_Admin_Role_Replacement_Users_List_Update_Insert", new string[5] { "@Checked", "@USER_ID", "@ROLE_ID", "@From_Date", "@To_Date" }, new Object[5] { 1, e.NewValues["User_name"], mRoleID, e.NewValues["FROM_DATE"], e.NewValues["TO_DATE"]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();

        }

        protected void ASPxMenu4_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            if (!mRoles.Contains("User Admin"))
            {
                mASPxMenu.Enabled = false;
            }
            else
            {
                mASPxMenu.Enabled = true;
            }
        }

        protected void ASPxGridViewRoleReplacementUsers_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == ColumnCommandButtonType.Delete)
            {
                e.Visible = CommandButtonVisibleCriteria((ASPxGridView)sender, e.VisibleIndex);
            }
        }


        private bool CommandButtonVisibleCriteria(ASPxGridView grid, int visibleIndex)
        {
            if (visibleIndex == -1) return false;

            bool persistentValue = !Convert.ToBoolean(grid.GetRowValues(visibleIndex, "PROCESSED"));
            return persistentValue == true;
        }

    }
}