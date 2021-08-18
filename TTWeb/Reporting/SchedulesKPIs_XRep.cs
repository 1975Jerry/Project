using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace TTWeb.Reporting
{
    public partial class SchedulesKPIs_XRep : DevExpress.XtraReports.UI.XtraReport
    {
        public SchedulesKPIs_XRep()
        {
            InitializeComponent();
        }

        private void SchedulesKPIs_XRep_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {

            schedulesKPIs_Dat1.EnforceConstraints = false;

            sCH_Reporting_KPI_CycledTableAdapter.Fill(schedulesKPIs_Dat1.SCH_Reporting_KPI_Cycled, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);
            sCH_Reporting_KPI_VisitsTableAdapter.Fill(schedulesKPIs_Dat1.SCH_Reporting_KPI_Visits, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);
            sCH_Reporting_KPI_SolvedTableAdapter.Fill(schedulesKPIs_Dat1.SCH_Reporting_KPI_Solved, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);
            scH_Reporting_KPI_DurationTableAdapter1.Fill(schedulesKPIs_Dat1.SCH_Reporting_KPI_Duration, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);
            sCH_Reporting_KPI_Duration_per_RoleTableAdapter.Fill(schedulesKPIs_Dat1.SCH_Reporting_KPI_Duration_per_Role, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);
            sCH_Reporting_KPI_Duration_per_UserTableAdapter.Fill(schedulesKPIs_Dat1.SCH_Reporting_KPI_Duration_per_User, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);
            sCH_Reporting_KPI_Duration_per_VisitTableAdapter.Fill(schedulesKPIs_Dat1.SCH_Reporting_KPI_Duration_per_Visit, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);
            sCH_Reporting_KPI_Expenses_KMTableAdapter.Fill(schedulesKPIs_Dat1.SCH_Reporting_KPI_Expenses_KM, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);

        }


    }
}
