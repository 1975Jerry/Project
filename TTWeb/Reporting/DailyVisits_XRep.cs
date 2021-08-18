using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace TTWeb
{
    public partial class DailyVisits_XRep : DevExpress.XtraReports.UI.XtraReport
    {
        public DailyVisits_XRep()
        {
            InitializeComponent();
        }

        private void ReportHeader_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {

        
            sCH_Reporting_Daily_VisitTableAdapter.Fill(dailyVisits_Dat1.SCH_Reporting_Daily_Visit, (DateTime)Parameters["FROM_DATE"].Value, (DateTime)Parameters["TO_DATE"].Value);
         

        }

        string ID;
        string Engineer;
        string Engineer2;
        string Site;
        string Visit;
        string Interventions;
        string Site_comments;
        double On_site_h;
        Single TotalCost;
        Single Km;
        string Date;
        //string Engineer_comments;



        private void xrTableCell1_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRLabel label = (XRLabel)sender;    // ID

            string IdV = (string)GetCurrentColumnValue("ID");

            if (IdV == ID)
            {
                label.ForeColor = label.BackColor;
            }
            else
            {
                label.ForeColor = Color.Black;
            };

            //ID = IdV;
        }

        private void xrTableCell34_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRLabel label = (XRLabel)sender;    // Schedule_Date

            string IdV = (string)GetCurrentColumnValue("SCHEDULE_DATE");

            if (IdV == Date)
            {
                label.ForeColor = label.BackColor;
            }
            else
            {
                label.ForeColor = Color.Black;
            };

            Date = IdV;
            //ID = IdV;

                
        }


        private void xrTableCell2_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRLabel label = (XRLabel)sender;     // Engineer

            string IdV = (string)GetCurrentColumnValue("ID");
            string Eng = (string)GetCurrentColumnValue("ENGINEER");

            if ((Eng == Engineer) && (IdV == ID))
            {
                label.ForeColor = label.BackColor;
            }
            else 
            { 
                label.ForeColor = Color.Black; 
            };

            Engineer = Eng;
           // ID = IdV;
        }



        private void xrTableCell3_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRLabel label = (XRLabel)sender;   // Site

            string IdV = (string)GetCurrentColumnValue("ID");
            string Sit = (string)GetCurrentColumnValue("SITE");



                if ((string)GetCurrentColumnValue("VISIT") == "Pending")
                {
                    label.ForeColor = Color.Gray;
                    label.BackColor = Color.WhiteSmoke;
                }
                else if ((string)GetCurrentColumnValue("VISIT") == "No")
                {
                    label.ForeColor = Color.Red;
                    label.BackColor = Color.White;
                }
                else
                {
                    label.ForeColor = Color.Black;
                    label.BackColor = Color.White;
            };

                if ((Sit == Site) && (IdV == ID))
                {
                    label.ForeColor = label.BackColor;
                };
            //Site = Sit;
            //ID = IdV;
        }




        private void xrTableCell19_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRLabel label = (XRLabel)sender;    // Visit

            string IdV = (string)GetCurrentColumnValue("ID");
            string Sit = (string)GetCurrentColumnValue("SITE");
            string Vis = (string)GetCurrentColumnValue("VISIT");


                if ((string)GetCurrentColumnValue("VISIT") == "Pending")
                {
                    label.ForeColor = Color.Gray;
                    label.BackColor = Color.WhiteSmoke;
                }
                else if ((string)GetCurrentColumnValue("VISIT") == "No")
                {
                    label.ForeColor = Color.Red;
                    label.BackColor = Color.White;
                }
                else
                {
                    label.ForeColor = Color.Black;
                    label.BackColor = Color.White;
            };

                if ((Sit == Site) && (IdV == ID) && (Vis == Visit))
                {
                    label.ForeColor = label.BackColor;
                };
            //Visit = Vis;
            //Site = Sit;
            //ID = IdV;

        }

        private void xrTableCell6_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRLabel label = (XRLabel)sender;    // Interventions

            string IdV = (string)GetCurrentColumnValue("ID");
            string Sit = (string)GetCurrentColumnValue("SITE");
            string Vis = (string)GetCurrentColumnValue("VISIT");
            string Inte = (string)GetCurrentColumnValue("INTERVENTIONS");


                if ((string)GetCurrentColumnValue("VISIT") == "Pending")
                {
                    label.ForeColor = Color.Gray;
                    label.BackColor = Color.WhiteSmoke;
                }
                else if ((string)GetCurrentColumnValue("VISIT") == "No")
                {
                    label.ForeColor = Color.Red;
                    label.BackColor = Color.White;
                }
                else
                {
                    label.ForeColor = Color.Black;
                    label.BackColor = Color.White;
                };


            if ((Sit == Site) && (IdV == ID) && (Inte == Interventions))
            {
                label.ForeColor = label.BackColor;
            };

            //Visit = Vis;
            //Site = Sit;
            //ID = IdV;
            Interventions = Inte;
        }

        private void xrTableCell7_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRLabel label = (XRLabel)sender;    // Site_comments

            string IdV = (string)GetCurrentColumnValue("ID");
            string Sit = (string)GetCurrentColumnValue("SITE");
            string Vis = (string)GetCurrentColumnValue("VISIT");
            string Scom = (string)GetCurrentColumnValue("SITE_COMMENTS");


            if ((string)GetCurrentColumnValue("VISIT") == "Pending")
            {
                label.ForeColor = Color.Gray;
                label.BackColor = Color.WhiteSmoke;
            }
            else if ((string)GetCurrentColumnValue("VISIT") == "No")
            {
                label.ForeColor = Color.Red;
                label.BackColor = Color.White;
            }
            else
            {
                label.ForeColor = Color.Black;
                label.BackColor = Color.White;
            };

            if ((Sit == Site) && (IdV == ID) && (Scom == Site_comments))
            {
                label.ForeColor = label.BackColor;
            }


            //Visit = Vis;
            //Site = Sit;
            //ID = IdV;
            Site_comments = Scom;
        }




        private void xrTableCell10_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRLabel label = (XRLabel)sender;    // On_site_h

            string IdV = (string)GetCurrentColumnValue("ID");
            string Sit = (string)GetCurrentColumnValue("SITE");
            string Vis = (string)GetCurrentColumnValue("VISIT");
           // double Onsh = (double)GetCurrentColumnValue("ON_SITE_H");


            if ((string)GetCurrentColumnValue("VISIT") == "Pending")
            {
                label.ForeColor = Color.Gray;
                label.BackColor = Color.WhiteSmoke;
            }
            else if ((string)GetCurrentColumnValue("VISIT") == "No")
            {
                label.ForeColor = Color.Red;
                label.BackColor = Color.White;
            }
            else
            {
                label.ForeColor = Color.Black;
                label.BackColor = Color.White;
            };

            if ((Sit == Site) && (IdV == ID))
            {
                label.Text = null; 
            };

            //Visit = Vis;
            //Site = Sit;
            //ID = IdV;
           // On_site_h = Onsh;
        }

        private void xrTableCell21_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRLabel label = (XRLabel)sender;    // TotalCost

            string IdV = (string)GetCurrentColumnValue("ID");
            string Sit = (string)GetCurrentColumnValue("SITE");
            string Vis = (string)GetCurrentColumnValue("VISIT");
            //Single TotC = (Single)GetCurrentColumnValue("TotalCost");


            if ((string)GetCurrentColumnValue("VISIT") == "Pending")
            {
                label.ForeColor = Color.Gray;
                label.BackColor = Color.WhiteSmoke;
            }
            else if ((string)GetCurrentColumnValue("VISIT") == "No")
            {
                label.ForeColor = Color.Red;
                label.BackColor = Color.White;
            }
            else
            {
                label.ForeColor = Color.Black;
                label.BackColor = Color.White;
            };

            if ((Sit == Site) && (IdV == ID))
            {
                label.Text = null; 

            };

            //Visit = Vis;
            //Site = Sit;
            //ID = IdV;
            //TotalCost = TotC;
        }



        private void xrTableCell22_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRLabel label = (XRLabel)sender;    // Km

            string IdV = (string)GetCurrentColumnValue("ID");
            string Sit = (string)GetCurrentColumnValue("SITE");
            string Vis = (string)GetCurrentColumnValue("VISIT");
            //Single TotKm = (Single)GetCurrentColumnValue("Km");


            if ((string)GetCurrentColumnValue("VISIT") == "Pending")
            {
                label.ForeColor = Color.Gray;
                label.BackColor = Color.WhiteSmoke;
            }
            else if ((string)GetCurrentColumnValue("VISIT") == "No")
            {
                label.ForeColor = Color.Red;
                label.BackColor = Color.White;
            }
            else
            {
                label.ForeColor = Color.Black;
                label.BackColor = Color.White;
            };

            if ((Sit == Site) && (IdV == ID))
            {
                label.Text = null;
            };

            //Visit = Vis;
            //Site = Sit;
            //ID = IdV;
            //Km = TotKm;
        }

        private void xrTableCell23_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRLabel label = (XRLabel)sender;   // Engineer_comments

            string IdV = (string)GetCurrentColumnValue("ID");
            string Sit = (string)GetCurrentColumnValue("SITE");



            if ((string)GetCurrentColumnValue("VISIT") == "Pending")
            {
                label.ForeColor = Color.Gray;
                label.BackColor = Color.WhiteSmoke;
            }
            else if ((string)GetCurrentColumnValue("VISIT") == "No")
            {
                label.ForeColor = Color.Red;
                label.BackColor = Color.White;
            }
            else
            {
                label.ForeColor = Color.Black;
                label.BackColor = Color.White;
            };

            if ((Sit == Site) && (IdV == ID))
            {
                label.ForeColor = label.BackColor;
            };


            Site = Sit;
            ID = IdV;

        }

        private void xrTableCell28_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            XRLabel label = (XRLabel)sender;     // Engineer2

            string IdV = (string)GetCurrentColumnValue("ID");
            string Eng2 = (string)GetCurrentColumnValue("ENGINEER2");

            if ((Eng2 == Engineer2) && (IdV == ID))
            {
                label.ForeColor = label.BackColor;
            }
            else
            {
                label.ForeColor = Color.Black;
            };

            Engineer2 = Eng2;
            // ID = IdV;
        }





 

    }
}

