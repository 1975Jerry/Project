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
    public partial class ActiveCosTelemg : System.Web.UI.Page
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
                    if (Global.CustomSession["ActiveCosTelemgTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveCosTelemg.DataSource = Global.CustomSession["ActiveCosTelemgTable"];
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
                    if (Global.CustomSession["ActiveCosTelemgTable"] == null)
                    {
                        MasterDataBind();
                    }
                    else
                    {
                        ASPxGridViewActiveCosTelemg.DataSource = Global.CustomSession["ActiveCosTelemgTable"];
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
            ASPxGridViewActiveCosTelemg.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Telemg Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewActiveCosTelemg.DataSource = Global.ExecuteStoredProcedure("Cos_Telemg_Active_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActiveCosTelemgTable"] = ASPxGridViewActiveCosTelemg.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActiveCosTelemgTable");
            ASPxGridViewActiveCosTelemg.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewActiveCosTelemg.AddNewRow();
        }

 
        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_COS_TELEMG", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewActiveCosTelemg;

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
            //ASPxGridViewActiveCosTelemg.Columns["CANCELLED"].Visible = !show;
            //ASPxGridViewActiveCosTelemg.Columns["Priority"].Visible = !show;
            //ASPxGridViewActiveCosTelemg.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewActiveCosTelemg.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewActiveCosTelemg.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewActiveCosTelemg.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            DevExpress.Web.MenuItem mItemAddSuppl = mASPxMenu.Items.FindByName("AddSuppl");

            if (!mRoles.Contains("SRI Cosmote Telemg Creator"))
            {
                mItemCreateSRI.Enabled = false;
            }
            else
            {
                mItemCreateSRI.Enabled = true;
            }

            if (!mRoles.Contains("Cosmote Telemg Editor"))
            {
                mItemAddSuppl.Enabled = false;
            }
            else
            {
                mItemAddSuppl.Enabled = true;
            }


        }

        protected void ASPxGridViewActiveCosTelemg_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


        protected void ASPxGridViewActiveCosTelemg_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("COS_Telemg_Insert_Update", new string[10] { "@COS_Telemg_ID", "@SRI", "@SITE", "@LOT", "@PREFECTURE", "@Region", "@INSTALLATION_DATE", "@COMMENTS", "@USER_ID", "@ToBeScheduled" },

                new Object[10] { System.DBNull.Value, e.NewValues["SRI"], e.NewValues["SITE"], e.NewValues["LOT"], e.NewValues["PREFECTURE"], e.NewValues["Region"], e.NewValues["INSTALLATION_DATE"], e.NewValues["COMMENTS"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }





        protected void ASPxGridViewActiveCosTelemg_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {


            Global.ExecuteStoredProcedureNoResults("COS_Telemg_Insert_Update", new string[10] { "@COS_Telemg_ID", "@SRI", "@SITE", "@LOT", "@PREFECTURE", "@Region", "@INSTALLATION_DATE", "@COMMENTS", "@USER_ID", "@ToBeScheduled"},

                new Object[10] { e.Keys[0], e.NewValues["SRI"], e.NewValues["SITE"], e.NewValues["LOT"], e.NewValues["PREFECTURE"], e.NewValues["Region"], e.NewValues["INSTALLATION_DATE"], e.NewValues["COMMENTS"], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveCosTelemg_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Cos_Telemg_Delete", new string[1] { "@TT_ID" },
                               new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }



        protected void ASPxGridViewActiveCosTelemg_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;

                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("Cosmote Telemg Editor");;

        }

        protected void ASPxGridViewActiveCosTelemg_CellEditorInitialize1(object sender, ASPxGridViewEditorEventArgs e)
        {
            switch (e.Column.FieldName)
            {
                case "PREFECTURE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Cos_Sites_Lookup_Prefecture_Telemg", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Prefecture"].ToString(), mDataTable.Rows[i]["Prefecture"]);
                        }
                    }
                    break;

                case "LOT":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Cos_Telemg_Lookup_Lot", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Lot"].ToString(), mDataTable.Rows[i]["Lot"]);
                        }
                    }
                    break;

                case "SITE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Cos_Lookup_Sites_Full", null, null);
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


 
	