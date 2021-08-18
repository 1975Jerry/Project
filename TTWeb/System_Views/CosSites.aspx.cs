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
    public partial class CosSites : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker =  Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                Debug.WriteLine("CALLBACKPARAM: " + HttpContext.Current.Request.Params["__CALLBACKPARAM"]);
                Debug.WriteLine("CALLBACKID: " + Page.Request.Params["__CALLBACKID"]);
                if (ASPxPopupControl1.IsCallback)
                {
                    return;
                }
                if (mSessionResourceTracker != null)
                {
                    if (Global.CustomSession["CosSitesTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCosSites.DataSource = Global.CustomSession["CosSitesTable"];
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
                    if (Global.CustomSession["CosSitesTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewCosSites.DataSource = Global.CustomSession["CosSitesTable"];
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
            ASPxGridViewCosSites.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Cosmote Site definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewCosSites.DataSource = Global.ExecuteStoredProcedure("Cos_Coord_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["CosSitesTable"] = ASPxGridViewCosSites.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("CosSitesTable");
            ASPxGridViewCosSites.DataBind();
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
            //ASPxGridViewCosSites.Columns["Attention"].Visible = !show;
            //ASPxGridViewCosSites.Columns["Priority"].Visible = !show;
            //ASPxGridViewCosSites.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewCosSites.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewCosSites.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewCosSites.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemAddCosSite = mASPxMenu.Items.FindByName("AddCosSite");
            if (!mRoles.Contains("Cosmote Sites Editor"))
            {
                mItemAddCosSite.Enabled = false;
            }
            else
            {
                mItemAddCosSite.Enabled = true;
            }
        }

        protected void ASPxGridViewCosSites_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Cos_Coord_Insert_Update", new string[6] 
            {"@ID", "@Site_Description","@Prefecture","@Latitude","@Longitude","@Updated_by"},

            new Object[6] { System.DBNull.Value, e.NewValues["Site"], e.NewValues["Prefecture"], e.NewValues["Latitude"], e.NewValues["Longitude"], Global.CustomSession["UserId"]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewCosSites_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Cos_Coord_Insert_Update", new string[6] { "@ID", "@Site_Description", "@Prefecture", "@Latitude", "@Longitude", "@Updated_by" },

             new Object[6] {e.Keys[0], e.NewValues["Site"], e.NewValues["Prefecture"], e.NewValues["Latitude"], e.NewValues["Longitude"], Global.CustomSession["UserId"]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewCosSites_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Cos_Coord_Delete", new string[1] { "@ID" }, new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewCosSites_Load(object sender, EventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            mGrid.Columns[0].Visible = mRoles.Contains("Cosmote Sites Editor");
        }

        protected void ASPxGridViewLocation_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();

            string mLocation = ASPxGridViewCosSites.GetRowValuesByKeyValue(keyValue, "SITE").ToString();
            detailGrid.DataSource = Global.ExecuteStoredProcedure("View_Location_History_SCHs", new string[1] { "@Location" }, new Object[1] { mLocation });
        }

        private char[] mDels = new char[2] { '°', '\'' };
        private string mCoordinate;
        private decimal Hours;
        private decimal Minutes;
        private decimal Total;
        private string[] mSubdstrings;
        private CultureInfo mCultureInfo = CultureInfo.CreateSpecificCulture("en-US");


        protected void ASPxGridViewCosSites_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

            switch (e.Column.FieldName)
            {
                case "Prefecture":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Cos_Coord_Lookup_Prefecture", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Prefecture"].ToString(), mDataTable.Rows[i]["Prefecture"]);
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
                //e.Row.Cells[3].Controls ASPxGridViewCosSites
                //Control mControl = ASPxGridViewCosSites.FindRowCellTemplateControl(e.VisibleIndex, null, "Map");
            }
            e.Properties["cpCoords"] = coordinate;
        }

    }
}


 
	