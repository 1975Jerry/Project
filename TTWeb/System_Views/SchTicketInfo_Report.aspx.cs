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
    public partial class SchTicketInfo_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            TTWeb.System_Views.SchTicketInfo_XtraReport report = new TTWeb.System_Views.SchTicketInfo_XtraReport();

            report.DataMember = "InvalidDataMember";



            string mTTId = (string)Global.CustomSession["Ticket_ID"];
            Int32 mUser_id = (Int32)Global.CustomSession["UserId"];

            report.Parameters["tt_id"].Value = mTTId;
            report.Parameters["tt_id"].Visible = false;

            report.Parameters["user_id"].Value = mUser_id;
            report.Parameters["user_id"].Visible = false;

            report.CreateDocument();


            SchTicketInfo_ReportViewer.Report = report;


        }
    }       
}