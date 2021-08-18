using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using System.Diagnostics;
using System.Globalization;

namespace TTWeb
{
    public partial class WindSites : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker =  Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                Debug.WriteLine("CALLBACKPARAM: " + HttpContext.Current.Request.Params["__CALLBACKPARAM"]);
                Debug.WriteLine("CALLBACKID: " + Page.Request.Params["__CALLBACKID"]);

                if (mSessionResourceTracker != null)
                {
                    if (Global.CustomSession["WindSitesTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewWindSites.DataSource = Global.CustomSession["WindSitesTable"];
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
                    if (Global.CustomSession["WindSitesTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewWindSites.DataSource = Global.CustomSession["WindSitesTable"];
                    }
                }
            }
            else
            {
                if (mSessionResourceTracker == null)
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
                ((SessionResourceTracker)mSessionResourceTracker).CleanupSessionObjects();
                MasterDataBind();
            }
            ASPxGridViewWindSites.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Wind Site definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewWindSites.DataSource = Global.ExecuteStoredProcedure("W_Sites_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["WindSitesTable"] = ASPxGridViewWindSites.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("WindSitesTable");
            ASPxGridViewWindSites.DataBind();
        }

        protected void ASPxMenu3_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
        {
            string mName = e.Item.Name;
            HideColumns(true);

            if (mName == "xls")
            { ASPxGridViewExporter2.WriteXlsToResponse(); }
            if (mName == "pdf")
            { ASPxGridViewExporter2.WritePdfToResponse(); }

            HideColumns(false);
        }

        void HideColumns(bool show)
        {
            //ASPxGridViewWindSites.Columns["Attention"].Visible = !show;
            //ASPxGridViewWindSites.Columns["Priority"].Visible = !show;
            //ASPxGridViewWindSites.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewWindSites.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewWindSites.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewWindSites.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemAddWindSite = mASPxMenu.Items.FindByName("AddWindSite");
            if (!mRoles.Contains("Wind Sites Editor"))
            {
                mItemAddWindSite.Enabled = false;
            }
            else
            {
                mItemAddWindSite.Enabled = true;
            }
        }

        protected void ASPxGridViewWindSites_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("W_Site_Insert_Update", new string[13] 
            { "@ID", "@SiteNo", "@SiteName", "@RNCategory", "@ActivationDate", "@DeactivationDate", "@Technology", "@Rsite", "@TransmRespons", "@GeographicalZone",	"@LATITUDE", "@LONGITUDE", "@Updated_by"},

            new Object[13] { System.DBNull.Value, e.NewValues["SiteNo"], e.NewValues["SiteName"], e.NewValues["RNCategory"], e.NewValues["ActivationDate"], e.NewValues["DeactivationDate"], e.NewValues["Technology"], e.NewValues["Rsite"], e.NewValues["TransmRespons"], e.NewValues["GeographicalZone"], e.NewValues["LATITUDE"], e.NewValues["LONGITUDE"], Global.CustomSession["UserId"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewWindSites_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("W_Site_Insert_Update", new string[13] { "@ID", "@SiteNo", "@SiteName", "@RNCategory", "@ActivationDate", "@DeactivationDate", "@Technology", "@Rsite", "@TransmRespons", "@GeographicalZone", "@LATITUDE", "@LONGITUDE", "@Updated_by" },

             new Object[13] { e.Keys[0], e.NewValues["SiteNo"], e.NewValues["SiteName"], e.NewValues["RNCategory"], e.NewValues["ActivationDate"], e.NewValues["DeactivationDate"], e.NewValues["Technology"], e.NewValues["Rsite"], e.NewValues["TransmRespons"], e.NewValues["GeographicalZone"], e.NewValues["LATITUDE"], e.NewValues["LONGITUDE"], Global.CustomSession["UserId"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewWindSites_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("W_Site_Delete", new string[1] { "@ID" }, new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewWindSites_Load(object sender, EventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            mGrid.Columns[0].Visible = mRoles.Contains("Wind Sites Editor");
        }

        protected void ASPxGridViewLocation_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();

            string mLocation = ASPxGridViewWindSites.GetRowValuesByKeyValue(keyValue, "SITE").ToString();
            detailGrid.DataSource = Global.ExecuteStoredProcedure("View_Location_History_SCHs", new string[1] { "@Location" }, new Object[1] { mLocation });
        }

        private char[] mDels = new char[2] { '°', '\'' };
        private string mCoordinate;
        private decimal Hours;
        private decimal Minutes;
        private decimal Total;
        private string[] mSubdstrings;
        private CultureInfo mCultureInfo = CultureInfo.CreateSpecificCulture("en-US");


        protected void ASPxGridViewWindSites_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

            switch (e.Column.FieldName)
            {
                case "GeographicalZone":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("W_Lookup_GeographicalZone", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["GeographicalZone"].ToString(), mDataTable.Rows[i]["GeographicalZone"]);
                        }
                    }
                    break;

                case "Technology":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("W_Lookup_Technology", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Technology"].ToString(), mDataTable.Rows[i]["Technology"]);
                        }
                    }
                    break;

                case "TransmRespons":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("W_Lookup_TransmRespons", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["TransmRespons"].ToString(), mDataTable.Rows[i]["TransmRespons"]);
                        }
                    }
                    break;

                case "RNCategory":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("W_Lookup_RNCategory", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["RNCategory"].ToString(), mDataTable.Rows[i]["RNCategory"]);
                        }
                    }
                    break;
            }
          }

