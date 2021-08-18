using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using System.Diagnostics;
using System.Globalization;
using DevExpress.Web.ASPxScheduler;
using System.Resources;
using DevExpress.XtraScheduler;
using System.Collections;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Drawing;



namespace TTWeb
{
    public partial class AppointmentScheduler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker =  Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                Debug.WriteLine("CALLBACKPARAM: " + HttpContext.Current.Request.Params["__CALLBACKPARAM"]);
                Debug.WriteLine("CALLBACKID: " + Page.Request.Params["__CALLBACKID"]);

                if (mSessionResourceTracker != null)
                {
                    MasterDataBind();
                }
                else
                {
                    DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/DeadSession.aspx");
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
            ASPxGridViewTickets.DataSource = Global.ExecuteStoredProcedure("Fixed_Find_Active_Tickets", new string[0] { }, new Object[0] { });
            Global.CustomSession["AppointmentSchedulerTable"] = ASPxGridViewTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("AppointmentSchedulerTable");
            ASPxGridViewTickets.DataBind();


            //Global.ExecuteStoredProcedure("TT_USR_VALIDATION", new string[2] { "@USERNAME", "@PASSWORD" }, new string[2] { Username.Text, Password.Text });
            if (ASPxComboBoxSLA.SelectedIndex != -1 && ASPxComboBoxArea.SelectedIndex != -1)
            {
                DataTable mTable = Global.ExecuteStoredProcedure("Fixed_Find_Resources_Workdays_per_SLA_Area", new string[2] { "@SLA", "@Area" }, new string[2] { ASPxComboBoxSLA.SelectedItem.Text, ASPxComboBoxArea.SelectedItem.Text });
                FillResources(TheScheduler.Storage, mTable);

                TheScheduler.LimitInterval.Start = (DateTime)Global.CustomSession["minSchedulerDate"];
                TheScheduler.LimitInterval.End = (DateTime)Global.CustomSession["maxSchedulerDate"];
            }
            
            MapCustomObjectsToAppointmentFields();
            TheScheduler.AppointmentDataSource = ObjectAppointmentsDataSource;
            TheScheduler.DataBind();
            //Global.CustomSession["SchedulerData"] = (DataTable)ASPxGridViewTickets.DataSource;
        }

        private void FillResources(ASPxSchedulerStorage storage, DataTable aDataTable)
        {
            ResourceCollection resources = storage.Resources.Items;
            storage.BeginUpdate();
            resources.Clear();
            DataRow mRow = null;

            Global.CustomSession["minSchedulerDate"] = Convert.ToDateTime(aDataTable.Compute("min(DATE_FROM)", string.Empty));
            Global.CustomSession["maxSchedulerDate"] = Convert.ToDateTime(aDataTable.Compute("max(DATE_TO)", string.Empty));

            DataView view = new DataView(aDataTable);
            DataTable aDataTableDist = view.ToTable(true, "USER_ID", "Resource");
                        
            try
            {
                for (int n = 0; n < aDataTableDist.Rows.Count; n++)
                {
                    mRow = aDataTableDist.Rows[n];
                    Resource mResource = new Resource(mRow[0].ToString(), mRow[1].ToString());
                    if (!resources.Contains(mResource))
                    {
                        resources.Add(new Resource(mRow[0].ToString(), mRow[1].ToString()));
                    }
                    //resources.Add(new Resource("54", "Resource 2"));
                    //resources.Add(new Resource("55", "Resource 1"));
                    //resources.Add(new Resource("56", "Resource 3"));
                    //resources.Add(new Resource("57", "Resource 4"));
                }
            }
            finally
            {
                storage.EndUpdate();
            }
        }

        protected void ASPxGridViewTickets_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

