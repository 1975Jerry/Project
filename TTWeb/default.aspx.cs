using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;
using DevExpress.Web;
using System.Data;
using System.Data.Common;
using System.Web.Security;

namespace TTWeb
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //if (FormsAuthentication.

            if (Page.IsPostBack)
            {
                Request.Cookies.Clear();
                Response.Cookies.Clear();
            }
            else
            {
                if (Request.Cookies.Get("privateTT") != null)
                {
                    string userdata;
                    HttpCookie authCookie = HttpContext.Current.Request.Cookies["privateTT"];
                    try
                    {
                        userdata = FormsAuthentication.Decrypt(authCookie.Value).UserData;
                    }
                    catch (Exception fexc)
                    {
                        userdata = null;
                    }

                    if (userdata != null)
                    {
                        bool pass = false;
                        try
                        {
                            pass = Convert.ToBoolean(Global.CustomSession["Authenticated"]);
                        }
                        catch (Exception)
                        {
                            pass = false;
                        }
                        if (pass)
                        {
                            Response.Redirect("~/MainPage.aspx");
                        }
                    }
                    else
                    {
                        killCookie();
                        Server.Transfer("~/DeadSession.aspx");
                    }
                }
            }
        }

        private void killCookie()
        {
            try
            {
                Response.Cookies.Clear();
                HttpCookie cookieresp = new HttpCookie("privateTT");
                cookieresp.Value = null;
                cookieresp.Expires = DateTime.Now.AddDays(-365);
                Response.Cookies.Add(cookieresp);
            }
            catch (Exception ex)
            {
            }
        }

        protected void ASPxButtonLogIn_Click(object sender, EventArgs e)
        {
            DataTable mDataTable = Global.ExecuteStoredProcedure("TT_USR_VALIDATION", new string[2] { "@USERNAME", "@PASSWORD" }, new string[2] { Username.Text, Password.Text });
            int mUserId = Convert.ToInt32(mDataTable.Rows[0][0]);
            string mUserName = mDataTable.Rows[0][1].ToString();
            int mPasswordExpiration = Convert.ToInt32(mDataTable.Rows[0][2]);

            if (mUserId > -1) // user is authenticateed
            {
                Guid mId = Guid.NewGuid();
                FormsAuthenticationTicket tkt;
                string cookiestr;
                HttpCookie ck;

                /*HttpCookie mCookie = Response.Cookies["PrivateTT"];
                if (mCookie != null)
                {
                    Response.Cookies.Remove("PrivateTT");
                }*/
                tkt = new FormsAuthenticationTicket(1, mUserName, DateTime.Now, DateTime.Now.AddHours(24), true, mId.ToString(), FormsAuthentication.FormsCookiePath);
                cookiestr = FormsAuthentication.Encrypt(tkt);
                ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                ck.Path = FormsAuthentication.FormsCookiePath;
                Response.Cookies.Add(ck);
                
                /*HttpCookie mCookie = new HttpCookie("privateTT", mId.ToString());

                Request.Cookies.Add(mCookie);
                Response.Cookies["privateTT"].Value = mId.ToString();*/

                //Response.Cookies[mId.ToString()].Value = "authenticated";
                bool exceptionThrown = false;
                try
                {
                    Global.UpdateLoggedUserName(mUserName, mId.ToString());
                    Global.CustomSession.AddSession(mId.ToString());
                    Global.CustomSession["Authenticated"] = true;
                    Global.CustomSession["UserId"] = mUserId;
                    Global.CustomSession["UserName"] = mUserName;
                    Global.CustomSession["Roles"] = Global.GetUserRoles(mUserId);
                    Global.CustomSession["SessionResourceTracker"] = new TTWeb.SessionResourceTracker(mId.ToString());
                    this.Context.Items["UserName"] = mUserName;
                    //Response.Redirect("~/MainPage.aspx");
                }
                catch (Exception ex)
                {
                    exceptionThrown = true;
                }
                if (exceptionThrown)
                {
                    killCookie();
                    Server.Transfer("~/DeadSession.aspx");
                }

                if (mPasswordExpiration == 0)
                {
                    Server.Transfer("~/MainPage.aspx");
                }
                else
                {
                    Server.Transfer("~/PasswordExpiration.aspx");
                }
            }
            ASPxlabelErrorText.Text = mDataTable.Rows[0][1].ToString();
        }
    }
}