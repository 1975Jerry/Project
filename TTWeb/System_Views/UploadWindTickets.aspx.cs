
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
    public partial class UploadWindTickets : System.Web.UI.Page
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
                    if (Global.CustomSession["UploadWindTicketsTableErrors"] != null)
                    {
                        ASPxGridViewUploadWindTicketsErrors.DataSource = Global.CustomSession["UploadWindTicketsTableErrors"];
                        ASPxGridViewUploadWindTicketsErrors.DataBind();
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
            if (Global.CustomSession["UploadWindTicketsTableErrors"] != null)
            {
                ASPxGridViewUploadWindTicketsErrors.DataSource = Global.CustomSession["UploadWindTicketsTableErrors"];
                ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("UploadWindTicketsTableErrors");
                ASPxGridViewUploadWindTicketsErrors.DataBind();
            }
        }

        protected void ASPxGridViewPendingtypes_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DataTable mTable = (DataTable)Global.CustomSession["UploadWindTicketsTable"];
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
            Global.CustomSession["UploadWindTicketsTable"] = mTable;
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            /*ASPxGridViewUploadWindTickets.DataSource = mTable;
            ASPxGridViewUploadWindTickets.DataBind();*/

            SqlConnection mSqlConnection = new SqlConnection(Global.GetConnectionString());
            SqlDataAdapter mAdapter = new SqlDataAdapter("select * from W_TICKET_STAGE", mSqlConnection);
            SqlCommandBuilder mBuilder = new SqlCommandBuilder();
            mBuilder.DataAdapter = mAdapter;
            int affectedRows = mAdapter.Update(mTable);

            if (affectedRows != 0)
            {
                DataTable ErrorsTable = (DataTable)Global.CustomSession["UploadWindTicketsTableErrors"];

                ErrorsTable.Rows.Remove(ErrorsTable.Rows.Find(e.Keys[0]));
                ASPxGridViewUploadWindTicketsErrors.DataSource = ErrorsTable;
                ASPxGridViewUploadWindTicketsErrors.DataBind();
            }
            Global.ExecuteStoredProcedure("UploadWindTickets_Synchronize", new string[0] { }, new Object[0] { });
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
            Global.CustomSession.Remove("UploadWindTicketsTable");
            Global.CustomSession.Remove("UploadWindTicketsTableErrors");

            DataTable mColumnsCorrelation = Global.ExecuteQuery("select * from COLUMN_CORRELATION where VENDOR='WIND'");
            string IdColumn = (from mRow in mColumnsCorrelation.AsEnumerable()
                               where mRow.Field<bool>(4) == true
                               select mRow.Field<string>(1)).ToList()[0];
            DataTable mErrorTable = null;
            //string ConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Configuration.ConfigurationManager.AppSettings["UploadDirectory"] + @";Extended Properties=""Excel 8.0;HDR=Yes;IMEX=1""";
            string ConnectionString = @"Dsn=Task_Upload;dbq=" + System.Configuration.ConfigurationManager.AppSettings["UploadDirectory"] + @";defaultdir=D:;driverid=790;fil=excel 8.0;maxbuffersize=2048;pagetimeout=5";
      
            
            DataTable XlTable = null;
            //OleDbConnection connection = new OleDbConnection(ConnectionString);
            OdbcConnection connection = new OdbcConnection(ConnectionString);

            {
                try
                {
                    connection.Open();
                    XlTable = new DataTable("Source");
                    using (OdbcDataAdapter adapter = new OdbcDataAdapter("select * from [tbsp$] where [" + IdColumn + "] is not null", connection))
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
            SqlDataAdapter mAdapter = new SqlDataAdapter("select * from W_TICKET_STAGE", mSqlConnection);
            SqlCommandBuilder mBuilder = new SqlCommandBuilder();
            mBuilder.DataAdapter = mAdapter;
            DataTable mDataTable = new DataTable("W_TICKET_STAGE");
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
            DataRow CorrRow = null;
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

                    for (int k = 0; k < mColumnsCorrelation.Rows.Count; k++)
                    {
                        CorrRow = mColumnsCorrelation.Rows[k];
                        if (CorrRow["Type"].ToString() == "text")
                        {
                            DestRow[CorrRow["TICKET_STAGE"].ToString()] = XlRow[CorrRow["OTHER_COLUMN"].ToString().Trim()];
                        }
                        else if (CorrRow["Type"].ToString() == "time")
                        {
                            tempdatetime = XlRow[CorrRow["OTHER_COLUMN"].ToString()].ToString();                 //Event_time
                            if (tempdatetime.Contains("μμ"))
                            {
                                DestRow[CorrRow["TICKET_STAGE"].ToString()] = tempdatetime.Replace("μμ", "PM");
                            }
                            else if (tempdatetime.Contains("πμ"))
                            {
                                DestRow[CorrRow["TICKET_STAGE"].ToString()] = tempdatetime.Replace("πμ", "AM");
                            }
                            else if (tempdatetime == "")
                            {
                                DestRow[CorrRow["TICKET_STAGE"].ToString()] = System.DBNull.Value;
                            }
                            else
                            {
                                DestRow[CorrRow["TICKET_STAGE"].ToString()] = tempdatetime;
                            }

                        }
                    }
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
                    for (int j = 0; j < mColumnsCorrelation.Rows.Count; j++)
                    {
                        CorrRow = mColumnsCorrelation.Rows[j];
                        mRow[CorrRow["TICKET_STAGE"].ToString()] = XlRow[CorrRow["OTHER_COLUMN"].ToString().Trim()];
                    }
                    mErrorTable.Rows.Add(mRow);
                }
            }

            if (mErrorTable != null)
            {
                mErrorTable.AcceptChanges();
                Global.CustomSession["UploadWindTicketsTableErrors"] = mErrorTable;
            }
            try
            {
                mAdapter.UpdateBatchSize = 100;
                mAdapter.RowUpdated += new SqlRowUpdatedEventHandler(mAdapter_RowUpdated);
                int num = mAdapter.Update(mDataTable);
                mSqlConnection.Close();
                mSqlConnection.Dispose();
                Global.CustomSession["UploadWindTicketsTable"] = mDataTable;
            }
            catch (Exception e)
            {
                mSqlConnection.Close();
                mSqlConnection.Dispose();
                throw e;
            }
            Global.ExecuteStoredProcedure("UploadWindTickets_Synchronize", new string[0] { }, new Object[0] { });
        }

        int progress = 0;
        void mAdapter_RowUpdated(object sender, SqlRowUpdatedEventArgs e)
        {
            Global.CustomSession["progress"] = ++progress * 100;
        }

        protected void ASPxCallback1_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            getdata();
        }

        protected void ASPxCallback1_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e)
        {
            if (Global.CustomSession["UploadWindTicketsTable"] != null)
            {
                e.Properties["cpgoodrows"] = ((DataTable)Global.CustomSession["UploadWindTicketsTable"]).Rows.Count;
            }
            if (Global.CustomSession["UploadWindTicketsTableErrors"] != null)
            {
                e.Properties["cperrorrows"] = ((DataTable)Global.CustomSession["UploadWindTicketsTableErrors"]).Rows.Count;
            }
        }

        protected void ASPxCallbackProgress_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            double m = Convert.ToDouble(Global.CustomSession["progress"]);
            double t = Convert.ToDouble(Global.CustomSession["progresstotal"]);
            e.Result = ((int)(m / t * 100)).ToString();
        }
    }
}