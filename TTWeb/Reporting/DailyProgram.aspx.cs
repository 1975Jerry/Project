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
    public partial class DailyProgram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (FromDay.Value != null )
            {
                ReportViewer1.Report = GetReport();
            }

        }


        protected TTWeb.Reporting.DailyProgram_XRep GetReport()
        {

            TTWeb.Reporting.DailyProgram_XRep report = new TTWeb.Reporting.DailyProgram_XRep();


            report.Parameters["DATE"].Value = FromDay.Value;
            report.Parameters["DATE"].Visible = false;


            report.Parameters["TEAM"].Value = ASPxComboBoxUsers.Value;
            report.Parameters["TEAM"].Visible = false;

            report.CreateDocument();
            return report;
            
        }

        protected void Refresh_Click(object sender, EventArgs e)
        {
            if (FromDay.Value != null )
            {
                ReportViewer1.Report = GetReport();
            }

        }

        protected void FromDay_Init(object sender, EventArgs e)
        {
            FromDay.Date = DateTime.Now.AddDays(+1);
        }



        protected void ASPxComboBoxUsers_Init(object sender, EventArgs e)
        {

            DataTable mDataTablePeriod = Global.ExecuteStoredProcedure("Teams_Lookup", null, null);
            //          ASPxComboBoxPeriod.Items.Add("All", "All");

            for (int i = 0; i < mDataTablePeriod.Rows.Count; i++)
            {
                ASPxComboBoxUsers.Items.Add(mDataTablePeriod.Rows[i]["Team"].ToString(), mDataTablePeriod.Rows[i]["Team"]);
            }
               
        }


    }

        
}







