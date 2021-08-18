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
    public partial class ProcessedTroubleTickets : System.Web.UI.Page
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
                    //if (Global.CustomSession["ProcessedTroubleTicketsTable"] == null)
                    //{
                        MasterDataBind();
                    //}
                    //else
                    //{
                    //    ASPxGridViewProcessedTroubleTickets.DataSource = Global.CustomSession["ProcessedTroubleTicketsTable"];
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
                    //if (Global.CustomSession["ProcessedTroubleTicketsTable"] == null)
                   // {
                        MasterDataBind();
                    //}
                    //else
                    //{
                    //    ASPxGridViewProcessedTroubleTickets.DataSource = Global.CustomSession["ProcessedTroubleTicketsTable"];
                    //}
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
            ASPxGridViewProcessedTroubleTickets.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewProcessedTroubleTickets.DataSource = Global.ExecuteStoredProcedure("Processed_Trouble_Tickets_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ProcessedTroubleTicketsTable"] = ASPxGridViewProcessedTroubleTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ProcessedTroubleTicketsTable");
            ASPxGridViewProcessedTroubleTickets.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewProcessedTroubleTickets.AddNewRow();
        }

 
        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_Processed_Trouble_Tickets", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewProcessedTroubleTickets;

            e.Result = mDataTable.Rows[0][0].ToString() + ";" + e.Parameter.ToString() + ";" + dberror;
            MasterDataBind();
        }



        protected void ASPxMenu3_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
        {
            ASPxGridViewProcessedTroubleTickets.DataSource = Global.CustomSession["ProcessedTroubleTicketsTable"];

            string mName = e.Item.Name;

            HideColumns(true);

            if (mName == "xls")
            { ASPxGridViewExporter3.WriteXlsToResponse(); }
            if (mName == "pdf")
            { ASPxGridViewExporter3.WritePdfToResponse(); }

            HideColumns(false);
        }


        void HideColumns(bool show)
        {
        //   ASPxGridViewProcessedTroubleTickets.Columns["Updated"].Visible = !show;
        //    //ASPxGridViewProcessedTroubleTickets.Columns["Priority"].Visible = !show;
        //    //ASPxGridViewProcessedTroubleTickets.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
        //    //ASPxGridViewProcessedTroubleTickets.Columns["Freeze_Flag"].Visible = !show;
        //    //ASPxGridViewProcessedTroubleTickets.Columns["Restore_Freeze"].Visible = !show;
        //    //ASPxGridViewProcessedTroubleTickets.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            

            if (!mRoles.Contains("SRI Processed Trouble Tickets Creator"))
            {
                mItemCreateSRI.Enabled = false;
            }
            else
            {
                mItemCreateSRI.Enabled = true;
            }



        }

        protected void ASPxGridViewProcessedTroubleTickets_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Comment") != null)
            {
                e.Row.ToolTip = e.GetValue("Comment").ToString();
            }
        }





        protected void ASPxGridViewProcessedTroubleTickets_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {


            Global.ExecuteStoredProcedureNoResults("Processed_Trouble_Tickets_Update", new string[4] { "@tt_id", "@To_be_scheduled", "@source", "@user_id" },

                new Object[4] { e.Keys[0], e.NewValues["ToBeScheduled"], e.Keys[1], Global.CustomSession["UserId"] });
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }



        protected void ASPxGridViewProcessedTroubleTickets_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;

                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("Processed Trouble Tickets Editor"); ;

        }

        protected void ASPxGridViewProcessedTroubleTickets_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName != "Updated_on") return;

            Boolean value = (Boolean)e.GetValue("Updated");

            if (value == true)
                e.Cell.ForeColor = System.Drawing.Color.Red;
        }

        protected void ASPxMenu4_ItemClick(object source, MenuItemEventArgs e)
        {

        }






    }
}


 
	