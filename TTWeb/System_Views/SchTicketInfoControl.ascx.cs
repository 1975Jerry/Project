using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ApplicationServices;
using System.Web.SessionState;
using System.Web.Util;
using System.Data;
using System.Data.Common;
using DevExpress.Web;
using System.Threading;
using System.Diagnostics;
using System.Text;

namespace TTWeb
{
    [Serializable]
    public class TicketInfo
    {

        public string SRI;
        public string TT_Id;
        public DateTime INC_Start_Datetime;
        public DateTime INC_End_Datetime;
        public DateTime TT_Creation_Datetime;
        public DateTime Send_to_Vendor_Datetime;
        public string Node_Type;
        public string Location;
        public string Master_Node;
        public string Priority;
        public string Ticket_Type;
        public string Short_Description;
        public string Cause_1_Level;
        public string Cause_2_Level;
        public string Affected_Nodes;
        public string BSC;
        public string ISSUER;
        public string Geographical_Location;
        public string Freeze_Flag;
        public string Response_Freeze;
        public string Response_Freeze_Reazons;
        public string Restore_Freeze;
        public string Restore_Freeze_Reazons;
        public string Status;
        public string Current_Owner;
        public string Cancellation_Flag;
        public DateTime Cancellation_Datetime;
        public DateTime Resolution_Datetime;
        public DateTime Response_Datetime;
        public string Kintec_Rejection_Status_Flag;
        public string Last_Kintec_Rejection_Flag;
        public string Last_VF_Rejection_Flag;
        public string ECO_Spare_Parts_RMA_No;
        public string AssignTo;
        public string Duration;
        public string Alarm_Severity;
        public DateTime LastUploadedOn;
                
        public TicketInfo()
        {
            
        }

        public TicketInfo(DataRow aRow)
        {

            SRI = aRow["SRI"].ToString();
            TT_Id = aRow["TT_Id"].ToString();
            INC_Start_Datetime = Convert.ToDateTime(aRow["INC_Start_Datetime"]);
            INC_End_Datetime = Convert.ToDateTime(aRow["INC_End_Datetime"]);
            TT_Creation_Datetime = Convert.ToDateTime(aRow["TT_Creation_Datetime"]);
            Send_to_Vendor_Datetime = Convert.ToDateTime(aRow["Send_to_Vendor_Datetime"]);
            Node_Type = aRow["Node_Type"].ToString();
            Location = aRow["Location"].ToString();
            Master_Node = aRow["Master_Node"].ToString();
            Priority = aRow["Priority"].ToString();
            Ticket_Type = aRow["Ticket_Type"].ToString();
            Short_Description = aRow["Short_Description"].ToString();
            Cause_1_Level = aRow["Cause_1_Level"].ToString();
            Cause_2_Level = aRow["Cause_2_Level"].ToString();
            Affected_Nodes = aRow["Affected_Nodes"].ToString();
            BSC = aRow["BSC"].ToString();
            ISSUER = aRow["ISSUER"].ToString();
            Geographical_Location = aRow["Geographical_Location"].ToString();
            Freeze_Flag = aRow["Freeze_Flag"].ToString();
            Response_Freeze = aRow["Response_Freeze"].ToString();
            Response_Freeze_Reazons = aRow["Response_Freeze_Reazons"].ToString();
            Restore_Freeze = aRow["Restore_Freeze"].ToString();
            Restore_Freeze_Reazons = aRow["Restore_Freeze_Reazons"].ToString();
            Status = aRow["Status"].ToString();
            Current_Owner = aRow["Current_Owner"].ToString();
            Cancellation_Flag = aRow["Cancellation_Flag"].ToString();
            Cancellation_Datetime = Convert.ToDateTime(aRow["Cancellation_Datetime"]);
            Resolution_Datetime = Convert.ToDateTime(aRow["Resolution_Datetime"]);
            Response_Datetime = Convert.ToDateTime(aRow["Response_Datetime"]);
            Kintec_Rejection_Status_Flag = aRow["Kintec_Rejection_Status_Flag"].ToString();
            Last_Kintec_Rejection_Flag = aRow["Last_Kintec_Rejection_Flag"].ToString();
            Last_VF_Rejection_Flag = aRow["Last_VF_Rejection_Flag"].ToString();
            ECO_Spare_Parts_RMA_No = aRow["ECO_Spare_Parts_RMA_No"].ToString();
            AssignTo = aRow["AssignTo"].ToString();
            Duration = aRow["Duration"].ToString();
            Alarm_Severity = aRow["Alarm_Severity"].ToString();
            LastUploadedOn = Convert.ToDateTime(aRow["Last_Uploaded_On"]);
        }
    }

