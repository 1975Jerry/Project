using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.IO;
using System.Drawing;
using System.Data;

namespace TTWeb
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookieCollection mCollection = Request.Cookies;
            if (Page.IsCallback)
            {
                
            }
            else if (Page.IsPostBack)
            {
                if (Convert.ToBoolean(Global.CustomSession["Authenticated"]) == false)
                {
                    Response.Redirect("DeadSession.aspx");
                    return;
                }
                if (ASPxMainMenu.SelectedItem != null)
                {
                    ASPxSplitter1.GetPaneByName("GridPane").ContentUrl = ASPxMainMenu.SelectedItem.NavigateUrl;
                }
            }
            else
            {
                if (Convert.ToBoolean(Global.CustomSession["Authenticated"]) == false)
                {
                    Response.Redirect("DeadSession.aspx");
                    return;
                }
                DataTable actionstable = Global.UserRoleActionsList((int)Global.CustomSession["UserId"]);
                ConstructmainMenu(actionstable);
                if (ASPxMainMenu.SelectedItem != null)
                {
                    ASPxSplitter1.GetPaneByName("GridPane").ContentUrl = ASPxMainMenu.SelectedItem.NavigateUrl;
                }
            }
        }

        private void ConstructmainMenu(DataTable aDatatable)
        {
            DataRow mRow = null;
            bool mSelected = false;
            for (int i = 0; i < aDatatable.Rows.Count; i++)
            {
                mRow = aDatatable.Rows[i];
                DevExpress.Web.MenuItem mMainMenuItem = ASPxMainMenu.Items.Find(delegate(DevExpress.Web.MenuItem c) { return c.Text == mRow[0].ToString(); });
                if (mMainMenuItem == null)
                {
                    mMainMenuItem = new DevExpress.Web.MenuItem();
                    mMainMenuItem.Name = mRow[0].ToString().Replace(" ", "");
                    mMainMenuItem.Text = mRow[0].ToString();
                    ASPxMainMenu.Items.Add(mMainMenuItem);
                }
                DevExpress.Web.MenuItem mMenuItem = null;
                string searchname = null;
                if (mRow[1].ToString().Contains("$"))
                {
                    searchname = mRow[1].ToString().Split(new char[1] { '$' })[1];
                }
                else
                {
                    searchname = mRow[1].ToString();
                }
                mMenuItem = ASPxMainMenu.Items.FindRecursive(delegate(DevExpress.Web.MenuItem c) { return c.Text == searchname; });


                if (mMenuItem == null)
                {
                    mMenuItem = new DevExpress.Web.MenuItem();
                    mMenuItem.Text = searchname;
                    //mMenuItem.Name = String.Format("{0}/{1}", mMainMenuItem.Name, mRow[1].ToString().Replace(" ", ""));
                    mMenuItem.Name = searchname;
                    if (mMenuItem.Name == "Log Out")
                    {
                        mMenuItem.Target = "_top";
                        mMenuItem.NavigateUrl = mRow[2].ToString();
                    }
                    else
                    {
                        if (mRow[1].ToString().Contains("$"))
                        {
                            string[] mdels = mRow[1].ToString().Split(new char[1] { '$' });
                            DevExpress.Web.MenuItem mMainMenuItem1 = ASPxMainMenu.Items.FindRecursive(delegate(DevExpress.Web.MenuItem c) { return c.Text == mdels[1]; });
                            if (mMainMenuItem1 != null)
                            {
                                mMenuItem.Name = mdels[1];
                                mMenuItem.Text = mdels[1];
                                mMainMenuItem1.NavigateUrl = mRow[2].ToString();
                                mMainMenuItem1.Target = ASPxSplitter1.GetPaneByName("GridPane").ContentUrlIFrameName;
                                mMainMenuItem1.Name = mdels[2];
                                mMainMenuItem1.Text = mdels[2];
                                mMenuItem.Items.Add(mMainMenuItem1);
                            }
                            else
                            {
                                mMainMenuItem1 = new DevExpress.Web.MenuItem();
                                mMainMenuItem1.NavigateUrl = mRow[2].ToString();
                                mMainMenuItem1.Target = ASPxSplitter1.GetPaneByName("GridPane").ContentUrlIFrameName;
                                mMenuItem.Name = mdels[1];
                                mMenuItem.Text = mdels[1];
                                mMainMenuItem1.Name = mdels[2];
                                mMainMenuItem1.Text = mdels[2];
                                mMenuItem.Items.Add(mMainMenuItem1);
                            }
                        }
                        else
                        {
                            mMenuItem.NavigateUrl = mRow[2].ToString();
                            mMenuItem.Target = ASPxSplitter1.GetPaneByName("GridPane").ContentUrlIFrameName;
                        }
                    }

                    if (!mSelected)
                    {
                        mSelected = true;
                        mMenuItem.Selected = true;
                    }
                    mMainMenuItem.Items.Add(mMenuItem);
                }
                else
                {
                    string[] mdels = mRow[1].ToString().Split(new char[1] { '$' });
                    DevExpress.Web.MenuItem mMainMenuItem2 = new DevExpress.Web.MenuItem();
                    mMainMenuItem2.Name = mdels[2];
                    mMainMenuItem2.Text = mdels[2];
                    mMainMenuItem2.NavigateUrl = mRow[2].ToString();
                    mMainMenuItem2.Target = ASPxSplitter1.GetPaneByName("GridPane").ContentUrlIFrameName;
                    mMenuItem.Items.Add(mMainMenuItem2);
                }
            }
        }

        /*
        private void ConstructNavBar(DataTable aDatatable)
        {
            ASPxNavBar mASPxNavBar = ASPxNavBarMain;
            DataRow mRow = null;
            bool mSelected = false;
            for (int i = 0; i < aDatatable.Rows.Count; i++)
            {
                mRow = aDatatable.Rows[i];
                NavBarGroup mNavBarGroup = ASPxNavBarMain.Groups.FindByText(mRow[0].ToString());
                if (mNavBarGroup == null)
                {
                    mNavBarGroup = new NavBarGroup();
                    mNavBarGroup.Name = mRow[0].ToString().Replace(" ", "");
                    mNavBarGroup.Text = mRow[0].ToString();
                    ASPxNavBarMain.Groups.Add(mNavBarGroup);
                }
                NavBarItem mNavBaritem = mNavBarGroup.Items.FindByText(mRow[1].ToString());
                if (mNavBaritem == null)
                {
                    mNavBaritem = new NavBarItem();
                    mNavBaritem.Text = mRow[1].ToString();
                    mNavBaritem.Name = String.Format("{0}/{1}", mNavBarGroup.Name, mRow[1].ToString().Replace(" ", ""));
                    if (mNavBaritem.Name == "Actions/LogOut")
                    {
                        mNavBaritem.Target = "_parent";
                    }
                    mNavBaritem.NavigateUrl = mRow[2].ToString();
                    if (!mSelected)
                    {
                        mSelected = true;
                        mNavBaritem.Selected = true;
                    }
                    mNavBarGroup.Items.Add(mNavBaritem);
                }
            }
        }*/

        /*
        private void UpdateMasterPage()
        {
            ASPxLabel mlabel = ASPxLabelUserName;
            mlabel.Text = "User Name: " + Session["UserName"].ToString();
            mlabel = ASPxLabelRoles;
            List<String> mRoles = (List<string>)Session["Roles"];
            string mText = null;
            for (int i = 0; i < (mRoles.Count); i++)
            {
                if (i < mRoles.Count - 1)
                {
                    mText += mRoles[i].ToString() + "/";
                }
                else mText += mRoles[i].ToString();

            }
            mlabel.Text = "Roles: " + mText;
        }
        */

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            //ASPxSplitter mSplitter = (ASPxSplitter)this.ContentPlaceHolder1.FindControl("ASPxSplitter1");
            //ASPxSplitter mSplitter = ASPxSplitter1;
            //mSplitter.GetPaneByName("GridPane").ContentUrl = "InitiateTT.aspx";
            //ASPxNavBarMain.SelectedItem = ASPxNavBarMain.Items.FindByText("Initiate TT");
        }

        protected void ASPxCallback1_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string[] mdel = e.Parameter.Split(new char[1] {'/'});
            Global.UpdateLoggedUserName(mdel[0], mdel[1]);
        }

        protected void ASPxMainMenu_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e)
        {
            e.Properties["cpUserName"] = String.Format("{0}/{1}", Global.CustomSession["UserName"], Global.CustomSession.SessionID);
        }


    }
}