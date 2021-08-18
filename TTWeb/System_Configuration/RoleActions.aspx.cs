using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Data.SqlTypes;


namespace TTWeb
{
    public partial class RoleActions : System.Web.UI.Page
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
                    ASPxGridViewRoleActions.DataSource = Global.CustomSession["RoleActionsTable"];
                }
                else
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
            }
            else if (Page.IsPostBack)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewRoleActions.DataSource = Global.CustomSession["RoleActionsTable"];
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
            ASPxGridViewRoleActions.DataSource = Global.ExecuteStoredProcedure("User_Admin_Role_Actions_List", null, null);
            Global.CustomSession["RoleActionsTable"] = ASPxGridViewRoleActions.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("RoleActionsTable");
            ASPxGridViewRoleActions.DataBind();

        }

        protected void ASPxGridViewRoleActions_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxComboBox combo = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxComboBoxRoles") as ASPxComboBox;

           
            byte[] newByte = (byte[])Global.CustomSession["mUploadedFile"];
            

            Global.ExecuteStoredProcedureNoResults("User_Admin_Role_Actions_List_Update_Insert", new string[9] { "@ROLE", "@LEVEL_NUM", "@LEVEL_NAME", "@ACTION_NUM", "@ACTION", "@URL", "@PERSISTENT", "@Hidden_ID", "@ICON" },
                new object[9] { combo.SelectedItem.Value, e.NewValues[2], e.NewValues[1], e.NewValues[4], e.NewValues[3], e.NewValues[5], e.NewValues[6] , e.Keys[0], newByte == null ? SqlBinary.Null : newByte });

            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            mUpdate = true;
            MasterDataBind();
        }


        protected void ASPxGridViewRoleActions_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxComboBox combo = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxComboBoxRoles") as ASPxComboBox;

            byte[] newByte = (byte[])Global.CustomSession["mUploadedFile"];

            Global.ExecuteStoredProcedureNoResults("User_Admin_Role_Actions_List_Update_Insert", new string[9] { "@ROLE", "@LEVEL_NUM", "@LEVEL_NAME", "@ACTION_NUM", "@ACTION", "@URL", "@PERSISTENT", "@Hidden_ID", "@ICON" },
                  new object[9] { combo.SelectedItem.Value, e.NewValues[2], e.NewValues[1], e.NewValues[4], e.NewValues[3], e.NewValues[5], 0, "", newByte == null ? SqlBinary.Null : newByte });

            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            mInsert = true;
            MasterDataBind();
        }




       

        protected void ASPxGridViewRoleActions_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if(e.RowType == GridViewRowType.EditForm) 
            {
                ASPxComboBox combo = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxComboBoxRoles") as ASPxComboBox;
                if(combo != null) 
                {
                    //DataTable table = Global.ExecuteStatement("select ROLE, ROLE_ID from USR_ROLES where VALID_FLG=1");
                    DataTable table = Global.ExecuteStoredProcedure("Edit_TT_Lookup_Roles", null,null);
                    //combo.SelectedIndex = 0;
                    combo.DataSource = table;
                    combo.ValueField = "Role";
                    combo.TextField = "Role";
                    combo.ValueType = typeof(string);
                    combo.DataBindItems();

                    //object rolevalue = ((ASPxGridView)sender).GetRowValuesByKeyValue(e.KeyValue, "Role");
                    //if (rolevalue != null)
                    //combo.Text = rolevalue.ToString();

                }

                if (((ASPxGridView)sender).IsNewRowEditing == true)
                {
                    combo.SelectedIndex = 0;
                }

                object value = ((ASPxGridView)sender).GetRowValues(e.VisibleIndex, "Persistent_Action");

                ASPxComboBox Roles = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxComboBoxRoles") as ASPxComboBox;
                ASPxTextBox URL = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxTextBoxURL") as ASPxTextBox;
                ASPxLabel PersistentLabel = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxLabelPersistent") as ASPxLabel;

                if (value != null)
                {
                    if ((bool)value == true)
                    {
                        Roles.ReadOnly = true;
                        URL.ReadOnly = true;
                        PersistentLabel.Visible = true;
                    }
                }


                //byte[] newByte = (byte[])Global.CustomSession["mUploadedFile"];
                //if (newByte == null)
                //{
                //    ASPxBinaryImage img = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxBinaryIcon") as ASPxBinaryImage;
                //    if (img != null)
                //    {
                //            Global.CustomSession["mUploadedFile"] = img.Value;
                //    }
                //}

   
            }

                                    
        }

        protected void ASPxGridViewRoleActions_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            if (mInsert)
            {
                e.Properties["cpOperation"] = "insert";
            }
            else if (mUpdate)
            {
                e.Properties["cpOperation"] = "update";
            }
            else
            {
                e.Properties["cpOperation"] ="nop";
            }
        }

        protected void ASPxGridViewRoleActions_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("User_Admin_Role_Actions_List_Delete", new string[1] { "@Hidden_ID" }, new object[1] {e.Keys[0]}  );
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            mInsert = true;
            MasterDataBind();
        }

        protected void ASPxButtonNew_Click(object sender, EventArgs e)
        {
            ASPxGridViewRoleActions.AddNewRow();
        }

        protected void ASPxGridViewRoleActions_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            e.Row.ToolTip = "";
        }



        protected void ASPxGridViewRoleActions_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == ColumnCommandButtonType.Delete)
            {
                e.Visible = CommandButtonVisibleCriteria((ASPxGridView)sender, e.VisibleIndex);
            }
        }



        private bool CommandButtonVisibleCriteria(ASPxGridView grid, int visibleIndex)
        {
            if (visibleIndex == -1) return false;

            bool persistentValue = !Convert.ToBoolean(grid.GetRowValues(visibleIndex, "Persistent_Action"));
            return persistentValue == true;
        }



                

    protected void ASPxUploadControl1_FileUploadComplete(object sender, FileUploadCompleteEventArgs e) 
    {
               e.UploadedFile.SaveAs(Server.MapPath("~/Images/UploadImages/Image.png"));

               Global.CustomSession["mUploadedFile"] = e.UploadedFile.FileBytes;
               Global.CustomSession["mUploaded"] = 1;
    }





    protected void ASPxCallbackDelete_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    {
        Global.CustomSession["mUploadedFile"] = null;
    }



    protected void ASPxGridViewRoleActions_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Global.CustomSession["mUploadedFile"] = null;
        

        ASPxBinaryImage img = (sender as ASPxGridView).FindEditFormTemplateControl("ASPxBinaryIcon") as ASPxBinaryImage;
        if (img != null)
        {
            Global.CustomSession["mUploadedFile"] = img.Value;

            if (img.ContentBytes == null)
            {
                Global.CustomSession["mUploadedFile"] = null;
            }
        }

        
    }




        
    }

}

