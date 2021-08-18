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
    public partial class ExpertTicketsLog : System.Web.UI.Page
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
                   // if (Global.CustomSession["ExpertTicketsLogTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewExpertTicketsLog.DataSource = Global.CustomSession["ExpertTicketsLogTable"];
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
                    //if (Global.CustomSession["ExpertTicketsLogTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewExpertTicketsLog.DataSource = Global.CustomSession["ExpertTicketsLogTable"];
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
            ASPxGridViewExpertTicketsLog.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewExpertTicketsLog.DataSource = Global.ExecuteStoredProcedure("Expert_List_Log", new string[0] { }, new Object[0] { });
            Global.CustomSession["ExpertTicketsLogTable"] = ASPxGridViewExpertTicketsLog.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ExpertTicketsLogTable");
            ASPxGridViewExpertTicketsLog.DataBind();
        }

 


        protected void ASPxMenu3_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
        {
            string mName = e.Item.Name;

            HideColumns(true);

            if (mName == "xls")
            {
                ASPxGridViewExpertTicketsLog.Columns["Last_updated_by_expert"].Visible = true;
                ASPxGridViewExporter2.WriteXlsToResponse();
                ASPxGridViewExpertTicketsLog.Columns["Last_updated_by_expert"].Visible = false;
            }
            if (mName == "pdf")
            {
                ASPxGridViewExpertTicketsLog.Columns["Last_updated_by_expert"].Visible = true;
                ASPxGridViewExporter2.WritePdfToResponse();
                ASPxGridViewExpertTicketsLog.Columns["Last_updated_by_expert"].Visible = false;
            }

            HideColumns(false);
        }


        void HideColumns(bool show)
        {
            //ASPxGridViewExpertTicketsLog.Columns["CANCELLED"].Visible = !show;
            //ASPxGridViewExpertTicketsLog.Columns["Priority"].Visible = !show;
            //ASPxGridViewExpertTicketsLog.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewExpertTicketsLog.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewExpertTicketsLog.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewExpertTicketsLog.Columns["Response_Freeze"].Visible = !show;
        }



        protected void ASPxGridViewExpertTicketsLog_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }




        protected void ASPxGridViewExpertTicketsLog_Load(object sender, EventArgs e)
        {
                //ASPxGridView mGrid = (ASPxGridView)sender;

                //List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                //mGrid.Columns[0].Visible = mRoles.Contains("Expert Tickets Editor") | mRoles.Contains("Expert Tickets Region Responsible Editor");

        }




        protected void ASPxGridViewExpertTicketsLog_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName != "Updated_on") return;

            Boolean value = (Boolean)e.GetValue("Updated");

            if (value == true)
                e.Cell.ForeColor = System.Drawing.Color.Red;
        }

        protected void ASPxGridViewExpertTicketsH_BeforePerformDataSelect(object sender, EventArgs e)
        {

            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            string[] keyValues = keyValue.ToString().Split('|');

            detailGrid.DataSource = Global.ExecuteStoredProcedure("Expert_Region_Comment_History", new string[2] { "@tt_id", "@Source" }, new Object[2] { keyValues[0], keyValues[1] });
       
        }


        




    }
}


 
	