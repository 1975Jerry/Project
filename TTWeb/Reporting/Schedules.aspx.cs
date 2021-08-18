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
    public partial class Schedules : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (FromDay.Value != null & ToDay.Value != null)
            {
                ReportViewer1.Report = GetReport();
            }

        }


        protected TTWeb.Reporting.Schedules_XRep GetReport()
        {
            
            TTWeb.Reporting.Schedules_XRep report = new TTWeb.Reporting.Schedules_XRep();


            report.Parameters["FROM_DATE"].Value = FromDay.Value;
            report.Parameters["FROM_DATE"].Visible = false;
            report.Parameters["TO_DATE"].Value = ToDay.Value;
            report.Parameters["TO_DATE"].Visible = false;

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







