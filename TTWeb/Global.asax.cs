using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;
using System.Web.UI.WebControls;
using System.Threading;
using DevExpress.Web;
using System.Collections;
using System.Web.Security;

namespace TTWeb
{
    public class User : Object
    {
        public int UserId { get; private set; }
        //public string Password { get; private set; }
        public string Username { get; private set; }
        public User(int aUserId, string aUserName/*, string aPassword*/)
        {
            UserId = aUserId;
            //Password = aPassword;
            Username = aUserName;
        }
    }

    public class MyCustomSession : object
    {
        private Dictionary<string, Dictionary<string, object>> m_Dictionary = new Dictionary<string, Dictionary<string, object>>();
        private ReaderWriterLockSlim m_ReaderWriterLock = new ReaderWriterLockSlim();
        public MyCustomSession()
        {

        }

        public object this[string aKey, string bKey]
        {
            get
            {
                try
                {
                    m_ReaderWriterLock.EnterReadLock();
                    if (m_Dictionary.ContainsKey(bKey))
                    {
                        m_ReaderWriterLock.ExitReadLock();
                        return m_Dictionary[aKey][bKey];
                    }
                    else
                    {
                        m_ReaderWriterLock.ExitReadLock();
                        return null;
                    }
                }
                catch (Exception m)
                {
                    if (m_ReaderWriterLock.IsReadLockHeld)
                    {
                        m_ReaderWriterLock.ExitReadLock();
                    }
                    return null;
                }
            }
            set
            {
                try
                {
                    m_ReaderWriterLock.EnterReadLock();
                    if (!m_Dictionary.ContainsKey(aKey))
                    {
                        m_ReaderWriterLock.ExitReadLock();
                        m_ReaderWriterLock.EnterWriteLock();
                        m_Dictionary.Add(aKey, new Dictionary<string, object>());
                        m_ReaderWriterLock.ExitWriteLock();
                    }
                    else
                    {
                        //m_ReaderWriterLock.EnterReadLock();
                        m_Dictionary[aKey][bKey] = value;
                        m_ReaderWriterLock.ExitReadLock();
                    }
                }
                catch (Exception m)
                {
                    if (m_ReaderWriterLock.IsReadLockHeld)
                    {
                        m_ReaderWriterLock.ExitReadLock();
                    }
                    if (m_ReaderWriterLock.IsWriteLockHeld)
                    {
                        m_ReaderWriterLock.ExitWriteLock();
                    }
                    throw new Exception("Invalid Session set operation");
                }
            }
        }

        public object this[string aKey]
        {
            get
            {
                try
                {
                    HttpCookie authCookie = HttpContext.Current.Request.Cookies["privateTT"];
                    Dictionary<string, object> mTargetDictionary = null;
                    m_ReaderWriterLock.EnterReadLock();
                    if (authCookie != null && m_Dictionary.TryGetValue(FormsAuthentication.Decrypt(authCookie.Value).UserData, out mTargetDictionary))
                    {
                        m_ReaderWriterLock.ExitReadLock();
                        if (mTargetDictionary.ContainsKey(aKey))
                        {
                            return mTargetDictionary[aKey];
                        }
                        else
                        {
                            return null;
                        }
                    }
                    else
                    {
                        m_ReaderWriterLock.ExitReadLock();
                        return null;
                    }
                }
                catch (Exception e)
                {
                    if (m_ReaderWriterLock.IsReadLockHeld)
                    {
                        m_ReaderWriterLock.ExitReadLock();
                    }
                    return null;
                }
            }
            set
            {
                try
                {
                    HttpCookie authCookie = HttpContext.Current.Request.Cookies["privateTT"];
                    Dictionary<string, object> mTargetDictionary = null;
                    m_ReaderWriterLock.EnterReadLock();
                    //Dictionary<string, object> mTargetDictionary = m_Dictionary[HttpContext.Current.Request.Cookies["privateTT"].Value.ToString()];
                    if (authCookie != null && m_Dictionary.TryGetValue(FormsAuthentication.Decrypt(authCookie.Value).UserData, out mTargetDictionary))
                    {
                        m_ReaderWriterLock.ExitReadLock();
                        if (!mTargetDictionary.ContainsKey(aKey))
                        {
                            mTargetDictionary.Add(aKey, new Dictionary<string, object>());
                        }
                        mTargetDictionary[aKey] = value;
                    }
                    else
                    {
                        m_ReaderWriterLock.ExitReadLock();
                        if (authCookie == null)
                        {
                            throw new Exception("NULL Authentication cookie");
                        }
                        throw new Exception("m_Dictionary.TryGetValue(FormsAuthentication.Decrypt(authCookie.Value).UserData, out mTargetDictionary) -- NO VALUE");
                    }
                }
                catch (Exception e)
                {
                    if (m_ReaderWriterLock.IsReadLockHeld)
                    {
                        m_ReaderWriterLock.ExitReadLock();
                    }
                }
            }
        }

