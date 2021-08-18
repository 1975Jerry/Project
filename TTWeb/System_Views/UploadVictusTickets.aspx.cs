using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using System.Data.Common;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using System.Data.OleDb;
using System.Data.Odbc;

namespace TTWeb
{
    public partial class UploadVictusTickets : System.Web.UI.Page
    {
        //private string filepath = @"C:/TBSP/uploaded.xls";
        //private string filepath = System
        protected void Page_Load(object sender, EventArgs e)
        {
            string mCALLBACKPARAM = HttpContext.Current.Request.Params["__CALLBACKPARAM"];
            string mCALLBACKID = HttpContext.Current.Request.Params["__CALLBACKID"];

            if (mCALLBACKID == "ASPxCallback2")
            {
                return;
            }
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    if (Global.CustomSession["UploadVictusTicketsTableErrors"] != null)
                    {
                        ASPxGridViewUploadVictusTicketsErrors.DataSource = Global.CustomSession["UploadVictusTicketsTableErrors"];
                        ASPxGridViewUploadVictusTicketsErrors.DataBind();
                    }
                    else
                    {
                        MasterDataBind();
                    }
                }
                else
                {
                    DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/DeadSession.aspx");
                    return;
                }
            }
            else if (Page.IsPostBack)
            {
                if (mSessionResourceTracker != null)
                {
                    MasterDataBind();
                }
            }
            else
            {
                if (mSessionResourceTracker == null)
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
                ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).CleanupSessionObjects();
                MasterDataBind();
            }
        }

        private void MasterDataBind()
        {
            if (Global.CustomSession["UploadVictusTicketsTableErrors"] != null)
            {
                ASPxGridViewUploadVictusTicketsErrors.DataSource = Global.CustomSession["UploadVictusTicketsTableErrors"];
                ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("UploadVictusTicketsTableErrors");
                ASPxGridViewUploadVictusTicketsErrors.DataBind();
            }
        }

        protected void ASPxGridViewPendingtypes_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DataTable mTable = (DataTable)Global.CustomSession["UploadVictusTicketsTable"];
            DataRow mRow = mTable.NewRow();
            for (int k = 0; k < mTable.Columns.Count; k++)
            {
                if (e.NewValues[mTable.Columns[k].ColumnName] == null || e.NewValues[mTable.Columns[k].ColumnName].ToString() == "")
                {
                    mRow[k] = System.DBNull.Value;
                }
                else
                {
                    mRow[k] = e.NewValues[mTable.Columns[k].ColumnName];
                }
            }
            mTable.Rows.Add(mRow);
            Global.CustomSession["UploadVictusTicketsTable"] = mTable;
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            /*ASPxGridViewUploadVictusTickets.DataSource = mTable;
            ASPxGridViewUploadVictusTickets.DataBind();*/

            SqlConnection mSqlConnection = new SqlConnection(Global.GetConnectionString());
            SqlDataAdapter mAdapter = new SqlDataAdapter("select * from VICTUS_TICKET_STAGE", mSqlConnection);
            SqlCommandBuilder mBuilder = new SqlCommandBuilder();
            mBuilder.DataAdapter = mAdapter;
            int affectedRows = mAdapter.Update(mTable);
            
            if (affectedRows != 0)
            {
                DataTable ErrorsTable = (DataTable)Global.CustomSession["UploadVictusTicketsTableErrors"];

                ErrorsTable.Rows.Remove(ErrorsTable.Rows.Find(e.Keys[0]));
                ASPxGridViewUploadVictusTicketsErrors.DataSource = ErrorsTable;
                ASPxGridViewUploadVictusTicketsErrors.DataBind();
            }
            Global.ExecuteStoredProcedure("Victus_UploadTickets_Synchronize", new string[0] { }, new Object[0] { });
        }

        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {

            if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["UploadDirectory"]))
            {
                File.Delete(System.Configuration.ConfigurationManager.AppSettings["UploadDirectory"]);
            }

            FileStream fileStream = new FileStream(System.Configuration.ConfigurationManager.AppSettings["UploadDirectory"], FileMode.CreateNew);
            try
            {
                fileStream.Write(e.UploadedFile.FileBytes, 0, (Int32)e.UploadedFile.ContentLength);
                fileStream.Flush();
            }
            finally
            {
                fileStream.Close();
            }   
        }

        private void getdata()
        {
            Global.CustomSession.Remove("UploadVictusTicketsTable");
            Global.CustomSession.Remove("UploadVictusTicketsTableErrors");
            
            DataTable mErrorTable = null;            
            //string ConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Configuration.ConfigurationManager.AppSettings["UploadDirectory"] + @";Extended Properties=""Excel 5.0;HDR=Yes;IMEX=1""";

            //string ConnectionString = @"Dsn=jerry;dbq=D:\Report_to_upload.xls;defaultdir=D:;driverid=790;fil=excel 8.0;maxbuffersize=2048;pagetimeout=5";
            string ConnectionString = @"Dsn=Task_Upload;dbq=" + System.Configuration.ConfigurationManager.AppSettings["UploadDirectory"] + @";defaultdir=D:;driverid=790;fil=excel 8.0;maxbuffersize=2048;pagetimeout=5";
            
            DataTable XlTable = null;
            //OleDbConnection connection = new OleDbConnection(ConnectionString);
            OdbcConnection connection = new OdbcConnection(ConnectionString);
            {
                try
                {
                    connection.Open();
                    XlTable = new DataTable("Source");
                    using (OdbcDataAdapter adapter = new OdbcDataAdapter("select * from [Report$]", connection))
                    {
                        adapter.Fill(XlTable);
                    }
                    connection.Close();
                    connection.Dispose();
                }
                catch (Exception e)
                {
                    if (connection != null)
                    {
                        connection.Close();
                        connection.Dispose();
                    }
                    File.Delete(System.Configuration.ConfigurationManager.AppSettings["UploadDirectory"]);
                    throw e;
                }
            }

            File.Delete(System.Configuration.ConfigurationManager.AppSettings["UploadDirectory"]);
            SqlConnection mSqlConnection = new SqlConnection(Global.GetConnectionString());
            SqlDataAdapter mAdapter = new SqlDataAdapter("select * from VICTUS_TICKET_STAGE", mSqlConnection);
            SqlCommandBuilder mBuilder = new SqlCommandBuilder();
            mBuilder.DataAdapter = mAdapter;
            DataTable mDataTable = new DataTable("TICKET_STAGE");
            try
            {
                mAdapter.Fill(mDataTable);
            }
            catch (Exception e)
            {
                if (mSqlConnection != null)
                {
                    mSqlConnection.Close();
                    mSqlConnection.Dispose();
                }
                throw e;
            }

            DataRow XlRow = null;
            DataRow DestRow = null;
            string tempdatetime;
            int p = 0;
            int mRowCount = XlTable.Rows.Count;
            Global.CustomSession["progresstotal"] = mRowCount;
            for (int n = 0; n < mRowCount; n++)
            {
                try
                {
                    XlRow = XlTable.Rows[n];
                    DestRow = mDataTable.NewRow();
                    DestRow[0] = XlRow[0];
                    DestRow[1] = XlRow[1];
                    DestRow[2] = XlRow[2];

                    tempdatetime = XlRow[3].ToString();
                    if (tempdatetime.Contains("μμ"))
                    {
                        DestRow[3] = tempdatetime.Replace("μμ", "PM");
                    }
                    else if (tempdatetime.Contains("πμ"))
                    {
                        DestRow[3] = tempdatetime.Replace("πμ", "AM");
                    }
                    else if (tempdatetime == "" || tempdatetime.Contains("--:") || tempdatetime.Contains(":--"))
                    {
                        DestRow[3] = System.DBNull.Value;
                    }
                    else
                    {
                        DestRow[3] = tempdatetime;
                    }

                    tempdatetime = XlRow[4].ToString();
                    if (tempdatetime.Contains("μμ"))
                    {
                        {
                            DestRow[4] = tempdatetime.Replace("μμ", "PM");
                        }
                    }
                    else if (tempdatetime.Contains("πμ"))
                    {
                        DestRow[4] = tempdatetime.Replace("πμ", "AM");
                    }
                    else if (tempdatetime == "" || tempdatetime.Contains("--:") || tempdatetime.Contains(":--"))
                    {
                        DestRow[4] = System.DBNull.Value;
                    }
                    else
                    {
                        DestRow[4] = tempdatetime;
                    }

                    tempdatetime = XlRow[5].ToString();
                    if (tempdatetime.Contains("μμ"))
                    {
                        DestRow[5] = tempdatetime.Replace("μμ", "PM");
                    }
                    else if (tempdatetime.Contains("πμ"))
                    {
                        DestRow[5] = tempdatetime.Replace("πμ", "AM");
                    }
                    else if (tempdatetime == "" || tempdatetime.Contains("--:") || tempdatetime.Contains(":--"))
                    {
                        DestRow[5] = System.DBNull.Value;
                    }
                    else
                    {
                        DestRow[5] = tempdatetime;
                    }

                    DestRow[6] = XlRow[6];
                    DestRow[7] = XlRow[7];
                    DestRow[8] = XlRow[8];
                    DestRow[9] = XlRow[9];
                    DestRow[10] = XlRow[10];
                    DestRow[11] = XlRow[11];
                    DestRow[12] = XlRow[12];
                    DestRow[13] = XlRow[13];
                    DestRow[14] = XlRow[14];
                    DestRow[15] = XlRow[15];
                    DestRow[16] = XlRow[16];
                    DestRow[17] = XlRow[17];
                    DestRow[18] = XlRow[18];
                    DestRow[19] = XlRow[19];
                    DestRow[20] = XlRow[20];
                    DestRow[21] = XlRow[21];
                    DestRow[22] = XlRow[22];
                    DestRow[23] = XlRow[23];
                    DestRow[24] = XlRow[24];
                    DestRow[25] = XlRow[25];

                    tempdatetime = XlRow[26].ToString();
                    if (tempdatetime.Contains("μμ"))
                    {
                        DestRow[26] = tempdatetime.Replace("μμ", "PM");
                    }
                    else if (tempdatetime.Contains("πμ"))
                    {
                        DestRow[26] = tempdatetime.Replace("πμ", "AM");
                    }
                    else if (tempdatetime == "" || tempdatetime.Contains("--:") || tempdatetime.Contains(":--"))
                    {
                        DestRow[26] = System.DBNull.Value;
                    }
                    else
                    {
                        DestRow[26] = tempdatetime;
                    }

                    tempdatetime = XlRow[27].ToString();
                    if (tempdatetime.Contains("μμ"))
                    {
                        DestRow[27] = tempdatetime.Replace("μμ", "PM");
                    }
                    else if (tempdatetime.Contains("πμ"))
                    {
                        DestRow[27] = tempdatetime.Replace("πμ", "AM");
                    }
                    else if (tempdatetime == "" || tempdatetime.Contains("--:") || tempdatetime.Contains(":--"))
                    {
                        DestRow[27] = System.DBNull.Value;
                    }
                    else
                    {
                        DestRow[27] = tempdatetime;
                    }

                    tempdatetime = XlRow[28].ToString();
                    if (tempdatetime.Contains("μμ"))
                    {
                        DestRow[28] = tempdatetime.Replace("μμ", "PM");
                    }
                    else if (tempdatetime.Contains("πμ"))
                    {
                        DestRow[28] = tempdatetime.Replace("πμ", "AM");
                    }
                    else if (tempdatetime == "" || tempdatetime.Contains("--:") || tempdatetime.Contains(":--"))
                    {
                        DestRow[28] = System.DBNull.Value;
                    }
                    else
                    {
                        DestRow[28] = tempdatetime;
                    }

                    DestRow[29] = XlRow[29];
                    DestRow[30] = XlRow[30];
                    DestRow[31] = XlRow[31];
                    DestRow[32] = XlRow[32];
                    DestRow[33] = XlRow[33];
                    DestRow[34] = XlRow[34];
                    DestRow[35] = XlRow[35];
                    mDataTable.Rows.Add(DestRow);
                }
                catch (Exception t)
                {
                    if (mErrorTable == null)
                    {
                        mErrorTable = new DataTable("Errors");
                        Type mType = Type.GetType("System.String");
                        for (int i = 0; i < mDataTable.Columns.Count; i++)
                        {
                            mErrorTable.Columns.Add(new DataColumn(mDataTable.Columns[i].ColumnName, mType));
                        }
                        mErrorTable.PrimaryKey = new DataColumn[] { mErrorTable.Columns["TT_Id"] };
                    }

                    DataRow mRow = mErrorTable.NewRow();
                    for (int k = 0; k < XlTable.Columns.Count; k++)
                    {
                        mRow[k] = XlTable.Rows[n][k];
                    }
                    mErrorTable.Rows.Add(mRow);
                }
            }

            if (mErrorTable != null)
            {
                DataRow mRow = null;
                string temp = null;
                for (int n = 0; n < mErrorTable.Rows.Count; n++)
                {
                    //DestRow[3] DestRow[4] DestRow[5] DestRow[26] DestRow[27] DestRow[28]
                    mRow = mErrorTable.Rows[n];
                    temp = mRow[3].ToString();
                    if (temp.Contains("μμ"))
                    {
                        mRow[3] = temp.Replace("μμ", "PM");
                    }
                    else if (temp.Contains("πμ"))
                    {
                        mRow[3] = temp.Replace("πμ", "AM");
                    }
                    else if (temp == "" || temp.Contains("--:") || temp.Contains(":--"))
                    {
                        mRow[3] = System.DBNull.Value;
                    }
                    else
                    {
                        mRow[3] = temp;
                    }

                    temp = mRow[4].ToString();
                    if (temp.Contains("μμ"))
                    {
                        mRow[4] = temp.Replace("μμ", "PM");
                    }
                    else if (temp.Contains("πμ"))
                    {
                        mRow[4] = temp.Replace("πμ", "AM");
                    }
                    else if (temp == "" || temp.Contains("--:") || temp.Contains(":--"))
                    {
                        mRow[4] = System.DBNull.Value;
                    }
                    else
                    {
                        mRow[4] = temp;
                    }

                    temp = mRow[5].ToString();
                    if (temp.Contains("μμ"))
                    {
                        mRow[5] = temp.Replace("μμ", "PM");
                    }
                    else if (temp.Contains("πμ"))
                    {
                        mRow[5] = temp.Replace("πμ", "AM");
                    }
                    else if (temp == "" || temp.Contains("--:") || temp.Contains(":--"))
                    {
                        mRow[5] = System.DBNull.Value;
                    }
                    else
                    {
                        mRow[5] = temp;
                    }

                    temp = mRow[26].ToString();
                    if (temp.Contains("μμ"))
                    {
                        mRow[26] = temp.Replace("μμ", "PM");
                    }
                    else if (temp.Contains("πμ"))
                    {
                        mRow[26] = temp.Replace("πμ", "AM");
                    }
                    else if (temp == "" || temp.Contains("--:") || temp.Contains(":--"))
                    {
                        mRow[26] = System.DBNull.Value;
                    }
                    else
                    {
                        mRow[26] = temp;
                    }

                    temp = mRow[27].ToString();
                    if (temp.Contains("μμ"))
                    {
                        mRow[27] = temp.Replace("μμ", "PM");
                    }
                    else if (temp.Contains("πμ"))
                    {
                        mRow[27] = temp.Replace("πμ", "AM");
                    }
                    else if (temp == "" || temp.Contains("--:") || temp.Contains(":--"))
                    {
                        mRow[27] = System.DBNull.Value;
                    }
                    else
                    {
                        mRow[27] = temp;
                    }

                    temp = mRow[28].ToString();
                    if (temp.Contains("μμ"))
                    {
                        mRow[28] = temp.Replace("μμ", "PM");
                    }
                    else if (temp.Contains("πμ"))
                    {
                        mRow[28] = temp.Replace("πμ", "AM");
                    }
                    else if (temp == "" || temp.Contains("--:") || temp.Contains(":--"))
                    {
                        mRow[28] = System.DBNull.Value;
                    }
                    else
                    {
                        mRow[28] = temp;
                    }

                }
                mErrorTable.AcceptChanges();
                Global.CustomSession["UploadVictusTicketsTableErrors"] = mErrorTable;
            }
            try
            {
                mAdapter.UpdateBatchSize = 100;
                mAdapter.RowUpdated += new SqlRowUpdatedEventHandler(mAdapter_RowUpdated);
                int num = mAdapter.Update(mDataTable);
                mSqlConnection.Close();
                mSqlConnection.Dispose();
                Global.CustomSession["UploadVictusTicketsTable"] = mDataTable;
            }
            catch (Exception e)
            {
                mSqlConnection.Close();
                mSqlConnection.Dispose();
                throw e;
            }
           Global.ExecuteStoredProcedure("Victus_UploadTickets_Synchronize", new string[0] { }, new Object[0] { });
        }

        int progress = 0;
        void mAdapter_RowUpdated(object sender, SqlRowUpdatedEventArgs e)
        {
            Global.CustomSession["progress"] = ++progress*100;
        }

        protected void ASPxCallback1_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            getdata();
        }

        protected void ASPxCallback1_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e)
        {
            if (Global.CustomSession["UploadVictusTicketsTable"] != null)
            {
                e.Properties["cpgoodrows"] = ((DataTable)Global.CustomSession["UploadVictusTicketsTable"]).Rows.Count;
            }
            if (Global.CustomSession["UploadVictusTicketsTableErrors"] != null)
            {
                e.Properties["cperrorrows"] = ((DataTable)Global.CustomSession["UploadVictusTicketsTableErrors"]).Rows.Count;
            }
        }

        protected void ASPxCallbackProgress_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            double m = Convert.ToDouble(Global.CustomSession["progress"]);
            double t = Convert.ToDouble(Global.CustomSession["progresstotal"]);
            e.Result = ((int)(m/t * 100)).ToString();
        }
    }
}