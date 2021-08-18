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
    public partial class RoutingPath : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    string mCallbackId = (string)Request.Params["__CALLBACKID"];
                    if (!ASPxGridViewRoutingPath.IsEditing)
                    {
                        ASPxGridViewRoutingPath.DataSource = Global.CustomSession["RoutingPathTable"];
                    }
                }
                else
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
            }
            else if (Page.IsPostBack)
            {
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
        }

        private void MasterDataBind()
        {
            ASPxGridViewRoutingPath.DataSource = Global.ExecuteStoredProcedure("Config_Admin_TT_Routing_Path_List ", new string[0] { }, new Object[0] { });
            Global.CustomSession["RoutingPathTable"] = ASPxGridViewRoutingPath.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("RoutingPathTable");
            ASPxGridViewRoutingPath.DataBind();
        }

        protected void ASPxGridViewRoutingPath_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_Routing_Path_List_Delete", new string[1] { "@Hidden_id" },
                                                                  new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewRoutingPath_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            string mFromTeamId = null;
            string mToteamId = null;
            mFromTeamId = GetTeamIdFromTeamName((string)e.NewValues[0]);
            mToteamId = GetTeamIdFromTeamName((string)e.NewValues[1]);

            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_Routing_Path_List_Update_Insert", new string[9] { "@HIDDEN_ID", "@FROM_TEAM_ID", "@TO_TEAM_ID", "@VERIFY_COMPLETION_TEAM", "@PROCESS", "@CONDITION", "@Approve_only", "@Cancel_team", "Valid_flg" },
                                                                  new Object[9] { 0, mFromTeamId, mToteamId, e.NewValues["Verify_Completion_Team"], e.NewValues["Process"], e.NewValues["Condition"], e.NewValues["Approve_only"], e.NewValues["Cancel_team"], e.NewValues["Valid_flg"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        private string GetTeamIdFromTeamName(string aTeamName)
        {
            DataTable mDataTable = (DataTable)Global.CustomSession["UserTeamTable"];
            DataRow mRow = null;
            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                mRow = mDataTable.Rows[i];
                if (mRow[1].ToString() == aTeamName)
                {
                    return mRow[0].ToString();
                }
            }
            return null;
        }

        protected void ASPxGridViewRoutingPath_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            string mFromTeamId  = null;
            string mToteamId = null;
            mFromTeamId = GetTeamIdFromTeamName((string)e.NewValues[0]);
            mToteamId = GetTeamIdFromTeamName((string)e.NewValues[1]);
            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_Routing_Path_List_Update_Insert", new string[9] { "@HIDDEN_ID", "@FROM_TEAM_ID", "@TO_TEAM_ID", "@VERIFY_COMPLETION_TEAM", "@PROCESS", "@CONDITION", "@Approve_only", "@Cancel_team", "Valid_flg" },
                                                                 new Object[9] { e.Keys[0], mFromTeamId, mToteamId, e.NewValues["Verify_Completion_Team"], e.NewValues["Process"], e.NewValues["Condition"], e.NewValues["Approve_only"], e.NewValues["Cancel_team"], e.NewValues["Valid_flg"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewRoutingPath_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            switch (e.Column.FieldName)
            {
                case "From_Team":
                    {
                        ASPxComboBox mCombo = (ASPxComboBox)e.Editor;
                        //if (e.Value == null)
                        {
                            DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_TT_Lookup_Teams", null, null);
                            Global.CustomSession["UserTeamTable"] = mDataTable;
                            DataRow mRow = null;
                            for (int i = 0; i < mDataTable.Rows.Count; i++)
                            {
                                mRow = mDataTable.Rows[i];
                                mCombo.Items.Add((string)mRow[1]/*, mRow[0]*/);
                            }
                        }
                    }
                    break;
                case "To_Team":
                    {
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_TT_Lookup_Teams", null, null);
                        Global.CustomSession["UserTeamTable"] = mDataTable;
                        ASPxComboBox mCombo = (ASPxComboBox)e.Editor;
                        //if (e.Value == null)
                        {
                            DataRow mRow = null;
                            if (mCombo.Items.Count == 0)
                            {
                                for (int i = 0; i < mDataTable.Rows.Count; i++)
                                {
                                    mRow = mDataTable.Rows[i];
                                    mCombo.Items.Add((string)mRow[1]/*, mRow[0]*/);
                                }
                            }
                        }
                        
                    }
                    break;
                case "Verify_Completion_Team":
                    {
                        //if (!ASPxGridViewRoutingPath.IsEditing)
                        {
                            if (e.Value == null)
                            {
                                ASPxCheckBox mCheckBox = (ASPxCheckBox)e.Editor;
                                mCheckBox.Checked = false;
                            }
                        }
                    }
                    break;

                case "Process":
                    {

                            ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                            DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_Process_List", null, null);
                            for (int i = 0; i < mDataTable.Rows.Count; i++)
                            {
                                mCombobox.Items.Add(mDataTable.Rows[i]["Process"].ToString(), mDataTable.Rows[i]["Process"]);
                            }
                        
                    }


                    //    ASPxDropDownEdit mDropDownEdit = (ASPxDropDownEdit)e.Editor;
                    //    ASPxListBox mListBox = (ASPxListBox)mDropDownEdit.FindControl("listBox");
                    //    DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_Process_List", null, null);
                    //    int count = mDataTable.Rows.Count;
                    //    DataRow mRow;
                    //    if (e.Value != null)
                    //    {
                    //        string[] mChecked = e.Value.ToString().Split(new char[1] { ';' });
                    //        for (int i = 0; i < count; i++)
                    //        {
                    //            mListBox.Items.Add(mDataTable.Rows[i]["Process"].ToString(), mDataTable.Rows[i]["Process"]);
                    //            for (int k = 0; k < mChecked.Length; k++)
                    //            {
                    //                if (mChecked[k] == mListBox.Items[i + 1].ToString())
                    //                {
                    //                    mListBox.Items[i + 1].Selected = true;
                    //                }
                    //            }
                    //        }
                    //    }
                    //    else
                    //    {
                    //        for (int i = 0; i < count; i++)
                    //        {
                    //            mListBox.Items.Add(mDataTable.Rows[i]["Process"].ToString(), mDataTable.Rows[i]["Process"]);
                    //        }
                    //    }
                    //}
                    break;
             }
        }


        protected void ButtonInitiateTT_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/InitiateTT.aspx");
        }

        protected void ASPxGridViewRoutingPath_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            /*if (Global.CustomSession["ASPxGridViewRoutingPathUpdating"] != null)
            {
                e.Properties["cpUpdating"] = true;
            }
            else e.Properties["cpUpdating"] = false;*/
        }






       
    }
}