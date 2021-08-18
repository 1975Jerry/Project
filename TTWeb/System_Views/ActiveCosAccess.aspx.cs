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
    public partial class ActiveCosAccess : System.Web.UI.Page
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
                    if (Global.CustomSession["ActiveCosAccessTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveCosAccess.DataSource = Global.CustomSession["ActiveCosAccessTable"];
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
                    if (Global.CustomSession["ActiveCosAccessTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveCosAccess.DataSource = Global.CustomSession["ActiveCosAccessTable"];
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
            ASPxGridViewActiveCosAccess.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Access Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewActiveCosAccess.DataSource = Global.ExecuteStoredProcedure("Cos_Access_Active_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActiveCosAccessTable"] = ASPxGridViewActiveCosAccess.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActiveCosAccessTable");
            ASPxGridViewActiveCosAccess.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewActiveCosAccess.AddNewRow();
        }

 
        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_COS_ACCESS", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewActiveCosAccess;

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
            //ASPxGridViewActiveCosAccess.Columns["CANCELLED"].Visible = !show;
            //ASPxGridViewActiveCosAccess.Columns["Priority"].Visible = !show;
            //ASPxGridViewActiveCosAccess.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewActiveCosAccess.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewActiveCosAccess.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewActiveCosAccess.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            DevExpress.Web.MenuItem mItemAddSuppl = mASPxMenu.Items.FindByName("AddSuppl");

            if (!mRoles.Contains("SRI Cosmote Access Creator"))
            {
                mItemCreateSRI.Enabled = false;
            }
            else
            {
                mItemCreateSRI.Enabled = true;
            }

            if (!mRoles.Contains("Cosmote Access Editor"))
            {
                mItemAddSuppl.Enabled = false;
            }
            else
            {
                mItemAddSuppl.Enabled = true;
            }


        }

        protected void ASPxGridViewActiveCosAccess_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


        protected void ASPxGridViewActiveCosAccess_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("COS_ACCESS_Insert_Update", new string[12] { "@COS_ACCESS_ID", "@SRI", "@SITE", "@PHASE", "@PREFECTURE", "@Region", "@DOORS_INV", "@DOORS_INST", "@INSTALLATION_DATE", "@COMMENTS", "@USER_ID", "@ToBeScheduled" },

                new Object[12] { System.DBNull.Value, e.NewValues["SRI"], e.NewValues["SITE"], e.NewValues["PHASE"], e.NewValues["PREFECTURE"], e.NewValues["Region"], e.NewValues["DOORS_INV"], e.NewValues["DOORS_INST"], e.NewValues["INSTALLATION_DATE"], e.NewValues["COMMENTS"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }





        protected void ASPxGridViewActiveCosAccess_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {


            Global.ExecuteStoredProcedureNoResults("COS_ACCESS_Insert_Update", new string[12] { "@COS_ACCESS_ID", "@SRI", "@SITE", "@PHASE", "@PREFECTURE", "@Region", "@DOORS_INV", "@DOORS_INST", "@INSTALLATION_DATE", "@COMMENTS", "@USER_ID", "@ToBeScheduled"},

                new Object[12] { e.Keys[0], e.NewValues["SRI"], e.NewValues["SITE"], e.NewValues["PHASE"], e.NewValues["PREFECTURE"], e.NewValues["Region"], e.NewValues["DOORS_INV"], e.NewValues["DOORS_INST"], e.NewValues["INSTALLATION_DATE"], e.NewValues["COMMENTS"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveCosAccess_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Cos_Access_Delete", new string[1] { "@TT_ID" },
                               new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        //protected void ASPxGridViewActiveCosAccess_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        //{
        //    switch (e.Column.FieldName)
        //    {
        //        //case "Region":
        //        //    {
        //        //        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
        //        //        DataTable mDataTable = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
        //        //        for (int i = 0; i < mDataTable.Rows.Count; i++)
        //        //        {
        //        //            mCombobox.Items.Add(mDataTable.Rows[i]["Region"].ToString(), mDataTable.Rows[i]["Region"]);
        //        //        }
        //        //    }
        //        //    break;

        //        case "NAME":
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

        //protected void ASPxGridViewActiveCosAccess_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        //{
        //    if (e.ButtonType == ColumnCommandButtonType.Edit || e.ButtonType == ColumnCommandButtonType.Delete)
        //    {
        //        List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
        //        e.Visible = mRoles.Contains("Suppl Editor");
        //    }
        //}

        protected void ASPxGridViewActiveCosAccess_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;

                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("Cosmote Access Editor");;

        }

        protected void ASPxGridViewActiveCosAccess_CellEditorInitialize1(object sender, ASPxGridViewEditorEventArgs e)
        {
            switch (e.Column.FieldName)
            {
                case "PREFECTURE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Cos_Sites_Lookup_Prefecture", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Prefecture"].ToString(), mDataTable.Rows[i]["Prefecture"]);
                        }
                    }
                    break;

                case "PHASE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Cos_Access_Lookup_Phase", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Phase"].ToString(), mDataTable.Rows[i]["Phase"]);
                        }
                    }
                    break;

                case "SITE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Cos_Lookup_Sites", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Site"].ToString(), mDataTable.Rows[i]["Site"]);
                        }
                    }
                    break;

                case "Region":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Region"].ToString(), mDataTable.Rows[i]["Region"]);
                        }
                    }
                    break;
            }

        }





    }
}


 
	