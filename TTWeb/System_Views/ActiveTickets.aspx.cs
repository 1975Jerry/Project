﻿using System;
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
    public partial class ActiveTickets : System.Web.UI.Page
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
                    //if (Global.CustomSession["ActiveTicketsTable"] == null)
                    {
                        MasterDataBind();                     
                    }
                    //else
                    //{
                    //    ASPxGridViewActiveTickets.DataSource = Global.CustomSession["ActiveTicketsTable"];
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
                    //if (Global.CustomSession["ActiveTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewActiveTickets.DataSource = Global.CustomSession["ActiveTicketsTable"];
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
            ASPxGridViewActiveTickets.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Head Office definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewActiveTickets.DataSource = Global.ExecuteStoredProcedure("ActiveTickets_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActiveTicketsTable"] = ASPxGridViewActiveTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActiveTicketsTable");
            ASPxGridViewActiveTickets.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewActiveTickets.AddNewRow();
        }

        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewActiveTickets;
            //string[] mstrs = new string[2];
            //mstrs[0] = "SRI";
            //mstrs[1] = "TT_Id";
            //object[] res = (object[])mGrid.GetRowValuesByKeyValue(e.Parameter, mstrs);
            //e.Result = res[0].ToString() + ";" + res[1].ToString() + ";" + dberror;
            e.Result = mDataTable.Rows[0][0].ToString() + ";" + e.Parameter.ToString() + ";" + dberror;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveTickets_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            if (e.Expanded)
            {
                object TTID = mGrid.GetDataRow(e.VisibleIndex)["TT_Id"];
                Global.CustomSession["Ticket_ID"] = TTID;
                Global.CustomSession["ExpandedTicket"] = true;
            }
            else
            {
                Global.CustomSession.Remove("ExpandedTicket");
            }
        }

        protected void ASPxGridViewActiveTickets_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.Name == "Priority")
            {
                e.Cell.ToolTip =  e.CellValue.ToString();
            }
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
            ASPxGridViewActiveTickets.Columns["Attention"].Visible = !show;
            ASPxGridViewActiveTickets.Columns["Priority"].Visible = !show;
            ASPxGridViewActiveTickets.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            ASPxGridViewActiveTickets.Columns["Freeze_Flag"].Visible = !show;
            ASPxGridViewActiveTickets.Columns["Restore_Freeze"].Visible = !show;
            ASPxGridViewActiveTickets.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            if (!mRoles.Contains("SRI Creator"))
            {
                mASPxMenu.Enabled = false;
            }
            else
            {
                mASPxMenu.Enabled = true;
            }
        }

        protected void ASPxGridViewActiveTickets_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            Global.ExecuteStoredProcedureNoResults("Tickets_ToBeScheduled_Update", new string[4] { "@tt_id", "@user_id", "@ToBeScheduled", "@Location"},
                                           new Object[4] { e.Keys[0], Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"], e.NewValues["Location"]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveTickets_Load(object sender, EventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            mGrid.Columns[0].Visible = mRoles.Contains("TT Editor");
        }

        protected void ASPxGridViewActiveTickets_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

            switch (e.Column.FieldName)
            {

                case "Location":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Nodes_Lookup_Sites", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["SITE"].ToString(), mDataTable.Rows[i]["SITE"]);
                        }
                    }

                    break;

            }
         }

        protected void ASPxGridViewActiveTickets_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

    }
}