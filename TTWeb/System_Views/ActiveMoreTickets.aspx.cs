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
    public partial class ActiveMoreTickets : System.Web.UI.Page
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
                    //if (Global.CustomSession["ActiveMoreTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewActiveMoreTickets.DataSource = Global.CustomSession["ActiveMoreTicketsTable"];
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
                    //if (Global.CustomSession["ActiveMoreTicketsTable"] == null)
                    {
                        MasterDataBind();
                    }
                    //else
                    //{
                    //    ASPxGridViewActiveMoreTickets.DataSource = Global.CustomSession["ActiveMoreTicketsTable"];
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
            ASPxGridViewActiveMoreTickets.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific Ticket definition?";
        
        

        }

        private void MasterDataBind()
        {
            ASPxGridViewActiveMoreTickets.DataSource = Global.ExecuteStoredProcedure("MORE_Tickets_Active_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["ActiveMoreTicketsTable"] = ASPxGridViewActiveMoreTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ActiveMoreTicketsTable");
            ASPxGridViewActiveMoreTickets.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewActiveMoreTickets.AddNewRow();
        }

 
        protected void ASPxCallbackSRI_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string dberror = "no";
            DataTable mDataTable = new DataTable();
            try
            {
                mDataTable = Global.ExecuteStoredProcedure("SRI_Number_Generaror_MORE_TICKET", new string[1] { "@TT_Id" }, new Object[1] { e.Parameter });
            }

            catch (System.Data.SqlClient.SqlException er)
            {
                dberror = er.Message;
            }

            ASPxGridView mGrid = ASPxGridViewActiveMoreTickets;

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
            //ASPxGridViewActiveMoreTickets.Columns["CANCELLED"].Visible = !show;
            //ASPxGridViewActiveMoreTickets.Columns["Priority"].Visible = !show;
            //ASPxGridViewActiveMoreTickets.Columns["Kintec_Rejection_Status_Flag"].Visible = !show;
            //ASPxGridViewActiveMoreTickets.Columns["Freeze_Flag"].Visible = !show;
            //ASPxGridViewActiveMoreTickets.Columns["Restore_Freeze"].Visible = !show;
            //ASPxGridViewActiveMoreTickets.Columns["Response_Freeze"].Visible = !show;
        }

        protected void ASPxMenuAttachment_Load(object sender, EventArgs e)
        {
            ASPxMenu mASPxMenu = (ASPxMenu)sender;
            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            DevExpress.Web.MenuItem mItemCreateSRI = mASPxMenu.Items.FindByName("CreateSRI");
            DevExpress.Web.MenuItem mItemAddSuppl = mASPxMenu.Items.FindByName("AddSuppl");

            if (!mRoles.Contains("SRI More Tickets Creator"))
            {
                mItemCreateSRI.Enabled = false;
            }
            else
            {
                mItemCreateSRI.Enabled = true;
            }

            if (!mRoles.Contains("More Tickets Editor"))
            {
                mItemAddSuppl.Enabled = false;
            }
            else
            {
                mItemAddSuppl.Enabled = true;
            }


        }

        protected void ASPxGridViewActiveMoreTickets_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }


        protected void ASPxGridViewActiveMoreTickets_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("MORE_Ticket_Insert_Update", new string[12] { "@MORE_TICKET_ID", "@SRI", "@SITE", "@STATUS", "@SEVERITY", "@Region", "@PROBLEM", "@EVENT_DATE", "@SOLVED_DATE", "@TYPE","@USER_ID", "@ToBeScheduled" },

                new Object[12] { System.DBNull.Value, e.NewValues["SRI"], e.NewValues["SITE"], e.NewValues["STATUS"], e.NewValues["SEVERITY"], e.NewValues["Region"], e.NewValues["PROBLEM"], e.NewValues["EVENT_DATE"], e.NewValues["SOLVED_DATE"], Global.CustomSession["TypeComboSelection"].ToString(), Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }





        protected void ASPxGridViewActiveMoreTickets_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {


            Global.ExecuteStoredProcedureNoResults("MORE_Ticket_Insert_Update", new string[12] { "@MORE_TICKET_ID", "@SRI", "@SITE", "@STATUS", "@SEVERITY", "@Region", "@PROBLEM", "@EVENT_DATE", "@SOLVED_DATE", "TYPE", "@USER_ID", "@ToBeScheduled" },

                new Object[12] { e.Keys[0], e.NewValues["SRI"], e.NewValues["SITE"], e.NewValues["STATUS"], e.NewValues["SEVERITY"], e.NewValues["Region"], e.NewValues["PROBLEM"], e.NewValues["EVENT_DATE"], e.NewValues["SOLVED_DATE"], Global.CustomSession["TypeComboSelection"].ToString(), Global.CustomSession["UserId"], e.NewValues["ToBeScheduled"] });
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewActiveMoreTickets_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("MORE_Tickets_Delete", new string[1] { "@TT_ID" },
                               new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }


        protected void ASPxGridViewActiveMoreTickets_Load(object sender, EventArgs e)
        {
                ASPxGridView mGrid = (ASPxGridView)sender;

                List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
                mGrid.Columns[0].Visible = mRoles.Contains("More Tickets Editor");;

        }

        protected void ASPxGridViewActiveMoreTickets_CellEditorInitialize1(object sender, ASPxGridViewEditorEventArgs e)
        {

            // PREPEI NA PERNEI TO TYPE KAI NA TO PERNAEI STA LOOKUPS

            ASPxGridView grid = sender as ASPxGridView;
        

            switch (e.Column.FieldName)
            {
                case "STATUS":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("MORE_Ticket_Lookup_Status", new string[1] { "@Type" },
                               new Object[1] { Global.CustomSession["TypeComboSelection"].ToString() });
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["STATUS"].ToString(), mDataTable.Rows[i]["STATUS"]);
                        }
                    }
                    break;

                case "SEVERITY":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("MORE_Ticket_Lookup_Severity", new string[1] { "@Type" },
                               new Object[1] { Global.CustomSession["TypeComboSelection"].ToString() });
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["SEVERITY"].ToString(), mDataTable.Rows[i]["SEVERITY"]);
                        }
                    }
                    break;

                case "SITE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("More_Ticket_Lookup_Site", new string[1] { "@Type" },
                               new Object[1] { Global.CustomSession["TypeComboSelection"].ToString() });
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Site"].ToString(), mDataTable.Rows[i]["Site"]);
                        }
                    }
                    break;

                case "PROBLEM":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("MORE_Ticket_Lookup_Problem", new string[1] { "@Type" },
                               new Object[1] { Global.CustomSession["TypeComboSelection"].ToString() });
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["PROBLEM"].ToString(), mDataTable.Rows[i]["PROBLEM"]);
                        }
                    }
                    break;

                case "TYPE":
                    {

                        ASPxTextBox mTextbox = (ASPxTextBox)e.Editor;

                        if (grid.IsNewRowEditing)
                        {
                            mTextbox.Text = Global.CustomSession["TypeComboSelection"].ToString();
                        }
                        else
                        {
                            Global.CustomSession["TypeComboSelection"] = e.Value.ToString();
                            TypeCombo.Value = e.Value.ToString();
                            TypeCombo.Text = e.Value.ToString();

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

        protected void ASPxComboBoxType_Init(object sender, EventArgs e)
        {
            
            ASPxComboBox mCombobox = (ASPxComboBox)sender;
            DataTable mDataTable = Global.ExecuteStoredProcedure("MORE_Ticket_Lookup_Type", null, null);
            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                mCombobox.Items.Add(mDataTable.Rows[i]["Type"].ToString(), mDataTable.Rows[i]["Type"]);
            }

        }

        protected void TypeCombo_SelectedIndexChanged(object sender, EventArgs e)
        {
            Global.CustomSession["TypeComboSelection"] = TypeCombo.Value;
        }

        
    }
}


 
	