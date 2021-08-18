using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Collections;
using DevExpress.Web;
using System.Diagnostics;

namespace TTWeb.System_Views
{
    public partial class WindSitesMap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxCallback1_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string[] mres = e.Parameter.Split(new char[1]{';'});
            DataTable mTable = Global.ExecuteStoredProcedure("WindSites_Map", new string[1] { "@GeographicalZone" }, new Object[1] { mres[0] });
            DataRow mRow = null;
            string mCoordinate;
            decimal Hours;
            decimal Minutes;
            decimal Total;
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
                        Hours = Convert.ToDecimal(mCoordinate.Substring(0,2));
                        Minutes = Convert.ToDecimal(mCoordinate.Substring(2, mCoordinate.Length - 4)) / 60;
                        Total = Hours + Minutes + Convert.ToDecimal(mCoordinate.Substring(4, mCoordinate.Length - 4)) / 3600;
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

        protected void ASPxComboBoxPeriod_Load(object sender, EventArgs e)
        {
            DataTable mDataTable = Global.ExecuteStoredProcedure("W_Lookup_GeographicalZone", null, null);
            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                ASPxComboBoxPeriod.Items.Add(mDataTable.Rows[i]["GeographicalZone"].ToString(), mDataTable.Rows[i]["GeographicalZone"]);
            }
        }

        private char[] mDels = new char[2] { '°', '\'' };
        private string mCoordinate;
        private decimal Hours;
        private decimal Minutes;
        private decimal Total;
        private string[] mSubdstrings;

        protected void Map_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e)
        {
            GridViewDataItemTemplateContainer mGridViewDataItemTemplateContainer = ((GridViewDataItemTemplateContainer)((ASPxButton)sender).NamingContainer);
            object keyValue = mGridViewDataItemTemplateContainer.KeyValue;
            ASPxGridView mGridView = (ASPxGridView)(mGridViewDataItemTemplateContainer).NamingContainer;

            object result = mGridView.GetRowValuesByKeyValue(keyValue, new string[2] { "Latitude", "Longitude" });
            string Latitude = ((object[])result)[0].ToString();
            string Longitude = ((object[])result)[1].ToString();
            string coordinate = null;
            if (Latitude != "" && Longitude != "")
            {
                mCoordinate = Latitude;
                mCoordinate = mCoordinate.Substring(0, mCoordinate.Length - 1);
                mSubdstrings = mCoordinate.Split(mDels);
                Hours = Convert.ToDecimal(mSubdstrings[0]);
                Minutes = Convert.ToDecimal(mSubdstrings[1]) / 60;
                Total = Hours + Minutes + Convert.ToDecimal(mSubdstrings[2]) / 3600;

                coordinate = Total.ToString();

                mCoordinate = Longitude;
                mCoordinate = mCoordinate.Substring(0, mCoordinate.Length - 1);
                mSubdstrings = mCoordinate.Split(mDels);
                Hours = Convert.ToDecimal(mSubdstrings[0]);
                Minutes = Convert.ToDecimal(mSubdstrings[1]) / 60;
                Total = Hours + Minutes + Convert.ToDecimal(mSubdstrings[2]) / 3600;

                coordinate = coordinate + ";" + Total.ToString();
            }
            e.Properties["cpCoords"] = coordinate;
        }
    }
}