using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace TTWeb.Reporting
{
    public partial class ManagementReportSummary_Xrep : DevExpress.XtraReports.UI.XtraReport
    {
        public ManagementReportSummary_Xrep()
        {
            InitializeComponent();
        }



        private void ManagementReportSummary_Xrep_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            reporting_Management_Report_SummaryTableAdapter1.Fill(managementReportSummary_Dat1.Reporting_Management_Report_Summary, (DateTime)Parameters["date"].Value, (DateTime)Parameters["to_date"].Value, (String)Parameters["ticket_source"].Value);

        }

    }
}
