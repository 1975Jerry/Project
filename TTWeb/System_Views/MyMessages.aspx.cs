using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web;


namespace TTWeb
{
    public partial class MyMessages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    string mCallbackId = (string)Request.Params["__CALLBACKID"];
                    string[] mdel = mCallbackId.Split(new char[1] { '$' });

                    if (mdel[mdel.Length - 1].EndsWith("ASPxGridViewMyMessages"))
                    {
                        ((SessionResourceTracker)mSessionResourceTracker).CleanupSessionObjects();
                        MasterDataBind();
                    }
                }
                else
                {
                    DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/DeadSession.aspx");
                    return;
                }
            }
            else if (Page.IsPostBack)
            {
                if (mSessionResourceTracker == null)
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
                MasterDataBind();
            }
            else
            {
                if (mSessionResourceTracker == null)
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
                ((SessionResourceTracker)mSessionResourceTracker).CleanupSessionObjects();
                //Global.UpdateTitle(ASPxRoundPanel1);
                MasterDataBind();
            }
        }

        private void MasterDataBind()
        {
            ASPxGridViewMyMessages.DataSource = Global.ExecuteStoredProcedure("View_Messages_Last_7_days", new string[1] { "@USER_ID" }, new Object[1] { Global.CustomSession["UserId"] });
            Global.CustomSession["MyMessagesTable"] = ASPxGridViewMyMessages.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("MyMessagesTable");
            ASPxGridViewMyMessages.DataBind();
        }
    }
}