    public partial class SchTicketInfoControl : UserControl
    {
        public SchTicketInfoControl()
        {
            this.EnableViewState = true;
        }

        public TicketInfo TTData
        {
            get
            {
                if (Global.CustomSession["TicketInfo"] != null)
                {
                    return (TicketInfo)Global.CustomSession["TicketInfo"];
                }
                return null;
            }
            set
            {
                Global.CustomSession["TicketInfo"] = value;
                ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("TicketInfo");
            }
        }

        protected override object SaveViewState()
        {
            return base.SaveViewState(); // not null now
        }

        protected override void LoadViewState(object savedState)
        {
            base.LoadViewState(savedState);
        }
        
        protected override void  OnInit(EventArgs e)
        {
            base.OnInit(e);
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            DataRow mRow;

            if (Page.IsCallback)
            {
                BindGeneralInformation();
                Debug.WriteLine("CALLBACKPARAM: " + HttpContext.Current.Request.Params["__CALLBACKPARAM"]);
                Debug.WriteLine("CALLBACKID: " + Page.Request.Params["__CALLBACKID"]);
                if (mSessionResourceTracker == null)
                {
                    Response.Redirect("~/DeadSession.aspx");
                    Debug.WriteLine("Nothing");
                    return;
                }


                if (HttpContext.Current.Request.Params["__CALLBACKPARAM"].Contains("HIDEDETAILROW") || HttpContext.Current.Request.Params["__CALLBACKPARAM"].Contains("HIDEALLDETAIL"))
                {
                    TTData = null;
                    return;
                }


                if (TTData == null)
                {
                    Debug.WriteLine("TTData Loading");
                    DataTable mdataTable = Global.ExecuteStoredProcedure("ActiveTickets_Info", new string[2] { "@tt_id", "@user_id" }, new Object[2] { Global.CustomSession["Ticket_ID"], Global.CustomSession["UserId"] });
                    mRow = mdataTable.Rows[0];
                    TTData = new TicketInfo(mdataTable.Rows[0]);
                    //BindRightsButtons();
                    BindGeneralInformation();
                }


                if (TTData.TT_Id != (string)Global.CustomSession["Ticket_ID"])
                {
                    Debug.WriteLine("TTData Loading");
                    DataTable mdataTable = Global.ExecuteStoredProcedure("ActiveTickets_Info", new string[2] { "@tt_id", "@user_id" }, new Object[2] { Global.CustomSession["Ticket_ID"], Global.CustomSession["UserId"] });
                    mRow = mdataTable.Rows[0];
                    TTData = new TicketInfo(mdataTable.Rows[0]);
                    //BindRightsButtons();
                    BindGeneralInformation();
                }



                string mCallbackId = (string)Page.Request.Params["__CALLBACKID"];
                string mCallbackParam = (string)Page.Request.Params["__CALLBACKPARAM"];
                string[] mdel = mCallbackId.Split(new char[1] { '$' });


                if (mCallbackId.EndsWith("ASPxPageControl1") || mCallbackId.EndsWith("ASPxGridViewLocation"))
                {
                    ASPxGridViewLocation.DataSource = Global.ExecuteStoredProcedure("View_Location_History_SCHs", new string[1] { "@Location" }, new Object[1] { TTData.Location });
                    ASPxGridViewLocation.DataBind();
                }


                /*switch (mdel[mdel.Length - 1])
                {
                    default:
                        Debug.WriteLine("PostBackDataBind()");
                        //BindTTDescriptionButtons();
                        PostBackDataBind();
                        break;
                }*/

            }
            else if (Page.IsPostBack)
            {
                Debug.WriteLine("SchEditPostBack");
                DataRow mRow1;
                if (TTData == null)
                {
                    Debug.WriteLine("TTData Loading");
                    DataTable mdataTable = Global.ExecuteStoredProcedure("ActiveTickets_Info", new string[2] { "@tt_id", "@user_id" }, new Object[2] { Global.CustomSession["Ticket_ID"], Global.CustomSession["UserId"] });
                    mRow1 = mdataTable.Rows[0];
                    TTData = new TicketInfo(mdataTable.Rows[0]);
                }

                string postbackControlName = Page.Request.Params.Get("__EVENTTARGET");

                if (Page.Request.Form["__EVENTTARGET"].ToString().EndsWith("Release"))
                {
                    return;
                }
                if (Global.CustomSession["SessionResourceTracker"] == null)
                {
                    HttpContext.Current.Response.Redirect("~/DeadSession.aspx");
                    return;
                }
                //if (!ASPxGridViewInterventions.IsEditing)
                //{
                //    PostBackDataBind();
                //}
            }
            else
            {
                if (mSessionResourceTracker == null)
                {
                    Response.Redirect("~/DeadSession.aspx");
                    return;
                }
                PostBackDataBind();
            }
        }