        protected void ASPxImage1_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e)
        {
            GridViewDataItemTemplateContainer mGridViewDataItemTemplateContainer = ((GridViewDataItemTemplateContainer)((ASPxImage)sender).NamingContainer);
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
                Total = Hours + Minutes + Convert.ToDecimal(mSubdstrings[2].Replace(",", ".")) / 3600;

                coordinate = Total.ToString(mCultureInfo);

                mCoordinate = Longitude;
                mCoordinate = mCoordinate.Substring(0, mCoordinate.Length - 1);
                mSubdstrings = mCoordinate.Split(mDels);
                Hours = Convert.ToDecimal(mSubdstrings[0]);
                Minutes = Convert.ToDecimal(mSubdstrings[1]) / 60;
                Total = Hours + Minutes + Convert.ToDecimal(mSubdstrings[2].Replace(",", ".")) / 3600;

                coordinate = coordinate + ";" + Total.ToString(mCultureInfo);
                //coordinate = coordinate.Replace(",", ".");
                //e.Row.Cells[3].Controls ASPxGridViewWindSites
                //Control mControl = ASPxGridViewWindSites.FindRowCellTemplateControl(e.VisibleIndex, null, "Map");
            }
            e.Properties["cpCoords"] = coordinate;
        }

        protected void ASPxGridViewWindSites_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

        protected void ASPxGridViewWindSites_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                ASPxImage mButton = ASPxGridViewWindSites.FindRowCellTemplateControl(e.VisibleIndex, ASPxGridViewWindSites.Columns[13] as GridViewDataColumn, "mapbutton") as ASPxImage;
                if (mButton != null)
                {
                    mButton.CustomJSProperties += new DevExpress.Web.CustomJSPropertiesEventHandler(WindSites_CustomJSProperties);
                }
            }
        }


        string Coordinate(string aTotal)
        {
            mCoordinate = aTotal;
            Hours = Convert.ToDecimal(mCoordinate.Substring(0,2));
            Minutes = Convert.ToDecimal(mCoordinate.Substring(2, mCoordinate.Length - 4)) / 60;
            return (Total = Hours + Minutes + Convert.ToDecimal(mCoordinate.Substring(4, mCoordinate.Length - 4)) / 3600).ToString().Replace(",",".");               
        }

        void WindSites_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e)
        {
            object keyval = ((sender as ASPxImage).NamingContainer as GridViewDataItemTemplateContainer).KeyValue;
            object[] res = (object[])ASPxGridViewWindSites.GetRowValuesByKeyValue(keyval, new string[3] { "LATITUDE", "LONGITUDE", "SiteName" });

            if (res[0].ToString() != "System.DBNull" && res[0].ToString() != "")
            {
                e.Properties["cp_Coordinates"] = Coordinate(res[0].ToString()) + ";" + Coordinate(res[1].ToString()) + ";" + res[2].ToString() + ";";
            }
            
        }
    }
}


 
	