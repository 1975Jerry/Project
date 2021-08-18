using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using System.Diagnostics;

namespace TTWeb
{
    public partial class ActiveChargeable : System.Web.UI.Page
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
                    if (Global.CustomSession["ActiveChargeableTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveChargeable.DataSource = Global.CustomSession["ActiveChargeableTable"];
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
                    if (Global.CustomSession["ActiveChargeableTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveChargeable.DataSource = Global.CustomSession["ActiveChargeableTable"];
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
            ASPxGridViewActiveChargeable.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Chargeable Ticket definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewActiveChargeable.DataSource = Global.ExecuteStoredProcedure("CH_Active_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActiveChargeableTable"] = ASPxGridViewActiveChargeable.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActiveChargeableTable");
            ASPxGridViewActiveChargeable.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewActiveChargeable.AddNewRow();
        }

        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_CH", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewActiveChargeable;

            e.Result = mDataTable.Rows[0][0].ToString() + ";" + e.Parameter.ToString() + ";" + dberror;
            MasterDataBind();
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
            //ASPxGridViewActiveChargeable.Columns["Attention"].Visible = !show;
            //ASPxGridViewActiveChargeable.Columns["Priority"].Visible = !show;
            //ASPxGridViewActiveChargeable.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewActiveChargeable.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewActiveChargeable.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewActiveChargeable.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            DevExpress.Web.MenuItem mItemAddSuppl = mASPxMenu.Items.FindByName("AddSuppl");

            if (!mRoles.Contains("SRI Chargeable Creator"))
            {
                mItemCreateSRI.Enabled = false;
            }
            else
            {
                mItemCreateSRI.Enabled = true;
            }

            if (!mRoles.Contains("Chargeable Editor"))
            {
                mItemAddSuppl.Enabled = false;
            }
            else
            {
                mItemAddSuppl.Enabled = true;
            }


        }

        protected void ASPxGridViewActiveChargeable_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
          if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

        protected void ASPxGridViewActiveChargeable_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("CH_Insert_Update", new string[18] { "@CH_ID", "@SRI", "@PROJECT", "@SITE", "@SITE_TYPE", "@REGION", "@DESCRIPTION", "@AED", "@REQUEST_DATE", "@OFFER_DATE", "@APPROVAL_DATE", "@COMPLETION_DATE", "@INVOICE_DATE", "@NOTES", "@STATUS", "@USER_ID", "@ToBeScheduled", "@PO" },

               new Object[18] 
                { System.DBNull.Value, e.NewValues["SRI"], e.NewValues["PROJECT"], e.NewValues["SITE"], e.NewValues["SITE_TYPE"], e.NewValues["REGION"], e.NewValues["DESCRIPTION"],
                    e.NewValues["AED"], e.NewValues["REQUEST_DATE"], e.NewValues["OFFER_DATE"],e.NewValues["APPROVAL_DATE"], e.NewValues["COMPLETION_DATE"], e.NewValues["INVOICE_DATEDEAD_LINE"], 
                    e.NewValues["NOTES"], e.NewValues["STATUS"], e.NewValues["USER_ID"], e.NewValues["ToBeScheduled"], e.NewValues["PO"]});
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveChargeable_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("CH_Insert_Update", new string[18] 
                { "@CH_ID", "@SRI", "@PROJECT", "@SITE", "@SITE_TYPE", "@REGION", "@DESCRIPTION", "@AED","@REQUEST_DATE", "@OFFER_DATE", "@APPROVAL_DATE", "@COMPLETION_DATE","@INVOICE_DATE", "@NOTES", "@STATUS", "@USER_ID", "@ToBeScheduled", "@PO"},

                new Object[18] 
                { e.Keys[0], e.NewValues["SRI"], e.NewValues["PROJECT"], e.NewValues["SITE"], e.NewValues["SITE_TYPE"], e.NewValues["REGION"], e.NewValues["DESCRIPTION"],
                    e.NewValues["AED"], e.NewValues["REQUEST_DATE"], e.NewValues["OFFER_DATE"],e.NewValues["APPROVAL_DATE"], e.NewValues["COMPLETION_DATE"], e.NewValues["INVOICE_DATEDEAD_LINE"], 
                    e.NewValues["NOTES"], e.NewValues["STATUS"], e.NewValues["USER_ID"], e.NewValues["ToBeScheduled"], e.NewValues["PO"]});
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveChargeable_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("CH_Delete", new string[1] { "@TT_ID"},
                               new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        //protected void ASPxGridViewActiveChargeable_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        //{
        //    switch (e.Column.FieldName)
        //    {
        //        case "REGION":
        //            {
        //                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
        //                DataTable mDataTable = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
        //                for (int i = 0; i < mDataTable.Rows.Count; i++)
        //                {
        //                    mCombobox.Items.Add(mDataTable.Rows[i]["Region"].ToString(), mDataTable.Rows[i]["Region"]);
        //                }
        //            }
        //            break;

        //        case "SITE":
        //            {
        //                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
        //                DataTable mDataTable = Global.ExecuteStoredProcedure("Nodes_Lookup_Sites", null, null);
        //                for (int i = 0; i < mDataTable.Rows.Count; i++)
        //                {
        //                    mCombobox.Items.Add(mDataTable.Rows[i]["SITE"].ToString(), mDataTable.Rows[i]["SITE"]);
        //                }
        //            }

        //            break;
        //    }
        //}

        //protected void ASPxGridViewActiveChargeable_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        //{
        //    if (e.ButtonType == ColumnCommandButtonType.Edit || e.ButtonType == ColumnCommandButtonType.Delete)
        //    {
        //        List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
        //        e.Visible = mRoles.Contains("Suppl Editor");
        //    }
        //}

        protected void ASPxGridViewActiveChargeable_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;

                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("Implem & Supplem Editor");;

        }

        protected void ASPxGridViewActiveChargeable_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            (sender as ASPxGridView).DetailRows.CollapseAllRows();
        }

        protected void ASPxGridViewActiveChargeable_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {
             if (e.RowType == GridViewRowType.EditForm)
            {
                if (((ASPxGridView)sender).IsNewRowEditing == true)
                {
                    ASPxComboBox comboRegionNew = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxComboBoxRegion") as ASPxComboBox;
                    if (comboRegionNew != null)
                    {
                        DataTable tableRegion = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
                        comboRegionNew.DataSource = tableRegion;
                        comboRegionNew.ValueField = "Region";
                        comboRegionNew.TextField = "Region";
                        comboRegionNew.ValueType = typeof(string);
                        comboRegionNew.DataBindItems();
                    }

                    return;
                }

                ASPxComboBox comboSite = (sender as ASPxGridView).FindEditFormTemplateControl("Site") as ASPxComboBox;
                if (comboSite != null)
                {
                    object keyvalue = ((GridViewEditFormTemplateContainer)comboSite.NamingContainer).KeyValue;
                    string mProject = (sender as ASPxGridView).GetRowValuesByKeyValue(keyvalue, new string[1] { "PROJECT" }).ToString();
                    DataTable tableSite = Global.ExecuteStoredProcedure("CH_Lookup_Sites", new string[1] { "@Project" }, new object[1] { mProject });
                    comboSite.DataSource = tableSite;
                    comboSite.ValueField = "SITE";
                    comboSite.TextField = "SITE";
                    comboSite.ValueType = typeof(string);
                    comboSite.DataBindItems();
                }

                ASPxComboBox comboRegion = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxComboBoxRegion") as ASPxComboBox;
                if (comboRegion != null)
                {
                    DataTable tableRegion = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
                    comboRegion.DataSource = tableRegion;
                    comboRegion.ValueField = "Region";
                    comboRegion.TextField = "Region";
                    comboRegion.ValueType = typeof(string);
                    comboRegion.DataBindItems();
                }

                //ASPxComboBox comboLoc = (sender as ASPxGridView).FindEditFormTemplateControl("Location") as ASPxComboBox;
                //if (comboLoc != null)
                //{
                //    DataTable tableLoc = Global.ExecuteStoredProcedure("Nodes_Lookup_Sites", null, null);
                //    comboLoc.DataSource = tableLoc;
                //    comboLoc.ValueField = "SITE";
                //    comboLoc.TextField = "SITE";
                //    comboLoc.ValueType = typeof(string);
                //    comboLoc.DataBindItems();
                //}

                //ASPxComboBox comboCat = (sender as ASPxGridView).FindEditFormTemplateControl("Category") as ASPxComboBox;
                //if (comboCat != null)
                //{
                //    DataTable tableCat = Global.ExecuteStoredProcedure("Suppl_Lookup_Category", null, null);
                //    comboCat.DataSource = tableCat;
                //    comboCat.ValueField = "Category";
                //    comboCat.TextField = "Category";
                //    comboCat.ValueType = typeof(string);
                //    comboCat.DataBindItems();
                //}

                //ASPxComboBox comboResp = (sender as ASPxGridView).FindEditFormTemplateControl("Responsible") as ASPxComboBox;
                //if (comboCat != null)
                //{
                //    DataTable tableResp = Global.ExecuteStoredProcedure("Suppl_Lookup_Responsible", null, null);
                //    comboResp.DataSource = tableResp;
                //    comboResp.ValueField = "Responsible";
                //    comboResp.TextField = "Responsible";
                //    comboResp.ValueType = typeof(string);
                //    comboResp.DataBindItems();
                //}        

                if (((ASPxGridView)sender).IsNewRowEditing == true)
                {
                    comboSite.SelectedIndex = 0;
                    comboRegion.SelectedIndex = 0;
                    //comboResp.SelectedIndex = 0;
                }
            }
        }

        protected void ASPxComboBoxDescription_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            //CH_Lookup_Issue @Project 
            ASPxComboBox mCombo = (sender as ASPxComboBox);
            DataTable mDataTable = Global.ExecuteStoredProcedure("CH_Lookup_Issue", new string[1] { "@Project" }, new object[1] { e.Parameter.ToString() });
            mCombo.DataSource = mDataTable;
            mCombo.ValueField = "Description";
            mCombo.TextField = "Description";
            mCombo.ValueType = typeof(string);
            mCombo.DataBind();
        }

        protected void Site_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            ASPxComboBox mCombo = (sender as ASPxComboBox);
            DataTable mDataTable = Global.ExecuteStoredProcedure("CH_Lookup_Sites", new string[1] { "@Project" }, new object[1] { e.Parameter.ToString() });
            mCombo.DataSource = mDataTable;
            mCombo.ValueField = "Site";
            mCombo.TextField = "Site";
            mCombo.ValueType = typeof(string);
            mCombo.DataBind();
        }


    }
}


 
	