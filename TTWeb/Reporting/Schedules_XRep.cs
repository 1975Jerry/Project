using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace TTWeb.Reporting
{
    public partial class Schedules_XRep : DevExpress.XtraReports.UI.XtraReport
    {
        public Schedules_XRep()
        {
            InitializeComponent();
        }
        
        private void Schedules_XRep_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {

           // schedules_Dat1.EnforceConstraints = false;

            sCH_Reporting_ScheduleTableAdapter.Fill(schedules_Dat1.SCH_Reporting_Schedule, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);
            sCH_Reporting_ScheduleItemTableAdapter.Fill(schedules_Dat1.SCH_Reporting_ScheduleItem, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);
            sCH_Reporting_ScheduleItemInterventionsTableAdapter.Fill(schedules_Dat1.SCH_Reporting_ScheduleItemInterventions, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);
            sCH_Reporting_ScheduleItemTicketsTableAdapter.Fill(schedules_Dat1.SCH_Reporting_ScheduleItemTickets, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);

        }

    }
}
