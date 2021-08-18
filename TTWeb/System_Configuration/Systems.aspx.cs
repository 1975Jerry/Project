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
    public partial class Systems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            if (Page.IsCallback)
            {
                if (mSessionResourceTracker != null)
                {
                    ASPxGridViewSystems.DataSource = Global.CustomSession["SystemsTable"];
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
                    ASPxGridViewSystems.DataSource = Global.CustomSession["SystemsTable"];
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

            ASPxGridViewSystems.SettingsText.ConfirmDelete = "Delete Configuration Item and associated CI's Relations?";
            
        }

        private void MasterDataBind()
        {
            ASPxGridViewSystems.DataSource = Global.ExecuteStoredProcedure("Config_Admin_TT_System_List", new string[0] { }, new Object[0] { });
            Global.CustomSession["SystemsTable"] = ASPxGridViewSystems.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("SystemsTable");
            ASPxGridViewSystems.DataBind();
        }



        protected void ASPxGridViewSystems_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_List_Delete", new string[1] { "@ID" },
                                                                  new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }


        protected void ASPxGridViewSystems_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            ASPxPageControl mASPxPageControl = mGrid.FindEditFormTemplateControl("ASPxPageControlSystems") as ASPxPageControl;

            ASPxTextBox mTextBoxLatDeg = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLatDeg");
            ASPxTextBox mTextBoxLatMin = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLatMin");
            ASPxTextBox mTextBoxLatSec = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLatSec");

            ASPxTextBox mTextBoxLonDeg = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLonDeg");
            ASPxTextBox mTextBoxLonMin = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLonMin");
            ASPxTextBox mTextBoxLonSec = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLonSec");

            decimal? mLatitude;
            decimal? mLongitude;
            if (mTextBoxLatDeg.Text == "" || mTextBoxLonDeg.Text == "")
            {
                mLatitude = null;
                mLongitude = null;
            }
            else
            {
                if (mTextBoxLatMin.Text == "") { mTextBoxLatMin.Text = "0"; };
                if (mTextBoxLatSec.Text.Trim() == ",") { mTextBoxLatSec.Text = "00,00"; };
                if (mTextBoxLonMin.Text == "") { mTextBoxLonMin.Text = "0"; };
                if (mTextBoxLonSec.Text.Trim() == ",") { mTextBoxLonSec.Text = "00,00"; };

                mLatitude = Convert.ToDecimal(mTextBoxLatDeg.Text) + Convert.ToDecimal(mTextBoxLatMin.Text) / 60 + Convert.ToDecimal(mTextBoxLatSec.Text) / 3600;
                mLongitude = Convert.ToDecimal(mTextBoxLonDeg.Text) + Convert.ToDecimal(mTextBoxLonMin.Text) / 60 + Convert.ToDecimal(mTextBoxLonSec.Text) / 3600;
            }

            
            ASPxTextBox mASPxTextBoxSystem = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxSystem");
            ASPxTextBox mASPxTextBoxSystemInfo = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxSystemInfo");
 
            ASPxComboBox mASPxComboBoxSystemGroup1 = (ASPxComboBox)mASPxPageControl.FindControl("ASPxComboBoxSystemGroup");
            String mASPxComboBoxSystemGroup = (String)mASPxComboBoxSystemGroup1.Value;

            ASPxComboBox mASPxComboBoxSystemArea1 = (ASPxComboBox)mASPxPageControl.FindControl("ASPxComboBoxSystemArea");
            String mASPxComboBoxSystemArea = (String)mASPxComboBoxSystemArea1.Value;

            ASPxDropDownEdit mASPxDropDownEditProcess2 = (ASPxDropDownEdit)mASPxPageControl.FindControl("ASPxDropDownEditProcess");
            String mASPxDropDownEditProcess = (String)mASPxDropDownEditProcess2.Value;

            ASPxTextBox mmASPxTextBoxHidden_id = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxHidden_id");
            

            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_List_Update_Insert", new string[8] { "@SYSTEM", "@SYSTEM_INFO", "@SYSTEM_AREA", "@SYSTEM_GROUP", "@LATITUDE", "@LONGITUDE", "PROCESS", "@ID" },
            new Object[8] { mASPxTextBoxSystem.Text, mASPxTextBoxSystemInfo.Text, mASPxComboBoxSystemArea, mASPxComboBoxSystemGroup, mLatitude, mLongitude, mASPxDropDownEditProcess, mmASPxTextBoxHidden_id.Text });
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }





        protected void ASPxGridViewSystems_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            ASPxGridView mGrid = (ASPxGridView)sender;
            ASPxPageControl mASPxPageControl = mGrid.FindEditFormTemplateControl("ASPxPageControlSystems") as ASPxPageControl;
            
            ASPxTextBox mTextBoxLatDeg = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLatDeg");
            ASPxTextBox mTextBoxLatMin = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLatMin");
            ASPxTextBox mTextBoxLatSec = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLatSec");

            ASPxTextBox mTextBoxLonDeg = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLonDeg");
            ASPxTextBox mTextBoxLonMin = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLonMin");
            ASPxTextBox mTextBoxLonSec = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLonSec");

            decimal? mLatitude;
            decimal? mLongitude;
            if (mTextBoxLatDeg.Text == "" || mTextBoxLonDeg.Text == "")
            {
                mLatitude = null;
                mLongitude = null;
            }
            else
            {
                if (mTextBoxLatMin.Text == "") { mTextBoxLatMin.Text = "0"; };
                if (mTextBoxLatSec.Text.Trim() == ",") { mTextBoxLatSec.Text = "00,00"; };
                if (mTextBoxLonMin.Text == "") { mTextBoxLonMin.Text = "0"; };
                if (mTextBoxLonSec.Text.Trim() == ",") { mTextBoxLonSec.Text = "00,00"; };

                mLatitude = Convert.ToDecimal(mTextBoxLatDeg.Text) + Convert.ToDecimal(mTextBoxLatMin.Text) / 60 + Convert.ToDecimal(mTextBoxLatSec.Text) / 3600;
                mLongitude = Convert.ToDecimal(mTextBoxLonDeg.Text) + Convert.ToDecimal(mTextBoxLonMin.Text) / 60 + Convert.ToDecimal(mTextBoxLonSec.Text) / 3600;
            }


            ASPxTextBox mASPxTextBoxSystem = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxSystem");
            ASPxTextBox mASPxTextBoxSystemInfo = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxSystemInfo");

            ASPxComboBox mASPxComboBoxSystemGroup1 = (ASPxComboBox)mASPxPageControl.FindControl("ASPxComboBoxSystemGroup");
            String mASPxComboBoxSystemGroup = (String)mASPxComboBoxSystemGroup1.Value;

            ASPxComboBox mASPxComboBoxSystemArea1 = (ASPxComboBox)mASPxPageControl.FindControl("ASPxComboBoxSystemArea");
            String mASPxComboBoxSystemArea = (String)mASPxComboBoxSystemArea1.Value;

            ASPxDropDownEdit mASPxDropDownEditProcess2 = (ASPxDropDownEdit)mASPxPageControl.FindControl("ASPxDropDownEditProcess");
            String mASPxDropDownEditProcess = (String)mASPxDropDownEditProcess2.Value;

            ASPxTextBox mmASPxTextBoxHidden_id = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxHidden_id");


            Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_List_Update_Insert", new string[8] { "@SYSTEM", "@SYSTEM_INFO", "@SYSTEM_AREA", "@SYSTEM_GROUP", "@LATITUDE", "@LONGITUDE", "PROCESS", "@ID" },
            new Object[8] { mASPxTextBoxSystem.Text, mASPxTextBoxSystemInfo.Text, mASPxComboBoxSystemArea, mASPxComboBoxSystemGroup, mLatitude, mLongitude, mASPxDropDownEditProcess, mmASPxTextBoxHidden_id.Text });
            
            
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            MasterDataBind();
        }



        

        protected void ASPxGridViewSystems_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.ToString() == "Longitude" && e.CellValue.ToString() != "")
            {
                string mLongitude = e.CellValue.ToString();
                string[] mdel = mLongitude.Replace(",", ".").Split(new char[1] { '.' });

                int mDegrees = Convert.ToInt32(mdel[0]);
                decimal remainder = (decimal)(Convert.ToDecimal(mdel[1]) / Convert.ToDecimal((Math.Pow(10, mdel[1].Length))));
                decimal mMinutes = remainder * 60;

                string[] mdel1 = mMinutes.ToString().Replace(",", ".").Split(new char[1] { '.' });
                decimal remainder1 = (decimal)(Convert.ToDecimal(mdel1[1]) / Convert.ToDecimal((Math.Pow(10, mdel1[1].Length))));
                decimal mSeconds = Math.Round((remainder1 * 60), 2);
                e.Cell.Text = String.Format("{0}° {1}' {2}\"", mDegrees, Math.Floor(Math.Abs(mMinutes)), mSeconds);

            }
            if (e.DataColumn.ToString() == "Latitude" && e.CellValue.ToString() != "")
            {
                string mLatitude = e.CellValue.ToString();
                string[] mdel = mLatitude.Replace(",", ".").Split(new char[1] { '.' });

                int mDegrees = Convert.ToInt32(mdel[0]);
                decimal remainder = (decimal)(Convert.ToDecimal(mdel[1]) / Convert.ToDecimal((Math.Pow(10, mdel[1].Length))));
                decimal mMinutes = remainder * 60;

                string[] mdel1 = mMinutes.ToString().Replace(",", ".").Split(new char[1] { '.' });
                decimal remainder1 = (decimal)(Convert.ToDecimal(mdel1[1]) / Convert.ToDecimal((Math.Pow(10, mdel1[1].Length))));
                decimal mSeconds = Math.Round((remainder1 * 60), 2);
                e.Cell.Text = String.Format("{0}° {1}' {2}\"", mDegrees, Math.Floor(Math.Abs(mMinutes)), mSeconds);
            }
        }


       


        protected void ASPxGridViewSystems_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        {

            Global.CustomSession["DetailRowID"] = e.VisibleIndex;
            Global.CustomSession["SystemNewRow"] = 0;

            ASPxGridView mGrid = (ASPxGridView)sender;
            mGrid.CancelEdit();


            if (e.Expanded)
            {
                ASPxPageControl mASPxPageControl = mGrid.FindDetailRowTemplateControl(e.VisibleIndex, "ASPxPageControlSystems") as ASPxPageControl;


                mGrid.DataSource = Global.CustomSession["SystemsTable"];

                ASPxTextBox mTextBoxLatDeg = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLatDeg");
                ASPxTextBox mTextBoxLatMin = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLatMin");
                ASPxTextBox mTextBoxLatSec = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLatSec");

                ASPxTextBox mTextBoxLonDeg = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLonDeg");
                ASPxTextBox mTextBoxLonMin = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLonMin");
                ASPxTextBox mTextBoxLonSec = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLonSec");
                ASPxDropDownEdit mDropDownEdit = (ASPxDropDownEdit)mASPxPageControl.FindControl("ASPxDropDownEditProcess");

                int index = e.VisibleIndex;
                object[] mData = (object[])mGrid.GetRowValues(index, new string[2] { "Latitude", "Longitude" });

                if (mData.Length == 2 && mData[0] != System.DBNull.Value && mData[0] != null)
                {
                    string mLongitude = mData[1].ToString();
                    string[] mdel = mLongitude.Replace(",", ".").Split(new char[1] { '.' });

                    int mDegrees = Convert.ToInt32(mdel[0]);
                    decimal remainder = (decimal)(Convert.ToDecimal(mdel[1]) / Convert.ToDecimal((Math.Pow(10, mdel[1].Length))));
                    decimal mMinutes = remainder * 60;


                    string[] mdel1 = mMinutes.ToString().Replace(",", ".").Split(new char[1] { '.' });
                    decimal remainder1 = (decimal)(Convert.ToDecimal(mdel1[1]) / Convert.ToDecimal((Math.Pow(10, mdel1[1].Length))));
                    decimal mSeconds = Math.Round((remainder1 * 60), 2);

                    //mTextBoxLonDeg.Text = mDegrees.ToString();
                    //mTextBoxLonMin.Text = Convert.ToInt32(mMinutes).ToString();
                    //mTextBoxLonSec.Text = mSeconds.ToString();

                    if (mDegrees >= 10)
                    {
                        mTextBoxLonDeg.Text = mDegrees.ToString();
                    }
                    else
                    {
                        mTextBoxLonDeg.Text = "0" + mDegrees;
                    }

                    if (Convert.ToInt32(mMinutes) >= 10)
                    {
                        mTextBoxLonMin.Text = Math.Floor(Math.Abs(mMinutes)).ToString();
                    }

                    else
                    {
                        mTextBoxLonMin.Text = "0" + Math.Floor(Math.Abs(mMinutes));
                    }
                    if (mSeconds >= 10)
                    {
                        mTextBoxLonSec.Text = mSeconds.ToString();
                    }
                    else
                    {
                        mTextBoxLonSec.Text = "0" + mSeconds;
                    }



                    string mLatitude = mData[0].ToString();
                    mdel = mLatitude.Replace(",", ".").Split(new char[1] { '.' });

                    mDegrees = Convert.ToInt32(mdel[0]);
                    remainder = (decimal)(Convert.ToDecimal(mdel[1]) / Convert.ToDecimal((Math.Pow(10, mdel[1].Length))));
                    mMinutes = remainder * 60;

                    mdel1 = mMinutes.ToString().Replace(",", ".").Split(new char[1] { '.' });
                    remainder1 = (decimal)(Convert.ToDecimal(mdel1[1]) / Convert.ToDecimal((Math.Pow(10, mdel1[1].Length))));
                    mSeconds = Math.Round((remainder1 * 60), 2);

                    if (mDegrees >= 10)
                    {
                        mTextBoxLatDeg.Text = mDegrees.ToString();
                    }
                    else
                    {
                        mTextBoxLatDeg.Text = "0" + mDegrees;
                    }

                    if (Convert.ToInt32(mMinutes) >= 10)
                    {
                        mTextBoxLatMin.Text = Math.Floor(Math.Abs(mMinutes)).ToString();
                    }

                    else
                    {
                        mTextBoxLatMin.Text = "0" + Math.Floor(Math.Abs(mMinutes));
                    }
                    if (mSeconds >= 10)
                    {
                        mTextBoxLatSec.Text = mSeconds.ToString();
                    }
                    else
                    {
                        mTextBoxLatSec.Text = "0" + mSeconds;
                    }
                }


            }

            
        }

        protected void ASPxGridViewRelations_BeforePerformDataSelect(object sender, EventArgs e)
        {
            

            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            

            Int32 SystemNewRow = (Int32)Global.CustomSession["SystemNewRow"];

            if (SystemNewRow != 1)
            {
                detailGrid.DataSource = Global.ExecuteStoredProcedure("Config_Admin_TT_System_Rel_List_per_System", new string[1] { "@SYSTEM_ID" }, new Object[1] { keyValue });
            }
        }



 
       protected void ASPxGridViewSystems_HtmlEditFormCreated(object sender, ASPxGridViewEditFormEventArgs e)
        {

            ASPxPageControl mASPxPageControl = ((ASPxGridView)sender).FindEditFormTemplateControl("ASPxPageControlSystems") as ASPxPageControl;
            ASPxComboBox mCombobox = mASPxPageControl.FindControl("ASPxComboBoxSystemGroup") as ASPxComboBox;
            ASPxComboBox mComboboxArea = mASPxPageControl.FindControl("ASPxComboBoxSystemArea") as ASPxComboBox;
            
            DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_TT_Lookup_System_Group", null, null);
            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                mCombobox.Items.Add(mDataTable.Rows[i]["SYSTEM_GROUP"].ToString(), mDataTable.Rows[i]["SYSTEM_GROUP"]);
            }


            DataTable mDataTable2 = Global.ExecuteStoredProcedure("SCH_Lookup_Regions", null, null);
            for (int i = 0; i < mDataTable2.Rows.Count; i++)
            {
                mComboboxArea.Items.Add(mDataTable2.Rows[i]["Region"].ToString(), mDataTable2.Rows[i]["Region"]);
            }


            ASPxGridView mGrid = (ASPxGridView)sender;
            mGrid.DataSource = Global.CustomSession["SystemsTable"];
            ASPxTextBox mTextBoxLatDeg = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLatDeg");
            ASPxTextBox mTextBoxLatMin = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLatMin");
            ASPxTextBox mTextBoxLatSec = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLatSec");

            ASPxTextBox mTextBoxLonDeg = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLonDeg");
            ASPxTextBox mTextBoxLonMin = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLonMin");
            ASPxTextBox mTextBoxLonSec = (ASPxTextBox)mASPxPageControl.FindControl("ASPxTextBoxLonSec");
            ASPxDropDownEdit mDropDownEdit = (ASPxDropDownEdit)mASPxPageControl.FindControl("ASPxDropDownEditProcess");

            int index = mGrid.EditingRowVisibleIndex;
            object[] mData = (object[])mGrid.GetRowValues(index, new string[2] { "Latitude", "Longitude" });

            if (mData.Length == 2 && mData[0] != System.DBNull.Value && mData[0] != null)
            {
                string mLongitude = mData[1].ToString();
                string[] mdel = mLongitude.Replace(",", ".").Split(new char[1] { '.' });

                int mDegrees = Convert.ToInt32(mdel[0]);
                decimal remainder = (decimal)(Convert.ToDecimal(mdel[1]) / Convert.ToDecimal((Math.Pow(10, mdel[1].Length))));
                decimal mMinutes = remainder * 60;


                string[] mdel1 = mMinutes.ToString().Replace(",", ".").Split(new char[1] { '.' });
                decimal remainder1 = (decimal)(Convert.ToDecimal(mdel1[1]) / Convert.ToDecimal((Math.Pow(10, mdel1[1].Length))));
                decimal mSeconds = Math.Round((remainder1 * 60), 2);

                //mTextBoxLonDeg.Text = mDegrees.ToString();
                //mTextBoxLonMin.Text = Convert.ToInt32(mMinutes).ToString();
                //mTextBoxLonSec.Text = mSeconds.ToString();

                if (mDegrees >= 10)
                {
                    mTextBoxLonDeg.Text = mDegrees.ToString();
                }
                else
                {
                    mTextBoxLonDeg.Text = "0" + mDegrees;
                }

                if (Convert.ToInt32(mMinutes) >= 10)
                {
                    mTextBoxLonMin.Text = Math.Floor(Math.Abs(mMinutes)).ToString();
                }

                else
                {
                    mTextBoxLonMin.Text = "0" + Math.Floor(Math.Abs(mMinutes));
                }
                if (mSeconds >= 10)
                {
                    mTextBoxLonSec.Text = mSeconds.ToString();
                }
                else
                {
                    mTextBoxLonSec.Text = "0" + mSeconds;
                }



                string mLatitude = mData[0].ToString();
                mdel = mLatitude.Replace(",", ".").Split(new char[1] { '.' });

                mDegrees = Convert.ToInt32(mdel[0]);
                remainder = (decimal)(Convert.ToDecimal(mdel[1]) / Convert.ToDecimal((Math.Pow(10, mdel[1].Length))));
                mMinutes = remainder * 60;

                mdel1 = mMinutes.ToString().Replace(",", ".").Split(new char[1] { '.' });
                remainder1 = (decimal)(Convert.ToDecimal(mdel1[1]) / Convert.ToDecimal((Math.Pow(10, mdel1[1].Length))));
                mSeconds = Math.Round((remainder1 * 60), 2);

                if (mDegrees >= 10)
                {
                    mTextBoxLatDeg.Text = mDegrees.ToString();
                }
                else
                {
                    mTextBoxLatDeg.Text = "0" + mDegrees;
                }

                if (Convert.ToInt32(mMinutes) >= 10)
                {
                    mTextBoxLatMin.Text = Math.Floor(Math.Abs(mMinutes)).ToString();
                }

                else
                {
                    mTextBoxLatMin.Text = "0" + Math.Floor(Math.Abs(mMinutes));
                }
                if (mSeconds >= 10)
                {
                    mTextBoxLatSec.Text = mSeconds.ToString();
                }
                else
                {
                    mTextBoxLatSec.Text = "0" + mSeconds;
                }
            }

 
            ASPxListBox mListBox = (ASPxListBox)mDropDownEdit.FindControl("listBoxProcess");
            DataTable m2DataTable = Global.ExecuteStoredProcedure("Config_Admin_Process_List", null, null);
            int count = m2DataTable.Rows.Count;
            //DataRow mRow;
            string mValue = (string)mGrid.GetRowValues(index, new string[1] { "Process" });

            if (mValue != null)
            {
                string[] mChecked = mValue.Split(new char[1] { ';' });
                for (int i = 0; i < count; i++)
                {
                    mListBox.Items.Add(m2DataTable.Rows[i]["Process"].ToString(), m2DataTable.Rows[i]["Process"]);
                    for (int k = 0; k < mChecked.Length; k++)
                    {
                        if (mChecked[k] == mListBox.Items[i + 1].ToString())
                        {
                            mListBox.Items[i + 1].Selected = true;
                        }
                    }
                }
            }
            else
            {
                for (int i = 0; i < count; i++)
                {
                    mListBox.Items.Add(m2DataTable.Rows[i]["Process"].ToString(), m2DataTable.Rows[i]["Process"]);
                }
            }

           
            if (((ASPxGridView)sender).IsNewRowEditing == true)
            {
                ASPxGridView mGridRel = mASPxPageControl.FindControl("ASPxGridViewRelations") as ASPxGridView;
                mGridRel.Visible = false;
                Global.CustomSession["SystemNewRow"] = 1;

             }
            else
            {
                Global.CustomSession["SystemNewRow"] = 0;

                Int32 mSystemID = (Int32)mGrid.GetRowValues(index, new string[1] { "Hidden_id" });
                Global.CustomSession["mSystemID"] = mSystemID.ToString();

            }

           
        }
        
        

       protected void ASPxGridViewSystems_StartRowEditing1(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
       {
           (sender as ASPxGridView).DetailRows.CollapseAllRows();
           Global.CustomSession["SystemNewRow"] = 0;
       }


       protected void ASPxGridViewSystems_InitNewRow1(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
       {
           (sender as ASPxGridView).DetailRows.CollapseAllRows();
           Global.CustomSession["SystemNewRow"] = 1;
       }



       protected void ASPxGridViewRelations_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
       {

           if (e.Column.Name == "Rel_type" & ((ASPxGridView)sender).IsNewRowEditing == true)
           {
               ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
               DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_TT_Rel_Type_List", null, null);
               for (int i = 0; i < mDataTable.Rows.Count; i++)
               {
                   mCombobox.Items.Add(mDataTable.Rows[i]["Type"].ToString(), mDataTable.Rows[i]["Hidden_id"]);
               }
           }


           //if (e.Column.Name == "From_system" & ((ASPxGridView)sender).IsNewRowEditing == true)
           //{
           //    ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
           //    DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_TT_System_SystemGroup_Lookup", null, null);
           //    for (int i = 0; i < mDataTable.Rows.Count; i++)
           //    {
           //        mCombobox.Items.Add(mDataTable.Rows[i]["System"].ToString(), mDataTable.Rows[i]["ID"]);
           //    }
           //}


           if (e.Column.Name == "System_B" & ((ASPxGridView)sender).IsNewRowEditing == true)
           {
               ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
               DataTable mDataTable = Global.ExecuteStoredProcedure("Config_Admin_TT_System_SystemGroup_Lookup", null, null);
               for (int i = 0; i < mDataTable.Rows.Count; i++)
               {
                   mCombobox.Items.Add(mDataTable.Rows[i]["System"].ToString(), mDataTable.Rows[i]["ID"]);
               }
           }

       }



       protected void ASPxGridViewRelations_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
       {
           Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Rel_Delete", new string[3] { "@A_ID", "@B_ID", "@REL_TYPE_ID" }, new Object[3] { e.Keys[0], e.Keys[1], e.Keys[2] });
           ((ASPxGridView)sender).CancelEdit();
           e.Cancel = true;
           ((ASPxGridView)sender).DataBind();
           MasterDataBind();
       }

       protected void ASPxGridViewRelations_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
       {
               String mSystemID = (String)Global.CustomSession["mSystemID"];

               if (Convert.ToInt32(e.NewValues[0]) > 0)
               {
                   Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Rel_Insert", new string[5] { "@A_ID", "@B_ID", "@REL_TYPE_ID", "@DEPEND_ON", "@INFO" },
                                                           new Object[5] { mSystemID, e.NewValues[1], e.NewValues[0], e.NewValues[2], e.NewValues[3] });
               }

               else
               {
                   Int32 mDepends; 
                   if (Convert.ToInt32(e.NewValues[2]) == 1) {mDepends = 2;}
                   else if (Convert.ToInt32(e.NewValues[2]) == 2) { mDepends = 1; }
                   else mDepends = Convert.ToInt32(e.NewValues[2]);

                   Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Rel_Insert", new string[5] { "@A_ID", "@B_ID", "@REL_TYPE_ID", "@DEPEND_ON", "@INFO" },
                                                           new Object[5] { e.NewValues[1], mSystemID, -1 * Convert.ToInt32(e.NewValues[0]), mDepends, e.NewValues[3] });
               }


               ((ASPxGridView)sender).CancelEdit();
               e.Cancel = true;
               ((ASPxGridView)sender).DataBind();
                
           MasterDataBind();
             
       }

       protected void ASPxGridViewRelations_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
       {

           String mSystemID = (String)Global.CustomSession["mSystemID"];
           if (Convert.ToInt32(e.Keys[2]) > 0)
           {
               Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Rel_Update", new string[5] { "@A_ID", "@B_ID", "@REL_TYPE_ID", "@DEPEND_ON", "@INFO" },
                                            new Object[5] { e.Keys[0], e.Keys[1], e.Keys[2], e.NewValues[2], e.NewValues[3] });
           }

           else
           {
               Int32 mDepends;
               if (Convert.ToInt32(e.NewValues[2]) == 1) { mDepends = 2; }
               else if (Convert.ToInt32(e.NewValues[2]) == 2) { mDepends = 1; }
               else mDepends = Convert.ToInt32(e.NewValues[2]);

               Global.ExecuteStoredProcedureNoResults("Config_Admin_TT_System_Rel_Update", new string[5] { "@A_ID", "@B_ID", "@REL_TYPE_ID", "@DEPEND_ON", "@INFO" },
                                            new Object[5] { e.Keys[0], e.Keys[1], -1 * Convert.ToInt32(e.Keys[2]), mDepends, e.NewValues[3] });
           }


           ((ASPxGridView)sender).CancelEdit();
           e.Cancel = true;
           ((ASPxGridView)sender).DataBind();
       }


       protected void ASPxMenu2_Init(object sender, EventArgs e)
       {
           ASPxMenu mASPxMenu = (ASPxMenu)sender;
           Int32 SystemNewRow = 1;

           if (Global.CustomSession["SystemNewRow"] != null)
           { SystemNewRow = (Int32)Global.CustomSession["SystemNewRow"]; };

           if (SystemNewRow == 1)
           {
               mASPxMenu.Enabled = false;
           }
           else
           {
               mASPxMenu.Enabled = true;

           }
       }


       //protected void ASPxGridViewRelations_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
       //{
       //    String mSystemID = (String)Global.CustomSession["mSystemID"];
       //    Int32 SystemNewRow = (Int32)Global.CustomSession["SystemNewRow"];

       //    if (((ASPxGridView)sender).IsNewRowEditing == true)
       //    {
       //        if (mSystemID != (String)e.NewValues[0] & mSystemID != (String)e.NewValues[3])
       //        {
       //            e.RowError = "Please specify a relation starting from or ending to the system you are editing!";
       //        }

       //    }            
       //}

    }
}