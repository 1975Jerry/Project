using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace TTWeb.Reporting
{
    public partial class Overtimes_Xrep : DevExpress.XtraReports.UI.XtraReport
    {
        public Overtimes_Xrep()
        {
            InitializeComponent();
        }

        private void Overtimes_Xrep_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {

            reporting_Overtimes_ReportTableAdapter.Fill(overtimes_Dat1.Reporting_Overtimes_Report, (DateTime)Parameters["date"].Value, (DateTime)Parameters["to_date"].Value, (String)Parameters["tt_user"].Value);

        }

    }
}