        protected void ASPxComboBoxSLA_Init(object sender, EventArgs e)
        {
            DataTable mDataTable = Global.ExecuteStoredProcedure("Fixed_SLAs_Lookup", null, null);
            //ASPxComboBoxPriority.Items.Add("All", "All");

            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                ASPxComboBoxSLA.Items.Add(mDataTable.Rows[i]["SLA"].ToString(), mDataTable.Rows[i]["SLA"]);
            }
            if (mDataTable.Rows.Count !=0)
            {
                ASPxComboBoxSLA.SelectedIndex = 0;
            }
        }

        protected void ASPxComboBoxArea_Init(object sender, EventArgs e)
        {
            DataTable mDataTable = Global.ExecuteStoredProcedure("Fixed_Areas_Lookup", null, null);
            //ASPxComboBoxPriority.Items.Add("All", "All");

            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                ASPxComboBoxArea.Items.Add(mDataTable.Rows[i]["Area"].ToString(), mDataTable.Rows[i]["Area"]);
            }
            if (mDataTable.Rows.Count != 0)
            {
                ASPxComboBoxArea.SelectedIndex = 0;
            }
        }

        protected void TheScheduler_AppointmentChanging(object sender, PersistentObjectCancelEventArgs e)
        {

        }

        protected void TheScheduler_AppointmentDeleting(object sender, PersistentObjectCancelEventArgs e)
        {

        }

        protected void TheScheduler_AppointmentRowInserting(object sender, ASPxSchedulerDataInsertingEventArgs e)
        {
            
        }

        protected void TheScheduler_AppointmentInserting(object sender, PersistentObjectCancelEventArgs e)
        {
            
        }

        protected void TheScheduler_AppointmentRowUpdated(object sender, ASPxSchedulerDataUpdatedEventArgs e)
        {

        }

        protected void TheScheduler_AppointmentRowUpdating(object sender, ASPxSchedulerDataUpdatingEventArgs e)
        {

        }

        protected void TheScheduler_AppointmentRowDeleted(object sender, ASPxSchedulerDataDeletedEventArgs e)
        {

        }

        protected void TheScheduler_AppointmentRowDeleting(object sender, ASPxSchedulerDataDeletingEventArgs e)
        {

        }

        protected void TheScheduler_AppointmentsInserted(object sender, PersistentObjectsEventArgs e)
        {
            Appointment apt = (Appointment)e.Objects[0];

            /*BOAdminInsertShifts oInsertShifts = new BOAdminInsertShifts();
            oInsertShifts.Insert(apt.Start.ToString("MM/dd/yyyy"), apt.End.ToString("MM/dd/yyyy"), apt.Location, apt.Description, apt.Subject, apt.ResourceId.ToString());

            ASPxSchedulerStorage storage = (ASPxSchedulerStorage)sender;
            storage.SetAppointmentId(apt, this.lastInsertedAppointmentId);*/

            ASPxSchedulerStorage storage = (ASPxSchedulerStorage)sender;

            storage.SetAppointmentId(apt, apt.Id);
        }
        MyAppointmentDataSource objectInstance;
        protected void TheScheduler_AppointmentRowInserted(object sender, ASPxSchedulerDataInsertedEventArgs e)
        {
            e.KeyFieldValue = this.objectInstance.ObtainLastInsertedId();

            try
            {
                Global.ExecuteStoredProcedureNoResults("Fixed_Appointments_Insert", new string[6] { "@ID", "@Engineer_id", "@From", "@To", "@Comments", "@User_id" },
                    new Object[6] { e.NewValues["Subject"].ToString(), e.NewValues["ResourceId"].ToString(), e.NewValues["Start"], e.NewValues["End"], e.NewValues["Description"], 54 });
            }
            catch (Exception ex)
            {
                int malakia = 0;
            }
        }

        protected void TheScheduler_QueryWorkTime(object sender, QueryWorkTimeEventArgs e)
        {
            int resourceIndex = TheScheduler.Storage.Resources.Items.IndexOf(e.Resource);
            
            DataTable mWorkTable = (DataTable)Global.CustomSession["WorkTimeTable"];
            if (mWorkTable == null)
            {
                DataTable mTable = new DataTable("Hours");
                DataColumn mDataColumn = new DataColumn("USER_ID", Type.GetType("System.Int32"));

                mTable.Columns.Add(mDataColumn);
                mDataColumn = new DataColumn("Resource", Type.GetType("System.String"));
                mTable.Columns.Add(mDataColumn);

                mDataColumn = new DataColumn("DATE_FROM", Type.GetType("System.DateTime"));
                mTable.Columns.Add(mDataColumn);

                mDataColumn = new DataColumn("DATE_TO", Type.GetType("System.DateTime"));
                mTable.Columns.Add(mDataColumn);

                mTable.AcceptChanges();
                DataRow mRow = mTable.NewRow();
                mRow["USER_ID"] = 55;
                mRow["Resource"] = "Resource 1";
                mRow["DATE_FROM"] = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 9, 0, 0);
                mRow["DATE_TO"] = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 17, 0, 0);
                mTable.Rows.Add(mRow);

                mRow = mTable.NewRow();
                mRow["USER_ID"] = 54;
                mRow["Resource"] = "Resource 2";
                mRow["DATE_FROM"] = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 9, 0, 0);
                mRow["DATE_TO"] = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 11, 0, 0);
                mTable.Rows.Add(mRow);

                mRow = mTable.NewRow();
                mRow["USER_ID"] = 56;
                mRow["Resource"] = "Resource 3";
                mRow["DATE_FROM"] = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 9, 0, 0);
                mRow["DATE_TO"] = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 10, 0, 0);
                mTable.Rows.Add(mRow);

                mRow = mTable.NewRow();
                mRow["USER_ID"] = 57;
                mRow["Resource"] = "Resource 4";
                mRow["DATE_FROM"] = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 9, 0, 0);
                mRow["DATE_TO"] = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 13, 0, 0);
                mTable.Rows.Add(mRow);
                mTable.AcceptChanges();

                Global.CustomSession["WorkTimeTable"] = mTable;
                mWorkTable = mTable;
            }

            if (TheScheduler.WorkDays.IsWorkDay(e.Interval.Start.Date) && resourceIndex != -1)
            {
                DataRow mRow = null;
                for (int n=0; n<mWorkTable.Rows.Count ;n++)
                {
                    mRow = mWorkTable.Rows[n];
                    if ((object)mRow["USER_ID"] == (object)e.Resource.Id)
                    {
                        e.WorkTime = new TimeOfDayInterval(TimeSpan.FromHours(((DateTime)mRow["DATE_FROM"]).Hour), TimeSpan.FromHours(((DateTime)mRow["DATE_TO"]).Hour));
                        break;
                    }
                }
            }
        }

        private void MapCustomObjectsToAppointmentFields()
        {
            ASPxAppointmentMappingInfo mappings = TheScheduler.Storage.Appointments.Mappings;
            TheScheduler.Storage.BeginUpdate();
            try
            {
                mappings.AllDay = "AllDay";
                mappings.AppointmentId = "AppointmentId";
                mappings.Description = "Description";
                mappings.End = "End";
                mappings.Label = "Label";
                mappings.Location = "Location";
                mappings.RecurrenceInfo = "RecurrenceInfo";
                mappings.ReminderInfo = "ReminderInfo";
                mappings.ResourceId = "ResourceId";
                mappings.Start = "Start";
                mappings.Status = "Status";
                mappings.Subject = "Subject";
                mappings.Type = "EventType";
            }
            finally
            {
                TheScheduler.Storage.EndUpdate();
            }
        }

        protected void ObjectAppointmentsDataSource_ObjectCreated(object sender, ObjectDataSourceEventArgs e)
        {
            this.objectInstance = new MyAppointmentDataSource(GetMyAppointments());
            e.ObjectInstance = this.objectInstance;
        }

        private MyAppointmentList GetMyAppointments()
        {
            return GenerateMyAppointmentEventList();
        }

        private MyAppointmentList GenerateMyAppointmentEventList()
        {
            TimeIntervalCollection mCollection = TheScheduler.ActiveView.GetVisibleIntervals();
            DateTime StartDate = mCollection.Start;
            DateTime EndDate = mCollection.End;

            string startdatetime = StartDate.ToString("MM/dd/yyyy");
            string enddatetime = EndDate.ToString("MM/dd/yyyy");
            MyAppointmentList mList = new MyAppointmentList();
            if (ASPxComboBoxArea.SelectedItem != null)
            {
                DataTable mDataTable = Global.ExecuteStoredProcedure("Fixed_Find_Appointments_per_Area", new string[1] { "@Area" }, new Object[1] { ASPxComboBoxArea.SelectedItem.Text });
                DataRow mRow = null;
                for (int n = 0; n < mDataTable.Rows.Count; n++)
                {
                    mRow = mDataTable.Rows[n];
                    MyAppointment mAppointment = new MyAppointment();
                    mAppointment.Start = Convert.ToDateTime(mRow["APPOINTMENT_FROM"]);
                    mAppointment.End = Convert.ToDateTime(mRow["APPOINTMENT_TO"]);
                    mAppointment.AppointmentId = mRow["ID"].ToString();

                    mAppointment.ResourceId = mRow["ENGINEER_ID"].ToString();
                    mAppointment.Subject = "Scheduled";
                    //mAppointment.Subject = mRow["SHIFT_ACTIVITY"].ToString();

                    mAppointment.Description = mRow["OPERATOR_COMMENTS"].ToString();
                    //mAppointment.Location = mRow["SHIFT_R_DAY_SUBSTITUDE"].ToString();
                    mList.AddAppointment(mAppointment);
                }
            }
            return mList;
        }

        protected void TheScheduler_HtmlTimeCellPrepared(object handler, ASPxSchedulerTimeCellPreparedEventArgs e)
        {

        if ((e.Interval.Start < TheScheduler.LimitInterval.Start) |  (e.Interval.End > TheScheduler.LimitInterval.End)) 
            {
                    e.Cell.BackColor = SystemColors.Control;
                    e.Cell.BorderColor = SystemColors.Control; 
            }

        }
    }
}


