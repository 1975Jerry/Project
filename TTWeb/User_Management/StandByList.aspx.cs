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
    public partial class StandByList : System.Web.UI.Page
    {
        private bool mUpdate = false;
        private bool mInsert = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewStandByList.DataSource = Global.CustomSession["StandByListTable"];
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
                    ASPxGridViewStandByList.DataSource = Global.CustomSession["StandByListTable"];
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
            ASPxGridViewStandByList.DataSource = Global.ExecuteStoredProcedure("User_Stand_By_List", null, null);
            Global.CustomSession["StandByListTable"] = ASPxGridViewStandByList.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("StandByListTable");
            ASPxGridViewStandByList.DataBind();
        }

        protected void ASPxGridViewStandByList_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            /*if ((int)e.EditingKeyValue == 32)
            {
                e.Cancel = true;
            }*/
        }

        protected void ASPxGridViewStandByList_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            e.Row.ToolTip = "";
        }
    }
}