        private void PostBackDataBind()
        {
            BindGeneralInformation();
            //ASPxGridViewProblemsDataBind(Global.CustomSession["ASPxGridViewProblemsDataTable"] == null ? true : false);
            //BindVisits();
        }

        private void BindGeneralInformation()
        {


            if (TTData != null)
            {
                SRI.Value = TTData.SRI;
                TTId.Value = TTData.TT_Id;
                Priority.Value = TTData.Priority;
                TicketType.Value = TTData.Ticket_Type;
                Status.Value = TTData.Status;
                CurrentOwner.Value = TTData.Current_Owner;

                if (TTData.INC_Start_Datetime != Convert.ToDateTime("01/01/1900"))
                {
                    IncStartOn.Value = TTData.INC_Start_Datetime;
                }

                NodeType.Value = TTData.Node_Type;
                ShortDescription.Value = TTData.Short_Description;

                if (TTData.INC_End_Datetime != Convert.ToDateTime("01/01/1900"))
                {
                    IncEndOn.Value = TTData.INC_End_Datetime;
                }

                Location.Value = TTData.Location;
                AlarmSeverity.Value = TTData.Alarm_Severity;

                if (TTData.TT_Creation_Datetime != Convert.ToDateTime("01/01/1900"))
                {
                    TTCreationOn.Value = TTData.TT_Creation_Datetime;
                }

                MasterNode.Value = TTData.Master_Node;
                Cause1.Value = TTData.Cause_1_Level;

                if (TTData.Send_to_Vendor_Datetime != Convert.ToDateTime("01/01/1900"))
                {
                    SendToVendorOn.Value = TTData.Send_to_Vendor_Datetime;
                }

                AffectedNodes.Value = TTData.Affected_Nodes;
                Cause2.Value = TTData.Cause_2_Level;

                if (TTData.Response_Datetime != Convert.ToDateTime("01/01/1900"))
                {
                    ResponseOn.Value = TTData.Response_Datetime;
                }

                Bsc.Value = TTData.BSC;
                SparePartsNo.Value = TTData.ECO_Spare_Parts_RMA_No;

                if (TTData.Resolution_Datetime != Convert.ToDateTime("01/01/1900"))
                {
                    ResolutionOn.Value = TTData.Resolution_Datetime;
                }

                GeogrLocation.Value = TTData.Geographical_Location;
                Issuer.Value = TTData.ISSUER;
                AssignTo.Value = TTData.AssignTo;

                FreezeFlag.Value = TTData.Freeze_Flag;
                CancellationFlag.Value = TTData.Cancellation_Flag;
                KintecRejStatusFlag.Value = TTData.Kintec_Rejection_Status_Flag;
                ResponseFreeze.Value = TTData.Response_Freeze;

                if (TTData.Cancellation_Datetime != Convert.ToDateTime("01/01/1900"))
                {
                    CancelationOn.Value = TTData.Cancellation_Datetime;
                }

                LastKintecRejFlag.Value = TTData.Last_Kintec_Rejection_Flag;
                ResponseFreezeReas.Value = TTData.Response_Freeze_Reazons;
                LastVFRejFlag.Value = TTData.Last_VF_Rejection_Flag;
                RestoreFreeze.Value = TTData.Restore_Freeze;
                RestoreFreezeReas.Value = TTData.Restore_Freeze_Reazons;

                LastUploadedOn.Value = TTData.LastUploadedOn;

            }

            //ASPxSpinStart.Value = TTData.Start_km_indic;
            //ASPxSpinStart.Enabled = TTData.Hidden_claimed_by_me;




        }

        private void BindRightsButtons()
        {

        }

        private void BindExpenses()
        {

        }



        private void BindVisits()
        {
 
        }

        private void BindTTDescriptionButtons()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
        }


        protected void ASPxCallbackSaveSchedule_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {

        }

        protected void ASPxGridViewLocation_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.Name == "Priority")
            {
                e.Cell.ToolTip = e.CellValue.ToString();

            }

            if (e.DataColumn.Name == "Type")
            {
                e.Cell.ToolTip = e.CellValue.ToString();

            }
        }

        protected void ASPxGridViewLocation_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;

            if ((string)e.GetValue("Type") == "Visit")
                e.Row.BackColor = System.Drawing.Color.Ivory; 
        }



    }
}


