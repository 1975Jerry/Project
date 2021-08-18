using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace TTWeb.System_Views
{
    public partial class Fleet_XtraReport : DevExpress.XtraReports.UI.XtraReport
    {
        public Fleet_XtraReport()
        {
            InitializeComponent();
        }

        private void Fleet_XtraReport_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {

            fleet_DataSet1.EnforceConstraints = false;

            fleet_Report_VehicleTableAdapter.Fill(fleet_DataSet1.Fleet_Report_Vehicle, (Guid)Parameters["id"].Value);

                        
            fleet_Report_RefreshTableAdapter1.Fill(fleet_DataSet1.Fleet_Report_Refresh, (Guid)Parameters["id"].Value);



        }

    }
}
