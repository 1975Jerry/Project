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
    public partial class Vehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewVehicles.DataSource = Global.CustomSession["VehiclesTable"];
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
                    ASPxGridViewVehicles.DataSource = Global.CustomSession["VehiclesTable"];
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

            ASPxGridViewVehicles.SettingsText.ConfirmDelete = "Are you sure that you want to permanently delete the selected Vehicle and its Team associations?";

        }

        private void MasterDataBind()
        {
            ASPxGridViewVehicles.DataSource = Global.ExecuteStoredProcedure("Config_Admin_Vehicle ", new string[0] { }, new Object[0] { });
            Global.CustomSession["VehiclesTable"] = ASPxGridViewVehicles.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("VehiclesTable");
            ASPxGridViewVehicles.DataBind();
        }


        

        protected void ASPxGridViewVehicle_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_Vehicle_Delete", new string[1] { "@ID" },
                                                                  new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewVehicle_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_Vehicle_Update_Insert", new string[8] { "@VEHICLE_NUMBER", "@VEHICLE_ID", "@VEHICLE_TYPE", "@VEHICLE_4x4", "@VEHICLE_COMMENTS", "@ID", "@FUEL", "@LIT_PER_100_KM" },
                                                                  new Object[8] { e.NewValues[0], e.NewValues[1], e.NewValues[2], e.NewValues[3], e.NewValues[6], 0, e.NewValues[4], e.NewValues[5] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewVehicle_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_Vehicle_Update_Insert", new string[8] { "@VEHICLE_NUMBER", "@VEHICLE_ID", "@VEHICLE_TYPE", "@VEHICLE_4x4", "@VEHICLE_COMMENTS", "@ID", "@FUEL", "@LIT_PER_100_KM" },
                                                                 new Object[8] { e.NewValues[0], e.NewValues[1], e.NewValues[2], e.NewValues[3], e.NewValues[6], e.Keys[0], e.NewValues[4], e.NewValues[5] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }




        protected void ASPxGridViewVehicles_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        {
            
            //if (e.Expanded)
            //{
            //    ASPxGridView mGrid = sender as ASPxGridView;
            //    int index = e.VisibleIndex;
            //    String mVehicle = (String)mGrid.GetRowValues(index, new string[1] { "System_Group" });
            //    Global.CustomSession["mVehicle"] = mVehicle.ToString();
            //}
        }


        protected void ASPxGridViewVehicleTeam_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            detailGrid.DataSource = Global.ExecuteStoredProcedure("Config_Admin_Vehicle_Teams_List", new string[1] { "@V_id" }, new Object[1] { keyValue });
        }

        protected void ASPxGridViewVehicleTeam_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.Name == "Team")
            {
                ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                //DataTable mDataTable = Global.ExecuteQuery("select * from dbo.TT_PROBLEM_GROUP");
                ASPxGridView detailGrid = sender as ASPxGridView;
                object keyValue = detailGrid.GetMasterRowKeyValue();
                DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_Vehicle_Teams_Selection_List", new string[1] { "@V_id" }, new Object[1] { keyValue });
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    mCombobox.Items.Add(mDataTable.Rows[i]["Team"].ToString(), mDataTable.Rows[i]["Hidden_team_id"]);
                }
            }
        }

        protected void ASPxGridViewVehicleTeam_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
                object keyValue = detailGrid.GetMasterRowKeyValue();

            Global.ExecuteStoredProcedureNoResults("Config_Admin_Vehicle_Team_Update_Insert", new string[3] { "@Checked", "@V_ID", "@TEAM_ID" },
                                                      new Object[3] { 0, keyValue, e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewVehicleTeam_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();

            Global.ExecuteStoredProcedureNoResults("Config_Admin_Vehicle_Team_Update_Insert", new string[3] { "@Checked", "@V_ID", "@TEAM_ID" },
                                                      new Object[3] { 1, keyValue, e.NewValues[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }
    }
}