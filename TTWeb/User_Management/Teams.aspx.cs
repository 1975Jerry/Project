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
    public partial class Teams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewTeams.DataSource = Global.CustomSession["TeamsListTable"];
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
                    ASPxGridViewTeams.DataSource = Global.CustomSession["TeamsListTable"];
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

            ASPxGridViewTeams.SettingsText.ConfirmDelete = "Are you sure that you want to permanently delete the selected team?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewTeams.DataSource = Global.ExecuteStoredProcedure("User_Admin_Team_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["TeamsListTable"] = ASPxGridViewTeams.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("TeamsListTable");
            ASPxGridViewTeams.DataBind();
        }

        protected void ASPxGridViewTeams_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("User_Admin_Team_Update_Insert", new string[6] { "@TEAM", "@VALID_FLG", "@TEAM_EMAIL", "@USER_CREATE", "@CREATION_DATE", "@TEAM_ID" },
                                                                    new Object[6] { e.NewValues["Team"], e.NewValues["Valid_team"], e.NewValues["Team_email"], Global.CustomSession["Username"], DateTime.Now, 0 });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewTeams_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            int Hidden_team_id = (int)ASPxGridViewTeams.GetRowValuesByKeyValue(e.Keys[0], new string[1] { "Hidden_team_id" });
            Global.ExecuteStoredProcedureNoResults("User_Admin_Team_Update_Insert", new string[6] { "@TEAM", "@VALID_FLG", "@TEAM_EMAIL", "@USER_CREATE", "@CREATION_DATE", "@TEAM_ID" },
                                                                    new Object[6] { e.NewValues["Team"], e.NewValues["Valid_team"], e.NewValues["Team_email"], Global.CustomSession["UserName"], e.NewValues["Created_on"], Hidden_team_id });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewTeams_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int Hidden_team_id = (int)ASPxGridViewTeams.GetRowValuesByKeyValue(e.Keys[0], new string[1] { "Hidden_team_id" });
            Global.ExecuteStoredProcedureNoResults("User_Admin_Team_Delete", new string[1] { "@TEAM_ID" }, new Object[1] { Hidden_team_id });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewTeams_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["Created_on"] = DateTime.Now.ToString();
        }

        protected void ASPxGridViewDetails_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            Global.CustomSession["cpExpandedRow"] = keyValue;
            detailGrid.DataSource = Global.ExecuteStoredProcedure("User_Admin_Team_Users_List", new string[1] { "@TEAM_ID" }, new Object[1] { keyValue });
        }

        protected void ASPxGridViewTeamDetails_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxGridView ASPxGridViewTeamDetails = (ASPxGridView)sender;
            int Hidden_team_id = (int)ASPxGridViewTeamDetails.GetRowValuesByKeyValue(e.Keys[0], new string[1] { "Hidden_team_id" });
            int Hidden_user_id = (int)ASPxGridViewTeamDetails.GetRowValuesByKeyValue(e.Keys[0], new string[1] { "Hidden_user_id" });
            Global.ExecuteStoredProcedureNoResults("User_Admin_Team_Users_List_Update_Insert", new string[4] { "@CHECKED", "@READ_ONLY", "@USER_ID", "@TEAM_ID" },
                                                                    new Object[4] { 1, e.NewValues["READ_ONLY"], Hidden_user_id, Hidden_team_id });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewTeamDetails_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxGridView ASPxGridViewTeamDetails = (ASPxGridView)sender;
            int Hidden_team_id = (int)ASPxGridViewTeamDetails.GetRowValuesByKeyValue(e.Keys[0], new string[1] { "Hidden_team_id" });
            int Hidden_user_id = (int)ASPxGridViewTeamDetails.GetRowValuesByKeyValue(e.Keys[0], new string[1] { "Hidden_user_id" });
            Global.ExecuteStoredProcedureNoResults("User_Admin_Team_Users_List_Update_Insert", new string[4] { "@CHECKED", "@READ_ONLY", "@USER_ID", "@TEAM_ID" },
                                                                    new Object[4] { 0,  0, Hidden_user_id, Hidden_team_id });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewTeamDetails_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView ASPxGridViewTeamDetails = (ASPxGridView)sender;
            Int32 mTeamID = (Int32)ASPxGridViewTeamDetails.GetMasterRowKeyValue();
            Global.ExecuteStoredProcedureNoResults("User_Admin_Team_Users_List_Update_Insert", new string[4] { "@CHECKED", "@READ_ONLY", "@USER_ID", "@TEAM_ID" },
                                                                    new Object[4] { 1, e.NewValues["Read_only"], e.NewValues["User_name"], mTeamID });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewSystemDetails_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            Global.CustomSession["cpExpandedRow"] = keyValue;
            detailGrid.DataSource = Global.ExecuteStoredProcedure("Config_Admin_Team_to_System_Groups_List", new string[1] { "@TEAM_ID" }, new Object[1] { keyValue });
        }

        protected void ASPxGridViewTeamDetails_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.Name == "Read_only")
            {
                ASPxCheckBox mCheckBox = (ASPxCheckBox)e.Editor;
                if (mCheckBox.Value == null)
                {
                    mCheckBox.Value = false;
                }
            }

            ASPxGridView mGrid = (ASPxGridView)sender;
            Int32 mTeamID = (Int32)mGrid.GetMasterRowKeyValue();

            if (e.Column.Name == "User_name" & ((ASPxGridView)sender).IsNewRowEditing == true)
            {
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                DataTable mDataTable = Global.ExecuteStoredProcedure("User_Admin_Team_Users_List_New_User", new string[1] { "@TEAM_ID" }, new Object[1] { mTeamID });
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["User_name"].ToString(), mDataTable.Rows[i]["Hidden_user_id"]);
                }
            }
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

        protected void ASPxGridViewSystemDetails_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxGridView ASPxGridViewSystemteams = (ASPxGridView)sender;
            int Hidden_team_id = (int)ASPxGridViewSystemteams.GetRowValuesByKeyValue(e.Keys[0], new string[1] { "Hidden_team_id" });

            Global.ExecuteStoredProcedureNoResults("Config_Admin_Team_to_System_Groups_Update", new string[3] { "@System_Group", "@Monitored_by_team", "@TEAM_ID" },
                                                                    new Object[3] { e.Keys[0], 0, Hidden_team_id });
            ASPxGridViewSystemteams.CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewSystemDetails_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView ASPxGridViewSystemDetails = (ASPxGridView)sender;
            Int32 mTeamID = (Int32)ASPxGridViewSystemDetails.GetMasterRowKeyValue();

            Global.ExecuteStoredProcedureNoResults("Config_Admin_Team_to_System_Groups_Update", new string[3] { "@System_Group", "@Monitored_by_team", "@TEAM_ID" },
                                                                    new Object[3] { e.NewValues["System_Group"], 1, mTeamID });
            ASPxGridViewSystemDetails.CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }
    }
}