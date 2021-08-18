using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace TTWeb
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            HttpCookie authCookie = HttpContext.Current.Request.Cookies["privateTT"];
            if (authCookie.Value != "")
            {
                Global.CustomSession.RemoveSession(FormsAuthentication.Decrypt(authCookie.Value).UserData);
            }
            Response.Cookies["privateTT"].Expires = DateTime.Today.AddDays(-1);
            Response.Redirect("~/Default.aspx");
        }
    }
}