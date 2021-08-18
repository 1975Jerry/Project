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
    public partial class VictusSites : System.Web.UI.Page
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
                    if (Global.CustomSession["VictusSitesTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewVictusSites.DataSource = Global.CustomSession["VictusSitesTable"];
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
                    if (Global.CustomSession["VictusSitesTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewVictusSites.DataSource = Global.CustomSession["VictusSitesTable"];
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
            ASPxGridViewVictusSites.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Victus Site definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewVictusSites.DataSource = Global.ExecuteStoredProcedure("Victus_Sites_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["VictusSitesTable"] = ASPxGridViewVictusSites.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("VictusSitesTable");
            ASPxGridViewVictusSites.DataBind();
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
            //ASPxGridViewVictusSites.Columns["Attention"].Visible = !show;
            //ASPxGridViewVictusSites.Columns["Priority"].Visible = !show;
            //ASPxGridViewVictusSites.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewVictusSites.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewVictusSites.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewVictusSites.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemAddVictusSite = mASPxMenu.Items.FindByName("AddVictusSite");
            if (!mRoles.Contains("Victus Sites Editor"))
            {
                mItemAddVictusSite.Enabled = false;
            }
            else
            {
                mItemAddVictusSite.Enabled = true;
            }
        }

        protected void ASPxGridViewVictusSites_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Victus_Sites_Insert_Update", new string[13] { "@ID", "@Site_ID", "@Site_name", "@Latitude", "@Longitude", "@Type", "@Operator", "@Collocated_site_ID", "@Collocated_site_name", "@Collocated_site_operator", "@Region", "@4x4_Required", "@Updated_by" },

            new Object[13] { System.DBNull.Value, e.NewValues["Site_ID"], e.NewValues["Site_name"], e.NewValues["Latitude"], e.NewValues["Longitude"], e.NewValues["Type"], e.NewValues["Operator"], e.NewValues["Collocated_site_ID"], e.NewValues["Collocated_site_name"], e.NewValues["Collocated_site_operator"], e.NewValues["Region"], e.NewValues["4x4_Required"], Global.CustomSession["UserId"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewVictusSites_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Victus_Sites_Insert_Update", new string[13] { "@ID", "@Site_ID", "@Site_name", "@Latitude", "@Longitude", "@Type", "@Operator", "@Collocated_site_ID", "@Collocated_site_name", "@Collocated_site_operator", "@Region", "@4x4_Required", "@Updated_by" },

             new Object[13] { e.Keys[0], e.NewValues["Site_ID"], e.NewValues["Site_name"], e.NewValues["Latitude"], e.NewValues["Longitude"], e.NewValues["Type"], e.NewValues["Operator"], e.NewValues["Collocated_site_ID"], e.NewValues["Collocated_site_name"], e.NewValues["Collocated_site_operator"], e.NewValues["Region"], e.NewValues["4x4_Required"], Global.CustomSession["UserId"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewVictusSites_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Victus_Sites_Delete", new string[1] { "@ID" }, new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewVictusSites_Load(object sender, EventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            mGrid.Columns[0].Visible = mRoles.Contains("Victus Sites Editor");
        }

        protected void ASPxGridViewLocation_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();

            string mLocation = ASPxGridViewVictusSites.GetRowValuesByKeyValue(keyValue, "SITE").ToString();
            detailGrid.DataSource = Global.ExecuteStoredProcedure("View_Location_History_SCHs", new string[1] { "@Location" }, new Object[1] { mLocation });
        }

        protected void ASPxGridViewVictusSites_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

            switch (e.Column.FieldName)
            {
                case "Region":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Victus_Lookup_Region", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Region"].ToString(), mDataTable.Rows[i]["Region"]);
                        }
                    }
                    break;


                case "4x4_Required":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Victus_Lookup_4x4_Required", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Required_4x4"].ToString(), mDataTable.Rows[i]["Required_4x4"]);
                        }
                    }
                    break;

                case "Type":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("W_Lookup_Technology", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Technology"].ToString(), mDataTable.Rows[i]["Technology"]);
                        }
                    }
                    break;

                case "Operator":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Victus_Lookup_Operator", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Operator"].ToString(), mDataTable.Rows[i]["Operator"]);
                        }
                    }
                    break;

                case "Collocated_site_operator":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Victus_Lookup_Operator", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Operator"].ToString(), mDataTable.Rows[i]["Operator"]);
                        }
                    }
                    break;

                //case "Collocated_site_name":
                //    {
                //        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                //        DataTable mDataTable = Global.ExecuteStoredProcedure("Victus_Lookup_Site_Name", null, null);
                //        for (int i = 0; i < mDataTable.Rows.Count; i++)
                //        {
                //            mCombobox.Items.Add(mDataTable.Rows[i]["Victus_Site"].ToString(), mDataTable.Rows[i]["Victus_Site"]);
                //        }
                //    }
                //    break;
            }
          }


        private char[] mDels = new char[2] { '°', '\'' };
        private string mCoordinate;
        private decimal Hours;
        private decimal Minutes;
        private decimal Total;
        private string[] mSubdstrings;
        private CultureInfo mCultureInfo = CultureInfo.CreateSpecificCulture("en-US");

        
        private string CoordinateString(string aLatitude, string aLongitude)
        {

            string Latitude = aLatitude;
            string Longitude = aLongitude;
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
                //e.Row.Cells[3].Controls ASPxGridViewVictusSites
                //Control mControl = ASPxGridViewVictusSites.FindRowCellTemplateControl(e.VisibleIndex, null, "Map");
            }
            return coordinate;
        }

        protected void ASPxGridViewVictusSites_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

        protected void ASPxGridViewVictusSites_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                ASPxImage mButton = ASPxGridViewVictusSites.FindRowCellTemplateControl(e.VisibleIndex, ASPxGridViewVictusSites.Columns[10] as GridViewDataColumn, "mapbutton") as ASPxImage;
                if (mButton != null)
                {
                    mButton.CustomJSProperties += new DevExpress.Web.CustomJSPropertiesEventHandler(VictusSites_CustomJSProperties);
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

        void VictusSites_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e)
        {
            object keyval = ((sender as ASPxImage).NamingContainer as GridViewDataItemTemplateContainer).KeyValue;
            object[] res = (object[])ASPxGridViewVictusSites.GetRowValuesByKeyValue(keyval, new string[3] { "Latitude", "Longitude", "Site_name" });

            if (res[0].ToString() != "System.DBNull" && res[0].ToString() != "")
            {
                e.Properties["cp_Coords"] = CoordinateString(res[0].ToString(), res[1].ToString()) + ";" + res[2].ToString() + ";";
            }
            
        }
    }
}


 
	