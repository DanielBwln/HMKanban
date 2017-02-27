using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HMKanBan.Source.Entity;
using HMKanBan.Source.BL;
using System.Security.Principal;
using HMKanBan.Source.Util;

namespace HMKanBan
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        public static String DATE_STRING = "";
        public String USER_STYLE = "menuitem";
        public String KANBAN_STYLE = "menuitem";
        public String BASKET_STYLE = "menuitem";
        public String WAIT_STYLE = "menuitem";
        public String TFS_STYLE = "menuitem";
        public String SUMMARY_STYLE = "menuitem";
        public String RPT_CYCLE_STYLE = "menuitem";
        public String KANBAN_GROUP_STYLE = "menugroup";
        public String REPORT_GROUP_STYLE = "menugroup";
        private KanBan _kanbanObj;
        public KanBan KanBanObj{
            set { 
                _kanbanObj = value; 
                KanBanBL.InitUserList(_kanbanObj.ID);
                CurCyclePeriod = KanBanBL.GetCurrentCyclePeriod(_kanbanObj.ID, KanBanBL.GetDefaultCycle(_kanbanObj.ID).ID);
            }
            get { return _kanbanObj; }
        }
        public String UserName
        {
            set { Session["S_UserName"] = value; }
            get { return (String)Session["S_UserName"]; }
        }
        public CyclePeriod CurCyclePeriod
        {
            set;
            get;
        }

        public String UserDomain
        {
            set { Session["S_UserDomain"] = value; }
            get { return (String)Session["S_UserDomain"]; }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DATE_STRING = DateTime.Today.ToString("yyyyMMdd");
                WindowsPrincipal wp = new WindowsPrincipal(WindowsIdentity.GetCurrent());
                String[] logon = Page.User.Identity.Name.Split('\\');
                if (logon.Length > 1)
                {
                    UserDomain = logon[0];
                    UserName = logon[1].ToString().ToLower();
                }
                else if (logon.Length == 1)
                {
                    UserName = logon[0];
                }
                else
                {
                    UserName = SYSUser.GUEST_USER;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                litProfile.Text = UserName;

                if (KANBAN_STYLE == "menuitem_sel")
                {
                    lnkKanBanPage.Attributes["onclick"] = "return false;";
                    KANBAN_GROUP_STYLE = "menugroup_sel";
                }
                else
                {
                    lnkKanBanPage.Attributes["onclick"] = "KanBan.FadeOut(function(){window.location.href='./KanBan.aspx?ID="+ KanBanObj.ID + "'; });return false;";
                }

                if (BASKET_STYLE == "menuitem_sel")
                {
                    lnkBasketPage.Attributes["onclick"] = "return false;";
                    KANBAN_GROUP_STYLE = "menugroup_sel";
                }
                else
                {
                    lnkBasketPage.Attributes["onclick"] = "KanBan.FadeOut(function(){window.location.href='./KanBan_Done.aspx?ID=" + KanBanObj.ID + "'; });return false;";
                }

                if (WAIT_STYLE == "menuitem_sel")
                {
                    lnkWaitPage.Attributes["onclick"] = "return false;";
                    KANBAN_GROUP_STYLE = "menugroup_sel";
                }
                else
                {
                    lnkWaitPage.Attributes["onclick"] = "KanBan.FadeOut(function(){window.location.href='./KanBan_Waitting.aspx?ID=" + KanBanObj.ID + "'; });return false;";
                }

                if (SUMMARY_STYLE == "menuitem_sel")
                {
                    lnkKanBanSummary.Attributes["onclick"] = "return false;";
                    REPORT_GROUP_STYLE = "menugroup_sel";
                }
                else
                {
                    lnkKanBanSummary.Attributes["onclick"] = "KanBan.FadeOut(function(){window.location.href='./KanBan_ColumnGroup.aspx?ID=" + KanBanObj.ID + "'; });return false;";
                }

                if (USER_STYLE == "menuitem_sel")
                {
                    lnkUserPage.Attributes["onclick"] = "return false;";
                    REPORT_GROUP_STYLE = "menugroup_sel";
                }
                else
                {
                    lnkUserPage.Attributes["onclick"] = "KanBan.FadeOut(function(){window.location.href='./UserStoryList.aspx?ID=" + KanBanObj.ID + "'; });return false;";
                }

                if (TFS_STYLE == "menuitem_sel")
                {
                    lnkTFSPage.Attributes["onclick"] = "return false;";
                }
                else
                {
                    lnkTFSPage.Attributes["onclick"] = "KanBan.FadeOut(function(){window.location.href='./TFS.aspx?ID=" + KanBanObj.ID + "'; });return false;";
                }

                if (RPT_CYCLE_STYLE == "menuitem_sel")
                {
                    lnkRptCycle.Attributes["onclick"] = "return false;";
                }
                else
                {
                    lnkRptCycle.Attributes["onclick"] = "KanBan.FadeOut(function(){window.location.href='./KanBan_Rpt_Cycle_Status.aspx?ID=" + KanBanObj.ID + "'; });return false;";
                }

                InitControl();
            }
        }

        protected void InitControl()
        {
            ListItem li = null;
            foreach (SYSUser.ConfigTicketColorEnum type in Enum.GetValues(typeof(SYSUser.ConfigTicketColorEnum)))
            {
                li = new ListItem(Enum.GetName(typeof(SYSUser.ConfigTicketColorEnum), type), Convert.ToInt16(type).ToString());
                ddlColor.Items.Add(li);
            }

            SYSUser objUser = (SYSUser)Session[KanBanUtil.SESSION_SYSUSER];
            if ((objUser == null || objUser.Alias != UserName))
            {
                if (UserName != SYSUser.GUEST_USER)
                {
                    objUser = KanBanBL.GetSYSUser(UserName);
                }
                else
                {
                    objUser = new SYSUser();
                    objUser.Alias = SYSUser.GUEST_USER;
                }
            }
            ddlColor.SelectedValue = Convert.ToInt16(objUser.ConfigTicketColor).ToString();
        }

        protected void ddlColor_Change(object sender, EventArgs e)
        {
            SYSUser objUser = (SYSUser)Session[KanBanUtil.SESSION_SYSUSER];
            if ((objUser == null || objUser.Alias != UserName))
            {
                if (UserName != SYSUser.GUEST_USER)
                {
                    objUser = KanBanBL.GetSYSUser(UserName);
                }
                else
                {
                    objUser = new SYSUser();
                    objUser.Alias = SYSUser.GUEST_USER;
                }
            }

            objUser.ConfigTicketColor = (SYSUser.ConfigTicketColorEnum)Convert.ToInt16(ddlColor.SelectedValue);
            if (UserName != SYSUser.GUEST_USER)
            {
                KanBanBL.UpdateSYSUser(objUser);
            }
            Session[KanBanUtil.SESSION_SYSUSER] = objUser;
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}