        public void Remove(string aKey)
        {
            HttpCookie authCookie = HttpContext.Current.Request.Cookies["privateTT"];
            m_ReaderWriterLock.EnterWriteLock();
            m_Dictionary[FormsAuthentication.Decrypt(authCookie.Value).UserData].Remove(aKey);
            m_ReaderWriterLock.ExitWriteLock();
        }

        public void AddSession(string aKey)
        {
            m_ReaderWriterLock.EnterWriteLock();
            m_Dictionary.Add(aKey, new Dictionary<string, object>());
            m_ReaderWriterLock.ExitWriteLock();
        }

        public void RemoveSession(string aKey)
        {
            m_ReaderWriterLock.EnterWriteLock();
            Dictionary<string, object> mTargetDictionary = null;
            m_Dictionary.TryGetValue(aKey, out mTargetDictionary);
            if (mTargetDictionary != null)
            {
                mTargetDictionary.Clear();
                m_Dictionary.Remove(aKey);
            }
            m_ReaderWriterLock.ExitWriteLock();
        }

        public string SessionID
        {
            get
            {
                HttpCookie authCookie = HttpContext.Current.Request.Cookies["privateTT"];
                string ret;
                m_ReaderWriterLock.EnterReadLock();
                ret = FormsAuthentication.Decrypt(authCookie.Value).UserData;
                m_ReaderWriterLock.ExitReadLock();
                return ret;
            }
        }

        public bool SessionIDExists(string aKey)
        {
            return m_Dictionary.ContainsKey(aKey) ? true : false;
        }
    }

    public class UserSession : Object
    {
        private DateTime m_LoginTime;
        private DateTime m_LastUpdate;
        private string m_SessionId;
        private string m_UserName;
        private string m_IpAddress;
        private string m_Browser;

        public DateTime LastUpdate
        {
            get { return m_LastUpdate; }
            set { m_LastUpdate = value; }
        }

        public string Browser
        {
            get { return m_Browser; }
            set { m_Browser = value; }
        }

        public DateTime LoginTime
        {
            get { return m_LoginTime; }
            set { m_LoginTime = value; }
        }

        public string UserName
        {
            get { return m_UserName; }
            set { m_UserName = value; }
        }

        public string SessionId
        {
            get { return m_SessionId; }
            set { m_SessionId = value; }
        }

        public string IpAddress
        {
            get { return m_IpAddress; }
            set { m_IpAddress = value; }
        }

        public UserSession(DateTime aLogInTime, string aSessionId, string aUserName, string aIpAdress, string aBrowser)
        {
            m_SessionId = aSessionId;
            m_UserName = aUserName;
            m_LoginTime = aLogInTime;
            m_IpAddress = aIpAdress;
            m_Browser = aBrowser;
            m_LastUpdate = aLogInTime;
        }
    }

    public class SessionResourceTracker : Object
    {
        readonly List<string> m_CleanupList = new List<string>();
        string mSession;
        public SessionResourceTracker(string aSession)
        {
            mSession = aSession;
        }
        public void AddForCleanup(string aTableName)
        {
            if (!m_CleanupList.Contains(aTableName))
            {
                m_CleanupList.Add(aTableName);
            }
        }
        public void CleanupSessionObjects()
        {
            for (int i = 0; i < m_CleanupList.Count; i++)
            {
                Global.CustomSession.Remove(m_CleanupList[i]);
            }
            m_CleanupList.Clear();
        }
    }

