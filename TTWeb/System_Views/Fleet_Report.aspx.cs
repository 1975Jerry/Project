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
    public partial class Fleet_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            TTWeb.System_Views.Fleet_XtraReport report = new TTWeb.System_Views.Fleet_XtraReport();

            report.DataMember = "InvalidDataMember";


            Guid mTTId = (Guid)Global.CustomSession["TTID"];


            report.Parameters["id"].Value = mTTId;
            report.Parameters["id"].Visible = false;


            report.CreateDocument();


            Fleet_ReportViewer.Report = report;


        }
    }       
}