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
    public partial class Nodes : System.Web.UI.Page
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
                    if (Global.CustomSession["NodesTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewNodes.DataSource = Global.CustomSession["NodesTable"];
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
                    if (Global.CustomSession["NodesTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewNodes.DataSource = Global.CustomSession["NodesTable"];
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
            ASPxGridViewNodes.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Node definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewNodes.DataSource = Global.ExecuteStoredProcedure("Nodes_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["NodesTable"] = ASPxGridViewNodes.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("NodesTable");
            ASPxGridViewNodes.DataBind();
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
            //ASPxGridViewNodes.Columns["Attention"].Visible = !show;
            //ASPxGridViewNodes.Columns["Priority"].Visible = !show;
            //ASPxGridViewNodes.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewNodes.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewNodes.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewNodes.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemAddNode = mASPxMenu.Items.FindByName("AddNode");
            if (!mRoles.Contains("Nodes Editor"))
            {
                mItemAddNode.Enabled = false;
            }
            else
            {
                mItemAddNode.Enabled = true;
            }
        }

        protected void ASPxGridViewNodes_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Nodes_Insert_Update", new string[23] 
            {"@ID", "@SITE","@NOMOS","@TYPE","@CABINS_2G","@3G_ACTIVATED","@NODE_ID", "@STATUS", "@LL_LINK","@RADIO_TYPE","@COLOCATION_HOST","@POWER",
             "@AIR_CONDITIONING_UNITS","@LC_LINKS","@HC_LINKS","@HC_MULTI_PLEXERS","@CRITICAL_RADIO","@CRITICAL_TMN","@ISLAND",  "@Updated_by", "@LATITUDE", "@LONGITUDE", "@REGION" },

            new Object[23] { System.DBNull.Value, e.NewValues["SITE"], e.NewValues["NOMOS"], e.NewValues["TYPE"], e.NewValues["CABINS_2G"], e.NewValues["3G_ACTIVATED"], e.NewValues["NODE_ID"], e.NewValues["STATUS"], e.NewValues["LL_LINK"], e.NewValues["RADIO_TYPE"], 
                             e.NewValues["COLOCATION_HOST"], e.NewValues["POWER"], e.NewValues["AIR_CONDITIONING_UNITS"], e.NewValues["LC_LINKS"], e.NewValues["HC_LINKS"], e.NewValues["HC_MULTI_PLEXERS"], e.NewValues["CRITICAL_RADIO"], e.NewValues["CRITICAL_TMN"],
                             e.NewValues["ISLAND"], Global.CustomSession["UserId"], e.NewValues["LATITUDE"], e.NewValues["LONGITUDE"], e.NewValues["REGION"]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewNodes_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Nodes_Insert_Update", new string[23] 
            {"@ID", "@SITE","@NOMOS","@TYPE","@CABINS_2G","@3G_ACTIVATED","@NODE_ID", "@STATUS", "@LL_LINK","@RADIO_TYPE","@COLOCATION_HOST","@POWER",
             "@AIR_CONDITIONING_UNITS","@LC_LINKS","@HC_LINKS","@HC_MULTI_PLEXERS","@CRITICAL_RADIO","@CRITICAL_TMN","@ISLAND",  "@Updated_by", "@LATITUDE", "@LONGITUDE", "@REGION"  },

             new Object[23] { e.Keys[0], e.NewValues["SITE"], e.NewValues["NOMOS"], e.NewValues["TYPE"], e.NewValues["CABINS_2G"], e.NewValues["3G_ACTIVATED"], e.NewValues["NODE_ID"], e.NewValues["STATUS"], e.NewValues["LL_LINK"], e.NewValues["RADIO_TYPE"], 
                             e.NewValues["COLOCATION_HOST"], e.NewValues["POWER"], e.NewValues["AIR_CONDITIONING_UNITS"], e.NewValues["LC_LINKS"], e.NewValues["HC_LINKS"], e.NewValues["HC_MULTI_PLEXERS"], e.NewValues["CRITICAL_RADIO"], e.NewValues["CRITICAL_TMN"],
                             e.NewValues["ISLAND"], Global.CustomSession["UserId"], e.NewValues["LATITUDE"], e.NewValues["LONGITUDE"], e.NewValues["REGION"]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewNodes_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Node_Delete", new string[1] { "@ID" }, new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewNodes_Load(object sender, EventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            mGrid.Columns[0].Visible = mRoles.Contains("Nodes Editor");
        }

        protected void ASPxGridViewLocation_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.Name == "Priority")
            {
                e.Cell.ToolTip = e.CellValue.ToString();
            }

            if (e.DataColumn.Name == "Type")
            {
                e.Cell.ToolTip = e.CellValue.ToString();
            }
        }

        protected void ASPxGridViewLocation_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            if ((string)e.GetValue("Type") == "Visit")
                e.Row.BackColor = System.Drawing.Color.Ivory;
        }

        protected void ASPxGridViewNodes_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            (sender as ASPxGridView).DetailRows.CollapseAllRows();
        }

        protected void ASPxGridViewLocation_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();

            string mLocation = ASPxGridViewNodes.GetRowValuesByKeyValue(keyValue, "SITE").ToString();
            detailGrid.DataSource = Global.ExecuteStoredProcedure("View_Location_History_SCHs", new string[1] { "@Location" }, new Object[1] { mLocation });
        }


        string mCoordinate;
        decimal Hours;
        decimal Minutes;
        decimal Total1;
        decimal Total2;
        string[] mSubdstrings;
        char[] mDels = new char[2] { '°', '\'' };
        private CultureInfo mCultureInfo = CultureInfo.CreateSpecificCulture("en-US");

        protected void ASPxButtonShowMap_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e)
        {
            string Latitude = ((sender as ASPxButton).NamingContainer.FindControl("ASPxTextBox14") as ASPxTextBox).Text;
            string Longitude = ((sender as ASPxButton).NamingContainer.FindControl("ASPxTextBox15") as ASPxTextBox).Text;
            string legent1 = ((sender as ASPxButton).NamingContainer.FindControl("ASPxTextBox1") as ASPxTextBox).Text;
            string legent2 = legent1;

            if (Latitude != "" && Longitude != "")
            {
                mCoordinate = Latitude.Substring(0, Latitude.Length - 1);
                mSubdstrings = Latitude.Split(mDels);
                Hours = Convert.ToDecimal(mSubdstrings[0])/* * 3600*/;
                Minutes = Convert.ToDecimal(mSubdstrings[1]) / 60;
                Total1 = Hours + Minutes + Convert.ToDecimal(mSubdstrings[2].Substring(0, mSubdstrings[2].Length - 1).Replace(",", "."), mCultureInfo) / 3600;

                mCoordinate = Longitude.Substring(0, Longitude.Length - 1);
                mSubdstrings = Longitude.Split(mDels);
                Hours = Convert.ToDecimal(mSubdstrings[0])/* * 3600*/;
                Minutes = Convert.ToDecimal(mSubdstrings[1]) / 60;
                Total2 = Hours + Minutes + Convert.ToDecimal(mSubdstrings[2].Substring(0, mSubdstrings[2].Length - 1).Replace(",", "."), mCultureInfo) / 3600;
                //kai edo einai i perifimi telia kai to komma pou sou elega.......
                //e.Properties["cpCoordinates"] = Total1.ToString().Replace(",",".") + ";" + Total2.ToString().Replace(",",".") + ";" + legent1 + ";" + "";
                e.Properties["cpCoordinates"] = Total1.ToString(mCultureInfo) + ";" + Total2.ToString(mCultureInfo) + ";" + legent1 + ";" + "";
            }
        }

        protected void ASPxGridViewNodes_HtmlEditFormCreated(object sender, ASPxGridViewEditFormEventArgs e)
        {
            ASPxComboBox combo = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxComboBoxRegion") as ASPxComboBox;
            if (combo != null)
            {
                //DataTable table = Global.ExecuteStatement("select ROLE, ROLE_ID from USR_ROLES where VALID_FLG=1");
                DataTable table = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
                //combo.SelectedIndex = 0;
                combo.DataSource = table;
                combo.ValueField = "Region";
                combo.TextField = "Region";
                combo.ValueType = typeof(string);
                combo.DataBindItems();


            }
        }
    }
}


 
	