using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace TTWeb
{
    public partial class SchEdit_XtraReport : DevExpress.XtraReports.UI.XtraReport
    {
        public SchEdit_XtraReport()
        {
            InitializeComponent();
        }

        private void SchEdit_XtraReport_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {

            

            schEdit_DataSet1.EnforceConstraints = false;


            reporting_SCHTableAdapter.Fill(schEdit_DataSet1.Reporting_SCH, (Guid)Parameters["tt_id"].Value, (Int32)Parameters["user_id"].Value);

            reporting_SCH_ItemsTableAdapter.Fill(schEdit_DataSet1.Reporting_SCH_Items, (Guid)Parameters["tt_id"].Value);




        }

    }
}
