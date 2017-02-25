using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyKanBan.Source.Entity;
using MyKanBan.Source.BL;
using System.Security.Principal;
using System.Text;
using MyKanBan.Source.Util;

namespace MyKanBan
{
    public partial class KanBan_Waitting : System.Web.UI.Page
    {
        #region "Member"
        public String FunctionButtonStyle
        {
            set { ViewState["VS_FunctionButtonStyle"] = value; }
            get { return (String)ViewState["VS_FunctionButtonStyle"]; }
        }
        public Story CurStory
        {
            set { ViewState["VS_CurStory"] = value; }
            get { return (Story)ViewState["VS_CurStory"]; }
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
        public List<User> UserList
        {
            set { ViewState["VS_UserList"] = value; }
            get { return (List<User>)ViewState["VS_UserList"]; }
        }

        public List<SwimmingLane> LaneList
        {
            set { ViewState["VS_LaneList"] = value; }
            get { return (List<SwimmingLane>)ViewState["VS_LaneList"]; }
        }
        #endregion

        #region "Template"
        public static Int32 MAX_EMAIL_LENGTH = 250;
        public static String EMAIL_SEPERATOR = ";";
        public static String STORY_TEMPLATE = @"
            <div id=""divStory_{0}"" name=""divStory_{0}"" class=""{3}"">
                <div class=""StoryDiv_FloatingNum"" style=""visibility:hidden""></div>
                <div class=""StoryDiv_Title"" id=""divStory_title_{0}"">{1}</div>
                <div class=""StoryDiv_Content"" id=""divStory_content_{0}"">{2}</div>
                <div class=""StoryDiv_Footer"">
                    <div id=""divStory_due_{0}"" class=""StoryDiv_ViewDetail_left"">{6}</div>
                    <a class=""StoryDiv_ViewDetail"" href=""#"" ontouchstart=""KanBan.ViewDetail({0}, event);return false;"" onmousedown=""KanBan.ViewDetail({0}, event);return false;"">Detail</a>
                    <a class=""StoryDiv_ViewDetail"" id=""divStory_tfslink_{0}"" style=""{5}"" href=""{4}"" target=""_blank"" ontouchstart=""ApoJS.Base.StopBubble();return false;"" onmousedown=""ApoJS.Base.StopBubble();return false;"">TFS</a>
                </div>
            </div>
        ";
        public static String STORY_MEMBER_TEMPLATE = @"<a href=""im:<sip:{1}>"" onmousedown=""ApoJS.Base.StopBubble(event);return false;"">{0}</a>";
        #endregion

        #region "Events"
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ((SiteMaster)this.Master).WAIT_STYLE = "menuitem_sel";
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
            KanBanBL.InitUserList(KanBanObj.ID);

            ListItem li = null;
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

            UserList = KanBanBL.GetUsers(KanBanObj.ID);
            LaneList = KanBanBL.GetKanBanLanesSimple(KanBanObj.ID);
            ddlLane.DataSource = LaneList;
            ddlLane.DataBind();
            txtDueDate.Attributes.Add("readonly", "readonly");

            litLegend.Text = KanBanUtil.PRIOR_LEGEND;
        }

