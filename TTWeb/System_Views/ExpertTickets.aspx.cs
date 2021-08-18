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
    public partial class ExpertTickets : System.Web.UI.Page
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
                    //if (Global.CustomSession["ExpertTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewExpertTickets.DataSource = Global.CustomSession["ExpertTicketsTable"];
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
                    //if (Global.CustomSession["ExpertTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewExpertTickets.DataSource = Global.CustomSession["ExpertTicketsTable"];
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
            ASPxGridViewExpertTickets.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewExpertTickets.DataSource = Global.ExecuteStoredProcedure("Expert_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ExpertTicketsTable"] = ASPxGridViewExpertTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ExpertTicketsTable");
            ASPxGridViewExpertTickets.DataBind();
        }

 


        protected void ASPxMenu3_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
        {
            string mName = e.Item.Name;

            HideColumns(true);

            if (mName == "xls")
            {
                ASPxGridViewExpertTickets.Columns["Last_updated_by_expert"].Visible = true;          
                ASPxGridViewExporter2.WriteXlsToResponse();
                ASPxGridViewExpertTickets.Columns["Last_updated_by_expert"].Visible = false;  
            }
            if (mName == "pdf")
            {
                ASPxGridViewExpertTickets.Columns["Last_updated_by_expert"].Visible = true;  
                ASPxGridViewExporter2.WritePdfToResponse();
                ASPxGridViewExpertTickets.Columns["Last_updated_by_expert"].Visible = false;  
            }

            HideColumns(false);
        }


        void HideColumns(bool show)
        {
            //ASPxGridViewExpertTickets.Columns["CANCELLED"].Visible = !show;
            //ASPxGridViewExpertTickets.Columns["Priority"].Visible = !show;
            //ASPxGridViewExpertTickets.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewExpertTickets.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewExpertTickets.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewExpertTickets.Columns["Response_Freeze"].Visible = !show;
        }



        protected void ASPxGridViewExpertTickets_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }




        protected void ASPxGridViewExpertTickets_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            string comp_com = (String)e.NewValues["Comment"];

            if ((Boolean)e.NewValues["Climber"]) {comp_com = comp_com + " [Climber]"; };
            
            if ((Boolean)e.NewValues["Electrician"])  { comp_com = comp_com + " [Electrician]"; };
            if ((Boolean)e.NewValues["AirCondition"]) { comp_com = comp_com + " [Air Condition]"; };
            if ((Boolean)e.NewValues["SpareParts"]) { comp_com = comp_com + " [Spare Parts]"; };
            if ((Boolean)e.NewValues["Instruments"]) { comp_com = comp_com + " [Instruments]"; };

            Global.ExecuteStoredProcedureNoResults("Expert_Comment_Update", new string[5] { "@TT_Id", "@Source", "@Comment", "@Updated_by", "@Region_Resp_Comment" },

                new Object[5] { e.Keys[0], e.Keys[1], comp_com, Global.CustomSession["UserId"], e.NewValues["Region_Resp_Comment"] });
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();

  
        }



        protected void ASPxGridViewExpertTickets_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;

                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("Expert Tickets Editor") | mRoles.Contains("Expert Tickets Region Responsible Editor");

        }



        protected void ASPxGridViewExpertTickets_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            (sender as ASPxGridView).DetailRows.CollapseAllRows();

        }

        protected void ASPxGridViewExpertTickets_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName != "Updated_on") return;

            Boolean value = (Boolean)e.GetValue("Updated");

            if (value == true)
                e.Cell.ForeColor = System.Drawing.Color.Red;
        }


        protected void Comment_Init(object sender, EventArgs e)
        {
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            ASPxMemo mM = (ASPxMemo)sender;
            mM.Enabled = mRoles.Contains("Expert Tickets Editor"); 
        }

        protected void CommentRegionResp_Init(object sender, EventArgs e)
        {
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            ASPxMemo mM = (ASPxMemo)sender;
            mM.Enabled = mRoles.Contains("Expert Tickets Region Responsible Editor");
        }

        protected void Climber_Init(object sender, EventArgs e)
        {
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            ASPxCheckBox mM = (ASPxCheckBox)sender;
            mM.Enabled = mRoles.Contains("Expert Tickets Editor"); 
        }

        protected void Electrician_Init(object sender, EventArgs e)
        {
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            ASPxCheckBox mM = (ASPxCheckBox)sender;
            mM.Enabled = mRoles.Contains("Expert Tickets Editor"); 
        }

        protected void AirCondition_Init(object sender, EventArgs e)
        {
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            ASPxCheckBox mM = (ASPxCheckBox)sender;
            mM.Enabled = mRoles.Contains("Expert Tickets Editor"); 
        }

        protected void SpareParts_Init(object sender, EventArgs e)
        {
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            ASPxCheckBox mM = (ASPxCheckBox)sender;
            mM.Enabled = mRoles.Contains("Expert Tickets Editor"); 
        }

        protected void Instruments_Init(object sender, EventArgs e)
        {
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            ASPxCheckBox mM = (ASPxCheckBox)sender;
            mM.Enabled = mRoles.Contains("Expert Tickets Editor"); 
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


 
	