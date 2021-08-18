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
    public partial class FixedProfiles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack && !Page.IsCallback)
            {
                MasterDataBind();
            }
            else if (Page.IsCallback)
            {

                /*ASPxGridView mAreas = ASPxGridViewProfileList.FindEditFormTemplateControl("ASPxGridViewAreas") as ASPxGridView;
                if (mAreas != null && mAreas.IsCallback)
                {

                    int editingRowVisibleIndex = ASPxGridViewProfileList.EditingRowVisibleIndex;
                    Guid index = (Guid)ASPxGridViewProfileList.GetRowValues(editingRowVisibleIndex, "ID");

                    mAreas.DataSource = Global.ExecuteStoredProcedure("Fixed_Profiles_per_Area_List", new string[1] { "@PROFILE_ID" }, new Object[1] { index });
                    mAreas.DataBind();
                }*/
                /*if (Session.Keys.Count == 0)
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }*/
                MasterDataBind();
            }
            else
            {
                ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).CleanupSessionObjects();
                ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("cpExpandedRow");
                MasterDataBind();
            }
            ASPxGridViewProfileList.SettingsText.ConfirmDelete = "Are you sure that you want to permanently delete the selected profile?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewProfileList.DataSource = Global.ExecuteStoredProcedure("Fixed_Users_Profile_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["FixedProfilesListTable"] = ASPxGridViewProfileList.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("FixedProfilesListTable");
            ASPxGridViewProfileList.DataBind();

            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            bool mIsAdmin = false;
            for (int i = 0; i < mRoles.Count; i++)
            {
                if (mRoles[i] == "Fixed Engineer Profile Admin")
                {
                    mIsAdmin = true;
                    break;
                }
            }
            if (!mIsAdmin)
            {
                (ASPxGridViewProfileList.Columns["EditButtons"] as GridViewColumn).Width = 30;
                (ASPxGridViewProfileList.Columns["EditButtons"] as GridViewCommandColumn).ShowDeleteButton = false;
            }
            else
            {
                (ASPxGridViewProfileList.Columns["EditButtons"] as GridViewColumn).Width = 50;
                (ASPxGridViewProfileList.Columns["EditButtons"] as GridViewCommandColumn).ShowDeleteButton = true;
            }
        }


        protected void ASPxGridViewProfileList_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView mgrid = sender as ASPxGridView;
            ASPxCheckBoxList cbl = mgrid.FindEditFormTemplateControl("AspxCheckBoxListSLAs") as ASPxCheckBoxList;

            string ean13 = String.Empty;
            if (cbl.SelectedItems.Count > 0)
            {
                foreach (string SLA in cbl.SelectedValues)
                {
                    ean13 += SLA.ToString() + '#';
                }
            }

            ASPxComboBox mComboUser = mgrid.FindEditFormTemplateControl("AspxComboBoxUser") as ASPxComboBox;

            Int32 mUserid = 0;

            if (mComboUser.SelectedIndex != -1)
            { mUserid = (Int32)mComboUser.Value; }

            //Guid mProfileGuid = Guid.NewGuid();

            Global.ExecuteStoredProcedureNoResults("Fixed_Users_Profile_Update_Insert", new string[25] { "@ID", "@USER_ID", "@FIXED_USER_ENABLED", "@TEMPORARY", "@FROM_DAY", "@TO_DAY", "@SLA", "@MON_FROM", "@MON_TO", "@TUE_FROM", "@TUE_TO", "@WED_FROM", "@WED_TO", "@THU_FROM", "@THU_TO", "@FRI_FROM", "@FRI_TO", "@SAT_FROM", "@SAT_TO", "@SUN_FROM", "@SUN_TO", "@ON_LEAVE_FROM", "@ON_LEAVE_TO", "@UPDATED_BY", "@TYPE" },
                                        new Object[25] { Global.CustomSession["NewFixedProfileGuid"], mUserid, e.NewValues["FIXED_USER_ENABLED"], e.NewValues["TEMPORARY"], e.NewValues["FROM_DAY"], e.NewValues["TO_DAY"], ean13, e.NewValues["MON_FROM"], e.NewValues["MON_TO"], e.NewValues["TUE_FROM"], e.NewValues["TUE_TO"], e.NewValues["WED_FROM"], e.NewValues["WED_TO"], e.NewValues["THU_FROM"], e.NewValues["THU_TO"], e.NewValues["FRI_FROM"], e.NewValues["FRI_TO"], e.NewValues["SAT_FROM"], e.NewValues["SAT_TO"], e.NewValues["SUN_FROM"], e.NewValues["SUN_TO"], e.NewValues["ON_LEAVE_FROM"], e.NewValues["ON_LEAVE_TO"], Global.CustomSession["UserId"], "I" });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewProfileList_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Fixed_Users_Profile_Delete", new string[1] { "@id" }, new object[1] { e.Keys[0] });
            e.Cancel = true;
            MasterDataBind();
            ((ASPxGridView)sender).CancelEdit();
        }

        protected void ASPxGridViewProfileList_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            e.Properties["cpExpandedRow"] = Global.CustomSession["cpExpandedRow"];
        }

        protected void ASPxGridViewProfileList_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            ASPxGridView mgrid = sender as ASPxGridView;
            ASPxCheckBoxList cbl = mgrid.FindEditFormTemplateControl("AspxCheckBoxListSLAs") as ASPxCheckBoxList;

            string ean13 = String.Empty;
            if (cbl.SelectedItems.Count > 0)
            {
                foreach (string SLA in cbl.SelectedValues)
                {
                    ean13 += SLA.ToString() + '#';
                }
            }

            ASPxComboBox mComboUser = mgrid.FindEditFormTemplateControl("AspxComboBoxUser") as ASPxComboBox;
            Int32 mUserid = (Int32)mComboUser.Value;

            Global.ExecuteStoredProcedureNoResults("Fixed_Users_Profile_Update_Insert", new string[25] { "@ID", "@USER_ID", "@FIXED_USER_ENABLED", "@TEMPORARY", "@FROM_DAY", "@TO_DAY", "@SLA", "@MON_FROM", "@MON_TO", "@TUE_FROM", "@TUE_TO", "@WED_FROM", "@WED_TO", "@THU_FROM", "@THU_TO", "@FRI_FROM", "@FRI_TO", "@SAT_FROM", "@SAT_TO", "@SUN_FROM", "@SUN_TO", "@ON_LEAVE_FROM", "@ON_LEAVE_TO", "@UPDATED_BY", "@TYPE" },
                                        new Object[25] { e.Keys[0], mUserid, e.NewValues["FIXED_USER_ENABLED"], e.NewValues["TEMPORARY"], e.NewValues["FROM_DAY"], e.NewValues["TO_DAY"], ean13, e.NewValues["MON_FROM"], e.NewValues["MON_TO"], e.NewValues["TUE_FROM"], e.NewValues["TUE_TO"], e.NewValues["WED_FROM"], e.NewValues["WED_TO"], e.NewValues["THU_FROM"], e.NewValues["THU_TO"], e.NewValues["FRI_FROM"], e.NewValues["FRI_TO"], e.NewValues["SAT_FROM"], e.NewValues["SAT_TO"], e.NewValues["SUN_FROM"], e.NewValues["SUN_TO"], e.NewValues["ON_LEAVE_FROM"], e.NewValues["ON_LEAVE_TO"], Global.CustomSession["UserId"], "U" });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewProfileList_HtmlEditFormCreated(object sender, ASPxGridViewEditFormEventArgs e)
        {
            ASPxGridView mASPxView = ((ASPxGridView)sender).FindEditFormTemplateControl("ASPxGridViewAreas") as ASPxGridView;
            if (((ASPxGridView)sender).IsNewRowEditing != true)
            {
                ASPxGridView mGrid = (ASPxGridView)sender;
                Int32 editingRowVisibleIndex = mGrid.EditingRowVisibleIndex;
                
                if (editingRowVisibleIndex >-1)
                {
                    Guid index = (Guid)mGrid.GetRowValues(editingRowVisibleIndex, "ID");

                    
                    mASPxView.DataSource = Global.ExecuteStoredProcedure("Fixed_Profiles_per_Area_List", new string[1] { "@PROFILE_ID" }, new Object[1] { index });
                    mASPxView.DataBind();

                    ASPxCheckBoxList cbl = mGrid.FindEditFormTemplateControl("AspxCheckBoxListSLAs") as ASPxCheckBoxList;
                
                    cbl.Items.FindByText("SLA1").Selected = (bool)mGrid.GetRowValuesByKeyValue(index, "SLA1");
                    cbl.Items.FindByText("SLA2").Selected = (bool)mGrid.GetRowValuesByKeyValue(index, "SLA2");
                    cbl.Items.FindByText("SLA3").Selected = (bool)mGrid.GetRowValuesByKeyValue(index, "SLA3");
                    cbl.Items.FindByText("SLA4").Selected = (bool)mGrid.GetRowValuesByKeyValue(index, "SLA4");
                    cbl.Items.FindByText("SLA5").Selected = (bool)mGrid.GetRowValuesByKeyValue(index, "SLA5");
                    cbl.Items.FindByText("SLA6").Selected = (bool)mGrid.GetRowValuesByKeyValue(index, "SLA6");
                    cbl.Items.FindByText("SLA7").Selected = (bool)mGrid.GetRowValuesByKeyValue(index, "SLA7");
                    cbl.Items.FindByText("SLA8").Selected = (bool)mGrid.GetRowValuesByKeyValue(index, "SLA8");
                    cbl.Items.FindByText("SLA9").Selected = (bool)mGrid.GetRowValuesByKeyValue(index, "SLA9");
                    cbl.Items.FindByText("SLA10").Selected = (bool)mGrid.GetRowValuesByKeyValue(index, "SLA10");
                    cbl.Items.FindByText("SLA11").Selected = (bool)mGrid.GetRowValuesByKeyValue(index, "SLA11");
                    cbl.Items.FindByText("SLA12").Selected = (bool)mGrid.GetRowValuesByKeyValue(index, "SLA12");
                }
            }
            else
            {
                mASPxView.DataSource = Global.ExecuteStoredProcedure("Fixed_Profiles_per_Area_List", new string[1] { "@PROFILE_ID" }, new Object[1] { Guid.NewGuid() });
                mASPxView.DataBind();

            }
        }

        protected void ASPxMenu1_Load(object sender, EventArgs e)
        {

            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            if (!mRoles.Contains("Fixed Engineer Profile Admin"))
            {
                mASPxMenu.Enabled = false;
            }
            else
            {
                mASPxMenu.Enabled = true;
            }
        }

        protected void ASPxComboBoxUser_Init(object sender, EventArgs e)
        {
            ASPxComboBox comb = (ASPxComboBox)sender;

            comb.Items.Clear();
            DataTable mDataTable = Global.ExecuteStoredProcedure("Fixed_Engineers_Lookup", new string[0] {}, new Object[0] {});
            DataRow mRow = null;
            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                mRow = mDataTable.Rows[i];
                comb.Items.Add(mRow[0].ToString(), mRow[1]);
            }
        }

        protected void ASPxGridViewAreas_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();

            if (keyValue == null)
            {
                keyValue = Global.CustomSession["NewFixedProfileGuid"];
            };

            Int32 mUserID = (Int32)Global.CustomSession["UserId"];
            Global.ExecuteStoredProcedureNoResults("Fixed_Profiles_per_Area_Insert", new string[3] { "@PROFILE_ID", "@CONFIG_VALUE_ID", "@UPDATED_BY" },
                                                    new Object[3] { keyValue, e.NewValues[0], mUserID});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;

            detailGrid.DataSource = Global.ExecuteStoredProcedure("Fixed_Profiles_per_Area_List", new string[1] { "@PROFILE_ID" }, new Object[1] { keyValue });
            detailGrid.DataBind();
        }

        protected void ASPxGridViewAreas_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            if (keyValue == null)
            {
                keyValue = Global.CustomSession["NewFixedProfileGuid"];
            };

            Global.ExecuteStoredProcedureNoResults("Fixed_Profiles_per_Area_Delete", new string[2] { "@PROFILE_ID", "@CONFIG_VALUE_ID"},
                                                    new Object[2] { keyValue, e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;

            detailGrid.DataSource = Global.ExecuteStoredProcedure("Fixed_Profiles_per_Area_List", new string[1] { "@PROFILE_ID" }, new Object[1] { keyValue });
            detailGrid.DataBind();
        }

        protected void ASPxGridViewAreas_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.Name == "CONFIGURATION_VALUE")
            {
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                DataTable mDataTable = Global.ExecuteStoredProcedure("Fixed_Areas_Lookup", new string[0] {}, new Object[0] {});
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["Area"].ToString(), mDataTable.Rows[i]["ID"]);
                }
            }
        }

        protected void ASPxGridViewProfileList_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            ASPxCheckBoxList cbl = mGrid.FindEditFormTemplateControl("AspxCheckBoxListSLAs") as ASPxCheckBoxList;

            cbl.Items.FindByText("SLA1").Selected = true;
            cbl.Items.FindByText("SLA2").Selected = true;
            cbl.Items.FindByText("SLA3").Selected = true;
            cbl.Items.FindByText("SLA4").Selected = true;
            cbl.Items.FindByText("SLA5").Selected = true;
            cbl.Items.FindByText("SLA6").Selected = true;
            cbl.Items.FindByText("SLA7").Selected = true;
            cbl.Items.FindByText("SLA8").Selected = true;
            cbl.Items.FindByText("SLA9").Selected = true;
            cbl.Items.FindByText("SLA10").Selected = true;
            cbl.Items.FindByText("SLA11").Selected = true;
            cbl.Items.FindByText("SLA12").Selected = true;

            ASPxTextBox tb1 = mGrid.FindEditFormTemplateControl("ASPxTextBoxMonFrom") as ASPxTextBox;
            tb1.Text = "09";
            ASPxTextBox tb2 = mGrid.FindEditFormTemplateControl("ASPxTextBoxMonTo") as ASPxTextBox;
            tb2.Text = "17";
            ASPxTextBox tb3 = mGrid.FindEditFormTemplateControl("ASPxTextBoxTueFrom") as ASPxTextBox;
            tb3.Text = "09";
            ASPxTextBox tb4 = mGrid.FindEditFormTemplateControl("ASPxTextBoxTueTo") as ASPxTextBox;
            tb4.Text = "17";
            ASPxTextBox tb5 = mGrid.FindEditFormTemplateControl("ASPxTextBoxWedFrom") as ASPxTextBox;
            tb5.Text = "09";
            ASPxTextBox tb6 = mGrid.FindEditFormTemplateControl("ASPxTextBoxWedTo") as ASPxTextBox;
            tb6.Text = "17";
            ASPxTextBox tb7 = mGrid.FindEditFormTemplateControl("ASPxTextBoxThuFrom") as ASPxTextBox;
            tb7.Text = "09";
            ASPxTextBox tb8 = mGrid.FindEditFormTemplateControl("ASPxTextBoxThuTo") as ASPxTextBox;
            tb8.Text = "17";
            ASPxTextBox tb9 = mGrid.FindEditFormTemplateControl("ASPxTextBoxFriFrom") as ASPxTextBox;
            tb9.Text = "09";
            ASPxTextBox tb10 = mGrid.FindEditFormTemplateControl("ASPxTextBoxFriTo") as ASPxTextBox;
            tb10.Text = "17";

            ASPxCheckBox cb = mGrid.FindEditFormTemplateControl("ASPxCheckBoxEnabled") as ASPxCheckBox;
            cb.Checked = true;

            //ASPxGridView gv = mGrid.FindEditFormTemplateControl("ASPxGridViewAreas") as ASPxGridView;
            //gv.Enabled = false;
            Guid mProfileGuid = Guid.NewGuid();
            Global.CustomSession["NewFixedProfileGuid"] = mProfileGuid;
        }

        protected void ASPxGridViewProfileList_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }
    }
}