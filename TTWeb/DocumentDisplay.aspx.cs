using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TTWeb
{
    public partial class DocumentDisplay : System.Web.UI.Page
    {
        private string m_Rid;
        protected void Page_Load(object sender, EventArgs e)
        {
            m_Rid = Request.QueryString["rid"];
            /*if (Session["UserId"] == null)
            {
                Response.Redirect("~/Registration.aspx");
            }
            bool found = false;
            //if (Session["Admin"] == null)
            {
                string mCmdText = String.Format("select ID from TT_ATTACHMENTS where USER_ID={0}", Session["UserId"]);
                DataTable mdataTable = Global.ExecuteQuery(mCmdText);
                for (int i = 0; i < mdataTable.Rows.Count; i++)
                {
                    if (m_Rid == mdataTable.Rows[i][0].ToString())
                    {
                        found = true;
                        break;
                    }
                }
            }
            //else found = true;
            if (found)*/
            {
                MasterDataBind();
            }
            /*else
            {
                Response.Redirect("~/Default.aspx");
            }*/
        }

        private void MasterDataBind()
        {
            string mCmdText = String.Format("select NAME_OF,ATTACHMENT from TT_ATTACHMENTS where ID={0}", m_Rid);
            DataTable mdataTable = Global.ExecuteQuery(mCmdText);
            string mFilename = mdataTable.Rows[0][0].ToString();
            string mFileType = mFilename.Substring(mFilename.LastIndexOf(".") + 1);
            switch (mFileType.ToLower())
            {
                case "xls":
                    Response.ClearContent(); 
                    Response.ClearHeaders(); 
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.BinaryWrite((byte[])mdataTable.Rows[0][1]);
                    Response.End();
                    break;
                case "pdf":
                    Response.ClearContent(); 
                    Response.ClearHeaders(); 
                    Response.ContentType = "application/pdf";
                    Response.BinaryWrite((byte[])mdataTable.Rows[0][1]);
                    Response.End();
                    break;
                case "doc":
                    Response.ClearContent(); 
                    Response.ClearHeaders(); 
                    Response.ContentType = "application/msword";
                    Response.BinaryWrite((byte[])mdataTable.Rows[0][1]);
                    Response.End();
                    break;
                case "gif":
                    Response.ClearContent(); 
                    Response.ClearHeaders(); 
                    Response.ContentType = "image/gif";
                    Response.BinaryWrite((byte[])mdataTable.Rows[0][1]);
                    Response.End();
                    break;
                case "jpeg":
                    Response.ClearContent(); 
                    Response.ClearHeaders(); 
                    Response.ContentType = "image/jpeg";
                    Response.BinaryWrite((byte[])mdataTable.Rows[0][1]);
                    Response.End();
                    break;
                case "jpg":
                    Response.ClearContent(); 
                    Response.ClearHeaders();
                    Response.ContentType = "image/jpeg";
                    Response.BinaryWrite((byte[])mdataTable.Rows[0][1]);
                    Response.End();
                    break;
                case "bmp":
                    Response.ClearContent(); 
                    Response.ClearHeaders(); 
                    Response.ContentType = "image/x-xbitmap";
                    Response.BinaryWrite((byte[])mdataTable.Rows[0][1]);
                    Response.End();
                    break;
                case "txt":
                    Response.ClearContent(); 
                    Response.ClearHeaders(); 
                    Response.ContentType = "text/plain";
                    Response.BinaryWrite((byte[])mdataTable.Rows[0][1]);
                    Response.End();
                    break;
                case "tiff":
                    Response.ClearContent(); 
                    Response.ClearHeaders(); 
                    Response.ContentType = "image/tiff";
                    Response.BinaryWrite((byte[])mdataTable.Rows[0][1]);
                    Response.End();
                    break;
                case "tif":
                    Response.ClearContent(); 
                    Response.ClearHeaders(); 
                    Response.ContentType = "image/tiff";
                    Response.BinaryWrite((byte[])mdataTable.Rows[0][1]);
                    Response.End();
                    break;
                default:
                    Response.ClearContent(); 
                    Response.ClearHeaders(); 
                    Response.Write(String.Format("File Type {0} is not supported", mFileType));
                    Response.End();
                    break;
                case "zip":
                    Response.ClearContent();
                    Response.ClearHeaders();
                    HttpContext.Current.Response.AddHeader("Content-Disposition", "inline; filename=" + mFilename);
                    HttpContext.Current.Response.ContentType = "application/zip";
                    Response.BinaryWrite((byte[])mdataTable.Rows[0][1]);
                    Response.End();
                    break;
            }
        }
    }
}