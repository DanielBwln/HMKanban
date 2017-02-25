using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyKanBan.Source.Entity;
using MyKanBan.Source.BL;
using System.Text;
using System.Security.Principal;
using MyKanBan.Source.Entity.Log;
using MyKanBan.Source.Util;

namespace MyKanBan
{
    public partial class UserStoryList : System.Web.UI.Page
    {
        public static String[] RainbowList = { 
                                                "rainbow_teal", 
                                                "rainbow_pink",
                                                "rainbow_brown",
                                                "rainbow_green", 
                                                "rainbow_purple",
                                                "rainbow_orange",
                                                "rainbow_magenta"                   
                                             };
        public static String EMAIL_SEPERATOR = ";";
        public static Int32 MAX_EMAIL_LENGTH = 250;

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
        public List<User> UserList
        {
            set { ViewState["VS_UserList"] = value; }
            get { return (List<User>)ViewState["VS_UserList"]; }
        }
        public List<User> AllUserList
        {
            set { ViewState["VS_AllUserList"] = value; }
            get { return (List<User>)ViewState["VS_AllUserList"]; }
        }
        public List<Story> StoryList
        {
            set { ViewState["VS_StoryList"] = value; }
            get { return (List<Story>)ViewState["VS_StoryList"]; }
        }
        public List<Column> ColumnList
        {
            set { ViewState["VS_ColumnList"] = value; }
            get { return (List<Column>)ViewState["VS_ColumnList"]; }
        }
        public Story CurStory
        {
            set { ViewState["VS_CurStory"] = value; }
            get { return (Story)ViewState["VS_CurStory"]; }
        }

        public static String TR_TEMPLATE = @"
            <tr>
                <td class=""{0}"">
                    <div>
                        <div class=""memberBoard_User"">{1}</div>
                        <div class=""memberBoard_Story"">{2}</div>
                    </div>
                </td>
            </tr>
        ";
        public static String STORY_TEMPLATE = @"
            <div id=""divStory_{0}""  name=""divStory_{0}"" class=""{3}"">
                <div class=""StoryDiv_FloatingNum"" style=""visibility:hidden""></div>
                <div class=""StoryDiv_Title"" id=""divStory_title_{0}"" name=""divStory_title_{0}"">{1}</div>
                <div class=""StoryDiv_Content"" id=""divStory_content_{0}"" name=""divStory_content_{0}"">{2}</div>
                <div class=""StoryDiv_Footer"">
                    <div id=""divStory_due_{0}"" name=""divStory_due_{0}"" class=""StoryDiv_ViewDetail_left"">{6}</div>
                    <a class=""StoryDiv_ViewDetail"" href=""#"" ontouchstart=""KanBan.ViewDetail({0}, event);return false;"" onmousedown=""KanBan.ViewDetail({0}, event);return false;"">Detail</a>
                    <a class=""StoryDiv_ViewDetail"" href=""{4}"" id=""divStory_tfslink_{0}"" name=""divStory_tfslink_{0}"" style=""{5}"" target=""_blank"" ontouchstart=""ApoJS.Base.StopBubble();return false;"" onmousedown=""ApoJS.Base.StopBubble();return false;"">TFS</a>
                </div>
            </div>
        ";
        public static String USER_TEMPLATE = @"
            <div class=""memberBoard_UserName"">{0}</div>
        ";
        public static String STORY_MEMBER_TEMPLATE = @"<a href=""im:<sip:{1}>"" onmousedown=""ApoJS.Base.StopBubble(event);return false;"">{0}</a>";
        public static String LOG_STATUS_TEMPLATE = @"
            <div class=""mask_log"">
                <div class=""mask_log_column"">{0}</div>
            </div>
            <div class=""mask_log"" style=""margin-bottom:3px;margin-top:3px;"">
                <div class=""mask_log_when"" style=""width:240px;"">{1}</div>
                <div class=""mask_log_icon"" style=""width:150px;""><img alt=""up"" src=""./Images/arrow_up.png"" style=""width:120px;height:30px;"" /></div>
                <div class=""mask_log_who"" style=""width:230px;"">{2}</div>
            </div>
        ";

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ((SiteMaster)this.Master).USER_STYLE = "menuitem_sel";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Init();
                PinStories();
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
            if (KanBanObj == null) KanBanObj = KanBanBL.GetKanBan(1);
            KanBanBL.InitUserList(KanBanObj.ID);