    public class Global : HttpApplication
    {
        private readonly static Hashtable m_UserSessions = new Hashtable();
        private readonly static ReaderWriterLockSlim m_ReaderWriterLock = new ReaderWriterLockSlim();
        private readonly static string m_DBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Production"].ConnectionString;
        public readonly static MyCustomSession CustomSession = new MyCustomSession();

        public static volatile Dictionary<string, User> m_Users = new Dictionary<string, User>();
        private static ServiceTimer m_ServiceTimer;
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            //InitializeDepedency();
            LogError("Application Start....");
            //InitializeUsers();
            TimerCallback timerDelegate = ThreadTimer_Tick;
            m_ServiceTimer = new ServiceTimer(timerDelegate, 60); // 60 seconds.....
        }

        public static string GetConnectionString()
        {
            return m_DBConnectionString;
        }

        public static Control FindControlRecursive(Control rootControl, string controlID)
        {
            if (rootControl.ID == controlID) return rootControl;

            foreach (Control controlToSearch in rootControl.Controls)
            {
                Control controlToReturn =
                    FindControlRecursive(controlToSearch, controlID);
                if (controlToReturn != null) return controlToReturn;
            }
            return null;
        }

        /*
        private static void InitializeUsers()
        {
            using (SqlCommand mSqlCommand = new SqlCommand("select [USER_ID],[USERNAME],[PASSWORD] FROM [dbo].[USERS]", null) { CommandType = System.Data.CommandType.Text, Notification = null, CommandTimeout = 60 })
            {
                using (SqlConnection mConnection = new SqlConnection(m_DBConnectionString))
                {
                    mSqlCommand.Connection = mConnection;
                    mConnection.Open();
                    using (SqlDataReader reader = mSqlCommand.ExecuteReader())
                    {
                        while (reader.Read())
                            m_Users.Add(reader.GetString(1), new User(reader.GetInt32(0), reader.GetString(1), reader.GetString(2)));
                        mConnection.Close();
                    }
                }
            }
        }
        
        public static void RefreshSystemUsers()
        {
            Dictionary<string, User> mUsers = new Dictionary<string, User>();
            using (SqlCommand mSqlCommand = new SqlCommand("select [USER_ID],[USERNAME],[PASSWORD] FROM [dbo].[USERS]", null) { CommandType = System.Data.CommandType.Text, Notification = null, CommandTimeout = 60 })
            {
                using (SqlConnection mConnection = new SqlConnection(m_DBConnectionString))
                {
                    mSqlCommand.Connection = mConnection;
                    mConnection.Open();
                    using (SqlDataReader reader = mSqlCommand.ExecuteReader())
                    {
                        while (reader.Read())
                            mUsers.Add(reader.GetString(1), new User(reader.GetInt32(0), reader.GetString(1), reader.GetString(2)));
                        mConnection.Close();
                    }
                }
            }
            m_Users = mUsers;
        }
        */

