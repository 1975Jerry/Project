using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TTWeb
{
    public partial class LoggedUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsCallback)
            {
                MasterDataBind();
            }
            else if (Page.IsPostBack)
            {
                MasterDataBind();
            }
            else
            {
                MasterDataBind();
            }
        }
        private void MasterDataBind()
        {
            ASPxGridViewLoggedUsers.DataSource = Global.GetCurrentUsers();
            ASPxGridViewLoggedUsers.DataBind();

        }
    }
}