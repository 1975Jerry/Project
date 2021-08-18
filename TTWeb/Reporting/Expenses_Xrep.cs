using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace TTWeb.Reporting
{
    public partial class Expenses_Xrep : DevExpress.XtraReports.UI.XtraReport
    {
        public Expenses_Xrep()
        {
            InitializeComponent();
        }

        private void Expenses_Xrep_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            reporting_SCH_ExpensesTableAdapter1.Fill(expenses_Dat1.Reporting_SCH_Expenses, (DateTime)Parameters["date"].Value, (DateTime)Parameters["to_date"].Value, (String)Parameters["tt_user"].Value);
        
        
        }

    }
}