        public static void LogError(string aError)
        {
            using (SqlConnection mConnection = new SqlConnection(m_DBConnectionString))
            {
                string mQuery = String.Format("insert Log values(getdate(),'{0}')", aError);
                using (SqlCommand mSqlCommand = new SqlCommand { Connection = mConnection, CommandTimeout = 30, CommandType = System.Data.CommandType.Text, CommandText = mQuery })
                {
                    mConnection.Open();
                    mSqlCommand.ExecuteNonQuery();
                    mConnection.Close();
                }
            }
        }
        /*
        void InitializeDepedency()
        {
            SqlDependency.Start(m_DBConnectionString);
            using (SqlCommand mSqlCommand = new SqlCommand("select [USER_ID],[USERNAME],[PASSWORD] FROM [dbo].[USERS]", null) { CommandType = System.Data.CommandType.Text, Notification = null, CommandTimeout = 60 })
            {
                SqlDependency mSqlDependency = new SqlDependency(mSqlCommand);
                mSqlDependency.OnChange += SqlDependency_OnChange;
                using (SqlConnection mConnection = new SqlConnection(m_DBConnectionString))
                {
                    mSqlCommand.Connection = mConnection;
                    mConnection.Open();
                    using (SqlDataReader reader = mSqlCommand.ExecuteReader())
                    {
                        while (reader.Read())
                            m_Users.Add(reader.GetString(1), new User(reader.GetInt32(0), reader.GetString(1), reader.GetString(2)));
                        mConnection.Close();
                    }
                }
            }        
        }

        void SqlDependency_OnChange(object sender, SqlNotificationEventArgs e)
        {
            Dictionary<string, User> mUsers = new Dictionary<string,User>();
            using (SqlCommand mSqlCommand = new SqlCommand("select [USER_ID],[USERNAME],[PASSWORD] FROM [dbo].[USERS]", null) { CommandType = System.Data.CommandType.Text, Notification = null, CommandTimeout = 60 })
            {
                SqlDependency mSqlDependency = new SqlDependency(mSqlCommand);
                mSqlDependency.OnChange += SqlDependency_OnChange;
                using (SqlConnection mConnection = new SqlConnection(m_DBConnectionString))
                {
                    mSqlCommand.Connection = mConnection;
                    mConnection.Open();
                    using (SqlDataReader reader = mSqlCommand.ExecuteReader())
                    {
                        while (reader.Read())
                            mUsers.Add(reader.GetString(1), new User(reader.GetInt32(0), reader.GetString(1), reader.GetString(2)));
                        mConnection.Close();
                    }
                }
            }
            m_Users = mUsers;
        }*/

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
            //SqlDependency.Stop(m_DBConnectionString);
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
            object mInnerException = Server.GetLastError().InnerException;
            if (mInnerException != null)
            {
                mInnerException = mInnerException.ToString().Replace("'", "\"");
            }
            LogError(String.Format("Stacktrace: {0} Message:{1} InneeException: {2}", Server.GetLastError().StackTrace.Replace("'", "\""), Server.GetLastError().Message.Replace("'", "\""), mInnerException));
        }

        void Session_Start(object sender, EventArgs e)
        {

        }

        public static List<UserSession> GetCurrentUsers()
        {
            List<UserSession> mList = new List<UserSession>();
            IEnumerator mIter = null;
            DictionaryEntry mEntry;
            m_ReaderWriterLock.EnterReadLock();
            mIter = m_UserSessions.GetEnumerator();
            while (mIter.MoveNext())
            {
                mEntry = (DictionaryEntry)mIter.Current;
                mList.Add((UserSession)mEntry.Value);
            }
            m_ReaderWriterLock.ExitReadLock();
            return mList;
        }

        private void ThreadTimer_Tick(Object state)
        {
            List<string> m_ToBeremoved = new List<string>();
            DateTime mNow = DateTime.Now;
            TimeSpan mSpan = new TimeSpan(0, 0, 5, 0, 0);
            DictionaryEntry mEntry;
            m_ReaderWriterLock.EnterWriteLock();
            IEnumerator mIter = m_UserSessions.GetEnumerator();
            while (mIter.MoveNext())
            {
                mEntry = (DictionaryEntry)mIter.Current;
                if (mNow - ((UserSession)mEntry.Value).LastUpdate > mSpan)
                {
                    m_ToBeremoved.Add(((UserSession)mEntry.Value).SessionId);
                }
            }
            for (int i = 0; i < m_ToBeremoved.Count; i++)
            {
                CustomSession.RemoveSession(m_ToBeremoved[i]);
                m_UserSessions.Remove(m_ToBeremoved[i]);
            }
            m_ReaderWriterLock.ExitWriteLock();
        }

        public static void UpdateLoggedUserName(string aUserName, string aSessionId)
        {
            m_ReaderWriterLock.EnterReadLock();
            UserSession mUserSession = (UserSession)m_UserSessions[aSessionId];
            if (mUserSession == null)
            {
                m_ReaderWriterLock.ExitReadLock();
                mUserSession = new UserSession(DateTime.Now, aSessionId, aUserName, HttpContext.Current.Request.UserHostAddress, HttpContext.Current.Request.Browser.Browser);
                m_ReaderWriterLock.EnterWriteLock();
                {
                    m_UserSessions.Add(aSessionId, mUserSession);
                }
                m_ReaderWriterLock.ExitWriteLock();
            }
            else
            {
                mUserSession.LastUpdate = DateTime.Now;
                m_ReaderWriterLock.ExitReadLock();
            }
        }

        void Session_End(object sender, EventArgs e)
        {
            /*lock (m_UserSessions)
            {
                IEnumerator<UserSession> mIter = m_UserSessions.GetEnumerator();
                UserSession mSession = null;
                while (mIter.MoveNext())
                {
                    mSession = mIter.Current;
                    if (mSession.SessionId == Session.SessionID)
                    {
                        m_UserSessions.Remove(mSession);
                        break;
                    }
                }
            }*/
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.
            Session.Clear();
        }

        public static List<string> GetUserRoles(int aUserId)
        {
            List<string> mRoles = new List<string>();
            using (SqlConnection mConnection = new SqlConnection(m_DBConnectionString))
            {
                using (SqlCommand mSqlCommand = new SqlCommand { Connection = mConnection, CommandTimeout = 30, CommandType = System.Data.CommandType.StoredProcedure, CommandText = "User_Select_Roles" })
                {
                    mSqlCommand.Parameters.AddWithValue("@USER_ID", aUserId);
                    mConnection.Open();
                    using (SqlDataReader reader = mSqlCommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            mRoles.Add(reader.GetString(0));
                        }
                    }
                }
            }
            return mRoles;
        }

        public static DataTable UserRoleActionsList(int aUserId)
        {
            string[] mNames = new string[1] { "@USER_ID" };
            object[] mValues = new object[1] { aUserId };
            return ExecuteStoredProcedure("User_Role_Actions_List", mNames, mValues);
        }

        public static int ExecuteStoredProcedureNoResults(string aStoredProcedure, string[] aVarNames, object[] aVarValues)
        {
            int res = -1;
            using (SqlConnection mConnection = new SqlConnection(m_DBConnectionString))
            {
                using (SqlCommand mSqlCommand = new SqlCommand { Connection = mConnection, CommandTimeout = 30, CommandType = System.Data.CommandType.StoredProcedure, CommandText = aStoredProcedure })
                {
                    if (aVarNames != null && aVarValues != null)
                    {
                        for (int i = 0; i < (aVarNames.Length); i++)
                        {
                            // prosthiki.......
                            if (aVarValues[i] == null)
                            {
                                aVarValues[i] = System.DBNull.Value;
                            }
                            mSqlCommand.Parameters.AddWithValue(aVarNames[i], aVarValues[i]);
                        }
                        mConnection.Open();
                        res = mSqlCommand.ExecuteNonQuery();
                        mConnection.Close();
                    }
                }
            }
            return res;
        }

        public static DataTable ExecuteStatement(string aStatement)
        {
            DataTable mDataTable;
            using (SqlConnection mConnection = new SqlConnection(m_DBConnectionString))
            {
                using (SqlCommand mSqlCommand = new SqlCommand { Connection = mConnection, CommandTimeout = 30, CommandType = System.Data.CommandType.Text, CommandText = aStatement })
                {
                    mConnection.Open();
                    using (SqlDataAdapter mDataAdapter = new SqlDataAdapter())
                    {
                        mDataTable = new DataTable();
                        mDataAdapter.SelectCommand = mSqlCommand;
                        mDataAdapter.Fill(mDataTable);
                    }
                }
            }
            return mDataTable;
        }


        public static DataTable ExecuteQuery(string aQueryString)
        {
            DataTable mDataTable;
            using (SqlConnection mConnection = new SqlConnection(m_DBConnectionString))
            {
                using (SqlCommand mSqlCommand = new SqlCommand { Connection = mConnection, CommandTimeout = 30, CommandType = System.Data.CommandType.Text, CommandText = aQueryString })
                {
                    mConnection.Open();
                    using (SqlDataAdapter mDataAdapter = new SqlDataAdapter())
                    {
                        mDataTable = new DataTable();
                        mDataAdapter.SelectCommand = mSqlCommand;
                        mDataAdapter.Fill(mDataTable);
                    }
                }
            }
            return mDataTable;
        }

        public static DataTable GetSystemCoordinates()
        {
            return ExecuteQuery("select SYSTEM, SYSTEM_GROUP, SYSTEM_INFO, SYSTEM_AREA, LATITUDE, LONGITUDE from [dbo].[TT_SYSTEM] where LATITUDE is not null and LONGITUDE is not null");
            //return ExecuteQuery("select Ne, Code,Name, Provider,Latitude,Longtitude from [IOmirosConfig].[dbo].[V_Object_Browser]");
        }

        public static DataTable ExecuteStoredProcedure(string aStoredProcedure, string[] aVarNames, object[] aVarValues)
        {
            DataTable mDataTable;
            using (SqlConnection mConnection = new SqlConnection(m_DBConnectionString))
            {
                using (SqlCommand mSqlCommand = new SqlCommand { Connection = mConnection, CommandTimeout = 30, CommandType = System.Data.CommandType.StoredProcedure, CommandText = aStoredProcedure })
                {
                    if (aVarNames != null && aVarValues != null)
                    {
                        for (int i = 0; i < (aVarNames.Length); i++)
                        {
                            mSqlCommand.Parameters.AddWithValue(aVarNames[i], aVarValues[i]);
                        }
                    }
                    mConnection.Open();
                    using (SqlDataAdapter mDataAdapter = new SqlDataAdapter())
                    {
                        mDataTable = new DataTable();
                        mDataAdapter.SelectCommand = mSqlCommand;
                        mDataAdapter.Fill(mDataTable);
                    }
                }
            }
            return mDataTable;
        }

        public static object ExecuteStoredProcedureScalar(string aStoredProcedure, string[] aVarNames, object[] aVarValues)
        {
            using (SqlConnection mConnection = new SqlConnection(m_DBConnectionString))
            {
                using (SqlCommand mSqlCommand = new SqlCommand { Connection = mConnection, CommandTimeout = 30, CommandType = System.Data.CommandType.StoredProcedure, CommandText = aStoredProcedure })
                {
                    if (aVarNames != null && aVarValues != null)
                    {
                        for (int i = 0; i < (aVarNames.Length); i++)
                        {
                            mSqlCommand.Parameters.AddWithValue(aVarNames[i], aVarValues[i]);
                        }
                    }
                    mConnection.Open();
                    return mSqlCommand.ExecuteScalar();
                }
            }
        }

        public static void UpdateTitle(ASPxRoundPanel aWebControl)
        {
            ASPxLabel mlabel = (ASPxLabel)aWebControl.FindControl("ASPxLabelUserName");
            //mlabel.Text = String.Format("  ({0})", HttpContext.Current.Session["UserName"]);
            mlabel.Text = String.Format("  ({0})", Global.CustomSession["UserName"]);
            mlabel = (ASPxLabel)aWebControl.FindControl("ASPxLabelRoles");
            //if (HttpContext.Current.Session["TTID"] != null)
            if (Global.CustomSession["TTID"] != null)
            {
                //mlabel.Text = HttpContext.Current.Session["TTID"].ToString();
            }
            /*List<String> mRoles = (List<string>)HttpContext.Current.Session["Roles"];
            string mText = null;
            for (int i = 0; i < (mRoles.Count); i++)
            {
                if (i < mRoles.Count - 1)
                {
                    mText += mRoles[i].ToString() + "/";
                }
                else mText += mRoles[i].ToString();
            }
            mlabel.Text = "Roles: " + mText;*/
        }
    }

    public class ServiceTimer : Object
    {
        private class TimerState
        { }
        private readonly System.Threading.Timer m_ThreadTimer;
        public ServiceTimer(TimerCallback aTimerCallback, int aPeriod)
        {
            //
            // TODO: Add constructor logic here
            //
            TimerState s = new TimerState();
            m_ThreadTimer = new System.Threading.Timer(aTimerCallback, s, aPeriod * 1000, aPeriod * 1000);
        }
    }
}

