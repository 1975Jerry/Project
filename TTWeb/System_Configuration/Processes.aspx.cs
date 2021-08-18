using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;

namespace TTWeb
{
    public partial class Processes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewProcesses.DataSource = Global.CustomSession["ProcessesTable"];
                }
                else
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
            }
            else if (Page.IsPostBack)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewProcesses.DataSource = Global.CustomSession["ProcessesTable"];
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
        }

        private void MasterDataBind()
        {
            ASPxGridViewProcesses.DataSource = Global.ExecuteStoredProcedure("Config_Admin_Process_List_All ", new string[0] { }, new Object[0] { });
            Global.CustomSession["ProcessesTable"] = ASPxGridViewProcesses.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ProcessesTable");
            ASPxGridViewProcesses.DataBind();
        }

                        
        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewProcesses.AddNewRow();
        }

        protected void ASPxGridViewProcesses_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_Process_Delete", new string[1] { "@Hidden_Process_ID" }, new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewProcesses_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_Process_Update_Insert", new string[4] { "@PROCESS", "@VALID_FLG", "@INITIATE_PROCESS", "@Hidden_Process_ID" },
                                                                  new Object[4] { e.NewValues[0], e.NewValues[2], e.NewValues[3], null });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewProcesses_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_Process_Update_Insert", new string[4] { "@PROCESS", "@VALID_FLG", "@INITIATE_PROCESS", "@Hidden_Process_ID" },
                                                                 new Object[4] { e.NewValues[0], e.NewValues[2], e.NewValues[3], e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewProcesses_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.Name == "Update_date")
            {
                e.Editor.Value = DateTime.Now;
            }
        }        
    }
}