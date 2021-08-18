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
    public partial class PasswordExpiration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
           
        }

        protected void ASPxButtonLogIn_Click(object sender, EventArgs e)
        {
            
            DataTable mDataTable = Global.ExecuteStoredProcedure("Password_Expired_Update", new string[4] { "@USER_ID", "@PASSWORD", "@PASSWORD_NEW", "@PASSWORD_VERIF" }, new string[4] { Convert.ToString(Global.CustomSession["UserId"]), PasswordOld.Text, PasswordNew.Text, PasswordNewConfirm.Text });
            int mSuccess = Convert.ToInt32(mDataTable.Rows[0][1]);
            string mInfo = mDataTable.Rows[0][0].ToString();


            if (mSuccess == 1) // password updated 
            {
                
                    Server.Transfer("~/Default.aspx");
            }
            ASPxlabelErrorText.Text = mInfo;
        }
    }
}