        protected void PinStories()
        {
            List<Story> lstWait = KanBanBL.GetBacklog(KanBanObj.ID);
            StringBuilder sb = new StringBuilder();

            foreach(Story objStory in lstWait)
            {
                sb.Append(String.Format(STORY_TEMPLATE,
                    objStory.ID,
                    objStory.Name,
                    BuildUserList(objStory),
                    KanBanUtil.GetTicketStyleByPrior(objStory),
                    ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#"),
                    ((objStory.TFS > 0 && objStory.TFSServer > 0) ? "" : "display:none"),
                    ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date)) ? objStory.DueDate.ToShortDateString() : "")));
            }

            litWait.Text = sb.ToString();
        }

        protected void btnStorySubmit_Click(object sender, EventArgs e)
        {
            Story objStory = CurStory;

            try
            {
                if (String.IsNullOrEmpty(txtStoryID.Value) || Convert.ToInt64(txtStoryID.Value) == 0)
                {
                    // new 
                    if (!String.IsNullOrEmpty(txtStoryName.Text))
                    {
                        BuildStory(ref objStory);
                        KanBanBL.AddStory(ref objStory);
                        KanBanBL.LogStoryStatus(UserName, objStory.ID, Story.StoryStatusEnum.Waiting);
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                            "addStory",
                            "KanBan.CloseStory(function(){ KanBan.AddStory(" + objStory.SwimLaneID.ToString()
                                + ", " + objStory.StoryStatus.ToString() + ", " + objStory.ID.ToString() + ", '"
                                + KanBanUtil.GetTicketStyleByPrior(objStory) + "', '" + objStory.Name.Replace("'", "\\'") + "', '" + BuildUserList(objStory).Replace("'", "\\'") + "','','"
                                + ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#") + "','"
                                + ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date)) ? objStory.DueDate.ToShortDateString() : "") + "');});",
                            true);
                    }
                }
                else
                {
                    // update
                    if (!String.IsNullOrEmpty(txtStoryName.Text))
                    {
                        BuildStory(ref objStory);
                        KanBanBL.UpdateStory(objStory);
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                            "refreshStory",
                            "KanBan.CloseStory(function(){ KanBan.RefreshStory(" + objStory.SwimLaneID.ToString()
                                + ", " + objStory.StoryStatus.ToString() + ", " + objStory.ID.ToString() + ", '"
                                + KanBanUtil.GetTicketStyleByPrior(objStory) + "', '" + objStory.Name.Replace("'", "\\'") + "', '" + BuildUserList(objStory).Replace("'", "\\'") + "','','"
                                + ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#") + "','"
                                + ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date)) ? objStory.DueDate.ToShortDateString() : "") + "');});",
                            true);
                    }
                }
            }
            catch (Exception ex)
            {
                // do nothing
            }
        }
        protected void btnUpdateStoryStatus_Click(object sender, EventArgs e)
        {
            Story objStory = CurStory;

            try
            {

                KanBanBL.UpdateStoryStatus(objStory.ID, Story.StoryStatusEnum.Deleted);
                KanBanBL.LogStoryStatus(UserName, objStory.ID, Story.StoryStatusEnum.Deleted, objStory.Status);
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                    "removeStory",
                    "KanBan.CloseStory(function(){ KanBan.RemoveStory(" + objStory.ID.ToString() + ");});",
                    true);
            }
            catch (Exception ex)
            {
                // do nothing for now
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
                RefreshUserAddList(objStory);
                RefreshStory(objStory);

                FunctionButtonStyle = "";
                ddlLane.Visible = true;
                ddlStoryTaskType.Enabled = false;
            }
            else
            {
                // new
                txtStory_Title.Text = "New Story";
                CurStory = new Story();
                CurStory.StoryType = Story.StoryTypeEnum.Queue;
                ClearStory();
                RefreshUserAddList(CurStory);

                FunctionButtonStyle = "display:none";
                ddlLane.Visible = false;
                ddlStoryTaskType.Enabled = true;
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                "showStory",
                "KanBan.ShowStory();",
                true);
        }
        protected void btnMove_Click(object sender, EventArgs e)
        {
            if (ddlLane.SelectedIndex < 0) return;
            if (!String.IsNullOrEmpty(txtStoryID.Value) && Convert.ToInt64(txtStoryID.Value) != 0)
            {
                Story objStory = CurStory;
                List<Column> lstColumn = KanBanBL.GetKanBanColumns(KanBanObj.ID);
                if (lstColumn.Count > 0)
                {
                    BuildStory(ref objStory);
                    objStory.SwimLaneID = Convert.ToInt64(ddlLane.SelectedValue);
                    objStory.Status = Story.StoryStatusEnum.Active;
                    objStory.StoryStatus = lstColumn[0].ID;
                    KanBanBL.UpdateStory(objStory);
                    KanBanBL.UpdateStoryStatus(objStory.ID, Story.StoryStatusEnum.Active);
                    KanBanBL.UpdateStoryLane(objStory.ID, Convert.ToInt64(ddlLane.SelectedValue));
                    KanBanBL.LogStoryStatus(UserName, objStory.ID, Story.StoryStatusEnum.Active, Story.StoryStatusEnum.Waiting);
                    KanBanBL.LogStoryColumn(UserName, objStory.ID, objStory.StoryStatus);
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                        "removeStory",
                        "KanBan.CloseStory(function(){ KanBan.RemoveStory(" + objStory.ID.ToString() + ");});",
                        true);
                }
            }
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
        protected void AddAssign_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            Story objStory = CurStory;
            User user = null;

            try
            {
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
            catch (Exception ex)
            {
            }
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
            try
            {
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
            catch (Exception ex)
            {
            }
        }
        protected void EGRemoveButton_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            Int64 nUserID = Convert.ToInt64(lnk.Attributes["USER_ID"]);

            Story objStory = CurStory;
            try
            {
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
            catch (Exception ex)
            {
            }
        }
        #endregion

        #region "UI"
        protected void BuildStory(ref Story objStory)
        {
            if (!String.IsNullOrEmpty(txtStoryID.Value))
            {
                objStory.ID = Convert.ToInt64(txtStoryID.Value);
            }
            objStory.Name = txtStoryName.Text;
            objStory.SwimLaneID = 0;
            objStory.KanBanID = KanBanObj.ID;
            objStory.StoryType = (Story.StoryTypeEnum)Convert.ToInt16(ddlStoryType.SelectedValue);
            objStory.StoryStatus = 0;
            objStory.Prior = (Story.PriorEnum)Convert.ToInt16(ddlStoryPrior.SelectedValue);
            objStory.TaskType = (Story.StoryTaskTypeEnum)Convert.ToInt16(ddlStoryTaskType.SelectedValue);
            objStory.PMEffortEstimated = Convert.ToDouble(txtPMEst.Text);
            objStory.PMEffort = Convert.ToDouble(txtPM.Text);
            objStory.DevEffortEstimated = Convert.ToDouble(txtDevEst.Text);
            objStory.DevEffort = Convert.ToDouble(txtDev.Text);
            objStory.TestEffortEstimated = Convert.ToDouble(txtTestEst.Text);
            objStory.TestEffort = Convert.ToDouble(txtTest.Text);
            objStory.Description = txtStoryDesc.Text;
            objStory.TFSServer = Convert.ToInt64(ddlTFSServer.SelectedValue);
            if (!String.IsNullOrEmpty(txtStoryTFS.Text))
            {
                objStory.TFS = Convert.ToInt64(txtStoryTFS.Text);
            }
            else
            {
                objStory.TFS = 0;
            }

            objStory.Status = Story.StoryStatusEnum.Waiting;
            if (!String.IsNullOrEmpty(txtDueDate.Text))
                objStory.DueDate = Convert.ToDateTime(txtDueDate.Text);
            else
                objStory.DueDate = Story.DEFAULT_DATE;
        }
        public void ClearStory()
        {
            txtStoryID.Value = "";
            txtStoryName.Text = "";
            ddlStoryType.SelectedIndex = 1;
            txtStoryStatus.Text = "";
            ddlStoryPrior.SelectedIndex = 0;
            ddlStoryTaskType.SelectedIndex = 0;
            txtPMEst.Text = "0";
            txtPM.Text = "0";
            txtDevEst.Text = "0";
            txtDev.Text = "0";
            txtTestEst.Text = "0";
            txtTest.Text = "0";
            txtStoryDesc.Text = "";
            txtStoryTFS.Text = "0";
            ddlTFSServer.SelectedIndex = 0;
            txtStoryStatus.Text = "";
            lstEngineer.DataSource = new List<User>();
            lstEngineer.DataBind();
            lstPM.DataSource = new List<User>();
            lstPM.DataBind();
            txtStatusStory.Value = Convert.ToInt16(Story.StoryStatusEnum.Active).ToString();
            txtDueDate.Text = "";
        }
        protected void RefreshStory(Story objStory)
        {
            txtStoryID.Value = objStory.ID.ToString();
            txtStoryName.Text = objStory.Name;
            ddlStoryType.SelectedValue = Convert.ToInt16(objStory.StoryType).ToString();
            txtStoryStatus.Text = "";
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
            txtStatusStory.Value = Convert.ToInt16(Story.StoryStatusEnum.Waiting).ToString();
            if (!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE))
                txtDueDate.Text = objStory.DueDate.ToShortDateString();
            else
                txtDueDate.Text = "";
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
            foreach (User user in UserList)
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
            foreach (User user in UserList)
            {
                if (user.ID == nID) return user;
            }
            return null;
        }
        #endregion
    }
}