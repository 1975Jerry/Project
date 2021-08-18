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
    public partial class ManagementReportSummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (FromDay.Value != null )
            {
                ReportViewer1.Report = GetReport();
            }

        }


        protected TTWeb.Reporting.ManagementReportSummary_Xrep GetReport()
        {

            TTWeb.Reporting.ManagementReportSummary_Xrep report = new TTWeb.Reporting.ManagementReportSummary_Xrep();


            report.Parameters["date"].Value = FromDay.Value;
            report.Parameters["date"].Visible = false;

            report.Parameters["to_date"].Value = ToDay.Value;
            report.Parameters["to_date"].Visible = false;

            string mDataSources = "#";

            foreach (ListEditItem item in Data_Sources.Items)
            {
                if (item.Selected)
                {
                    mDataSources += item.Value + "#";
                }
            }

            report.Parameters["ticket_source"].Value = mDataSources;
            report.Parameters["ticket_source"].Visible = false;

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

        protected void Data_Sources_Init(object sender, EventArgs e)
        {
            DataTable mDataTablePeriod = Global.ExecuteStoredProcedure("Lookup_Manag_Report_Ticket_Source", null, null);
            //          ASPxComboBoxPeriod.Items.Add("All", "All");

            for (int i = 0; i < mDataTablePeriod.Rows.Count; i++)
            {
                Data_Sources.Items.Add(mDataTablePeriod.Rows[i]["TICKET_SOURCE"].ToString(), mDataTablePeriod.Rows[i]["TICKET_SOURCE"]);
            }

           

            foreach (ListEditItem item in Data_Sources.Items)
            {
                if (((string)item.Value == "VF TT") | ((string)item.Value == "VF PM") | ((string)item.Value == "Wind TT") | ((string)item.Value == "Wind PM") | ((string)item.Value == "VF Sup&Imp"))
                {
                    item.Selected = true;
                }
            }

        }


    }

        
}







