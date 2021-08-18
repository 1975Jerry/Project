using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;


namespace TTWeb.User_Management
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            if (Page.IsPostBack)
            {
                MasterDataBind();
           }
            else if (Page.IsCallback)
            {
                if (Session.Keys.Count == 0)
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
                MasterDataBind();
            }
            else
            {
                ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).CleanupSessionObjects();
                ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("cpExpandedRow");
                MasterDataBind();                   
            }
            ASPxGridViewUserList.SettingsText.ConfirmDelete = "Are you sure that you want to permanently delete the selected user?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewUserList.DataSource = Global.ExecuteStoredProcedure("Users_List", new string[1] { "@USER_ID" }, new Object[1] { Global.CustomSession["UserId"] });
            Global.CustomSession["UsersListTable"] = ASPxGridViewUserList.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("UsersListTable");
            ASPxGridViewUserList.DataBind();

            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            bool mIsAdmin = false;
            for (int i = 0; i < mRoles.Count; i++)
            {
                if (mRoles[i] == "User Admin")
                {
                    mIsAdmin = true;
                    break;
                }
            }
            if (!mIsAdmin)
            {
                (ASPxGridViewUserList.Columns["EditButtons"] as GridViewColumn).Width = 30;
                (ASPxGridViewUserList.Columns["EditButtons"] as GridViewCommandColumn).ShowDeleteButton = false;
                //(ASPxGridViewUserList.Columns["EditButtons"] as GridViewCommandColumn).NewButton.Visible = false;
            }
            else
            {
                (ASPxGridViewUserList.Columns["EditButtons"] as GridViewColumn).Width = 50;
                (ASPxGridViewUserList.Columns["EditButtons"] as GridViewCommandColumn).ShowDeleteButton = true;
                //(ASPxGridViewUserList.Columns["EditButtons"] as GridViewCommandColumn).NewButton.Visible = true;
            }
        }

        protected void ASPxGridViewUserList_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["Updated_by"] = Global.CustomSession["UserName"].ToString();
            e.NewValues["Updated_on"] = DateTime.Now.ToString();
            e.NewValues["Created_by"] = Global.CustomSession["UserName"].ToString();
            e.NewValues["Created_on"] = DateTime.Now.ToString();
            e.NewValues["Valid_user"] = true;
            (sender as ASPxGridView).DetailRows.CollapseAllRows();
        }

        protected void ASPxGridViewUserList_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            ASPxPageControl mASPxPageControl = mGrid.FindEditFormTemplateControl("ASPxPageControlUsers") as ASPxPageControl;
            ASPxTextBox mTextBoxUserName = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxUserName");
            ASPxTextBox mTextBoxLoginName = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLoginName");
            ASPxTextBox mTextBoxPassword = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxPassword");
            ASPxTextBox mTextBoxPhone = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxPhone");
            ASPxTextBox mTextBoxMobile = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxMobile");
            ASPxTextBox mTextBoxEmail = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxEmail");
            ASPxCheckBox mCheckBoxValidUser = (ASPxCheckBox)mASPxPageControl.FindControl("ASPxCheckBoxValidUser");
            ASPxTextBox mTextBoxHiddenUserID = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxHiddenUserID");

            Global.ExecuteStoredProcedureNoResults("Users_Update_Insert", new string[10] { "@TT_USER", "@USERNAME", "@PASSWORD", "@PHONE", "@PHONE_MOBILE", "@EMAIL", "@USER_CREATE", "@USER_UPDATE", "@VALID_FLG", "@USER_ID" },
                                        new Object[10] { mTextBoxUserName.Text, mTextBoxLoginName.Text, mTextBoxPassword.Text, mTextBoxPhone.Text, mTextBoxMobile.Text, mTextBoxEmail.Text, Global.CustomSession["UserName"], Global.CustomSession["UserName"], mCheckBoxValidUser.Value, mTextBoxHiddenUserID.Text });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewUserList_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Users_Delete", new string[1] { "@USER_ID" }, new object[1] { e.Keys[0] });
            e.Cancel = true;
            MasterDataBind();
            ((ASPxGridView)sender).CancelEdit();
            //Global.RefreshSystemUsers();
        }

        protected void ASPxGridViewUserList_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            e.Properties["cpExpandedRow"] = Global.CustomSession["cpExpandedRow"];
        }

        protected void ASPxGridViewTeams_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            Int32 SystemNewRow = (Int32)Global.CustomSession["SystemNewRow"];

            if (SystemNewRow != 1)
            {
                detailGrid.DataSource = Global.ExecuteStoredProcedure("User_Teams_Select", new string[1] { "@uid" }, new Object[1] { keyValue });
            }
        }


        protected void ASPxGridCiewRoles_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();

            Int32 SystemNewRow = (Int32)Global.CustomSession["SystemNewRow"];

            if (SystemNewRow != 1)
            {
                detailGrid.DataSource = Global.ExecuteStoredProcedure("User_Roles_Select", new string[1] { "@uid" }, new Object[1] { keyValue });
            }
        }

        protected void ASPxGridViewUserList_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        {

            ASPxGridView mGrid = (ASPxGridView)sender;
            mGrid.CancelEdit();
            Global.CustomSession["SystemNewRow"] = 0;
            if (e.Expanded)
            {
                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                bool mIsAdmin = false;
                for (int i = 0; i < mRoles.Count; i++)
                {
                    if (mRoles[i] == "User Admin")
                    {
                        mIsAdmin = true;
                        break;
                    }
                }
                if (!mIsAdmin)
                {
                    
                    ASPxPageControl mASPxPageControl = mGrid.FindDetailRowTemplateControl(e.VisibleIndex, "ASPxPageControlUsers") as ASPxPageControl;
                    ASPxTextBox mASPxTextBoxPassword = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxPassword");
                    mASPxTextBoxPassword.Text = "******";
                }
                  
            }
        }

        
        protected void ASPxGridViewUserList_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            ASPxGridView mGrid = (ASPxGridView)sender;
            ASPxPageControl mASPxPageControl = mGrid.FindEditFormTemplateControl("ASPxPageControlUsers") as ASPxPageControl;
            
            ASPxTextBox mTextBoxUserName = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxUserName");
            ASPxTextBox mTextBoxLoginName = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLoginName");
            ASPxTextBox mTextBoxPassword = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxPassword");
            ASPxTextBox mTextBoxPhone = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxPhone");
            ASPxTextBox mTextBoxMobile = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxMobile");
            ASPxTextBox mTextBoxEmail = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxEmail");
            ASPxCheckBox mCheckBoxValidUser = (ASPxCheckBox)mASPxPageControl.FindControl("ASPxCheckBoxValidUser");
            ASPxTextBox mTextBoxHiddenUserID = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxHiddenUserID");

            Global.ExecuteStoredProcedureNoResults("Users_Update_Insert", new string[10] { "@TT_USER", "@USERNAME", "@PASSWORD", "@PHONE", "@PHONE_MOBILE", "@EMAIL", "@USER_CREATE", "@USER_UPDATE", "@VALID_FLG", "@USER_ID" },
                                        new Object[10] { mTextBoxUserName.Text, mTextBoxLoginName.Text, mTextBoxPassword.Text, mTextBoxPhone.Text, mTextBoxMobile.Text, mTextBoxEmail.Text, Global.CustomSession["UserName"], Global.CustomSession["UserName"], mCheckBoxValidUser.Value, mTextBoxHiddenUserID.Text });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }


        protected void ASPxGridViewTeams_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            String mUserID = (String)Global.CustomSession["mUserID"];
            if (e.Column.Name == "Team" & ((ASPxGridView)sender).IsNewRowEditing == true)
            {
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                DataTable mDataTable = Global.ExecuteStoredProcedure("User_Teams_Select_New_List", new string[1] { "@uid" }, new Object[1] { mUserID });
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["Team"].ToString(), mDataTable.Rows[i]["Hidden_team_id"]);
                }
            }
        }

        protected void ASPxGridViewTeams_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            String mUserID = (String)Global.CustomSession["mUserID"];
            Global.ExecuteStoredProcedureNoResults("User_Admin_Team_Users_List_Update_Insert", new string[4] { "@Checked", "@READ_ONLY", "@USER_ID", "@TEAM_ID" },
                                                    new Object[4] { 1, e.NewValues[1], mUserID, e.NewValues[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();    
        }

        protected void ASPxGridViewTeams_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String mUserID = (String)Global.CustomSession["mUserID"];
            Global.ExecuteStoredProcedureNoResults("User_Admin_Team_Users_List_Update_Insert", new string[4] { "@Checked", "@READ_ONLY", "@USER_ID", "@TEAM_ID" },
                                                    new Object[4] { 0, 0, mUserID, e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }


        protected void ASPxGridViewTeams_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            String mUserID = (String)Global.CustomSession["mUserID"];
            
            Global.ExecuteStoredProcedureNoResults("User_Admin_Team_Users_List_Update_Insert", new string[4] { "@Checked", "@READ_ONLY", "@USER_ID", "@TEAM_ID" },
                                                    new Object[4] { 1, e.NewValues[1], mUserID, e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }


        protected void ASPxGridViewUserList_HtmlEditFormCreated(object sender, ASPxGridViewEditFormEventArgs e)
        {

            ASPxPageControl mASPxPageControl = ((ASPxGridView)sender).FindEditFormTemplateControl("ASPxPageControlUsers") as ASPxPageControl;
            ASPxGridView mGrid = (ASPxGridView)sender;
            int index = mGrid.FocusedRowIndex; 
            ASPxGridView mGridTeams = mASPxPageControl.FindControl("ASPxGridViewTeams") as ASPxGridView;
            ASPxGridView mGridRoles = mASPxPageControl.FindControl("ASPxGridCiewRoles") as ASPxGridView;

                        
            if (((ASPxGridView)sender).IsNewRowEditing == true)
            {
                mGridTeams.Visible = false;
                mGridRoles.Visible = false;
                Global.CustomSession["SystemNewRow"] = 1;
            }
            else
            {
                Global.CustomSession["SystemNewRow"] = 0;

                Int32 mUserID = (Int32)mGrid.GetRowValues(index, new string[1] { "Hidden_user_id" });
                Global.CustomSession["mUserID"] = mUserID.ToString();


                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                bool mIsAdmin = false;
                for (int i = 0; i < mRoles.Count; i++)
                {
                    if (mRoles[i] == "User Admin")
                    {
                        mIsAdmin = true;
                        break;
                    }
                }
                if (!mIsAdmin)
                {
                    (mGridTeams.Columns["EditButtons"] as GridViewColumn).Visible = false;
                    (mGridRoles.Columns["EditButtons"] as GridViewColumn).Visible = false;
                }
                //else
                //{
                //    (mGridTeams.Columns["EditButtons"] as GridViewColumn).Visible = true;
                //    (mGridRoles.Columns["EditButtons"] as GridViewColumn).Visible = true;                    
                //}

            }           
        }

        protected void ASPxGridCiewRoles_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

            String mUserID = (String)Global.CustomSession["mUserID"];

            if (e.Column.Name == "Role" & ((ASPxGridView)sender).IsNewRowEditing == true)
            {
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                DataTable mDataTable = Global.ExecuteStoredProcedure("User_Roles_Select_to_Add", new string[1] { "@uid" }, new Object[1] { mUserID });
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["Role"].ToString(), mDataTable.Rows[i]["Hidden_role_id"]);
                }
            }

        }

        protected void ASPxGridCiewRoles_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            String mUserID = (String)Global.CustomSession["mUserID"];
            Global.ExecuteStoredProcedureNoResults("User_Admin_Role_Users_List_Update_Insert", new string[3] { "@Checked", "@USER_ID", "@ROLE_ID" },
                                                    new Object[3] { 1, mUserID, e.NewValues[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridCiewRoles_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String mUserID = (String)Global.CustomSession["mUserID"];
            Global.ExecuteStoredProcedureNoResults("User_Admin_Role_Users_List_Update_Insert", new string[3] { "@Checked", "@USER_ID", "@ROLE_ID" },
                                                    new Object[3] { 0, mUserID, e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewUserList_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            (sender as ASPxGridView).DetailRows.CollapseAllRows();
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

        protected void ASPxMenu2_Init(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            Int32 SystemNewRow = 1;

            if (Global.CustomSession["SystemNewRow"] != null)
            { SystemNewRow = (Int32)Global.CustomSession["SystemNewRow"]; };


            if ((!mRoles.Contains("User Admin")) || (SystemNewRow == 1))
            {
                mASPxMenu.Enabled = false;
            }
            else
            {
                mASPxMenu.Enabled = true;
            }
        }

        protected void ASPxMenu3_Init(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            Int32 SystemNewRow = 1;

            if (Global.CustomSession["SystemNewRow"] != null)
            { SystemNewRow = (Int32)Global.CustomSession["SystemNewRow"]; };
            if ((!mRoles.Contains("User Admin")) || (SystemNewRow == 1))
            {
                mASPxMenu.Enabled = false;
            }
            else
            {
                mASPxMenu.Enabled = true;
            }
        }
    }
}