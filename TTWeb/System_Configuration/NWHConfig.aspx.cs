using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TTWeb
{
    public partial class NWHConfig : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!Page.IsCallback) && (!Page.IsPostBack))
            {
                MasterDataBind();
            }
        }

        private void MasterDataBind()
        {
            DataTable NWH_DataTable;

            NWH_DataTable = Global.ExecuteStoredProcedure("Config_Admin_NWH_List ", new string[0] { }, new Object[0] { });

            ASPxTextBoxFrom.Text =  NWH_DataTable.Rows[0][0].ToString();
            ASPxTextBoxTo.Text = NWH_DataTable.Rows[0][1].ToString();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            Global.ExecuteStoredProcedure("Config_Admin_NWH_Update ", new string[3] { "@From_time", "@To_time", "@Updated_by" }, new Object[3] { ASPxTextBoxFrom.Text, ASPxTextBoxTo.Text, Global.CustomSession["UserName"] });

        }

    }
}