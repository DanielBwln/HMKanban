using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyKanBan.Source.Entity;
using System.Security.Principal;
using MyKanBan.Source.BL;
using System.Text;
using MyKanBan.Source.Entity.Log;

namespace MyKanBan
{
    public partial class KanBan_Done : System.Web.UI.Page
    {
        #region "Member"
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
        public List<SwimmingLane> LaneList
        {
            set { ViewState["VS_LaneList"] = value; }
            get { return (List<SwimmingLane>)ViewState["VS_LaneList"]; }
        }
        public List<Column> ColumnList
        {
            set { ViewState["VS_ColumnList"] = value; }
            get { return (List<Column>)ViewState["VS_ColumnList"]; }
        }
        #endregion

        #region "Template"
        public static Int32 MAX_EMAIL_LENGTH = 250;
        public static String EMAIL_SEPERATOR = ";";
        public static String TR_ARCHIVE_TEMPLATE = @"
            <tr class=""StoryDoneRow"" id=""row_{0}"">
                <td class=""FirstColumn"" >
                    <div class=""StoryRow_Title"" id=""row_title_{0}"" >{1}</div><div class=""StoryRow_Conf""><img alt=""remove"" src=""./Images/remove.png"" onclick=""if(KanBan.RemoveClientEvent('{1}')) ArchiveLane({0});"" /></div>
                </td>
                <td>
                    {2}
                </td>
            </tr>
        ";
        public static String TR_TEMPLATE = @"
            <tr class=""StoryDoneRow"" id=""row_{0}"">
                <td class=""FirstColumn"" >
                    <div class=""StoryRow_Title"" id=""row_title_{0}"" >{1}</div></div>
                </td>
                <td>
                    {2}
                </td>
            </tr>
        ";
        public static String STORY_TEMPLATE = @"
            <div id=""divStory_{0}"" name=""divStory_{0}"" class=""{3}"">
                <div class=""StoryDiv_FloatingNum"" style=""visibility:hidden""></div>
                <div class=""StoryDiv_Title"" id=""divStory_title_{0}"">{1}</div>
                <div class=""StoryDiv_Content"" id=""divStory_content_{0}"">{2}</div>
                <div class=""StoryDiv_Footer"">
                    <div id=""divStory_due_{0}"" name=""divStory_due_{0}"" class=""StoryDiv_ViewDetail_left"">{6}</div>
                    <a class=""StoryDiv_ViewDetail"" href=""#"" ontouchstart=""KanBan.ViewDetail({0}, event);return false;"" onmousedown=""KanBan.ViewDetail({0}, event);return false;"">Detail</a>
                    <a class=""StoryDiv_ViewDetail"" id=""divStory_tfslink_{0}"" style=""{5}"" href=""{4}"" target=""_blank"" ontouchstart=""ApoJS.Base.StopBubble();return false;"" onmousedown=""ApoJS.Base.StopBubble();return false;"">TFS</a>
                </div>
            </div>
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
        #endregion

        #region "Events"
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ((SiteMaster)this.Master).BASKET_STYLE = "menuitem_sel";
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
        protected void Init()
        {
            Int64 nID;
            ListItem li = null;
            if (String.IsNullOrEmpty(Request.Params["ID"]) ||
                !Int64.TryParse(Request.Params["ID"], out nID))
            {
                nID = 1;
            }
            KanBanObj = KanBanBL.GetKanBan(nID);
            KanBanBL.InitUserList(KanBanObj.ID);

            LaneList = KanBanBL.GetNonActiveKanBanLanes(KanBanObj.ID);
            ColumnList = KanBanBL.GetAllKanBanColumns(KanBanObj.ID);
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
        }
        protected void PinStories()
        {
            StringBuilder sb = new StringBuilder();
            StringBuilder sbDone = null;
            StringBuilder sbRemove = null;
            
            foreach (SwimmingLane lane in LaneList)
            {
                sbDone = new StringBuilder();
                sbRemove = new StringBuilder();
                foreach (Story objStory in lane.StoryList)
                {
                    if (objStory.SwimLaneID == lane.ID)
                    {
                        switch(objStory.Status)
                        {
                            case Story.StoryStatusEnum.Deleted:
                                sbRemove.Append(String.Format(STORY_TEMPLATE, 
                                    objStory.ID, 
                                    objStory.Name, 
                                    BuildUserList(objStory),
                                    "StoryDiv_Removed", 
                                    ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#"),
                                    ((objStory.TFS > 0 && objStory.TFSServer > 0) ? "" : "display:none"),
                                    ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date)) ? objStory.DueDate.ToShortDateString() : "")));
                                break;
                            case Story.StoryStatusEnum.Finished:
                                sbDone.Append(String.Format(STORY_TEMPLATE, 
                                    objStory.ID, 
                                    objStory.Name, 
                                    BuildUserList(objStory),
                                    "StoryDiv_Finished", 
                                    ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#"),
                                    ((objStory.TFS > 0 && objStory.TFSServer > 0) ? "" : "display:none"),
                                    ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date)) ? objStory.DueDate.ToShortDateString() : "")));
                                break;
                        }
                    }
                }
                if (lane.Status == SwimmingLane.SwimmingLaneStatusEnum.Finished
                    || lane.Status == SwimmingLane.SwimmingLaneStatusEnum.Deleted)
                    sb.Append(String.Format(TR_ARCHIVE_TEMPLATE, lane.ID, lane.Name, sbDone.ToString() + sbRemove.ToString()));
                else
                    sb.Append(String.Format(TR_TEMPLATE, lane.ID, lane.Name, sbDone.ToString() + sbRemove.ToString()));
            }

            litTable.Text = sb.ToString();
        }
        #endregion

        #region "Lane"
        protected void btnArchiveLane_Click(object sender, EventArgs e)
        {
            String strID = Request["__EVENTARGUMENT"];
            Int64 nID = Convert.ToInt64(strID);
            SwimmingLane objLane = KanBanBL.GetLane(nID);
           
            KanBanBL.UpdateLaneStatus(objLane.ID,SwimmingLane.SwimmingLaneStatusEnum.Archived);
            KanBanBL.LogLaneStatus(UserName, objLane.ID, SwimmingLane.SwimmingLaneStatusEnum.Finished, objLane.Status);

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                "removeLane",
                "KanBan.RemoveLane(" + objLane.ID + ");",
                true);
        }
        #endregion

        #region "Story"
        protected void btnUpdateStory_Click(object sender, EventArgs e)
        {
            Story objStory;
            Int64 nID;
            if (!String.IsNullOrEmpty(txtStoryID.Value) && Convert.ToInt64(txtStoryID.Value) != 0)
            {
                nID = Convert.ToInt64(txtStoryID.Value);
                objStory = KanBanBL.GetStory(nID);
                txtStory_Title.Text = objStory.Name;
                RefreshLogView(objStory);
                RefreshStory(objStory);
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                    "showStory",
                    "KanBan.ShowStory();",
                    true);
            }
        }

        protected void RefreshStory(Story objStory)
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