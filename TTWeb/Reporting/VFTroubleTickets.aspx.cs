using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using System.IO;
using DevExpress.XtraReports.Web;


namespace TTWeb
{
    public partial class VFTroubleTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (FromDay.Value != null & ToDay.Value != null)
            {
                ReportViewer1.Report = GetReport();
            }

        }


        protected TTWeb.Reporting.VFTroubleTickets_XRep GetReport()
        {
            
            TTWeb.Reporting.VFTroubleTickets_XRep report = new TTWeb.Reporting.VFTroubleTickets_XRep();


            report.Parameters["startday"].Value = FromDay.Value;
            report.Parameters["startday"].Visible = false;
            report.Parameters["endday"].Value = ToDay.Value;
            report.Parameters["endday"].Visible = false;

            report.CreateDocument();
            return report;
            
        }

        protected void Refresh_Click(object sender, EventArgs e)
        {
            if (FromDay.Value != null & ToDay.Value != null)
            {
                ReportViewer1.Report = GetReport();
            }
            
        }

        protected void FromDay_Init(object sender, EventArgs e)
        {
            FromDay.Date = DateTime.Now.AddDays(-6);
        }

        protected void ToDay_Init(object sender, EventArgs e)
        {
            ToDay.Date = DateTime.Now;
        }
    }

        
}







