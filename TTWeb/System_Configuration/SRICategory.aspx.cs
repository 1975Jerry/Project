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
    public partial class SRICategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewSRICategory.DataSource = Global.CustomSession["SRICategoryConfigurationTable"];    
                }
                else
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
            }
            else if (Page.IsPostBack)
            {
                ASPxGridViewSRICategory.DataSource = Global.CustomSession["SRICategoryConfigurationTable"];
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

            ASPxGridViewSRICategory.SettingsText.ConfirmDelete = "Are you sure that you want to delete the specific SRI Category definition?";
        }

        private void MasterDataBind()
        {
            ASPxGridViewSRICategory.DataSource = Global.ExecuteStoredProcedure("Config_Admin_SRI_Category", new string[0] { }, new Object[0] { });
            Global.CustomSession["SRICategoryConfigurationTable"] = ASPxGridViewSRICategory.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("SRICategoryConfigurationTable");
            ASPxGridViewSRICategory.DataBind();
        }

        protected void ASPxGridViewSRICategory_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            Global.ExecuteStoredProcedureNoResults("Config_Admin_SRI_Category_Delete", new string[1] { "@ID" },
                                                                   new Object[1] { e.Keys[0]} );
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewSRICategory_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_SRI_Category_Update_Insert", new string[3] { "@SRI_CATEGORY", "@PREFIX_NUMBER", "@ID" },
                                                                   new Object[3] { e.NewValues[0], e.NewValues[1], 0 });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }

        protected void ASPxGridViewSRICategory_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_SRI_Category_Update_Insert", new string[3] { "@SRI_CATEGORY", "@PREFIX_NUMBER", "@ID" },
                                                                   new Object[3] { e.NewValues[0], e.NewValues[1], e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }


    }
}