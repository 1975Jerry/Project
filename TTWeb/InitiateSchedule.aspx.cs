using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using DevExpress.Web;

namespace TTWeb
{
    public partial class InitiateSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mReason = HttpContext.Current.Request.Params["__CALLBACKPARAM"];
            string mCallbackId = (string)Request.Params["__CALLBACKID"];
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];

            //ASPxGridViewScheduleProblems
            if (Page.IsCallback)
            {
                if (PopupControl.IsCallback || (Page.IsCallback && mCallbackId.EndsWith("ASPxGridViewTickets")))
                {
                    if (mReason.Contains("APPLYCOLUMNFILTER") || mReason.Contains("APPLYFILTER") || mReason.Contains("SORT") || mReason.Contains("PAGER") || mReason.Contains("REFRESH"))
                    {
                        TicketsGridDataBind();
                    }
                    return;
                }
                if (mSessionResourceTracker != null)
                {
                    if (Global.CustomSession["ScheduleProblemsTable"] == null)
                    {
                        ScheduleProblemsTableDataBind();
                    }
                    else
                    {
                        ASPxGridViewScheduleProblems.DataSource = (DataTable)Global.CustomSession["ScheduleProblemsTable"];
                        ASPxGridViewScheduleProblems.DataBind();
                    }
                    if (Global.CustomSession["TicketsTable"] == null)
                    {
                        TicketsGridDataBind();
                    }
                    else
                    {
                        ASPxGridViewTickets.DataSource = (DataTable)Global.CustomSession["TicketsTable"];
                        ASPxGridViewTickets.DataBind();
                    }
                    if (Global.CustomSession["ScheduleAttachmetsTable"] == null)
                    {
                        ScheduleAttachmetsTableDataBind();
                    }
                    else
                    {
                        ASPxGridViewAttachments.DataSource = (DataTable)Global.CustomSession["ScheduleAttachmetsTable"];
                        ASPxGridViewAttachments.DataBind();
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
                if (Global.CustomSession["ScheduleProblemsTable"] == null)
                {
                    ScheduleProblemsTableDataBind();
                }
                else
                {
                    ASPxGridViewScheduleProblems.DataSource = (DataTable)Global.CustomSession["ScheduleProblemsTable"];
                    ASPxGridViewScheduleProblems.DataBind();
                }
                if (Global.CustomSession["TicketsTable"] == null)
                {
                    TicketsGridDataBind();
                }
                if ((DataTable)Global.CustomSession["ScheduleAttachmetsTable"] == null)
                {
                    ScheduleAttachmetsTableDataBind();
                }
                else
                {
                    ASPxGridViewAttachments.DataSource = (DataTable)Global.CustomSession["ScheduleAttachmetsTable"];
                    ASPxGridViewAttachments.DataBind();
                }
            }
            else
            {
                if (mSessionResourceTracker == null)
                {
                    Response.Redirect("DeadSession.aspx");
                    return;
                }
                ((SessionResourceTracker)mSessionResourceTracker).CleanupSessionObjects();
                MasterDataBind();
            }
        }

        private void TicketsGridDataBind()
        {
            DataTable mDataTable = Global.ExecuteStoredProcedure("New_Schedule_Select_Ticket", null, null);
            mDataTable.PrimaryKey = new DataColumn[1] { mDataTable.Columns["TT_Id"]};
            ASPxGridViewTickets.DataSource = mDataTable;

            Global.CustomSession["TicketsTable"] = ASPxGridViewTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("TicketsTable");
            ASPxGridViewTickets.DataBind();
        }

        private void ScheduleProblemsTableDataBind()
        {
            DataTable mDataTable = new DataTable("ScheduleProblemsTable");
            DataColumn mDataColumn = new DataColumn("SRI", typeof(string));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("TT_Id", typeof(string));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("Location", typeof(string));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("Event", typeof(string));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("Priority", typeof(string));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("NewID", typeof(string));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("PROBLEM_ID", typeof(int));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("SEVERITY", typeof(string));
            mDataTable.Columns.Add(mDataColumn);

            mDataTable.PrimaryKey = new DataColumn[1] { mDataTable.Columns["TT_Id"] };

            ASPxGridViewScheduleProblems.DataSource = mDataTable;
            Global.CustomSession["ScheduleProblemsTable"] = ASPxGridViewScheduleProblems.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ScheduleProblemsTable");
            ASPxGridViewScheduleProblems.DataBind();
        }

        private void ScheduleAttachmetsTableDataBind()
        {
            DataTable mDataTable = new DataTable("ScheduleAttachmetsTable");
            DataColumn mDataColumn = new DataColumn("Hidden_attacment_id", typeof(Guid));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("TEAM_ID", typeof(string));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("USER_ID", typeof(DateTime));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("ATTACHMENT", typeof(byte[]));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("Filename", typeof(string));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("Uploaded_by", typeof(string));
            mDataTable.Columns.Add(mDataColumn);
            mDataColumn = new DataColumn("Uploaded_on", typeof(DateTime));
            mDataTable.Columns.Add(mDataColumn);

            ASPxGridViewAttachments.DataSource = mDataTable;
            Global.CustomSession["ScheduleAttachmetsTable"] = ASPxGridViewAttachments.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ScheduleAttachmetsTable");
            ASPxGridViewAttachments.DataBind();
        }

        private void MasterDataBind()
        {
            DataTable mDataTable = Global.ExecuteStoredProcedure("New_Schedule_Select_Creation_Team", new string[2] { "@USER_ID", "@PROCESS" }, new Object[2] { Global.CustomSession["UserId"], "Schedule" });
            DataRow mRow = null;
            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                mRow = mDataTable.Rows[i];
                ASPxComboBoxFromTeam.Items.Add(mRow[0].ToString(), mRow[1]);
            }

            DataTable mDataTable2 = Global.ExecuteStoredProcedure("New_Schedule_Select_To_Team", new string[2] { "@USER_ID", "@PROCESS" }, new Object[2] { Global.CustomSession["UserId"], "Schedule" });
            DataRow mRow2 = null;
            for (int i = 0; i < mDataTable2.Rows.Count; i++)
            {
                mRow2 = mDataTable2.Rows[i];
                ASPxComboBoxToTeam.Items.Add(mRow2[0].ToString(), mRow2[1]);
            }
                        
            ASPxComboBoxFromTeam.SelectedIndex = 0;
            ScheduleProblemsTableDataBind();
            ScheduleAttachmetsTableDataBind();
        }

        protected void ASPxGridViewScheduleProblems_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable mDataTable = (DataTable)Global.CustomSession["ScheduleProblemsTable"];
            DataRow mRow = null;
            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                mRow = mDataTable.Rows[i];
                if (mRow["TT_Id"] == e.Keys[0])
                {
                    mDataTable.Rows.Remove(mRow);
                    ASPxGridViewScheduleProblems.DataSource = mDataTable;
                    Global.CustomSession["ScheduleProblemsTable"] = mDataTable;
                    ASPxGridViewScheduleProblems.DataBind();
                    break;
                }
            }
            e.Cancel = true;
            ((ASPxGridView)sender).CancelEdit();
        }

        private void TransactedSave(string ToTeam)
        {
            int creationTeamId = Convert.ToInt32(ASPxComboBoxFromTeam.Value);
            int teamToSendId = Convert.ToInt32(ToTeam);

            int toTeamId = Convert.ToInt32(ASPxComboBoxToTeam.Value);
            int toEngineerId = Convert.ToInt32(ASPxComboBoxToEngineer.Value);
            int toEngineerId2 = Convert.ToInt32(ASPxComboBoxToEngineer2.Value);

            string comments = ASPxMemoComments.Text;
            bool success = true;

            // prepei na TO Do kai to Problem Description as well as to Comments
            using (SqlConnection mConnection = new SqlConnection(Global.GetConnectionString()))
            {
                SqlTransaction mTransaction = null;
                try
                {
                    mConnection.Open();
                    mTransaction = mConnection.BeginTransaction();
                    SqlCommand mSqlCommand = new SqlCommand { Connection = mConnection, Transaction = mTransaction, CommandTimeout = 30, CommandType = System.Data.CommandType.StoredProcedure, CommandText = "New_Schedule_Save_Schedule" };
                    Guid mScheduleGuid = Guid.NewGuid();
                    mSqlCommand.Parameters.AddWithValue("@ID", mScheduleGuid);
                    mSqlCommand.Parameters.AddWithValue("@PROCESS", "Schedule");
                    mSqlCommand.Parameters.AddWithValue("@CREATION_TEAM_ID", creationTeamId);
                    mSqlCommand.Parameters.AddWithValue("@CREATION_USER_ID", Global.CustomSession["UserId"]);
                    mSqlCommand.Parameters.AddWithValue("@CUR_TEAM_ID", teamToSendId);
                    mSqlCommand.Parameters.AddWithValue("@CUR_USER_ID", Global.CustomSession["UserId"]);

                    mSqlCommand.Parameters.AddWithValue("@SCHEDULE_DATE", ASPxDateEditScheduleDate.Value);
                    mSqlCommand.Parameters.AddWithValue("@INITIATOR_COMMENTS", comments);
                    mSqlCommand.Parameters.AddWithValue("@First_team_id", toTeamId);
                    mSqlCommand.Parameters.AddWithValue("@Assigned_user_id", toEngineerId);
                    mSqlCommand.Parameters.AddWithValue("@Assigned_user_id2", toEngineerId2);

                   // mSqlCommand.Parameters.AddWithValue("@SYSTEM_GROUP", systemgroup);
                    //mSqlCommand.Parameters.AddWithValue("@SYSTEM", system);

                    //mSqlCommand.Parameters.AddWithValue("@SYSTEM_INFO", systeminfo);
                    //mSqlCommand.Parameters.AddWithValue("@SYSTEM_AREA", systemarea);

                    //mSqlCommand.Parameters.AddWithValue("@SYSTEM_CODE", systemcode);
                    //mSqlCommand.Parameters.AddWithValue("@SYSTEM_DESCR", systemdescription);
                    
                    mSqlCommand.ExecuteNonQuery();
                    DataTable mProblemsTable = (DataTable)Global.CustomSession["ScheduleProblemsTable"];
                    mSqlCommand = null;
                    DataRow mRow = null;
                    int UserId = Convert.ToInt32(Global.CustomSession["UserId"]);
                    for (int n = 0; n < mProblemsTable.Rows.Count; n++)
                    {
                        mSqlCommand = new SqlCommand { Connection = mConnection, Transaction = mTransaction, CommandTimeout = 30, CommandType = System.Data.CommandType.StoredProcedure, CommandText = "New_Schedule_Save_Schedule_Item" };
                        mRow = mProblemsTable.Rows[n];
                        mSqlCommand.Parameters.AddWithValue("@ID", mScheduleGuid);
                        mSqlCommand.Parameters.AddWithValue("@TT_ID", mRow["TT_Id"]);
                        mSqlCommand.Parameters.AddWithValue("@User_id", Global.CustomSession["UserId"]);
                        mSqlCommand.ExecuteNonQuery();
                        mSqlCommand.Dispose();
                    }

                    DataTable mAttachmentsTable = (DataTable)Global.CustomSession["ScheduleAttachmetsTable"];
                    for (int n = 0; n < mAttachmentsTable.Rows.Count; n++)
                    {
                        //@tt_id uniqueidentifier, @team_id int, @user_id int, @attachment varbinary(max), @name_of varchar(200)
                        mSqlCommand = new SqlCommand { Connection = mConnection, Transaction = mTransaction, CommandTimeout = 30, CommandType = System.Data.CommandType.StoredProcedure, CommandText = "Edit_TT_View_Attachments_Add" };
                        mRow = mAttachmentsTable.Rows[n];
                        mSqlCommand.Parameters.AddWithValue("@id", mScheduleGuid);
                        mSqlCommand.Parameters.AddWithValue("@team_id", ASPxComboBoxFromTeam.SelectedItem.Value);
                        mSqlCommand.Parameters.AddWithValue("@user_id", Global.CustomSession["UserId"]);
                        mSqlCommand.Parameters.AddWithValue("@attachment", mRow["ATTACHMENT"]);
                        mSqlCommand.Parameters.AddWithValue("@name_of", mRow["Filename"]);
                        mSqlCommand.ExecuteNonQuery();
                        mSqlCommand.Dispose();
                    }

                    using (SqlCommand mSqlCommandRelease = new SqlCommand { Connection = mConnection, Transaction = mTransaction, CommandTimeout = 30, CommandType = System.Data.CommandType.StoredProcedure, CommandText = "Route_SCH" })
                    {
                        mSqlCommandRelease.Parameters.AddWithValue("@SCH_ID", mScheduleGuid);
                        mSqlCommandRelease.ExecuteNonQuery();
                    }
                    mTransaction.Commit();

                    mConnection.Close();
                    mConnection.Dispose();
                }
                catch (Exception e)
                {
                    success = false;
                    if (mTransaction != null)
                    {
                        mTransaction.Rollback();
                    }
                    if (mConnection != null)
                    {
                        mConnection.Close();
                        mConnection.Dispose();
                    }
                    throw e;
                }
                if (success) 
                {
                   DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/System_Views/ActiveSchedules.aspx");
                }
            }
        }

        protected void ASPxGridViewAttachments_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable mDataTable = (DataTable)Global.CustomSession["ScheduleAttachmetsTable"];
            DataRow mRow = null;
            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                mRow = mDataTable.Rows[i];
                if (mRow["Hidden_attacment_id"] == e.Keys[0])
                {
                    mDataTable.Rows.Remove(mRow);
                    ASPxGridViewAttachments.DataSource = mDataTable;
                    ASPxGridViewAttachments.DataBind();
                    break;
                }
            }
            e.Cancel = true;
        }

        protected void ASPxGridViewAttachments_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            DataTable mDataTable = (DataTable)ASPxGridViewAttachments.DataSource;
            if (mDataTable != null)
            {
                e.Properties["cpRowCount"] = mDataTable.Rows.Count;
            }
        }

        private void ASPxGridViewAttachmentsDataBind()
        {
            DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_Schedule_View_Attachments", new string[2] { "@ID", "@user_id" }, new Object[2] { Global.CustomSession["ID"], Global.CustomSession["UserId"] });
            ASPxGridViewAttachments.DataSource = mDataTable;
            ASPxGridViewAttachments.DataBind();
        }

        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            DataTable mDataTable = (DataTable)Global.CustomSession["ScheduleAttachmetsTable"];
            DataRow mRow = mDataTable.NewRow();
            mRow["Hidden_attacment_id"] = Guid.NewGuid();
            mRow["ATTACHMENT"] = e.UploadedFile.FileBytes;
            mRow["Filename"] = e.UploadedFile.FileName;
            mRow["Uploaded_by"] = Global.CustomSession["UserName"];
            mRow["Uploaded_on"] = DateTime.Now;
            mDataTable.Rows.Add(mRow);
            Global.CustomSession["ScheduleAttachmetsTable"] = mDataTable;
        }

        protected void ASPxGridViewScheduleProblems_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            DateTime mDateNow = DateTime.Now;
            DateTime mDateNowMinus2Years = mDateNow.AddYears(-2);
            DateTime mDateNowPlus2Years = mDateNow.AddYears(2);
   
            if ((DateTime)e.NewValues["EVENT_TIME"] >= mDateNow )
            {
                e.Errors[ASPxGridViewScheduleProblems.Columns["EVENT_TIME"]] = "Event time must be in the past.";
            }
            else if ((DateTime)e.NewValues["EVENT_TIME"] <= mDateNowMinus2Years)
            {
                e.Errors[ASPxGridViewScheduleProblems.Columns["EVENT_TIME"]] = "Event time must be within 2 years.";
            }
            if (e.NewValues["CEASED_TIME"] != null)
            {
                if (((DateTime)e.NewValues["CEASED_TIME"] >= mDateNowPlus2Years))
                {
                    e.Errors[ASPxGridViewScheduleProblems.Columns["CEASED_TIME"]] = "Cease time must be within 2 years.";
                }
                else if ((DateTime)e.NewValues["CEASED_TIME"] < (DateTime)e.NewValues["EVENT_TIME"])
                {
                    e.Errors[ASPxGridViewScheduleProblems.Columns["CEASED_TIME"]] = "Cease time must be after Event time.";
                }
            }
        }

        protected void ASPxCallbackInitiate_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
           TransactedSave(e.Parameter);
        }

        private void ConstructMenuInitiate(DataTable aDatatable)
        {
            DataRow mRow = null;
            bool mSelected = false;
            for (int i = 0; i < aDatatable.Rows.Count; i++)
            {
                mRow = aDatatable.Rows[i];
                DevExpress.Web.MenuItem mMainMenuItem = ASPxMenuInitiate.Items.Find(delegate(DevExpress.Web.MenuItem c) { return c.Text == mRow[0].ToString(); });
                if (mMainMenuItem == null)
                {
                    mMainMenuItem = new DevExpress.Web.MenuItem();
                    mMainMenuItem.Name = mRow[0].ToString().Replace(" ", "");
                    mMainMenuItem.Text = mRow[0].ToString();
                    ASPxMenuInitiate.Items.Add(mMainMenuItem);
                }
                DevExpress.Web.MenuItem mMenuItem = ASPxMenuInitiate.Items.Find(delegate(DevExpress.Web.MenuItem c) { return c.Text == mRow[1].ToString(); });
                if (mMenuItem == null)
                {
                    mMenuItem = new DevExpress.Web.MenuItem();
                    mMenuItem.Text = mRow[1].ToString();
                    mMenuItem.Name = String.Format("{0}/{1}", mMainMenuItem.Name, mRow[1].ToString().Replace(" ", ""));
                    if (mMenuItem.Name == "Actions/LogOut")
                    {
                        mMenuItem.Target = "_top";
                        mMenuItem.NavigateUrl = mRow[2].ToString();
                        //MemoryStream ms = new MemoryStream((byte[])mRow[5]);
                        //mMenuItem.Image. = System.Drawing.Image.FromStream(ms);
                    }
                    else
                    {
                        mMenuItem.NavigateUrl = mRow[2].ToString();
                       // mMenuItem.Target = ASPxSplitter1.GetPaneByName("GridPane").ContentUrlIFrameName;
                    }

                    if (!mSelected)
                    {
                        mSelected = true;
                        mMenuItem.Selected = true;
                    }
                    mMainMenuItem.Items.Add(mMenuItem);
                }
            }
        }

        protected void ASPxPopupControlInitiate_WindowCallback(object source, DevExpress.Web.PopupWindowCallbackArgs e)
        {
            ASPxGridView mGrid = ASPxGridViewScheduleProblems as ASPxGridView;
            int mRowCount = mGrid.VisibleRowCount;
            //string mEvents = "##";
            string mSeverity = "##";
            int mCounter = 0;

            while (mCounter < mRowCount)
            {
                mSeverity = mSeverity + mGrid.GetRowValues(mCounter, "Priority") + "##";
                mCounter = mCounter + 1;
            }

            if (ASPxComboBoxFromTeam.Value != null)
            {
                DataTable mDataTable = Global.ExecuteStoredProcedure("New_SCH_Select_Team_To_Send", new string[5] { "@FROM_TEAM_ID", "@process", "@Severity", "@Status", "@FOR_TEAM_ID" }, new Object[5] { ASPxComboBoxFromTeam.Value, "Schedule", mSeverity, "Initiating", Convert.ToInt32(ASPxComboBoxToTeam.Value) });
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    ASPxRadioButtonListToTeam.Items.Add(mDataTable.Rows[i][0].ToString(), mDataTable.Rows[i][1]);
                }
            }
        }

        private bool m_NeedsUpdate = false;
        protected void ASPxGridViewScheduleProblems_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            DataTable mTicketsTable = (DataTable)Global.CustomSession["TicketsTable"];
            if (mTicketsTable == null)
            {
                //mTicketsTable = 
            }
            DataTable ProblemsTable = (DataTable)Global.CustomSession["ScheduleProblemsTable"];
            string[] mArrayOfKeys = e.Parameters.Split(new char[1] { ',' });
            DataRow mTicketRow = null;
            DataRow mProblemsRow = null;
            for (int n = 0; n < mArrayOfKeys.Length; n++)
            {
                mTicketRow = mTicketsTable.Rows.Find(mArrayOfKeys[n]);
                if (ProblemsTable.Rows.Find(mArrayOfKeys[n]) == null)
                {
                    mProblemsRow = ProblemsTable.NewRow();
                    mProblemsRow["SRI"] = mTicketRow["SRI"];
                    mProblemsRow["TT_Id"] = mTicketRow["TT_Id"];
                    mProblemsRow["Location"] = mTicketRow["Location"];
                    mProblemsRow["Event"] = mTicketRow["Event"];
                    mProblemsRow["Priority"] = mTicketRow["Priority"];
                    mProblemsRow["NewID"] = Guid.NewGuid();
                    ProblemsTable.Rows.Add(mProblemsRow);
                    m_NeedsUpdate = true;
                }
            }

            Global.CustomSession["ScheduleProblemsTable"] = ProblemsTable;
            ((ASPxGridView)sender).DataSource = ProblemsTable;
            ((ASPxGridView)sender).DataBind();
        }

        protected void ASPxGridViewScheduleProblems_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            if ((DataTable)ASPxGridViewScheduleProblems.DataSource != null)
            {
                e.Properties["cpUpdate"] = m_NeedsUpdate;
            }

            if ((DataTable)ASPxGridViewScheduleProblems.DataSource != null)
            {
                e.Properties["cpRowCount"] = ((DataTable)ASPxGridViewScheduleProblems.DataSource).Rows.Count;
            }
        }

        protected void PopupControl_WindowCallback(object source, DevExpress.Web.PopupWindowCallbackArgs e)
        {
            if (Global.CustomSession["TicketsTable"] == null)
            {
                TicketsGridDataBind();
            }
            else
            {
                ASPxGridView mGrid = ((ASPxPopupControl)source).FindControl("ASPxGridViewTickets") as ASPxGridView;
                DataTable Source = (DataTable)Global.CustomSession["TicketsTable"];
                DataTable Target = (DataTable)Global.CustomSession["ScheduleProblemsTable"];
                if (Source != null && Target!=null)
                {
                    mGrid.Selection.UnselectAll();
                    object key = null;                    
                    for (int n = 0; n < Target.Rows.Count;n++)
                    {
                        key = Target.Rows[n]["TT_Id"];
                        mGrid.Selection.SelectRowByKey(key);
                    }
                }
            }
        }

        protected void ASPxComboBoxToEngineer_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (Page.IsCallback)
            {
                ASPxComboBoxToEngineer.Items.Clear();
                DataTable mDataTable = Global.ExecuteStoredProcedure("New_Schedule_Select_Engineer", new string[1] { "@TEAM_ID" }, new Object[1] { e.Parameter });
                DataRow mRow = null;
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mRow = mDataTable.Rows[i];
                    ASPxComboBoxToEngineer.Items.Add(mRow[0].ToString(), mRow[1]);
                }
            }
        }

        protected void ASPxComboBoxToEngineer2_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (Page.IsCallback)
            {
                ASPxComboBoxToEngineer2.Items.Clear();
                DataTable mDataTable = Global.ExecuteStoredProcedure("New_Schedule_Select_Engineer", new string[1] { "@TEAM_ID" }, new Object[1] { e.Parameter });
                DataRow mRow = null;
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mRow = mDataTable.Rows[i];
                    ASPxComboBoxToEngineer2.Items.Add(mRow[0].ToString(), mRow[1]);
                }

            }
        }


    }
}