            ListItem li = null;
            StoryList = KanBanBL.GetStoryListByKanBanOrderByType(KanBanObj.ID);
            UserList = KanBanBL.GetUsersByKanBan(KanBanObj.ID);
            AllUserList = KanBanBL.GetUsers(KanBanObj.ID);
            ColumnList = KanBanBL.GetKanBanColumns(KanBanObj.ID);
            foreach (Story.PriorEnum prior in Enum.GetValues(typeof(Story.PriorEnum)))
            {
                li = new ListItem(Enum.GetName(typeof(Story.PriorEnum), prior), Convert.ToInt16(prior).ToString());
                ddlStoryPrior.Items.Add(li);
            }
            foreach (Story.StoryTypeEnum type in Enum.GetValues(typeof(Story.StoryTypeEnum)))
            {
                li = new ListItem(Enum.GetName(typeof(Story.StoryTypeEnum), type), Convert.ToInt16(type).ToString());
                ddlStoryType.Items.Add(li);
            }
            foreach (Story.StoryTaskTypeEnum type in Enum.GetValues(typeof(Story.StoryTaskTypeEnum)))
            {
                li = new ListItem(Enum.GetName(typeof(Story.StoryTaskTypeEnum), type), Convert.ToInt16(type).ToString());
                ddlStoryTaskType.Items.Add(li);
            }
            ddlTFSServer.DataSource = Global.TFSServerList;
            ddlTFSServer.DataBind();
            RefreshUserAddList(new Story());
            txtDueDate.Attributes.Add("readonly", "readonly");

            litLegend.Text = KanBanUtil.GetTicketStyleLegend(UserName);
        }

