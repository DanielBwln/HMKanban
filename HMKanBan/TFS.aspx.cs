using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HMKanBan.Source.Entity;
using System.Security.Principal;
using HMKanBan.Source.BL;
using HMKanBan.Source.Entity.TFS;
using System.Text;
using HMKanBan.Source.DAL;

namespace HMKanBan
{
    public partial class TFS : System.Web.UI.Page
    {
        #region "Member"
        public String CurQueryID
        {
            set { ViewState["VS_CurQueryID"] = value; }
            get { return (String)ViewState["VS_CurQueryID"]; }
        }
        public String UserName
        {
            get { return ((SiteMaster)this.Master).UserName; }
        }
        public String UserDomain
        {
            get { return ((SiteMaster)this.Master).UserDomain; }
        }
        public KanBan KanBanObj
        {
            set { ViewState["VS_KanBan"] = value; }
            get { return (KanBan)ViewState["VS_KanBan"]; }
        }
        public List<TFSWorkItemQuery> QueryList
        {
            set { ViewState["VS_QueryList"] = value; }
            get { return (List<TFSWorkItemQuery>)ViewState["VS_QueryList"]; }
        }
        #endregion

        #region "Template"
        public static String QUERY_TEMPLATE = @"<div class=""{2}"" id=""TFSQuery"" name=""TFSQuery"" onclick=""SelectQuery({0}, this);return false;""><div class=""QueryText""><span>{1}</span></div></div>";
        #endregion

        #region "Events"
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ((SiteMaster)this.Master).TFS_STYLE = "menuitem_sel";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Init();
                InitQueryList();
            }
            ((SiteMaster)this.Master).KanBanObj = KanBanObj;
        }
        
        protected new void Init()
        {
            Int64 nID;
            if (String.IsNullOrEmpty(Request.Params["ID"]) ||
                !Int64.TryParse(Request.Params["ID"], out nID))
            {
                nID = 1;
            }
            KanBanObj = KanBanBL.GetKanBan(nID);
            KanBanBL.InitUserList(KanBanObj.ID);

            QueryList = KanBanBL.ListQueryByKanBan(KanBanObj.ID);
            tblTFS.DataSource = new List<TFSObject>();
            tblTFS.DataBind();
        }
        protected void InitQueryList()
        {
            StringBuilder sb = new StringBuilder();

            foreach(TFSWorkItemQuery item in QueryList)
            {
                sb.Append(String.Format(QUERY_TEMPLATE, item.ID, item.Name, "Query"));
            }

            litQueryList.Text = sb.ToString();
            CurQueryID = "0";
            hidQueryID.Value = "0";
            txtQuery.Text = "";
        }

        protected void btnQueryChange_Click(object sender, EventArgs e)
        {
            Int64 nID = Convert.ToInt64(hidQueryID.Value);
            TFSWorkItemQuery objQuery = GetCurQuery(nID);
            if (objQuery != null)
            {
                txtQuery.Text = objQuery.Query;
            }
        }

        protected void btnRunQuery_Click(object sender, EventArgs e)
        {
            List<TFSObject> lst = new List<TFSObject>();
            Int64 nKanBan = KanBanObj.ID;
            Int64 nQueryID = Convert.ToInt64(hidQueryID.Value);
            TFSWorkItemQuery objQuery = GetCurQuery(nQueryID);

            if (nKanBan > 0 && objQuery != null)
            {
                if (hidQueryType.Value == "lost")
                {
                    lst = KanBanBL.ListUnKanBannedTFS(nKanBan, objQuery);
                }
                else
                {
                    lst = KanBanBL.RunQuery(objQuery);
                }
            }

            tblTFS.DataSource = lst;
            tblTFS.DataBind();
            upTable.Update();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                "HideLoad",
                "HideLoading();",
                true);
        }
        #endregion

        #region "util"
        protected TFSWorkItemQuery GetCurQuery(Int64 _nID)
        {
            foreach (TFSWorkItemQuery item in QueryList)
            {
                if (item.ID == _nID)
                {
                    return item;
                }
            }
            return null;
        }

        protected String GetUrl(String _strProject, Int64 _nTFS)
        {
            return TFSServer.GenerateTFSLink(TFSDAL.DEFAULT_TFS_SERVER, TFSDAL.DEFAULT_TFS_COLLECTION, _strProject, _nTFS);
        }
        #endregion
    }
}