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
    public partial class CombinedPMs : System.Web.UI.Page
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
                   // if (Global.CustomSession["CombinedPMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewCombinedPMs.DataSource = Global.CustomSession["CombinedPMsTable"];
                    //}
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
                   // if (Global.CustomSession["CombinedPMsTable"] == null)
                    {
                        MasterDataBind();
                    }
                //    else
                //    {
                //        ASPxGridViewCombinedPMs.DataSource = Global.CustomSession["CombinedPMsTable"];
                //    }
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
            ASPxGridViewCombinedPMs.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific PM definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewCombinedPMs.DataSource = Global.ExecuteStoredProcedure("Combined_PM_Active_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["CombinedPMsTable"] = ASPxGridViewCombinedPMs.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("CombinedPMsTable");
            ASPxGridViewCombinedPMs.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewCombinedPMs.AddNewRow();
        }

 
        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_Combined_PMs", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewCombinedPMs;
            //string[] mstrs = new string[2];
            //mstrs[0] = "SRI";
            //mstrs[1] = "TT_Id";
            //object[] res = (object[])mGrid.GetRowValuesByKeyValue(e.Parameter, mstrs);
            //e.Result = res[0].ToString() + ";" + res[1].ToString() + ";" + dberror;
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
            //ASPxGridViewCombinedPMs.Columns["Attention"].Visible = !show;
            //ASPxGridViewCombinedPMs.Columns["Priority"].Visible = !show;
            //ASPxGridViewCombinedPMs.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewCombinedPMs.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewCombinedPMs.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewCombinedPMs.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
   

            if (!mRoles.Contains("SRI Combined PMs Creator"))
            {
                mItemCreateSRI.Enabled = false;
            }
            else
            {
                mItemCreateSRI.Enabled = true;
            }



        }

        protected void ASPxGridViewCombinedPMs_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
          if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }




        protected void ASPxGridViewCombinedPMs_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Combined_PMs_Update", new string[4] { "@tt_id", "@To_be_scheduled", "source", "@user_id", },
                                           new Object[4] { e.Keys[0], e.NewValues["ToBeScheduled"], e.Keys[1], Global.CustomSession["UserId"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }


        protected void ASPxGridViewCombinedPMs_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            
        }


        protected void ASPxGridViewCombinedPMs_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;
                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("Combined PMs Editor");
        }
    }
}


 
	