        protected void PinStories()
        {
            StringBuilder sb = new StringBuilder();
            StringBuilder sbStory = null;
            Boolean isEmpty = true;
            Int32 nMode = RainbowList.Length;
            Int32 nCount = 0;
            Column objColumn = null;

            foreach(User objUser in UserList)
            {
                sbStory = new StringBuilder();
                isEmpty = true;

                foreach(Story objStory in StoryList)
                {
                    objColumn = GetColumn(objStory.StoryStatus);
                    if (!objColumn.CheckValidUser(objStory, objUser)) continue;

                    isEmpty = false;
                    sbStory.Append(String.Format(STORY_TEMPLATE, 
                        objStory.ID, 
                        objStory.Name, 
                        BuildUserList(objStory),
                        KanBanUtil.GetTicketStyle(UserName, objStory),
                        ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#"),
                        ((objStory.TFS > 0 && objStory.TFSServer > 0) ? "" : "display:none"),
                        ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date)) ? objStory.DueDate.ToShortDateString() : "")));
                }

                if (isEmpty) continue;
                sb.Append(String.Format(TR_TEMPLATE,
                    RainbowList[nCount % nMode],
                    String.Format(USER_TEMPLATE,objUser.FirstName),
                    sbStory.ToString()));
                nCount++;
            }
            litUsers.Text = sb.ToString();
        }

        #region "Story"

        protected void btnUpdateStoryStatus_Click(object sender, EventArgs e)
        {
            String strStatus = Request["__EVENTARGUMENT"];
            Story objStory = CurStory;
            Boolean bNeedRemove = false;

            BuildStory(ref objStory);
            KanBanBL.UpdateStory(objStory);

            switch (strStatus)
            {
                case "Finish":
                    KanBanBL.UpdateStoryStatus(objStory.ID, Story.StoryStatusEnum.Finished);
                    KanBanBL.LogStoryStatus(UserName, objStory.ID, Story.StoryStatusEnum.Finished, objStory.Status);
                    bNeedRemove = true;
                    break;
                case "Remove":
                    KanBanBL.UpdateStoryStatus(objStory.ID, Story.StoryStatusEnum.Deleted);
                    KanBanBL.LogStoryStatus(UserName, objStory.ID, Story.StoryStatusEnum.Deleted, objStory.Status);
                    bNeedRemove = true;
                    break;
                default:
                    bNeedRemove = false;
                    break;
            }
            if (bNeedRemove)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                    "removeStory",
                    "KanBan.CloseStory(function(){ KanBan.RemoveStoryAry(" + objStory.ID.ToString() + ");});",
                    true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                    "refreshStory",
                    "KanBan.CloseStory(function(){ KanBan.RefreshStoryAry(" + objStory.SwimLaneID.ToString()
                        + ", " + objStory.StoryStatus.ToString() + ", " + objStory.ID.ToString() + ", '"
                        + KanBanUtil.GetTicketStyle(UserName, objStory) + "', '" + objStory.Name.Replace("'", "\\'") + "', '" + BuildUserList(objStory).Replace("'", "\\'") + "','','"
                        + ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#") + "','"
                        + ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date)) ? objStory.DueDate.ToShortDateString() : "") + "');});",
                    true);
            }
        }

        protected void btnStory_Click(object sender, EventArgs e)
        {
            Story objStory = CurStory;

            if (!String.IsNullOrEmpty(txtStoryID.Value) && Convert.ToInt64(txtStoryID.Value) != 0)
            {
                // update
                if (!String.IsNullOrEmpty(txtStoryName.Text))
                {
                    BuildStory(ref objStory);
                    KanBanBL.UpdateStory(objStory);
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                        "refreshStory",
                        "KanBan.CloseStory(function(){ KanBan.RefreshStoryAry(" + objStory.SwimLaneID.ToString()
                            + ", " + objStory.StoryStatus.ToString() + ", " + objStory.ID.ToString() + ", '"
                            + KanBanUtil.GetTicketStyle(UserName, objStory) + "', '" + objStory.Name.Replace("'", "\\'") + "', '" + BuildUserList(objStory).Replace("'", "\\'") + "','','"
                            + ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#") + "','"
                        + ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date)) ? objStory.DueDate.ToShortDateString() : "") + "');});",
                        true);
                }
            }
        }

        protected void btnUpdateStory_Click(object sender, EventArgs e)
        {
            Story objStory;
            Int64 nID;
            if (!String.IsNullOrEmpty(txtStoryID.Value) && Convert.ToInt64(txtStoryID.Value) != 0)
            {
                // update
                nID = Convert.ToInt64(txtStoryID.Value);
                objStory = KanBanBL.GetStory(nID);
                CurStory = objStory;
                txtStory_Title.Text = objStory.Name;
                RefreshStory(objStory);
                RefreshUserAddList(objStory);
                RefreshLogView(objStory);
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                    "showStory",
                    "KanBan.ShowStory();",
                    true);
            }
        }

        protected void AddAssign_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            Story objStory = CurStory;
            User user = null;

            BuildStory(ref objStory);
            if (lnk.CommandName == "PM")
            {
                if (ddlPM.SelectedIndex >= 0)
                {
                    user = GetUser(Convert.ToInt64(ddlPM.SelectedValue));
                    if (user != null)
                    {
                        objStory.PMs.Add(user);
                    }
                }
            }
            else if (lnk.CommandName == "EG")
            {
                if (ddlEngineer.SelectedIndex >= 0)
                {
                    user = GetUser(Convert.ToInt64(ddlEngineer.SelectedValue));
                    if (user != null)
                    {
                        objStory.Engineers.Add(user);
                    }
                }
            }

            RefreshStory(objStory);
            RefreshUserAddList(objStory);

        }

        protected void PMListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                User user = (User)e.Item.DataItem;
                LinkButton lnk = (LinkButton)e.Item.FindControl("lnkPMRemove");
                lnk.Attributes["STORY_ID"] = CurStory.ID.ToString();
                lnk.Attributes["USER_ID"] = user.ID.ToString();
            }
        }
        protected void EGListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                User user = (User)e.Item.DataItem;
                LinkButton lnk = (LinkButton)e.Item.FindControl("lnkEGRemove");
                lnk.Attributes["STORY_ID"] = CurStory.ID.ToString();
                lnk.Attributes["USER_ID"] = user.ID.ToString();
            }
        }
        protected void PMRemoveButton_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            Int64 nUserID = Convert.ToInt64(lnk.Attributes["USER_ID"]);

            Story objStory = CurStory;
            BuildStory(ref objStory);
            foreach (User user in objStory.PMs)
            {
                if (user.ID == nUserID)
                {
                    objStory.PMs.Remove(user);
                    break;
                }
            }
            RefreshStory(objStory);
            RefreshUserAddList(objStory);
        }
        protected void EGRemoveButton_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            Int64 nUserID = Convert.ToInt64(lnk.Attributes["USER_ID"]);

            Story objStory = CurStory;
            BuildStory(ref objStory);
            foreach (User user in objStory.Engineers)
            {
                if (user.ID == nUserID)
                {
                    objStory.Engineers.Remove(user);
                    break;
                }
            }
            RefreshStory(objStory);
            RefreshUserAddList(objStory);
        }
        protected void lnkRetrieve_Click(object sender, EventArgs e)
        {
            Int64 nTFS = 0;
            Story curStory = CurStory;

            if (Int64.TryParse(txtStoryTFS.Text, out nTFS))
            {
                BuildStory(ref curStory);
                curStory.PMs = new List<User>();
                curStory.Engineers = new List<User>();

                KanBanBL.CreateStoryFromTFS(nTFS, Global.GetTFServerByID(Convert.ToInt64(ddlTFSServer.SelectedValue)), ref curStory);

                RefreshStory(curStory);
                RefreshUserAddList(curStory);

                CurStory = curStory;
            }

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                "StopRetrieveTFS",
                "StopRetrieveTFS();",
                true);
        }

        public void BuildStory(ref Story objStory)
        {
            if (!String.IsNullOrEmpty(txtStoryID.Value))
            {
                objStory.ID = Convert.ToInt64(txtStoryID.Value);
            }
            objStory.Name = txtStoryName.Text;
            objStory.SwimLaneID = Convert.ToInt64(txtStoryLaneID.Value);
            objStory.StoryType = (Story.StoryTypeEnum)Convert.ToInt16(ddlStoryType.SelectedValue);
            objStory.StoryStatus = Convert.ToInt64(txtStepID.Value);
            objStory.Prior = (Story.PriorEnum)Convert.ToInt16(ddlStoryPrior.SelectedValue);
            objStory.TaskType = (Story.StoryTaskTypeEnum)Convert.ToInt16(ddlStoryTaskType.SelectedValue);
            objStory.PMEffortEstimated = Convert.ToDouble(txtPMEst.Text);
            objStory.PMEffort = Convert.ToDouble(txtPM.Text);
            objStory.DevEffortEstimated = Convert.ToDouble(txtDevEst.Text);
            objStory.DevEffort = Convert.ToDouble(txtDev.Text);
            objStory.TestEffortEstimated = Convert.ToDouble(txtTestEst.Text);
            objStory.TestEffort = Convert.ToDouble(txtTest.Text);
            objStory.Description = txtStoryDesc.Text;
            if (!String.IsNullOrEmpty(txtStoryTFS.Text))
            {
                objStory.TFS = Convert.ToInt64(txtStoryTFS.Text);
            }
            else
            {
                objStory.TFS = 0;
            }
            objStory.TFSServer = Convert.ToInt64(ddlTFSServer.SelectedValue);
            objStory.Status = (Story.StoryStatusEnum)Convert.ToInt16(txtStatusStory.Value);
            if (!String.IsNullOrEmpty(txtDueDate.Text))
                objStory.DueDate = Convert.ToDateTime(txtDueDate.Text);
            else
                objStory.DueDate = Story.DEFAULT_DATE;
        }

        public void RefreshStory(Story objStory)
        {
            txtStoryID.Value = objStory.ID.ToString();
            txtStoryName.Text = objStory.Name;
            txtStoryLaneID.Value = objStory.SwimLaneID.ToString();
            txtStepID.Value = objStory.StoryStatus.ToString();
            ddlStoryType.SelectedValue = Convert.ToInt16(objStory.StoryType).ToString();
            txtStoryStatus.Text = GetStatusString(objStory.StoryStatus);
            ddlStoryPrior.SelectedValue = Convert.ToInt16(objStory.Prior).ToString();
            ddlStoryTaskType.SelectedValue = Convert.ToInt16(objStory.TaskType).ToString();
            txtPMEst.Text = objStory.PMEffortEstimated.ToString();
            txtPM.Text = objStory.PMEffort.ToString();
            txtDevEst.Text = objStory.DevEffortEstimated.ToString();
            txtDev.Text = objStory.DevEffort.ToString();
            txtTestEst.Text = objStory.TestEffortEstimated.ToString();
            txtTest.Text = objStory.TestEffort.ToString();
            txtStoryDesc.Text = objStory.Description;
            txtStoryTFS.Text = objStory.TFS.ToString();
            ddlTFSServer.SelectedValue = objStory.TFSServer.ToString();
            lstEngineer.DataSource = objStory.Engineers;
            lstEngineer.DataBind();
            lstPM.DataSource = objStory.PMs;
            lstPM.DataBind();
            lnkEmail.HRef = GenerateEmailString(objStory);
            txtStatusStory.Value = Convert.ToInt16(objStory.Status).ToString();
            if (!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE))
                txtDueDate.Text = objStory.DueDate.ToShortDateString();
            else
                txtDueDate.Text = "";
        }

        #endregion

        #region "UI"
        public void RefreshLogView(Story objStory)
        {
            StringBuilder sb = new StringBuilder();
            List<StoryColumnLog> lst = KanBanBL.GetStoryColumnLog(objStory.ID);

            foreach (StoryColumnLog log in lst)
            {
                sb.Append(String.Format(LOG_STATUS_TEMPLATE, log.ToColumnName, log.LogDatetime.ToString("yyyy-MM-dd"), log.UserName));
            }

            litColumnLog.Text = sb.ToString();
        }
        public String GenerateEmailString(Story objStory)
        {
            StringBuilder sb = new StringBuilder();
            Boolean bMulti = false;
            if (objStory.PMs.Count > 0 || objStory.Engineers.Count > 0)
            {
                sb.Append("mailto:");
                foreach (User user in objStory.PMs)
                {
                    if (bMulti)
                        sb.Append(EMAIL_SEPERATOR);
                    else
                        bMulti = true;
                    sb.Append(user.Alias + "@microsoft.com");
                }
                foreach (User user in objStory.Engineers)
                {
                    if (bMulti)
                        sb.Append(EMAIL_SEPERATOR);
                    else
                        bMulti = true;
                    sb.Append(user.Alias + "@microsoft.com");
                }
                if (Uri.EscapeDataString(objStory.Name).Length + sb.Length <= MAX_EMAIL_LENGTH)
                {
                    sb.Append("?subject=");
                    sb.Append(Uri.EscapeDataString(objStory.Name));
                }
            }

            return sb.ToString();
        }
        public String BuildUserList(Story objStory)
        {
            StringBuilder sbContent = new StringBuilder();

            foreach (User user in objStory.PMs)
            {
                sbContent.Append(String.Format(STORY_MEMBER_TEMPLATE, user.Alias, user.Alias + "@microsoft.com"));
            }
            foreach (User user in objStory.Engineers)
            {
                sbContent.Append(String.Format(STORY_MEMBER_TEMPLATE, user.Alias, user.Alias + "@microsoft.com"));
            }

            return sbContent.ToString();
        }

        public void RefreshUserAddList(Story objStory)
        {
            Boolean bAssigned = false;

            ddlPM.Items.Clear();
            ddlEngineer.Items.Clear();
            foreach (User user in AllUserList)
            {
                bAssigned = false;
                foreach (User pm in objStory.PMs)
                {
                    if (pm.ID == user.ID)
                        bAssigned = true;
                }

                foreach (User eng in objStory.Engineers)
                {
                    if (eng.ID == user.ID)
                        bAssigned = true;
                }

                if (!bAssigned)
                {
                    ddlPM.Items.Add(new ListItem(user.Alias, user.ID.ToString()));
                    ddlEngineer.Items.Add(new ListItem(user.Alias, user.ID.ToString()));
                }
            }
        }

        public User GetUser(Int64 nID)
        {
            foreach (User user in AllUserList)
            {
                if (user.ID == nID) return user;
            }
            return null;
        }

        public Column GetColumn(Int64 nID)
        {
            foreach (Column col in ColumnList)
            {
                if (col.ID == nID)
                    return col;
            }
            return null;
        }

        public String GetStatusString(Int64 nID)
        {
            foreach (Column col in ColumnList)
            {
                if (col.ID == nID)
                    return col.Name;
            }
            return "";
        }
        #endregion
    }
}