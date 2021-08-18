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
    public partial class Overtimes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (FromDay.Value != null )
            {
                ReportViewer1.Report = GetReport();
            }

        }


        protected TTWeb.Reporting.Overtimes_Xrep GetReport()
        {

            TTWeb.Reporting.Overtimes_Xrep report = new TTWeb.Reporting.Overtimes_Xrep();


            report.Parameters["date"].Value = FromDay.Value;
            report.Parameters["date"].Visible = false;

            report.Parameters["to_date"].Value = ToDay.Value;
            report.Parameters["to_date"].Visible = false;


            report.Parameters["tt_user"].Value = ASPxComboBoxUsers.Value;
            report.Parameters["tt_user"].Visible = false;

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
            FromDay.Date = DateTime.Now.AddDays(-1);
        }

        protected void ToDay_Init(object sender, EventArgs e)
        {
            ToDay.Date = DateTime.Now.AddDays(0);
        }



        protected void ASPxComboBoxUsers_Init(object sender, EventArgs e)
        {

            DataTable mDataTablePeriod = Global.ExecuteStoredProcedure("All_Users_Lookup", null, null);
            //          ASPxComboBoxPeriod.Items.Add("All", "All");

            for (int i = 0; i < mDataTablePeriod.Rows.Count; i++)
            {
                ASPxComboBoxUsers.Items.Add(mDataTablePeriod.Rows[i]["TT_USER"].ToString(), mDataTablePeriod.Rows[i]["TT_USER"]);
            }
               
        }


    }

        
}







