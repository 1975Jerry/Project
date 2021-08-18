using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Collections;
using System.Globalization;

namespace TTWeb.System_Views
{
    public partial class ActiveCombinedMap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MasterDataBind();
        }

        protected void ASPxCallback1_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string a = VFreezed.Text;
            //DataTable mTable = Global.GetSystemCoordinates();
            string[] mres = e.Parameter.Split(new char[1]{';'});
            DataTable mTable = Global.ExecuteStoredProcedure("Active_Combined_Map", new string[15] { "@VFTT", "@VFreezed", "@VPriority", "@VPeriod", "@VProcessed", "@WTT", "@WPriority", "@WPeriod", "@WProcessed", "@VFPM", "@VPPriority", "@VPPeriod", "@WPM", "@WPPriority", "@WPPeriod" }, new Object[15] { mres[0], mres[1], mres[2], mres[3], mres[4], mres[5], mres[6], mres[7], mres[8], mres[9], mres[10], mres[11], mres[12], mres[13], mres[14] });
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
            CultureInfo mCultureInfo = CultureInfo.CreateSpecificCulture("en-US");
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
                        Total = Hours + Minutes + Convert.ToDecimal(mSubdstrings[2].Replace(",", "."), mCultureInfo) / 3600;

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



        private void MasterDataBind()
        {

            ASPxGridViewMissing.DataSource = Global.ExecuteStoredProcedure("Active_Combined_NOT_Map",   new string[15] { "@VFTT", "@VFreezed", "@VPriority", "@VPeriod", "@VProcessed", "@WTT", "@WPriority", "@WPeriod", "@WProcessed", "@VFPM", "@VPPriority", "@VPPeriod", "@WPM", "@WPPriority", "@WPPeriod" }, 
                                                                                                        new Object[15] { VFTT.Text, VFreezed.Text, VPriority.Text, VPeriod.Text, VProcessed.Text, WTT.Text, WPriority.Text, WPeriod.Text, WProcessed.Text, VFPM.Text, VPPriority.Text, VPPeriod.Text, WPM.Text, WPPriority.Text, WPPeriod.Text });




            Global.CustomSession["ViewMissing"] = ASPxGridViewMissing.DataSource;
            //((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ViewMissing");
            ASPxGridViewMissing.DataBind();
        }

        protected void ASPxGridViewMissing_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

        protected void ASPxGridViewMissing_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            MasterDataBind();
        }

        protected void ASPxComboBoxPeriod_Load(object sender, EventArgs e)
        {
            DataTable mDataTablePeriod = Global.ExecuteStoredProcedure("PM_Lookup_Year", null, null);
            //          ASPxComboBoxPeriod.Items.Add("All", "All");

            for (int i = 0; i < mDataTablePeriod.Rows.Count; i++)
            {
                VPPeriod.Items.Add(mDataTablePeriod.Rows[i]["PM_YEAR"].ToString(), mDataTablePeriod.Rows[i]["PM_YEAR"]);
            }

            VPPeriod.SelectedIndex = 0;
        }

        protected void ASPxComboBoxPriority_Load(object sender, EventArgs e)
        {
            DataTable mDataTablePriority = Global.ExecuteStoredProcedure("PM_Lookup_Criticality", null, null);
            //          ASPxComboBoxPeriod.Items.Add("All", "All");

            for (int i = 0; i < mDataTablePriority.Rows.Count; i++)
            {
                VPPriority.Items.Add(mDataTablePriority.Rows[i]["CRITICALITY"].ToString(), mDataTablePriority.Rows[i]["CRITICALITY"]);
            }
        }

        protected void WPPeriod_Load(object sender, EventArgs e)
        {
            DataTable mDataTablePeriod = Global.ExecuteStoredProcedure("W_PM_Lookup_Year_Filter", null, null);
            //          ASPxComboBoxPeriod.Items.Add("All", "All");

            for (int i = 0; i < mDataTablePeriod.Rows.Count; i++)
            {
                WPPeriod.Items.Add(mDataTablePeriod.Rows[i]["Year"].ToString(), mDataTablePeriod.Rows[i]["Year"]);
            }

            WPPeriod.SelectedIndex = 0;
        }

        protected void WPPriority_Load(object sender, EventArgs e)
        {
            DataTable mDataTablePriority = Global.ExecuteStoredProcedure("W_PM_Lookup_PMType", null, null);
            //          ASPxComboBoxPeriod.Items.Add("All", "All");

            for (int i = 0; i < mDataTablePriority.Rows.Count; i++)
            {
                WPPriority.Items.Add(mDataTablePriority.Rows[i]["PM_Type"].ToString(), mDataTablePriority.Rows[i]["PM_Type"]);
            }
        }


    }
}