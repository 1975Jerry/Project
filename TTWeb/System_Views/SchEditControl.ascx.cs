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
    public class SchDetails
    {
        public Guid TT_id;
        public string Status;
        public string Team;
        public String Severity;
        public DateTime CreationDate;
        public string CreatedBy;
        public string Assigned_user;
        public string Assigned_user2;
        public string Initiator;
        public string Initiator_comments;
        public string Vehicle_number;
        public string Vehicle_type;
        public bool Vehicle_4x4;
        public int Vehicle_id;
        public DateTime Departure_date;
        public string Departure_comments;
        public string Spare_parts;
        
        /* Expenses */
        public bool Overtime;
        public double Overtime_hours;
        public string Overtime_comments;
        public double Gas_cost;
        public double Gas_cost_credit;
        public double Toll_cost;
        public double Toll_cost_credit;
        public double Consumambles_cost;
        public double Consumambles_cost_credit;
        public bool Out_of_base;
        public double Out_of_base_meals_cost;
        public bool Overnight;
        public double Out_of_base_overnight_cost;
        public double Out_of_base_overnight_cost_credit;
        public double Taxi_cost;
        public double Taxi_cost_credit;
        public double Parking_cost;
        public double Parking_cost_credit;
        public double Other_car_expenses_cost;
        public double Other_car_expenses_cost_credit;
        public double Ferry_tickets_cost;
        public double Ferry_tickets_cost_credit;
        public double Ferry_car_limit_violation_cost;
        public double Ferry_car_limit_violation_cost_credit;
        public double Airline_tickets_cost;
        public double Airline_tickets_cost_credit;
        public double Airline_overweight_cost;
        public double Airline_overweight_cost_credit;
        public double Other_tickets_cost;
        public double Other_tickets_cost_credit;
        public double Office_expenses_cost;
        public double Office_expenses_cost_credit;
        public bool Advance;
        public double Advance_amount;

        /* Team Expenses */

        public string Overtime_hours_team;
        public string Gas_cost_team;
        public string Gas_cost_credit_team;
        public string Toll_cost_team;
        public string Toll_cost_credit_team;
        public string Consumambles_cost_team;
        public string Consumambles_cost_credit_team;
        public string Out_of_base_meals_cost_team;
        public string Out_of_base_overnight_cost_team;
        public string Out_of_base_overnight_cost_credit_team;
        public string Taxi_cost_team;
        public string Taxi_cost_credit_team;
        public string Parking_cost_team;
        public string Parking_cost_credit_team;
        public string Other_car_expenses_cost_team;
        public string Other_car_expenses_cost_credit_team;
        public string Ferry_tickets_cost_team;
        public string Ferry_tickets_cost_credit_team;
        public string Ferry_car_limit_violation_cost_team;
        public string Ferry_car_limit_violation_cost_credit_team;
        public string Airline_tickets_cost_team;
        public string Airline_tickets_cost_credit_team;
        public string Airline_overweight_cost_team;
        public string Airline_overweight_cost_credit_team;
        public string Other_tickets_cost_team;
        public string Other_tickets_cost_credit_team;
        public string Office_expenses_cost_team;
        public string Office_expenses_cost_credit_team;
        public string Advance_amount_team;


        public double Return_to_base_km;
        public double Start_km_indic;
        public double End_km_indic;
        public double Fleet_total_km;
        public string Engineer_comments;
        public DateTime Return_date;
        public string Spare_parts_return;
        public int Hidden_cur_team_id;
        public bool Hidden_claimed_by_me;
        public bool Hidden_claim_right;
        public bool Hidden_edit_right;
        public bool Hidden_edit_distance_right;
        public bool Hidden_edit_expenses_right;
        public bool Hidden_approve_only_right;
        public bool Hidden_cancel_right;
        public bool Hidden_update_problem_right;
        public bool Hidden_completion_right;
        public bool Hidden_intervention_update_right = false;
        public bool Hidden_new_intervention_right = false;
        public bool Hidden_assign_right;
        public string Hidden_process;
        public int Hidden_assigned_user_id;
        public int Hidden_assigned_user_id2;
        public Int64 Stamp;
        
        public SchDetails()
        {
            
        }
        public SchDetails(DataRow aRow)
        {
            TT_id = (Guid)aRow["ID"];
            Assigned_user = aRow["Assigned_user"].ToString();
            Assigned_user2 = aRow["Assigned_user2"].ToString();
            Initiator = aRow["Initiator"].ToString();
            Initiator_comments = aRow["Initiator_Comments"].ToString();
            Vehicle_number = aRow["VEHICLE_NUMBER"].ToString();
            Vehicle_type = aRow["VEHICLE_TYPE"].ToString();
            Vehicle_4x4 = Convert.ToBoolean(aRow["VEHICLE_4x4"]);
            Vehicle_id = Convert.ToInt32(aRow["Vehicle_id"]);
            Status = aRow["Status"].ToString();
            Departure_date = Convert.ToDateTime(aRow["DEPARTURE_DATE"]);
            Departure_comments = aRow["DEPARTURE_COMMENTS"].ToString();
            Spare_parts = aRow["SPARE_PARTS"].ToString();

            /* Expenses */
            Overtime = Convert.ToBoolean(aRow["OVERTIME"]);
            Overtime_hours = Convert.ToDouble(aRow["OVERTIME_HOURS"]);
            Overtime_comments = aRow["OVERTIME_COMMENTS"].ToString();
            Gas_cost = Convert.ToDouble(aRow["GAS_COST"]);
            Gas_cost_credit = Convert.ToDouble(aRow["GAS_COST_CREDIT"]);
            Toll_cost = Convert.ToDouble(aRow["TOLL_COST"]);
            Toll_cost_credit = Convert.ToDouble(aRow["TOLL_COST_CREDIT"]);
            Consumambles_cost = Convert.ToDouble(aRow["CONSUMABLES_COST"]);
            Consumambles_cost_credit = Convert.ToDouble(aRow["CONSUMABLES_COST_CREDIT"]);
            Out_of_base = Convert.ToBoolean(aRow["OUT_OF_BASE"]);
            Out_of_base_meals_cost = Convert.ToDouble(aRow["OUT_OF_BASE_MEALS_COST"]);
            Overnight = Convert.ToBoolean(aRow["OVERNIGHT"]);
            Out_of_base_overnight_cost = Convert.ToDouble(aRow["OUT_OF_BASE_OVERNIGHT_COST"]);
            Out_of_base_overnight_cost_credit = Convert.ToDouble(aRow["OUT_OF_BASE_OVERNIGHT_COST_CREDIT"]);
            Taxi_cost = Convert.ToDouble(aRow["TAXI"]);
            Taxi_cost_credit = Convert.ToDouble(aRow["TAXI_CREDIT"]);
            Parking_cost = Convert.ToDouble(aRow["PARKING"]);
            Parking_cost_credit = Convert.ToDouble(aRow["PARKING_CREDIT"]);
            Other_car_expenses_cost = Convert.ToDouble(aRow["OTHER_CAR_EXPENSES"]);
            Other_car_expenses_cost_credit = Convert.ToDouble(aRow["OTHER_CAR_EXPENSES_CREDIT"]);
            Ferry_tickets_cost = Convert.ToDouble(aRow["FERRY_TICKETS"]);
            Ferry_tickets_cost_credit = Convert.ToDouble(aRow["FERRY_TICKETS_CREDIT"]);
            Ferry_car_limit_violation_cost = Convert.ToDouble(aRow["FERRY_CAR_LIMIT_VIOLATION"]);
            Ferry_car_limit_violation_cost_credit = Convert.ToDouble(aRow["FERRY_CAR_LIMIT_VIOLATION_CREDIT"]);
            Airline_tickets_cost = Convert.ToDouble(aRow["AIRLINE_TICKETS"]);
            Airline_tickets_cost_credit = Convert.ToDouble(aRow["AIRLINE_TICKETS_CREDIT"]);
            Airline_overweight_cost = Convert.ToDouble(aRow["AIRLINE_OVERWEIGHT"]);
            Airline_overweight_cost_credit = Convert.ToDouble(aRow["AIRLINE_OVERWEIGHT_CREDIT"]);
            Other_tickets_cost = Convert.ToDouble(aRow["OTHER_TICKETS"]);
            Other_tickets_cost_credit = Convert.ToDouble(aRow["OTHER_TICKETS_CREDIT"]);
            Office_expenses_cost = Convert.ToDouble(aRow["OFFICE_EXPENSES"]);
            Office_expenses_cost_credit = Convert.ToDouble(aRow["OFFICE_EXPENSES_CREDIT"]);
            Advance = Convert.ToBoolean(aRow["ADVANCE"]);
            Advance_amount = Convert.ToDouble(aRow["ADVANCE_AMOUNT"]);

            /* Team Expenses */

            Overtime_hours_team = aRow["OVERTIME_HOURS_TEAM"].ToString();
            Gas_cost_team = aRow["GAS_COST_TEAM"].ToString();
            Gas_cost_credit_team = aRow["GAS_COST_CREDIT_TEAM"].ToString();
            Toll_cost_team = aRow["TOLL_COST_TEAM"].ToString();
            Toll_cost_credit_team = aRow["TOLL_COST_CREDIT_TEAM"].ToString();
            Consumambles_cost_team = aRow["CONSUMABLES_COST_TEAM"].ToString();
            Consumambles_cost_credit_team = aRow["CONSUMABLES_COST_CREDIT_TEAM"].ToString();
            Out_of_base_meals_cost_team = aRow["OUT_OF_BASE_MEALS_COST_TEAM"].ToString();
            Out_of_base_overnight_cost_team = aRow["OUT_OF_BASE_OVERNIGHT_COST_TEAM"].ToString();
            Out_of_base_overnight_cost_credit_team = aRow["OUT_OF_BASE_OVERNIGHT_COST_CREDIT_TEAM"].ToString();
            Taxi_cost_team = aRow["TAXI_TEAM"].ToString();
            Taxi_cost_credit_team = aRow["TAXI_CREDIT_TEAM"].ToString();
            Parking_cost_team = aRow["PARKING_TEAM"].ToString();
            Parking_cost_credit_team = aRow["PARKING_CREDIT_TEAM"].ToString();
            Other_car_expenses_cost_team = aRow["OTHER_CAR_EXPENSES_TEAM"].ToString();
            Other_car_expenses_cost_credit_team = aRow["OTHER_CAR_EXPENSES_CREDIT_TEAM"].ToString();
            Ferry_tickets_cost_team = aRow["FERRY_TICKETS_TEAM"].ToString();
            Ferry_tickets_cost_credit_team = aRow["FERRY_TICKETS_CREDIT_TEAM"].ToString();
            Ferry_car_limit_violation_cost_team = aRow["FERRY_CAR_LIMIT_VIOLATION_TEAM"].ToString();
            Ferry_car_limit_violation_cost_credit_team = aRow["FERRY_CAR_LIMIT_VIOLATION_CREDIT_TEAM"].ToString();
            Airline_tickets_cost_team = aRow["AIRLINE_TICKETS_TEAM"].ToString();
            Airline_tickets_cost_credit_team = aRow["AIRLINE_TICKETS_CREDIT_TEAM"].ToString();
            Airline_overweight_cost_team = aRow["AIRLINE_OVERWEIGHT_TEAM"].ToString();
            Airline_overweight_cost_credit_team = aRow["AIRLINE_OVERWEIGHT_CREDIT_TEAM"].ToString();
            Other_tickets_cost_team = aRow["OTHER_TICKETS_TEAM"].ToString();
            Other_tickets_cost_credit_team = aRow["OTHER_TICKETS_CREDIT_TEAM"].ToString();
            Office_expenses_cost_team = aRow["OFFICE_EXPENSES_TEAM"].ToString();
            Office_expenses_cost_credit_team = aRow["OFFICE_EXPENSES_CREDIT_TEAM"].ToString();
            Advance_amount_team = aRow["ADVANCE_AMOUNT_TEAM"].ToString();

            Return_to_base_km = Convert.ToDouble(aRow["RETURN_TO_BASE_KM"]);
            Start_km_indic = Convert.ToDouble(aRow["START_KM_INDIC"]);
            End_km_indic = Convert.ToDouble(aRow["END_KM_INDIC"]);
            Fleet_total_km = Convert.ToDouble(aRow["FLEET_TOTAL_KM"]);
            Engineer_comments = aRow["ENGINEER_COMMENTS"].ToString();
            Return_date = Convert.ToDateTime(aRow["RETURN_DATE"]);
            Spare_parts_return = aRow["SPARE_PARTS_RETURN"].ToString();
            Hidden_cur_team_id = Convert.ToInt32(aRow["Hidden_cur_team_id"]);
            Hidden_claimed_by_me = Convert.ToBoolean(aRow["Hidden_claimed_by_me"]);
            Hidden_claim_right = Convert.ToBoolean(aRow["Hidden_claim_right"]);
            Hidden_edit_right = Convert.ToBoolean(aRow["Hidden_edit_right"]);
            Hidden_update_problem_right = Convert.ToBoolean(aRow["Hidden_update_problem_right"]);
            Hidden_completion_right = Convert.ToBoolean(aRow["Hidden_completion_right"]);
            Hidden_assign_right = Convert.ToBoolean(aRow["Hidden_assign_right"]);
            Hidden_process = aRow["Hidden_process"].ToString();
            Hidden_assigned_user_id = Convert.ToInt32(aRow["Hidden_assigned_user_id"]);
            Hidden_assigned_user_id2 = Convert.ToInt32(aRow["Hidden_assigned_user_id2"]);
            //Hidden_form_edit_status = Hidden_edit_right;
            Hidden_new_intervention_right = Hidden_claimed_by_me ;
            Hidden_edit_distance_right = Convert.ToBoolean(aRow["Hidden_edit_distance"]);
            Hidden_edit_expenses_right = Convert.ToBoolean(aRow["Hidden_edit_expenses"]);
            Hidden_approve_only_right = Convert.ToBoolean(aRow["Hidden_approve_only"]);
            Hidden_cancel_right = Convert.ToBoolean(aRow["Hidden_cancel_right"]);
            Stamp = Convert.ToInt64(aRow["Stamp"]);
        }
    }

    public partial class SchEditControl : UserControl
    {
        public SchEditControl()
        {
            this.EnableViewState = true;
        }
        private SchDetails m_TTData;
        private void RefreshTTData()
        {
            DataRow mRow;
            DataTable mdataTable = Global.ExecuteStoredProcedure("Edit_SCH_View_SCH_info", new string[2] { "@sch_id", "@user_id" }, new Object[2] { TT_ID, Global.CustomSession["UserId"] });
            mRow = mdataTable.Rows[0];
            m_TTData = new SchDetails(mdataTable.Rows[0]);
        }
        public SchDetails TTData
        {
            get
            {
                return m_TTData;
            }
            /*set
            {
                TTData = value;
            }*/
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

        protected void Page_Init(object sender, EventArgs e)
        {
            if (this.DesignMode == true)
            {
                this.EnsureChildControls();
            }
            this.Page.RegisterRequiresControlState(this);
        }

        private Guid TT_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            TT_ID = (Guid)((GridViewDetailRowTemplateContainer)this.NamingContainer).KeyValue;
            RefreshTTData();
            object mSessionResourceTracker = Global.CustomSession["SessionResourceTracker"];
            //DataRow mRow;
            if (Page.IsCallback)
            {
                BindGeneralInformation();
                string mReason = HttpContext.Current.Request.Params["__CALLBACKPARAM"];
                string mCallbackId = (string)Request.Params["__CALLBACKID"];
                if (mSessionResourceTracker == null)
                {
                    DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/DeadSession.aspx");
                    Debug.WriteLine("Nothing");
                    return;
                }

                if (PopupControl.IsCallback || (Page.IsCallback && mCallbackId.EndsWith("ASPxGridViewTickets")))
                {
                    if (mReason.Contains("APPLYCOLUMNFILTER") || mReason.Contains("APPLYFILTER") || mReason.Contains("SORT") || mReason.Contains("PAGER"))
                    {
                        TicketsGridDataBind();
                    }
                    return;
                }
                
                if (HttpContext.Current.Request.Params["__CALLBACKPARAM"].Contains("HIDEDETAILROW") || HttpContext.Current.Request.Params["__CALLBACKPARAM"].Contains("HIDEALLDETAIL"))
                {
                    //TTData = null;
                    return;
                }

                if (TTData.TT_id != TT_ID)
                {
                    //RefreshTTData();
                    BindGeneralInformation();
                }

                string[] mdel = mCallbackId.Split(new char[1] { '$' });
                switch (mdel[mdel.Length - 1])
                {                    
                    case "ASPxGridViewProblems":
                        ASPxGridViewProblemsDataBind(Global.CustomSession["ASPxGridViewProblemsDataTable"] == null ? true : false);
                        break;
                    case "ASPxGridViewInterventions":
                        BindInterventions();
                        break;
                    case "ASPxGridViewRoutingHistory":
                        ASPxGridViewRoutingHistoryDataBind();
                        break;
                    case "ASPxGridViewRelatedTickets":
                        ASPxGridRelatedTicketsDataBind();
                        break;
                    case "ASPxGridViewAttachments":
                        ASPxGridViewAttachmentsDataBind();
                        break;
                    case "ASPxPageControl1":
                        /*if (HttpContext.Current.Request.Params["__CALLBACKPARAM"] == "c0:1")
                        {
                            //this is the Expenses tab
                            BindExpenses();
                        }*/
                        if (HttpContext.Current.Request.Params["__CALLBACKPARAM"] == "c0:1")
                        {
                            BindInterventions();
                        }
                        else if (HttpContext.Current.Request.Params["__CALLBACKPARAM"] == "c0:2")
                        {
                            ASPxGridViewAttachmentsDataBind();
                        }
                        else if (HttpContext.Current.Request.Params["__CALLBACKPARAM"] == "c0:3")
                        {
                            ASPxGridRelatedTicketsDataBind();
                        }
                        else if (HttpContext.Current.Request.Params["__CALLBACKPARAM"] == "c0:4")
                        {
                            ASPxGridViewRoutingHistoryDataBind();
                        }

                        break;
                    case "PopupControlAssign":
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_TT_View_Current_Team_Members_to_Assign", new string[2] { "@TEAM_ID", "@USER_ID" }, new Object[2] { TTData.Hidden_cur_team_id, Global.CustomSession["UserId"] });
                        if (mDataTable.Rows.Count == 0)
                        {
                            ASPxRadioButtonList.Visible = false;
                        }
                        else
                        {
                            for (int i = 0; i < mDataTable.Rows.Count; i++)
                            {
                                ASPxRadioButtonList.Items.Add(mDataTable.Rows[i][0].ToString(), mDataTable.Rows[i][1]);
                            }
                        }
                        Debug.WriteLine("Filling Assign Popup");
                        break;

                    case "PopupControlRelease":
                        ASPxPageControl mASPxPageControl = ASPxPageControl1 as ASPxPageControl;
                        ASPxGridView mGrid = mASPxPageControl.FindControl("ASPxGridViewProblems") as ASPxGridView;
                        if (TTData != null)
                        {
                            
                            int mRowCount = mGrid.VisibleRowCount;
                            string mSeverity = "##";
                            
                            mSeverity = mSeverity + mGrid.GetRowValues(0, "Priority") + "##";
                            string mStatus = TTData.Status;
                            mDataTable = Global.ExecuteStoredProcedure("Edit_SCH_Select_Team_To_Send", new string[8] { "@FROM_TEAM_ID", "@Hidden_edit_right", "@Hidden_update_problem_right", "@Process", "@Severity", "@Status", "sch_id", "@Hidden_approve_only_right" },
                                                                   new Object[8] { TTData.Hidden_cur_team_id, TTData.Hidden_edit_right, TTData.Hidden_update_problem_right, TTData.Hidden_process, mSeverity, mStatus, TTData.TT_id, TTData.Hidden_approve_only_right });
                            for (int i = 0; i < mDataTable.Rows.Count; i++)
                            {
                                ASPxRadioButtonListToTeam.Items.Add(mDataTable.Rows[i][0].ToString(), mDataTable.Rows[i][1]);
                            }
                            Debug.WriteLine("Filling release PopUp");
                        }
                        break;
                    case "ASPxCallbackSaveSchedule":
                        break;
                    case "ASPxCallbackReleaseButton":
                        break;
                    case "ASPxCallbackClaimButton":
                        break;
                    default:
                        Debug.WriteLine("PostBackDataBind()");
                        PostBackDataBind();
                        break;
                }
            }
            else if (Page.IsPostBack)
            {
                Debug.WriteLine("SchEditPostBack");
                // DataRow mRow1;
                /*if (TTData == null)
                {
                    Debug.WriteLine("TTData Loading");
                    DataTable mdataTable = Global.ExecuteStoredProcedure("Edit_TT_View_TT_info", new string[2] { "@TT_ID", "@USER_ID" }, new Object[2] { (Guid)((GridViewDetailRowTemplateContainer)this.NamingContainer).KeyValue, Global.CustomSession["UserId"] });
                    mRow1 = mdataTable.Rows[0];
                    TTData = new SchDetails(mdataTable.Rows[0]);
                }*/

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
                if (!ASPxGridViewInterventions.IsEditing)
                {
                    PostBackDataBind();
                }
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
            Debug.WriteLine("");
        }

        private void BindInterventions()
        {
            bool update = Global.CustomSession["ASPxGridViewInterventionsDataTable"] == null ? true : false;
            DataTable mTable = (DataTable)null;
            if (update)
            {
                ASPxGridViewInterventionsDataBind(true);
                mTable = (DataTable)ASPxGridViewInterventions.DataSource;
            }
            else
            {
                mTable = (DataTable)Global.CustomSession["ASPxGridViewInterventionsDataTable"];
                ASPxGridViewInterventions.DataSource = mTable;
                ASPxGridViewInterventions.DataBind();
            }
            if (HttpContext.Current.Request.Params["__CALLBACKPARAM"].Contains("SORT"))
            {
                ASPxGridViewInterventions.DataSource = Global.CustomSession["ASPxGridViewInterventionsDataTable"];
                ASPxGridViewInterventions.DataBind();
            }

            if (ASPxGridViewInterventions.FocusedRowIndex != -1)
            {
                TTData.Hidden_intervention_update_right = mTable.Rows.Count == 0 ? false : (Convert.ToBoolean(mTable.Rows[ASPxGridViewInterventions.FocusedRowIndex]["Hidden_update_right"]));
            }
        }

        private void PostBackDataBind()
        {
            BindGeneralInformation();
            //ASPxGridViewProblemsDataBind(Global.CustomSession["ASPxGridViewProblemsDataTable"] == null ? true : false);
            ASPxGridViewProblemsDataBind(true);
            BindVisits();
            BindExpenses();
        }

        private void BindGeneralInformation()
        {
            BindRightsButtons();
        }

        private void BindRightsButtons()
        {
            // put back the assign button
            DevExpress.Web.MenuItem mItemClaim = ASPxMenuTT.Items.FindByName("Claim");
            DevExpress.Web.MenuItem mItemAssign = ASPxMenuTT.Items.FindByName("Assign");
            DevExpress.Web.MenuItem mItemRelease = ASPxMenuTT.Items.FindByName("Release");
            DevExpress.Web.MenuItem mItemSave = ASPxMenuTTSave.Items.FindByName("Save");
            DevExpress.Web.MenuItem mItemExport = ASPxMenuTTSave.Items.FindByName("Export");
            DevExpress.Web.MenuItem mItemReject = ASPxMenuTT.Items.FindByName("Reject");
            DevExpress.Web.MenuItem mItemComplete = ASPxMenuTT.Items.FindByName("Complete");
            DevExpress.Web.ASPxMenu mItemNewTicket = ASPxMenuEvent;   
            
            mItemClaim.Enabled = !(TTData.Hidden_claimed_by_me) && (TTData.Hidden_claim_right) ? true : false;
            mItemAssign.Enabled = TTData.Hidden_assign_right;
            mItemRelease.Enabled = TTData.Hidden_claimed_by_me;
            mItemSave.Enabled = TTData.Hidden_claimed_by_me || TTData.Hidden_edit_distance_right || TTData.Hidden_edit_expenses_right;
            mItemExport.ClientVisible = false;                                                                              /* 19/9/2017 to export egine hidden */
            mItemReject.Enabled = TTData.Hidden_cancel_right;
            mItemComplete.Enabled = TTData.Hidden_claimed_by_me && (TTData.Status == "Sign Off");

            mItemNewTicket.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_update_problem_right;


            DevExpress.Web.MenuItem mItemCheckFleet = ASPxMenuCheckFleet.Items.FindByName("CheckFleet");
            //mItemCheckFleet.Enabled = TTData.Hidden_claimed_by_me;

            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];

            if (!mRoles.Contains("Fleet Control"))
            {
                mItemCheckFleet.Enabled = false;
            }
            else { mItemCheckFleet.Enabled = true; }

            //ASPxButtonCheckFleet.Enabled = TTData.Hidden_claimed_by_me;
            //ASPxLabelInitiator.Text =  TTData.Initiator;
            ASPxLabelInitiatorComments.Text =  TTData.Initiator_comments;

        }

        private void BindExpenses()
        {
            // km indicators
            ASPxSpinStart.Value = TTData.Start_km_indic;
            ASPxSpinStart.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_distance_right;

            ASPxSpinEnd.Value = TTData.End_km_indic;
            ASPxSpinEnd.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_distance_right;
            ASPxLabelTotalKmStartEnd.Text = Convert.ToString(TTData.End_km_indic - TTData.Start_km_indic);
            ASPxLabelTotalKmStartEnd0.Text = Convert.ToString(TTData.End_km_indic - TTData.Start_km_indic);


            // Costs
            ASPxSpinGas.Value = TTData.Gas_cost;
            //ASPxSpinGas.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_distance_right || TTData.Hidden_edit_expenses_right; EFYGE O DISTANCE 29/09/2017 APO KYRIAKO
            ASPxSpinGas.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinGas_credit.Value = TTData.Gas_cost_credit;
            //ASPxSpinGas_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_distance_right || TTData.Hidden_edit_expenses_right; EFYGE O DISTANCE 29/09/2017 APO KYRIAKO
            ASPxSpinGas_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinToll.Value = TTData.Toll_cost;
            ASPxSpinToll.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinToll_credit.Value = TTData.Toll_cost_credit;
            ASPxSpinToll_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinConsumables.Value = TTData.Consumambles_cost;
            ASPxSpinConsumables.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;
            
            ASPxSpinConsumables_credit.Value = TTData.Consumambles_cost_credit;
            ASPxSpinConsumables_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinTaxi.Value = TTData.Taxi_cost;
            ASPxSpinTaxi.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinTaxi_credit.Value = TTData.Taxi_cost_credit;
            ASPxSpinTaxi_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinParking.Value = TTData.Parking_cost;
            ASPxSpinParking.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinParking_credit.Value = TTData.Parking_cost_credit;
            ASPxSpinParking_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinOtherCarExpenses.Value = TTData.Other_car_expenses_cost;
            ASPxSpinOtherCarExpenses.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinOtherCarExpenses_credit.Value = TTData.Other_car_expenses_cost_credit;
            ASPxSpinOtherCarExpenses_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinFerryTickets.Value = TTData.Ferry_tickets_cost;
            ASPxSpinFerryTickets.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinFerryTickets_credit.Value = TTData.Ferry_tickets_cost_credit;
            ASPxSpinFerryTickets_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinFerryCarLimitViolation.Value = TTData.Ferry_car_limit_violation_cost;
            ASPxSpinFerryCarLimitViolation.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinFerryCarLimitViolation_credit.Value = TTData.Ferry_car_limit_violation_cost_credit;
            ASPxSpinFerryCarLimitViolation_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinAirlineTickets.Value = TTData.Airline_tickets_cost;
            ASPxSpinAirlineTickets.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinAirlineTickets_credit.Value = TTData.Airline_tickets_cost_credit;
            ASPxSpinAirlineTickets_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinAirlineOverweight.Value = TTData.Airline_overweight_cost;
            ASPxSpinAirlineOverweight.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinAirlineOverweight_credit.Value = TTData.Airline_overweight_cost_credit;
            ASPxSpinAirlineOverweight_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinOtherTickets.Value = TTData.Other_tickets_cost;
            ASPxSpinOtherTickets.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinOtherTickets_credit.Value = TTData.Other_tickets_cost_credit;
            ASPxSpinOtherTickets_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinOfficeExpenses.Value = TTData.Office_expenses_cost;
            ASPxSpinOfficeExpenses.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinOfficeExpenses_credit.Value = TTData.Office_expenses_cost_credit;
            ASPxSpinOfficeExpenses_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            // Costs + out of base

            ASPxCheckOut.Value = TTData.Out_of_base;
            ASPxCheckOut.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinMeals.Value = TTData.Out_of_base_meals_cost;
            ASPxSpinMeals.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            // Costs + overnight

            ASPxCheckOvernight.Value = TTData.Overnight;
            ASPxCheckOvernight.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinOvernight.Value = TTData.Out_of_base_overnight_cost;
            ASPxSpinOvernight.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinOvernight_credit.Value = TTData.Out_of_base_overnight_cost_credit;
            ASPxSpinOvernight_credit.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;


            ASPxLabelTotalCost.Text = Convert.ToString(Math.Round(TTData.Gas_cost + TTData.Toll_cost + TTData.Consumambles_cost + TTData.Out_of_base_meals_cost + TTData.Out_of_base_overnight_cost + TTData.Taxi_cost + TTData.Parking_cost + TTData.Other_car_expenses_cost + TTData.Ferry_tickets_cost + TTData.Ferry_car_limit_violation_cost + TTData.Airline_tickets_cost + TTData.Airline_overweight_cost + TTData.Other_tickets_cost + TTData.Office_expenses_cost, 2));
            ASPxLabelTotalCostCredit.Text = Convert.ToString(Math.Round(TTData.Gas_cost_credit + TTData.Toll_cost_credit  + TTData.Consumambles_cost_credit + TTData.Out_of_base_overnight_cost_credit + TTData.Taxi_cost_credit + TTData.Parking_cost_credit + TTData.Other_car_expenses_cost_credit + TTData.Ferry_tickets_cost_credit + TTData.Ferry_car_limit_violation_cost_credit + TTData.Airline_tickets_cost_credit + TTData.Airline_overweight_cost_credit + TTData.Other_tickets_cost_credit + TTData.Office_expenses_cost_credit, 2));
            ASPxLabelTotalCost0.Text = (Convert.ToDecimal(ASPxLabelTotalCost.Text) + Convert.ToDecimal(ASPxLabelTotalCostCredit.Text)).ToString();


            // Overtimes

            List<string> mRoles = (List<string>)Global.CustomSession["Roles"];
            
            ASPxCheckOvertime.Value = TTData.Overtime;
            //ASPxCheckOvertime.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinOvertime.Value = TTData.Overtime_hours;
            //ASPxSpinOvertime.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            //if (!mRoles.Contains("Expenses Control") || !TTData.Hidden_claimed_by_me)
            //{
            //    ASPxCheckOvertime.Enabled = false;
            //    ASPxSpinOvertime.Enabled = false;
            //}


            ASPxMemoOvertimeComments.Text = TTData.Overtime_comments;
            
            //ASPxMemoOvertimeComments.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;
            
            // AN TO EXO EGO KAI EIMAI TEAM OR MOU TO EXEI STEILEI PISO O EXPENSES CONTROL - DEN PREPEI NA TA ALLAZEI O EXPENSES CONTROL KAI O FINANCIAL MANAGER

            ASPxCheckOvertime.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || (TTData.Hidden_edit_expenses_right && (!mRoles.Contains("Expenses Control")) && (!mRoles.Contains("Financial Manager")));
            ASPxSpinOvertime.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || (TTData.Hidden_edit_expenses_right && (!mRoles.Contains("Expenses Control")) && (!mRoles.Contains("Financial Manager"))); ;
            ASPxMemoOvertimeComments.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || (TTData.Hidden_edit_expenses_right && (!mRoles.Contains("Expenses Control")) && (!mRoles.Contains("Financial Manager"))); ;



            // Advance
            ASPxCheckAdvance.Value = TTData.Advance;
            ASPxCheckAdvance.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxSpinAdvance.Value = TTData.Advance_amount;
            ASPxSpinAdvance.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_expenses_right;

            ASPxLabelCostMinusAdvance.Text = Convert.ToString(Math.Round(TTData.Gas_cost + TTData.Toll_cost + TTData.Consumambles_cost + TTData.Out_of_base_meals_cost + TTData.Out_of_base_overnight_cost + TTData.Taxi_cost + TTData.Parking_cost + TTData.Other_car_expenses_cost + TTData.Ferry_tickets_cost + TTData.Ferry_car_limit_violation_cost + TTData.Airline_tickets_cost + TTData.Airline_overweight_cost + TTData.Other_tickets_cost + TTData.Office_expenses_cost - TTData.Advance_amount, 2));
            
            

            // Team Costs
            
            ASPxLabelGas.Value = TTData.Gas_cost_team;
            ASPxLabelGas_credit.Value = TTData.Gas_cost_credit_team;
            ASPxLabelToll.Value = TTData.Toll_cost_team;
            ASPxLabelToll_credit.Value = TTData.Toll_cost_credit_team;
            ASPxLabelConsumables.Value = TTData.Consumambles_cost_team;
            ASPxLabelConsumables_credit.Value = TTData.Consumambles_cost_credit_team;
            ASPxLabelTaxi.Value = TTData.Taxi_cost_team;
            ASPxLabelTaxi_credit.Value = TTData.Taxi_cost_credit_team;
            ASPxLabelParking.Value = TTData.Parking_cost_team;
            ASPxLabelParking_credit.Value = TTData.Parking_cost_credit_team;
            ASPxLabelOtherCarExpenses.Value = TTData.Other_car_expenses_cost_team;
            ASPxLabelOtherCarExpenses_credit.Value = TTData.Other_car_expenses_cost_credit_team;
            ASPxLabelFerryTickets.Value = TTData.Ferry_tickets_cost_team;
            ASPxLabelFerryTickets_credit.Value = TTData.Ferry_tickets_cost_credit_team;
            ASPxLabelFerryCarLimitViolation.Value = TTData.Ferry_car_limit_violation_cost_team;
            ASPxLabelFerryCarLimitViolation_credit.Value = TTData.Ferry_car_limit_violation_cost_credit_team;
            ASPxLabelAirlineTickets.Value = TTData.Airline_tickets_cost_team;
            ASPxLabelAirlineTickets_credit.Value = TTData.Airline_tickets_cost_credit_team;
            ASPxLabelAirlineOverweight.Value = TTData.Airline_overweight_cost_team;
            ASPxLabelAirlineOverweight_credit.Value = TTData.Airline_overweight_cost_credit_team;
            ASPxLabelOtherTickets.Value = TTData.Other_tickets_cost_team;
            ASPxLabelOtherTickets_credit.Value = TTData.Other_tickets_cost_credit_team;
            ASPxLabelOfficeExpenses.Value = TTData.Office_expenses_cost_team;
            ASPxLabelOfficeExpenses_credit.Value = TTData.Office_expenses_cost_credit_team;
            ASPxLabelMeals.Value = TTData.Out_of_base_meals_cost_team;
            ASPxLabelOvernight.Value = TTData.Out_of_base_overnight_cost_team;
            ASPxLabelOvernight_credit.Value = TTData.Out_of_base_overnight_cost_credit_team;
            ASPxLabelOvertime.Value = TTData.Overtime_hours_team;
            ASPxLabelAdvance.Value = TTData.Advance_amount_team;


            // Engineer comments
            ASPxMemoEngineerComments.Text = TTData.Engineer_comments;
            ASPxMemoEngineerComments.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;
        }

        private void BindVisits()
        {
            if (TTData != null)
            {
                // Engineers
                DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_TT_View_User", new string[2] { "@team_id", "@user_id" }, new Object[2] { TTData.Hidden_cur_team_id, TTData.Hidden_assigned_user_id });
                for (int i = 0; i < mDataTable.Rows.Count; i++)
                {
                    ASPxComboEngineer1.Items.Add(mDataTable.Rows[i][0].ToString(), mDataTable.Rows[i][1]);
                }

                if (TTData.Hidden_assigned_user_id != 0)
                {
                    ASPxComboEngineer1.SelectedIndex = ASPxComboEngineer1.Items.FindByValue(TTData.Hidden_assigned_user_id).Index;
                }
                ASPxComboEngineer1.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;

                //DataTable mDataTable2 = Global.ExecuteStoredProcedure("Edit_TT_View_Current_Team_Members ", new string[1] { "@TEAM_ID" }, new Object[1] { TTData.Hidden_cur_team_id });
                //for (int i = 0; i < mDataTable2.Rows.Count; i++)
                //{
                //    ASPxComboEngineer2.Items.Add(mDataTable2.Rows[i][0].ToString(), mDataTable2.Rows[i][1]);
                //}

                //if (TTData.Hidden_assigned_user_id2 != 0)
                //{
                //    if (ASPxComboEngineer1.Items.FindByValue(TTData.Hidden_assigned_user_id2) != null)
                //    {
                //        ASPxComboEngineer2.SelectedIndex = ASPxComboEngineer1.Items.FindByValue(TTData.Hidden_assigned_user_id2).Index;
                //    }
                //    else
                //    {
                //        ListEditItem mItem = new ListEditItem(TTData.Assigned_user2, TTData.Hidden_assigned_user_id2);
                //        ASPxComboEngineer2.Items.Add(mItem);
                //        ASPxComboEngineer2.SelectedItem = mItem;
                //    }
                //}
                //ASPxComboEngineer2.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;


                DataTable mDataTable2 = Global.ExecuteStoredProcedure("Edit_TT_View_Current_Team_Members_Plus_User", new string[2] { "@team_id", "@user_id" }, new Object[2] { TTData.Hidden_cur_team_id, TTData.Hidden_assigned_user_id2 });
                for (int i = 0; i < mDataTable2.Rows.Count; i++)
                {
                    ASPxComboEngineer2.Items.Add(mDataTable2.Rows[i][0].ToString(), mDataTable2.Rows[i][1]);
                }

                if (TTData.Hidden_assigned_user_id2 != 0)
                {
                    ASPxComboEngineer2.SelectedIndex = ASPxComboEngineer2.Items.FindByValue(TTData.Hidden_assigned_user_id2).Index;
                }
                ASPxComboEngineer2.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;

                // Vehicle
                if (ASPxComboVehicle.Items.Count == 0)
                {
                    DataTable mDataTable4 = Global.ExecuteStoredProcedure("Edit_SCH_Vehicle_list", new string[1] { "@Team_id" }, new Object[1] { TTData.Hidden_cur_team_id });
                    for (int i = 0; i < mDataTable4.Rows.Count; i++)
                    {
                        ASPxComboVehicle.Items.Add(mDataTable4.Rows[i][0].ToString(), mDataTable4.Rows[i][1]);
                    }

                    if (TTData.Vehicle_id != 0)
                    {
                        if (ASPxComboVehicle.Items.FindByValue(TTData.Vehicle_id) != null)
                        {
                            ASPxComboVehicle.SelectedIndex = ASPxComboVehicle.Items.FindByValue(TTData.Vehicle_id).Index;
                        }
                        else
                        {
                            ListEditItem mItem = new ListEditItem(TTData.Vehicle_number, TTData.Vehicle_id);
                            ASPxComboVehicle.Items.Add(mItem);
                            ASPxComboVehicle.SelectedItem = mItem;
                        }
                    }
                    ASPxComboVehicle.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_distance_right;
                }
                if (TTData.Vehicle_4x4 == true) { ASPxLabelVehicle.Text = TTData.Vehicle_type + ", 4x4"; } else { ASPxLabelVehicle.Text = TTData.Vehicle_type; };
                ASPxLabelVehicle.Enabled = TTData.Hidden_claimed_by_me;
                // Departure
                if (TTData.Departure_date != Convert.ToDateTime("01/01/1900"))
                {
                    ASPxDateEditDeparture.Value = TTData.Departure_date;
                }
                ASPxDateEditDeparture.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;

                ASPxMemoDeparture.Text = TTData.Departure_comments;
                ASPxMemoDeparture.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;

                // Spare Parts Warehouse
                ASPxListBox mlistBox = (ASPxListBox)ASPxDropDownSpareParts.FindControl("listBoxspareparts");
                if (mlistBox.Items.Count == 1)
                {
                    DataTable mDataTable3 = Global.ExecuteStoredProcedure("Edit_SCH_SparePartsWarehouse_list", new string[0] { }, new Object[0] { });
                    for (int i = 0; i < mDataTable3.Rows.Count; i++)
                    {
                        mlistBox.Items.Add(mDataTable3.Rows[i][0].ToString(), mDataTable3.Rows[i][0]);
                    }

                    if (TTData.Spare_parts != "") //??
                    {
                        string[] mselected = TTData.Spare_parts_return.Split(new char[1] { ';' });
                        for (int n = 0; n < mselected.Length; n++)
                        {
                            mlistBox.SelectedItem = mlistBox.Items.FindByValue(TTData.Spare_parts);
                        }
                    }
                    ASPxDropDownSpareParts.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;
                }

                ASPxDropDownSpareParts.Value = TTData.Spare_parts;
                ASPxDropDownSpareParts.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;

            // Return to base km
                ASPxSpinReturnToHome.Value = TTData.Return_to_base_km;
                ASPxSpinReturnToHome.Enabled = (TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right) || TTData.Hidden_edit_distance_right;
            
            // Return Date

                if (TTData.Return_date != Convert.ToDateTime("01/01/1900"))
                {
                    ASPxDateEditReturn.Value = TTData.Return_date;
                }
                ASPxDateEditReturn.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;

              // Spare Parts Warehouse Return
                ASPxListBox mListbox = (ASPxListBox)ASPxDropDownSparePartsRet.FindControl("listBoxsparepartsret");
                if (mListbox.Items.Count == 1)
                {
                    DataTable mDataTable5 = Global.ExecuteStoredProcedure("Edit_SCH_SparePartsWarehouse_list", new string[0] { }, new Object[0] { });
                    for (int i = 0; i < mDataTable5.Rows.Count; i++)
                    {
                        mListbox.Items.Add(mDataTable5.Rows[i][0].ToString(), mDataTable5.Rows[i][0]);
                    }

                    if (TTData.Spare_parts_return != "")
                    {
                        string[] mselected = TTData.Spare_parts_return.Split(new char[1]{';'});
                        for (int n = 0; n < mselected.Length; n++)
                        {
                            mListbox.SelectedItem = mListbox.Items.FindByValue(TTData.Spare_parts_return);
                        }
                    }
                    ASPxDropDownSparePartsRet.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;
                }
                ASPxDropDownSparePartsRet.Value = TTData.Spare_parts_return;
                ASPxDropDownSparePartsRet.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;
            }
        }

        private void BindTTDescriptionButtons()
        {
            //ASPxButtonUpdateProblem.Enabled = false;
            (ASPxGridViewProblems.Columns["CommandButtons"] as GridViewCommandColumn).ShowEditButton = false;   
            bool mClaimedByMe = TTData.Hidden_claimed_by_me;
            bool mEditRight = TTData.Hidden_edit_right;
            bool mUpdateProblemRight = TTData.Hidden_update_problem_right;
            DataTable mDataTable = (DataTable)ASPxGridViewProblems.DataSource;
            if ((mClaimedByMe && !mEditRight && mUpdateProblemRight) || (mClaimedByMe && mEditRight))
            {
                //ASPxButtonUpdateProblem.Enabled = true;
                (ASPxGridViewProblems.Columns["CommandButtons"] as GridViewCommandColumn).ShowEditButton = true;
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
        }

        protected void ASPxCallbackComlpeteButton_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (TTData.Hidden_edit_right)
            {
                if (Global.ExecuteStoredProcedureScalar("Edit_SCH_Validate_Schedule", new string[1] { "TT_ID" }, new object[1] { TTData.TT_id }).ToString() == "0")
                {
                    Global.ExecuteStoredProcedure("Edit_SCH_Complete_Button", new string[2] { "@tt_id", "@user_id" }, new Object[2] { TT_ID, Global.CustomSession["UserId"] });
                    //TTData = null; // refresh TT Data
                    Global.CustomSession["CompleteClicked"] = true;
                }
            }

            else
            {
                Global.ExecuteStoredProcedure("Edit_SCH_Complete_Button", new string[2] { "@tt_id", "@user_id" }, new Object[2] { TT_ID, Global.CustomSession["UserId"] });
                //TTData = null; // refresh TT Data
                Global.CustomSession["CompleteClicked"] = true;
            }
        }

        protected void ASPxCallbackReleaseButton_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {

            string TeamName = Global.ExecuteStoredProcedureScalar("Edit_TT_SelectedTeamName", new string[1] { "@team_id" }, new object[1] { e.Parameter }).ToString();

            if ((TTData.Hidden_edit_right) && (TeamName!= "Dispatcher"))  /* Pare mia customia*/
            {
                
                if (Global.ExecuteStoredProcedureScalar("Edit_SCH_Validate_Schedule", new string[1] { "TT_ID" }, new object[1] { TTData.TT_id }).ToString() == "0")
                {
                    Global.ExecuteStoredProcedure("Edit_SCH_Release_Button", new string[3] { "@tt_id", "@user_id", "@team_to_send_id" }, new Object[3] { TT_ID, Global.CustomSession["UserId"], e.Parameter });
                    //TTData = null; // refresh TT Data
                    Global.CustomSession["ReleaseClicked"] = true;
                }
            }

            else
            {
                Global.ExecuteStoredProcedure("Edit_SCH_Release_Button", new string[3] { "@tt_id", "@user_id", "@team_to_send_id" }, new Object[3] { TT_ID, Global.CustomSession["UserId"], e.Parameter });
                //TTData = null; // refresh TT Data
                Global.CustomSession["ReleaseClicked"] = true;
            }
        }


        protected void ASPxCallbackClaimButton_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (TTData != null)
            {
                Global.ExecuteStoredProcedure("Edit_SCH_Claim_Button", new string[3] { "@tt_id", "@user_id", "@stamp" }, new Object[3] { TT_ID, Global.CustomSession["UserId"], TTData.Stamp });
                //TTData = null;
            }
        }

        protected void ASPxGridViewInterventions_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

        protected void ASPxGridViewProblems_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //string[] mdel = ((string)e.NewValues[1]).Split(new char[1] { '%' });
            //object ceasetime = null;
            //if (e.NewValues[3] == null)
            //{
            //    ceasetime = System.DBNull.Value;
            //}
            //else
            //{
            //    ceasetime = e.NewValues[3];
            //}
            //Global.ExecuteStoredProcedureNoResults("Edit_TT_View_Problems_New", new string[6] { "@TT_ID", "@PROBLEM_ID", "@EVENT_TIME", "@CEASED_TIME", "@USER_ID" , "@SEVERITY"},
            //                                                     new Object[6] { Global.CustomSession["TTID"], mdel[1], e.NewValues["EVENT_TIME"], ceasetime, Global.CustomSession["UserId"] , e.NewValues["SEVERITY"]});
            //((ASPxGridView)sender).CancelEdit();
            //e.Cancel = true;
            //ASPxGridViewProblemsDataBind(true);
        }

        protected void ASPxGridViewProblems_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //int id = (int)ASPxGridViewProblems.GetRowValues(ASPxGridViewProblems.FocusedRowIndex, "Hidden_id");
            //Global.ExecuteStoredProcedureNoResults("Edit_TT_View_Problems_Update", new string[4] { "@TT_ID", "@ID", "@CEASED_TIME", "@USER_ID" }, 
            //                                                                        new Object[4] { Global.CustomSession["TTID"], id, e.NewValues["CEASED_TIME"], Global.CustomSession["UserId"] });
            //((ASPxGridView)sender).CancelEdit();
            //e.Cancel = true;
            //ASPxGridViewProblemsDataBind(true);
            //DataTable mdataTable = Global.ExecuteStoredProcedure("Edit_SCH_View_SCH_info", new string[2] { "@sch_id", "@user_id" }, new Object[2] { Global.CustomSession["TTID"], Global.CustomSession["UserId"] });
            //TTData = new SchDetails(mdataTable.Rows[0]);

            SchDetails mSchDetails = TTData;
            Global.ExecuteStoredProcedureNoResults("Edit_SCH_View_Problems_Update", new string[9] { "@ID", "@SITE_TYPE_ID", "@ARRIVAL_DATE", "@DEPARTURE_DATE", "@DISTANCE_TO_SITE", "@SITE_COMMENTS", "@SOLVED", "@VISIT", "@FOUR_WHEEL" },
              new Object[9] { e.Keys[0], e.NewValues["SITE_TYPE"], e.NewValues["ARRIVAL_DATE"], e.NewValues["DEPARTURE_DATE"], e.NewValues["DISTANCE_TO_SITE"], e.NewValues["SITE_COMMENTS"], e.NewValues["SOLVED"], e.NewValues["VISIT"], e.NewValues["FOUR_WHEEL"] });
            ((ASPxGridView)sender).CancelEdit();
            //m_InterventionsUpdate = true;
            ASPxGridViewProblemsDataBind(true);
            //BindGeneralInformation();
            e.Cancel = true;
        }

        protected void ASPxGridViewProblems_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            DataTable mDataTable = (DataTable)ASPxGridViewProblems.DataSource;
            if (mDataTable == null)
            {
                ASPxGridViewProblemsDataBind(false);
                mDataTable = (DataTable)ASPxGridViewProblems.DataSource;
            }

            if (mDataTable != null)
            {
                e.Properties["cpRowCount"] = mDataTable.Rows.Count;
            }
            else
            {
                e.Properties["cpAddedRowCount"] = 0;
                e.Properties["cpRowCount"] = 0;
                e.Properties["cpLatitude"] = null;
                e.Properties["cpLongitude"] = null;
            }

            ASPxComboBox mItemRelease = (ASPxComboBox)ASPxComboEngineer1;
            e.Properties["cpEditable"] = mItemRelease.Enabled;
            if (TTData != null)
            {
                e.Properties["cpCompletionRight"] = TTData.Hidden_completion_right;
                e.Properties["cpValidate"] = TTData.Hidden_edit_right;
                e.Properties["cpEditDistance"] = TTData.Hidden_edit_distance_right;
                e.Properties["cpEditExpenses"] = TTData.Hidden_edit_expenses_right;
                decimal total = 0;
                for (int n=0; n<mDataTable.Rows.Count;n++)
                {
                    total = total +Convert.ToDecimal(mDataTable.Rows[n]["DISTANCE_TO_SITE"]);
                }
                e.Properties["cpTotalKM"] = total;
            }
        }

        protected void ASPxGridViewInterventions_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            switch (e.Column.FieldName)
            {
                case "Team":
                    {
                        SchDetails mSchDetails = TTData;
                        if (mSchDetails != null)
                        {
                            ASPxTextBox mTextBox = (ASPxTextBox)e.Editor;
                            DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_TT_SelectedTeamName", new string[1] { "@team_id" }, new Object[1] { mSchDetails.Hidden_cur_team_id });
                            mTextBox.Text = mDataTable.Rows[0][0].ToString();
                            e.Column.ReadOnly = true;
                        }
                    }
                    break;
                default:
                    break;
            }
        }

        protected void ASPxGridViewInterventions_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            SchDetails mSchDetails = TTData;
            Global.ExecuteStoredProcedureNoResults("Edit_SCH_Comments_New_Update", new string[5] { "@ID", "@SCH_ID", "@USER_ID", "@TEAM_ID", "@COMMENT"},
                                            new Object[5] { System.DBNull.Value, mSchDetails.TT_id, Global.CustomSession["UserId"], mSchDetails.Hidden_cur_team_id, e.NewValues["Comments"]});
            m_InterventionsUpdate = true;
            ((ASPxGridView)sender).CancelEdit();
            ASPxGridViewInterventionsDataBind(true);
            BindGeneralInformation();
            e.Cancel = true;
        }

        protected void ASPxGridViewInterventions_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Edit_SCH_Comments_New_Update", new string[5] { "@ID", "@SCH_ID", "@USER_ID", "@TEAM_ID", "@COMMENT" },
                                            new Object[5] { e.Keys[0], TTData.TT_id, Global.CustomSession["UserId"], TTData.Hidden_cur_team_id, e.NewValues["Comments"] });
            ((ASPxGridView)sender).CancelEdit();
            m_InterventionsUpdate = true;
            ASPxGridViewInterventionsDataBind(true);
            BindGeneralInformation();
            e.Cancel = true;
        }

        protected void ASPxGridViewInterventions_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Edit_SCH_Comments_Delete", new string[1] { "@ID" }, new Object[1] { e.Keys[0] });
            m_InterventionsUpdate = true;
            ((ASPxGridView)sender).CancelEdit();
            ASPxGridViewInterventionsDataBind(true);
            BindGeneralInformation();
            e.Cancel = true;
        }

        private void ASPxGridViewProblemsDataBind(bool aUpdate)
        {
            Debug.WriteLine("ASPxGridViewProblemsDataBind()");
            if (aUpdate)
            {
                DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_SCH_View_Problems", new string[1] { "@TT_ID" }, new Object[1] { TTData.TT_id });
                ASPxGridViewProblems.DataSource = mDataTable;
                Global.CustomSession["ASPxGridViewProblemsDataTable"] = mDataTable;
                ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ASPxGridViewProblemsDataTable");
                ASPxGridViewProblems.DataBind();
            }
            else
            {
                ASPxGridViewProblems.DataSource = (DataTable)Global.CustomSession["ASPxGridViewProblemsDataTable"];
                ASPxGridViewProblems.DataBind();
            }
        }

        private void ASPxGridViewInterventionsDataBind(bool aUpdate)
        {
            if (aUpdate)
            {
                Debug.WriteLine("ASPxGridViewInterventionsDataBind()");
                DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_SCH_View_Comments", new string[2] { "@sch_id", "@user_id" }, new Object[2] { TTData.TT_id, Global.CustomSession["UserId"] });
                Global.CustomSession["ASPxGridViewInterventionsDataTable"] = mDataTable;
                ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("ASPxGridViewInterventionsDataTable");
                ASPxGridViewInterventions.DataSource = mDataTable;
                ASPxGridViewInterventions.DataBind();
            }
            else
            {
                ASPxGridViewInterventions.DataSource = (DataTable)Global.CustomSession["ASPxGridViewInterventionsDataTable"];
                ASPxGridViewInterventions.DataBind();
            }
        }

        private void ASPxGridViewRoutingHistoryDataBind()
        {
            Debug.WriteLine("ASPxGridViewRoutingHistoryDataBind()");
            ASPxGridViewRoutingHistory.DataSource = Global.ExecuteStoredProcedure("Edit_TT_View_RoutingHistory", new string[1] { "@TT_ID" }, new Object[1] { TTData.TT_id });
            ASPxGridViewRoutingHistory.DataBind();
        }

        private void ASPxGridRelatedTicketsDataBind()
        {
            Debug.WriteLine("ASPxGridRelatedTicketsDataBind()");
            ASPxGridViewRelatedTickets.DataSource = Global.ExecuteStoredProcedure("View_Location_History_SCHs_Multi", new string[1] {"@ID" }, new Object[1] { TTData.TT_id });
            ASPxGridViewRelatedTickets.DataBind();
        }

        private bool m_InterventionsUpdate = false;
        protected void ASPxGridViewInterventions_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            e.Properties["cpUpdate"] = m_InterventionsUpdate;
            DataTable mDataSource = ((DataTable)ASPxGridViewInterventions.DataSource);
            e.Properties["cpRowCount"] = mDataSource == null ? 0 : mDataSource.Rows.Count;
            e.Properties["cpAllowEdit"] = TTData.Hidden_intervention_update_right && TTData.Hidden_claimed_by_me;
            e.Properties["cpAllowNewIntervention"] = e.Properties["cpAllowNewIntervention"] = TTData.Hidden_new_intervention_right;
        }

        protected void ASPxCallbackVisibleIndex_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)Global.FindControlRecursive(this.Page, Global.CustomSession["Grid"].ToString());
            int vindex = mGrid.FindVisibleIndexByKeyValue(TTData.TT_id);
            e.Result = vindex.ToString();
        }

        private void ASPxGridViewAttachmentsDataBind()
        {
            Debug.WriteLine("ASPxGridViewPendingsDataBind");
            DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_TT_View_Attachments", new string[2] { "@TT_ID", "@user_id" }, new Object[2] { TT_ID, Global.CustomSession["UserId"] });
            ASPxGridViewAttachments.DataSource = mDataTable;
            ASPxGridViewAttachments.DataBind();
        }

        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            TT_ID = (Guid)((GridViewDetailRowTemplateContainer)this.NamingContainer).KeyValue;
            RefreshTTData();
            Global.ExecuteStoredProcedureNoResults("Edit_TT_View_Attachments_Add", new string[5] { "@id", "@team_id", "@user_id", "@attachment", "@name_of" },
                new Object[5] { (Guid)((GridViewDetailRowTemplateContainer)this.NamingContainer).KeyValue, TTData.Hidden_cur_team_id, Global.CustomSession["UserId"], e.UploadedFile.FileBytes, e.UploadedFile.FileName });
        }

        protected void ASPxGridViewAttachments_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            DataTable mDataTable = (DataTable)ASPxGridViewAttachments.DataSource;
            if (mDataTable != null)
            {
                e.Properties["cpRowCount"] = mDataTable.Rows.Count;
            }
            e.Properties["cpAllowInsert"] = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;
        }

        protected void ASPxGridViewAttachments_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Edit_TT_View_Attachments_Delete", new string[1] { "@Hidden_attacment_id" }, new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
            ASPxGridViewAttachmentsDataBind();
        }

        protected void ASPxGridViewInterventions_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == ColumnCommandButtonType.Edit || e.ButtonType == ColumnCommandButtonType.Delete)
            {
                e.Visible = CommandButtonVisibleCriteria_EditDeleteInterventions((ASPxGridView)sender, e.VisibleIndex);
            }
        }

        private bool CommandButtonVisibleCriteria_EditDeleteInterventions(ASPxGridView grid, int visibleIndex)
        {
            if ((visibleIndex == -1) || (TTData == null)) return false;
            bool persistentValue = (Convert.ToBoolean(grid.GetRowValues(visibleIndex, "Hidden_update_right")) && TTData.Hidden_claimed_by_me);
            return persistentValue == true;
        }

        protected void ASPxGridViewAttachments_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == ColumnCommandButtonType.Delete)
            {
                e.Visible = CommandButtonVisibleCriteria_DeleteAttachment((ASPxGridView)sender, e.VisibleIndex);
            }
        }

        private bool CommandButtonVisibleCriteria_DeleteAttachment(ASPxGridView grid, int visibleIndex)
        {
            if ((visibleIndex == -1) || (TTData == null)) return false;
            bool persistentValue = (Convert.ToBoolean(grid.GetRowValues(visibleIndex, "Hidden_delete_right")) && TTData.Hidden_claimed_by_me);
            return persistentValue == true;
        }

        protected void ASPxMenuAttachment_Init(object sender, EventArgs e)
        {
            if (TTData != null)
            {
                DevExpress.Web.MenuItem mItemNewAttachment = ASPxMenuAttachment.Items.FindByName("AddAttachment");
                mItemNewAttachment.Enabled = TTData.Hidden_claimed_by_me && TTData.Hidden_edit_right;
            }              
        }

        protected void ASPxCallbackSaveSchedule_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Edit_SCH_Update",
                new string[47] { 
                    "@ID",
                    "@ASSIGNED_USER_ID",
                    "@ASSIGNED_USER_ID2",
                    "@DEPARTURE_DATE",
                    "@DEPARTURE_COMMENTS",
                    "@SPARE_PARTS",
                    "@VEHICLE_ID",
                    "@RETURN_TO_BASE_KM",
                    "@START_KM_INDIC",
                    "@END_KM_INDIC",
                    "@GAS_COST",
                    "@TOLL_COST",
                    "@CONSUMABLES_COST",
                    "@OUT_OF_BASE",
                    "@OUT_OF_BASE_MEALS_COST",
                    "@OVERNIGHT",
                    "@OUT_OF_BASE_OVERNIGHT_COST",
                    "@OVERTIME",
                    "@OVERTIME_HOURS",
                    "@OVERTIME_COMMENTS",
                    "@ADVANCE",
                    "@ADVANCE_AMOUNT",
                    "@ENGINEER_COMMENTS",
                    "@RETURN_DATE",
                    "@SPARE_PARTS_RETURN",
                    "@GAS_COST_CREDIT",
                    "@CONSUMABLES_COST_CREDIT",
                    "@OUT_OF_BASE_OVERNIGHT_COST_CREDIT",
                    "@TAXI" ,
                    "@TAXI_CREDIT" ,
                    "@PARKING" ,
                    "@PARKING_CREDIT" ,
                    "@OTHER_CAR_EXPENSES" ,
                    "@OTHER_CAR_EXPENSES_CREDIT" ,
                    "@FERRY_TICKETS" ,
                    "@FERRY_TICKETS_CREDIT" ,
                    "@FERRY_CAR_LIMIT_VIOLATION" ,
                    "@FERRY_CAR_LIMIT_VIOLATION_CREDIT" ,
                    "@AIRLINE_TICKETS" ,
                    "@AIRLINE_TICKETS_CREDIT" ,
                    "@AIRLINE_OVERWEIGHT" ,
                    "@AIRLINE_OVERWEIGHT_CREDIT" ,
                    "@OTHER_TICKETS" ,
                    "@OTHER_TICKETS_CREDIT" ,
                    "@OFFICE_EXPENSES" ,
                    "@OFFICE_EXPENSES_CREDIT",
                    "@TOLL_COST_CREDIT"},

                new Object[47] {
                    TTData.TT_id,
                    ASPxComboEngineer1.Value,
                    ASPxComboEngineer2.Value,
                    ASPxDateEditDeparture.Value,
                    ASPxMemoDeparture.Text,
                    ASPxDropDownSpareParts.Value,
                    ASPxComboVehicle.Value,
                    ASPxSpinReturnToHome.Value,
                    ASPxSpinStart.Value,
                    ASPxSpinEnd.Value,
                    ASPxSpinGas.Value,
                    ASPxSpinToll.Value, 
                    ASPxSpinConsumables.Value, 
                    ASPxCheckOut.Value, 
                    ASPxSpinMeals.Value, 
                    ASPxCheckOvernight.Value, 
                    ASPxSpinOvernight.Value, 
                    ASPxCheckOvertime.Value, 
                    ASPxSpinOvertime.Value,
                    ASPxMemoOvertimeComments.Text, 
                    ASPxCheckAdvance.Value, 
                    ASPxSpinAdvance.Value,
                    ASPxMemoEngineerComments.Text,
                    ASPxDateEditReturn.Value,
                    ASPxDropDownSparePartsRet.Value,
                    ASPxSpinGas_credit.Value,
                    ASPxSpinConsumables_credit.Value, 
                    ASPxSpinOvernight_credit.Value, 
                    ASPxSpinTaxi.Value,
                    ASPxSpinTaxi_credit.Value,
                    ASPxSpinParking.Value,
                    ASPxSpinParking_credit.Value,
                    ASPxSpinOtherCarExpenses.Value,
                    ASPxSpinOtherCarExpenses_credit.Value,
                    ASPxSpinFerryTickets.Value,
                    ASPxSpinFerryTickets_credit.Value,
                    ASPxSpinFerryCarLimitViolation.Value,
                    ASPxSpinFerryCarLimitViolation_credit.Value,
                    ASPxSpinAirlineTickets.Value,
                    ASPxSpinAirlineTickets_credit.Value,
                    ASPxSpinAirlineOverweight.Value,
                    ASPxSpinAirlineOverweight_credit.Value,
                    ASPxSpinOtherTickets.Value,
                    ASPxSpinOtherTickets_credit.Value,
                    ASPxSpinOfficeExpenses.Value,
                    ASPxSpinOfficeExpenses_credit.Value,
                    ASPxSpinToll_credit.Value
                    });

            object value = ASPxSpinStart.Value;      
            //TTData = null;
        }

        protected void ASPxCallbackReject_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            Global.ExecuteStoredProcedure("Edit_SCH_Reject_Button", new string[2] { "@tt_id", "@user_id" }, new Object[2] { TT_ID, Global.CustomSession["UserId"] });
            //TTData = null; // refresh TT Data
            Global.CustomSession["RejectClicked"] = true;
        }

        protected void listBox_Init(object sender, EventArgs e)
        {
            ASPxListBox mListBox = (sender as ASPxListBox);
            //mCombo.ValueField = "Id";
            //mCombo.TextField = "Configuration_value";
            DataTable mDataTable = null;
            if (Global.CustomSession["Edit_SCH_InterventionCategory_list"] == null)
            {
                mDataTable = Global.ExecuteStoredProcedure("Edit_SCH_InterventionCategory_list", new string[0] { }, new Object[0] { });
                Global.CustomSession["Edit_SCH_InterventionCategory_list"] = mDataTable;
            }
            else
            {
                mDataTable = (DataTable)Global.CustomSession["Edit_SCH_InterventionCategory_list"];
            }

            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                mListBox.Items.Add(mDataTable.Rows[i][0].ToString(), mDataTable.Rows[i][0].ToString());
            }
        }

        protected void listBoxinttype_Init(object sender, EventArgs e)
        {
            ASPxListBox mListBox = (sender as ASPxListBox);
            //mCombo.ValueField = "Id";
            //mCombo.TextField = "Configuration_value";
            DataTable mDataTable = null;
            if (Global.CustomSession["Edit_SCH_InterventionType_list"] == null)
            {
                mDataTable = Global.ExecuteStoredProcedure("Edit_SCH_InterventionType_list", new string[0] { }, new Object[0] { });
                Global.CustomSession["Edit_SCH_InterventionType_list"] = mDataTable;
            }
            else
            {
                mDataTable = (DataTable)Global.CustomSession["Edit_SCH_InterventionType_list"];
            }

            for (int i = 0; i < mDataTable.Rows.Count; i++)
            {
                mListBox.Items.Add(mDataTable.Rows[i][0].ToString(), mDataTable.Rows[i][0].ToString());
            }
        }
        
        protected void ASPxComboBoxInterventionCategory_Init(object sender, EventArgs e)
        {
            ASPxComboBox mCombo = (sender as ASPxComboBox);
            mCombo.ValueField = "Id";
            mCombo.TextField = "Configuration_value";
            if (Global.CustomSession["Edit_SCH_InterventionCategory_list"] == null)
            {
                mCombo.DataSource = Global.ExecuteStoredProcedure("Edit_SCH_InterventionCategory_list", new string[0] { }, new Object[0] { });
                Global.CustomSession["Edit_SCH_InterventionCategory_list"] = mCombo.DataSource;
            }
            else
            {
                mCombo.DataSource = Global.CustomSession["Edit_SCH_InterventionCategory_list"];
            }
        }

        protected void ASPxComboBoxInterventionType_Init(object sender, EventArgs e)
        {
            ASPxComboBox mCombo = (sender as ASPxComboBox);
            mCombo.ValueField = "Id";
            mCombo.TextField = "Configuration_value";
            if (Global.CustomSession["Edit_SCH_InterventionType_list"] == null)
            {
                mCombo.DataSource = Global.ExecuteStoredProcedure("Edit_SCH_InterventionType_list", new string[0] { }, new Object[0] { });
                Global.CustomSession["Edit_SCH_InterventionType_list"] = mCombo.DataSource;
            }
            else
            {
                mCombo.DataSource = Global.CustomSession["Edit_SCH_InterventionType_list"];
            }
        }

        protected void ASPxComboBoxSiteType_Init(object sender, EventArgs e)
        {
            ASPxComboBox mCombo = (sender as ASPxComboBox);
            mCombo.ValueField = "Id";
            mCombo.TextField = "Configuration_value";
            if (Global.CustomSession["Edit_SCH_SiteType_list"] == null)
            {
                mCombo.DataSource = Global.ExecuteStoredProcedure("Edit_SCH_SiteType_list", new string[0] { }, new Object[0] { });
                Global.CustomSession["Edit_SCH_SiteType_list"] = mCombo.DataSource;
            }
            else
            {
                mCombo.DataSource = Global.CustomSession["Edit_SCH_SiteType_list"];
            }
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

        private void TicketsGridDataBind()
        {
            DataTable mDataTable = Global.ExecuteStoredProcedure("New_Schedule_Select_Ticket", null, null);
            mDataTable.PrimaryKey = new DataColumn[1] { mDataTable.Columns["TT_Id"] };
            ASPxGridViewTickets.DataSource = mDataTable;

            Global.CustomSession["TicketsTable"] = ASPxGridViewTickets.DataSource;
            ((SessionResourceTracker)Global.CustomSession["SessionResourceTracker"]).AddForCleanup("TicketsTable");
            ASPxGridViewTickets.DataBind();
        }

        protected void PopupControl_WindowCallback(object source, DevExpress.Web.PopupWindowCallbackArgs e)
        {
            if (Global.CustomSession["TicketsTable"] == null)
            {
                TicketsGridDataBind();
            }
            else
            {
                ASPxGridView mGrid = ((ASPxPopupControl)source).FindControl("ASPxGridViewTickets") as ASPxGridView;
                DataTable Source = (DataTable)Global.CustomSession["TicketsTable"];
                DataTable Target = (DataTable)Global.CustomSession["ScheduleProblemsTable"];
                if (Source != null && Target != null)
                {
                    mGrid.Selection.UnselectAll();
                    object key = null;
                    for (int n = 0; n < Target.Rows.Count; n++)
                    {
                        key = Target.Rows[n]["TT_Id"];
                        mGrid.Selection.SelectRowByKey(key);
                    }
                }
            }
        }

        protected void ASPxGridViewProblems_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
             string[] mArrayOfKeys = e.Parameters.Split(new char[1] { ',' });
             for (int n = 0; n < mArrayOfKeys.Length; n++)
             {
                 Global.ExecuteStoredProcedure("New_Schedule_Save_Schedule_Item", new string[3] { "@ID", "TT_ID", "@User_id" }, new Object[3] { TTData.TT_id, mArrayOfKeys[n], Global.CustomSession["UserId"] });
             }
             ASPxGridViewProblemsDataBind(true);
        }

        protected void ASPxCallbackAssign_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Edit_SCH_Assign", new string[3] { "@tt_id", "@user_id", "@calling_user_id" }, new Object[3] { TTData.TT_id, e.Parameter, Global.CustomSession["UserId"] });
        }

        protected void PopupControlAssign_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e)
        {
            e.Properties["cpButtonCount"] = ASPxRadioButtonList.Items.Count;
        }


        protected void ASPxGridViewProblems_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            string handlerfunction = @"function (s, e) 
            {
                if (e.htmlEvent.keyCode == 13) {        
                ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
            }}";

            e.Editor.SetClientSideEventHandler("KeyPress", handlerfunction);

            switch (e.Column.FieldName)
            {
                case "SITE_TYPE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_SCH_SiteType_list", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Configuration_value"].ToString(), mDataTable.Rows[i]["Id"]);
                        }

                        if (ASPxGridViewProblems.GetRowValues(ASPxGridViewProblems.FocusedRowIndex, "SITE_TYPE") != System.DBNull.Value)
                        {
                            string mid = (string)ASPxGridViewProblems.GetRowValues(ASPxGridViewProblems.FocusedRowIndex, "SITE_TYPE");

                            if (mid != null)
                            {
                                mCombobox.SelectedIndex = mCombobox.Items.FindByText(mid).Index;
                            }
                        }

                        if (TTData != null) { mCombobox.ReadOnly = !(TTData.Hidden_claimed_by_me & TTData.Hidden_edit_right); }
                    }
                    break;

                case "VISIT":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        if (TTData != null) { mCombobox.ReadOnly = !(TTData.Hidden_claimed_by_me & TTData.Hidden_edit_right); }
                    }
                    break;

                case "ARRIVAL_DATE":
                    {
                        ASPxDateEdit mCombobox = (ASPxDateEdit)e.Editor;
                        if (TTData != null) { mCombobox.ReadOnly = !(TTData.Hidden_claimed_by_me & TTData.Hidden_edit_right); }
                    }
                    break;

                case "DEPARTURE_DATE":
                    {
                        ASPxDateEdit mCombobox = (ASPxDateEdit)e.Editor;
                        if (TTData != null) { mCombobox.ReadOnly = !(TTData.Hidden_claimed_by_me & TTData.Hidden_edit_right); }
                    }
                    break;

                case "SITE_COMMENTS":
                    {
                        ASPxTextBox mCombobox = (ASPxTextBox)e.Editor;
                        if (TTData != null) { mCombobox.ReadOnly = !(TTData.Hidden_claimed_by_me & TTData.Hidden_edit_right); }
                    }
                    break;

                default:
                    break;
            }
        }

        protected void ASPxGridViewTickets_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            detailGrid.DataSource = Global.ExecuteStoredProcedure("Edit_SCH_View_Schedule_Item_Tickets_new", new string[1] { "@SCH_ITEM_ID" }, new Object[1] { keyValue });
        }

        protected void ASPxGridViewActions_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            detailGrid.DataSource = Global.ExecuteStoredProcedure("Edit_SCH_View_Schedule_Item_Actions", new string[1] { "@SCH_ITEM_ID" }, new Object[1] { keyValue });
        }

        protected void ASPxGridViewTickets_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            Global.ExecuteStoredProcedureNoResults("Edit_SCH_View_Schedule_Item_Tickets_Update", new string[2] { "@ID", "@SOLVED"},
              new Object[2] { e.Keys[0], e.NewValues["SOLVED"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
        }

        protected void ASPxGridViewActions_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            switch (e.Column.FieldName)
            {
                case "INTERVENTION_TYPE":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_SCH_InterventionType_list", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Configuration_value"].ToString(), mDataTable.Rows[i]["Configuration_value"]);
                        }
                    }
                    break;

                default:
                    break;
            }
        }

        protected void ASPxGridViewActions_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();

            Global.ExecuteStoredProcedureNoResults("Edit_SCH_View_Schedule_Item_Actions_Update_Insert", new string[5] { "@ID", "@SCH_ITEM_ID", "@INTERVENTION_TYPE", "@COMMENTS", "@CHARGEABLE"},
                new Object[5] { -1, keyValue, e.NewValues["INTERVENTION_TYPE"], e.NewValues["COMMENTS"], e.NewValues["CHARGEABLE"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
        }

        protected void ASPxGridViewActions_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            Global.ExecuteStoredProcedureNoResults("Edit_SCH_View_Schedule_Item_Actions_Update_Insert", new string[5] { "@ID", "@SCH_ITEM_ID", "@INTERVENTION_TYPE", "@COMMENTS", "@CHARGEABLE" },
                new Object[5] { e.Keys[0], keyValue, e.NewValues["INTERVENTION_TYPE"], e.NewValues["COMMENTS"], e.NewValues["CHARGEABLE"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
        }

        protected void ASPxGridViewActions_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Edit_SCH_View_Schedule_Item_Actions_Delete", new string[1] { "@ID"},
                new Object[1] { e.Keys[0]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
        }

        protected void ASPxMenuAddAction_Load(object sender, EventArgs e)
        {
            ASPxMenu mMenu = sender as ASPxMenu;
            if (TTData != null)
            {
                mMenu.Enabled = TTData.Hidden_claimed_by_me & TTData.Hidden_edit_right;
            }
            else
            { 
                mMenu.Enabled = false; 
            }
        }

        protected void ASPxGridViewTickets_Load(object sender, EventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;

            if (TTData != null)
            {
                mGrid.Columns[0].Visible = TTData.Hidden_claimed_by_me & TTData.Hidden_edit_right;
            }
            else
            {
                mGrid.Columns[0].Visible = false;
            }
        }

        protected void ASPxGridViewActions_Load(object sender, EventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            if (TTData != null)
            {
                mGrid.Columns[0].Visible = TTData.Hidden_claimed_by_me & TTData.Hidden_edit_right;
            }
            else
            {
                mGrid.Columns[0].Visible = false;
            }
        }

        protected void ASPxGridViewProblems_Load(object sender, EventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            if (TTData != null)
            {
                mGrid.Columns[0].Visible = TTData.Hidden_claimed_by_me & (TTData.Hidden_edit_right || TTData.Hidden_edit_distance_right);
            }
            else
            {
                mGrid.Columns[0].Visible = false;
            }
        }

        protected void ASPxGridViewInterventionsCategory_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            detailGrid.DataSource = Global.ExecuteStoredProcedure("Edit_SCH_View_Schedule_Item_Interventions", new string[1] { "@SCH_ITEM_ID" }, new Object[1] { keyValue });
        }

        protected void ASPxGridViewInterventionsCategory_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            switch (e.Column.FieldName)
            {
                case "INTERVENTION_CATEGORY":
                    {
                        ASPxComboBox mCombobox = (ASPxComboBox)e.Editor;
                        DataTable mDataTable = Global.ExecuteStoredProcedure("Edit_SCH_InterventionCategory_list", null, null);
                        for (int i = 0; i < mDataTable.Rows.Count; i++)
                        {
                            mCombobox.Items.Add(mDataTable.Rows[i]["Configuration_value"].ToString(), mDataTable.Rows[i]["Configuration_value"]);
                        }
                    }
                    break;

                default:
                    break;
            }
        }

        protected void ASPxGridViewInterventionsCategory_Load(object sender, EventArgs e)
        {
            ASPxGridView mGrid = (ASPxGridView)sender;
            if (TTData != null)
            {
                mGrid.Columns[0].Visible = TTData.Hidden_claimed_by_me & TTData.Hidden_edit_right;
            }
            else
            {
                mGrid.Columns[0].Visible = false;
            }
        }

        protected void ASPxGridViewInterventionsCategory_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Global.ExecuteStoredProcedureNoResults("Edit_SCH_View_Schedule_Item_Interventions_Delete", new string[1] { "@ID" }, new Object[1] { e.Keys[0] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
        }

        protected void ASPxGridViewInterventionsCategory_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();

            Global.ExecuteStoredProcedureNoResults("Edit_SCH_View_Schedule_Item_Interventions_Update_Insert", new string[3] { "@ID", "@SCH_ITEM_ID", "@INTERVENTION_CATEGORY"},
                new Object[3] { -1, keyValue, e.NewValues["INTERVENTION_CATEGORY"] });
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
        }

        protected void ASPxGridViewInterventionsCategory_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            object keyValue = detailGrid.GetMasterRowKeyValue();
            Global.ExecuteStoredProcedureNoResults("Edit_SCH_View_Schedule_Item_Interventions_Update_Insert", new string[3] { "@ID", "@SCH_ITEM_ID", "@INTERVENTION_CATEGORY"},
                new Object[3] { e.Keys[0], keyValue, e.NewValues["INTERVENTION_CATEGORY"]});
            ((ASPxGridView)sender).CancelEdit();
            e.Cancel = true;
        }

        protected void ASPxGridViewActions_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            if (e.RowType == DevExpress.Web.GridViewRowType.EmptyDataRow)
            {
                    e.Row.Controls[0].Visible = false;
            }
        }

        protected void ASPxGridViewInterventionsCategory_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            ASPxGridView detailGrid = sender as ASPxGridView;
            if (e.RowType == DevExpress.Web.GridViewRowType.EmptyDataRow)
            {
                e.Row.Controls[0].Visible = false;
            }
        }

        protected void ASPxGridViewTickets_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.GetValue("Tooltip") != null)
            {
                e.Row.ToolTip = e.GetValue("Tooltip").ToString();
            }
        }

        protected void ASPxPageControl1_ActiveTabChanged(object source, TabControlEventArgs e)
        {

        }

        protected void ASPxGridViewProblems_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if ((e.GetValue("SRIS") != null) && (e.DataColumn.FieldName == "Location"))
            {
                e.Cell.ToolTip = e.GetValue("SRIS").ToString();
            }

        }

    }
}


