﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Collections;




namespace TTWeb.System_Views
{
    public partial class SchedulesMap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MasterDataBind();
        }


        protected void ASPxCallback1_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            //string a = ASPxComboBoxFreezed.Text;
            //DataTable mTable = Global.GetSystemCoordinates();
            string[] mres = e.Parameter.Split(new char[1]{';'});

            DateTime dday = Convert.ToDateTime(mres[0]);

            DataTable mTable = Global.ExecuteStoredProcedure("Schedules_Map", new string[2] { "@day", "@USER_ID" }, new Object[2] { dday.ToString("dd/MM/yyyy"), Global.CustomSession["UserId"] });

            string aa = dday.ToString("dd/MM/yyyy");

            DataRow mRow = null;
            string mCoordinate;
            decimal Hours;
            decimal Minutes;
            decimal Total;
            string[] mSubdstrings;
            char[] mDels = new char[2] { '°', '\'' };
            StringBuilder mStringBuilder = new StringBuilder();
            Hashtable mHashTable = new Hashtable();
            List<DataRow> mRowsToDelete = new List<DataRow>();
            DataRow temp;

            //for test purposes only to be removed
            //mTable.ImportRow(mTable.Rows[0]);
            //mTable.AcceptChanges();

            for (int m = 0; m < mTable.Rows.Count; m++)
            {
                mRow = mTable.Rows[m];
                if (!mHashTable.ContainsKey(mRow[0].ToString() + mRow[1].ToString()))
                {
                    mHashTable.Add(mRow[0].ToString() + mRow[1].ToString(), mRow);
                }
                else
                {
                    temp = (DataRow)mHashTable[mRow[0].ToString() + mRow[1].ToString()];
                    temp[2] = temp[2] + "<br>" + mRow[2].ToString();
                    mRowsToDelete.Add(mRow);
                }
            }

            for (int l = 0;l<mRowsToDelete.Count;l++)
            {
                mTable.Rows.Remove(mRowsToDelete[l]);
            }
            mTable.AcceptChanges();

            for (int i = 0; i < mTable.Rows.Count; i++)
            {
                mRow = mTable.Rows[i];
                for (int k = 0; k < mTable.Columns.Count; k++)
                {
                    if (k < 2)
                    {
                        mCoordinate = mRow[k].ToString();
                        mCoordinate = mCoordinate.Substring(0, mCoordinate.Length - 1);
                        mSubdstrings = mCoordinate.Split(mDels);
                        Hours = Convert.ToDecimal(mSubdstrings[0])/* * 3600*/;
                        Minutes = Convert.ToDecimal(mSubdstrings[1]) / 60;
                        Total = Hours + Minutes + Convert.ToDecimal(mSubdstrings[2]) / 3600;
                        mStringBuilder.Append(Total + ";");
                    }
                    else
                    {
                        mStringBuilder.Append(mRow[k] + ";");
                    }
                }
                if (i < mTable.Rows.Count - 1)
                {
                    mStringBuilder.Append("/");
                }
            }
            e.Result = mStringBuilder.ToString().Replace(",", ".");
        }

        protected void ASPxGridViewMissing_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

        private void MasterDataBind()
        {
            DateTime dday = (DateTime)ASPxDateEditDay.Value;

            ASPxGridViewMissing.DataSource = Global.ExecuteStoredProcedure("Schedules_NOT_Map", new string[2] { "@day", "@USER_ID" }, new Object[2] { dday.ToString("dd/MM/yyyy"), Global.CustomSession["UserId"] });
            Global.CustomSession["ViewMissing"] = ASPxGridViewMissing.DataSource;
            //((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ViewMissing");
            ASPxGridViewMissing.DataBind();
        }

        protected void ASPxGridViewMissing_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            MasterDataBind();
        }

        protected void ASPxDateEditDay_Init(object sender, EventArgs e)
        {
            ASPxDateEditDay.Date = DateTime.Now;
        }
    }
}