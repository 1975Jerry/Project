using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace TTWeb.System_Views
{
    public partial class SchTicketInfo_XtraReport : DevExpress.XtraReports.UI.XtraReport
    {
        public SchTicketInfo_XtraReport()
        {
            InitializeComponent();
        }

        private void Detail_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            schTicketInfo_DataSet1.EnforceConstraints = false;


            activeTickets_InfoTableAdapter1.Fill(schTicketInfo_DataSet1.Reporting_Tickets_Info, (string)Parameters["tt_id"].Value, (Int32)Parameters["user_id"].Value);



        }

    }
}