[Serializable]
public class MyAppointmentList : BindingList<MyAppointment>
{
    public void AddRange(MyAppointmentList events)
    {
        Array.ForEach(events.ToArray(), e => this.Add(e));
    }

    public void AddAppointment(MyAppointment aAppointment)
    {
        this.Add(aAppointment);
    }

    public int GetEventIndex(object eventId)
    {
        for (int i = 0; i < Count; i++)
            if (this[i].AppointmentId == eventId)
                return i;
        return -1;
    }

}

[Serializable]
public class MyAppointment
{
    public object AppointmentId { get; set; }
    public DateTime Start { get; set; }
    public DateTime End { get; set; }
    public object ResourceId { get; set; }
    public string Subject { get; set; }
    public string Description { get; set; }
    public string Location { get; set; }

    public int Status { get; set; }
    public long Label { get; set; }
    public bool AllDay { get; set; }
    public int EventType { get; set; }
    public string RecurrenceInfo { get; set; }
    public string ReminderInfo { get; set; }
    public object OwnerId { get; set; }
    public double Price { get; set; }
    public string ContactInfo { get; set; }
}

public class MyAppointmentDataSource
{
    private MyAppointmentList events;
    public MyAppointmentList Events
    {
        get { return events; }
        set { events = value; }
    }

    public MyAppointmentDataSource(MyAppointmentList events)
    {
        this.events = events;
    }

    public MyAppointmentDataSource()
        : this(new MyAppointmentList())
    { }

    #region ObjectDataSource methods
    public void InsertMethodHandler(MyAppointment appointment)
    {
        Events.Add(appointment);
    }

    public void DeleteMethodHandler(MyAppointment appointment)
    {

        int eventIndex = Events.GetEventIndex(appointment.AppointmentId);
        if (eventIndex >= 0)
            Events.RemoveAt(eventIndex);
    }

    public void UpdateMethodHandler(MyAppointment appointment)
    {
        int eventIndex = Events.GetEventIndex(appointment.AppointmentId);
        if (eventIndex >= 0)
        {
            Events.RemoveAt(eventIndex);
            Events.Insert(eventIndex, appointment);
        }
    }

    public IEnumerable SelectMethodHandler()
    {
        MyAppointmentList result = new MyAppointmentList();
        result.AddRange(Events);
        return result;
    }
    #endregion

    public object ObtainLastInsertedId()
    {
        if (events.Count < 1)
            return null;
        return Events[events.Count - 1].AppointmentId;
    }

}

