using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace TTWeb.Reporting
{
    public partial class DailyProgram_XRep : DevExpress.XtraReports.UI.XtraReport
    {
        public DailyProgram_XRep()
        {
            InitializeComponent();
        }

        private void DailyProgram_XRep_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            
            sCH_Reporting_Daily_Program_per_EngineerTableAdapter.Fill(dailyProgram_Dat1.SCH_Reporting_Daily_Program_per_Engineer, (DateTime)Parameters["DATE"].Value, (String)Parameters["TEAM"].Value);

            sCH_Reporting_Daily_Program_per_Free_EngineerTableAdapter.Fill(dailyProgram_Dat1.SCH_Reporting_Daily_Program_per_Free_Engineer, (DateTime)Parameters["DATE"].Value, (String)Parameters["TEAM"].Value);

        }

    }
}
