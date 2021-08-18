using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace TTWeb.Reporting
{
    public partial class VFTroubleTickets_XRep : DevExpress.XtraReports.UI.XtraReport
    {
        public VFTroubleTickets_XRep()
        {
            InitializeComponent();
        }

        private void VFTroubleTickets_XRep_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {

            
            //vfTroubleTickets_Dat1.EnforceConstraints = false;

            sCH_Reporting_VF_Trouble_TicketsTableAdapter.Fill(vfTroubleTickets_Dat1.SCH_Reporting_VF_Trouble_Tickets, (DateTime)Parameters["startday"].Value, (DateTime)Parameters["endday"].Value);

            
        }


    }
}
