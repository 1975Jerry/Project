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
    public partial class SchEdit_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



            SchEdit_XtraReport report = new SchEdit_XtraReport();

            report.DataMember = "InvalidDataMember";

                        
            Guid mTTId = (Guid)Global.CustomSession["TTID"];
            Int32 mUser_id = (Int32)Global.CustomSession["UserId"];

            report.Parameters["tt_id"].Value = mTTId;
            report.Parameters["tt_id"].Visible = false;

            report.Parameters["user_id"].Value = mUser_id;
            report.Parameters["user_id"].Visible = false;

            report.CreateDocument();


            SchEdit_ReportViewer.Report = report;


        }
    }       
}