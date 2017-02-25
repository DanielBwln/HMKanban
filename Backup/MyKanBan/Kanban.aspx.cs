using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;
using MyKanBan.Source.Entity;
using System.Text;
using MyKanBan.Source.Util;
using MyKanBan.Source.BL;
using MyKanBan.Source.Entity.Log;

namespace MyKanBan
{
    public partial class Kanban : System.Web.UI.Page
    {
        #region "members"
        public static Int32 MAX_EMAIL_LENGTH = 250;
        public static String EMAIL_SEPERATOR = ";";

        public String StoryIDList = "";
        public String StepIDList = "";
        public String ColumnsIDList = "";
        public Int32 KanBanWidth = 0;

        public String FunctionButtonStyle
        {
            set { ViewState["VS_FunctionButtonStyle"] = value; }
            get { return (String)ViewState["VS_FunctionButtonStyle"]; }
        }
        public String UserName
        {
            get { return ((SiteMaster)this.Master).UserName; }
        }
        public String UserDomain
        {
            get { return ((SiteMaster)this.Master).UserDomain; }
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
        public List<User> UserList
        {
            set { ViewState["VS_UserList"] = value; }
            get { return (List<User>)ViewState["VS_UserList"]; }
        }
        public KanBan KanBanObj
        {
            set { ViewState["VS_KanBan"] = value; }
            get { return (KanBan)ViewState["VS_KanBan"]; }
        }
        public Story CurStory
        {
            set { ViewState["VS_CurStory"] = value; }
            get { return (Story)ViewState["VS_CurStory"]; }
        }
        public SwimmingLane CurLane
        {
            set { ViewState["VS_CurLane"] = value; }
            get { return (SwimmingLane)ViewState["VS_CurLane"]; }
        }
        public Dictionary<Int64, Column> ColumnDic
        {
            set { ViewState["VS_ColumnDic"] = value; }
            get { return (Dictionary<Int64, Column>)ViewState["VS_ColumnDic"]; }
        }

        public static String SWIMLANE_TEMPLATE = @"
            <tr class=""StoryRow"" id=""row_{0}"">
                <td class=""FirstColumn""><div id=""FloatingColumn"" name=""FloatingColumn"" class=""FloatingColumn""><div class=""StoryRow_Title"" id=""row_title_{0}"" >{1}</div><div class=""StoryRow_Conf""><img alt=""config"" src=""./Images/add.png"" onclick=""KanBan.NewStoryClient({0});"" /><img alt=""config"" src=""./Images/conf.png"" onclick=""KanBan.UpdateLane({0});"" /></div></div></td>
                {2}
            </tr>    
        ";
        public static String SWIMLANE_TEMPLATE_TASK = @"
            <tr class=""StoryRow"" id=""row_{0}"">
                <td class=""FirstColumn""><div id=""FloatingColumn"" name=""FloatingColumn"" class=""FloatingColumn"" style=""background-color:#91989F;color:#FFFFFF;""><div class=""StoryRow_Title"" id=""row_title_{0}"" >{1}</div><div class=""StoryRow_Conf""><img alt=""config"" src=""./Images/add.png"" onclick=""KanBan.NewStoryClient({0});"" /><img alt=""config"" src=""./Images/conf.png"" onclick=""KanBan.UpdateLane({0});"" /></div></div></td>
                {2}
            </tr>    
        ";

        public static String COLUMN_TEMPLATE = @"
           <td id=""cell_{1}_{0}"" class=""{3}"">{2}</td> 
        ";
        public static String COLUMN_HEAD_TEMPLATE = @"
           <th class=""{1}"" ><div id=""Flyer"" Name=""Flyer"" class=""FloatingHeader"" >{0}</div></th> 
        ";
        public static String COLUMN_HEAD_TEMPLATE_WITH_LINK = @"
            <th class=""{1}"" ><div id=""Flyer"" Name=""Flyer"" class=""FloatingHeader""><a href=""{2}"" target=""_balnk"">{0}</a></div></th>";

        public static String COLUMN_HEAD_LAST_TEMPLATE = @"
           <th class=""{1} LastColumn"" ><div id=""Flyer"" Name=""Flyer"" class=""FloatingHeader"">{0}</div></th> 
        ";
        public static String COLUMN_HEAD_LAST_TEMPLATE_WITH_LINK = @"
           <th class=""{1} LastColumn"" ><div id=""Flyer"" Name=""Flyer"" class=""FloatingHeader""><a href=""{2}"" target=""_balnk"">{0}</a></div></th> 
        ";
        public static String COLUMN_HEAD_STORY_NUM_TEMPLATE = @"<div class=""column_storynum"">{0}</div>";

        public static String COLUMN_LINK_BULB = @"<img src=""./Images/bulb.png""/>";

        public static String STORY_TEMPLATE = @"
            <div id=""divStory_{0}"" name=""divStory_{0}"" class=""{3}"">
                {8}
                <div class=""StoryDiv_Title"" id=""divStory_title_{0}"" style=""top:-38px;"">{1}</div>
                <div class=""StoryDiv_Content"" id=""divStory_content_{0}"" style=""top:-38px;"">{2}</div>
                <div class=""StoryDiv_Footer"" style=""top:-38px;"">
                    <div id=""divStory_due_{0}"" class=""StoryDiv_ViewDetail_left"">{7}</div>
                    <a class=""StoryDiv_ViewDetail"" href=""#"" ontouchstart=""KanBan.ViewDetail({0}, event);return false;"" onmousedown=""KanBan.ViewDetail({0}, event);return false;"">Detail</a>
                    <a class=""StoryDiv_ViewDetail"" id=""divStory_tfslink_{0}"" href=""{5}"" style=""{6}"" target=""_blank"" ontouchstart=""ApoJS.Base.StopBubble();return false;"" onmousedown=""ApoJS.Base.StopBubble();return false;"">TFS</a>
                </div>
                <div class=""StoryDiv_Hover"" id=""divStory_{0}_Hover"">{4}</div>
            </div>";
        public static String STORY_NUM_TEMPLATE = @"<div class=""StoryDiv_FloatingNum"" style=""top:-10px;left:70px;{1}"" id=""divStory_StayDay_{3}"">{0}</div><div class=""StoryDiv_FloatingNum"" style=""top:-29px;left:100px;{1}"" id=""divStory_LifeDay_{3}"">{2}</div>";
        public static String STORY_NUM_STYLE_TEMPLATE = @"visibility:hidden;";

        public static String HOVER_CONTENT_TEMPLATE = @"<div class=""StoryDiv_Hover_Pair"">{3}</div>{4}<div class=""StoryDiv_Hover_Pair""><div class=""StoryDiv_Hover_Label"">PM Status&nbsp;:</div><div class=""StoryDiv_Hover_Value"">&nbsp;{0}</div></div><div class=""StoryDiv_Hover_Pair""><div class=""StoryDiv_Hover_Label"">Dev Status&nbsp;:</div><div class=""StoryDiv_Hover_Value"">&nbsp;{1}</div></div><div class=""StoryDiv_Hover_Pair""><div class=""StoryDiv_Hover_Label"">Test Status&nbsp;:</div><div class=""StoryDiv_Hover_Value"">&nbsp;{2}</div></div>";
        public static String STORY_ID_TEMPLATE = "divStory_{0}";
        public static String STEP_ID_TEMPLATE = "cell_{1}_{0}";
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

        protected void Page_Init(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ((SiteMaster)this.Master).KANBAN_STYLE = "menuitem_sel";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Init();
                PinStories();
            }
            ((SiteMaster)this.Master).KanBanObj = KanBanObj;
        }

        protected void Init()
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
            LaneList = KanBanBL.GetKanBanLanes(KanBanObj.ID);
            ColumnList = KanBanBL.GetKanBanColumns(KanBanObj.ID);
            UserList = KanBanBL.GetUsers(KanBanObj.ID);
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
            foreach (SwimmingLane.SwimingLaneTypeEnum type in Enum.GetValues(typeof(SwimmingLane.SwimingLaneTypeEnum)))
            {
                li = new ListItem(Enum.GetName(typeof(SwimmingLane.SwimingLaneTypeEnum), type), Convert.ToInt16(type).ToString());
                ddlLaneType.Items.Add(li);
            }
            foreach (Story.StoryTaskTypeEnum type in Enum.GetValues(typeof(Story.StoryTaskTypeEnum)))
            {
                li = new ListItem(Enum.GetName(typeof(Story.StoryTaskTypeEnum), type), Convert.ToInt16(type).ToString());
                ddlStoryTaskType.Items.Add(li);
            }
            ddlTFSServer.DataSource = Global.TFSServerList;
            ddlTFSServer.DataBind();

            ColumnDic = new Dictionary<long, Column>();
            txtDueDate.Attributes.Add("readonly","readonly");

            litLegend.Text = KanBanUtil.GetTicketStyleLegend(UserName);
        }
        
        protected void PinStories()
        {
            StringBuilder sbStory = new StringBuilder();
            StringBuilder sbStep = new StringBuilder();
            StringBuilder sbColumn = new StringBuilder();
            StringBuilder sbColumnHeader = new StringBuilder();
            StringBuilder sbHtml = new StringBuilder();
            StringBuilder sbSubHtml = null;
            String strColumnTemplate = "";
            String strLaneTemplate = "";
            String strHead = "", strStay = "", strLife = "";

            Dictionary<Int64, StringBuilder> dicColumn;
            StringBuilder sbTmp;
            int nCount = 0;

            dicColumn = new Dictionary<Int64, StringBuilder>();
            foreach (Column objColumnTmp in ColumnList)
            {
                nCount++;
                dicColumn.Add(objColumnTmp.ID, null);

                if (sbColumn.Length > 0) sbColumn.Append(",");
                sbColumn.Append(objColumnTmp.ID.ToString());
                ColumnDic[objColumnTmp.ID] = objColumnTmp;
            }
            sbStep = new StringBuilder();

            foreach (SwimmingLane lane in LaneList)
            {
                foreach (Column objColumnTmp in ColumnList)
                {
                    dicColumn[objColumnTmp.ID] = new StringBuilder();
                    if (sbStep.Length > 0) sbStep.Append(",");
                    sbStep.Append(String.Format(STEP_ID_TEMPLATE, lane.ID, objColumnTmp.ID));
                }
                
                foreach (Story objStory in lane.StoryList)
                {

                    objStory.GetChecklistStatus(ColumnList.FindLast(
                        delegate(Column col)
                        {
                            return col.ID == objStory.StoryStatus;
                        }
                        ));

                    if (objStory.SwimLaneID == lane.ID)
                    {
                        if (sbStory.Length > 0) sbStory.Append(",");
                        sbStory.Append(String.Format(STORY_ID_TEMPLATE, objStory.ID));

                        sbTmp = dicColumn[objStory.StoryStatus];
                        strHead = "";
                        if (objStory.TaskType == Story.StoryTaskTypeEnum.Feature
                            && objStory.StoryType != Story.StoryTypeEnum.Queue)
                        {
                            if (objStory.StayDay < 0) strStay = "-";
                            else strStay = objStory.StayDay.ToString();
                            if (objStory.LifeDay < 0) strLife = "-";
                            else strLife = objStory.LifeDay.ToString();
                            strHead = String.Format(STORY_NUM_TEMPLATE, strStay, "", strLife, objStory.ID.ToString());
                        }
                        else
                        {
                            strHead = String.Format(STORY_NUM_TEMPLATE, "-", STORY_NUM_STYLE_TEMPLATE, "-", objStory.ID.ToString());
                        }

                        sbTmp.Append(String.Format(STORY_TEMPLATE, 
                            objStory.ID,
                            objStory.Name, 
                            BuildUserList(objStory),
                            KanBanUtil.GetTicketStyle(UserName,objStory), 
                            GenerateHoverContent(objStory),
                            ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#"),
                            ((objStory.TFS > 0 && objStory.TFSServer > 0) ? "" : "display:none"),
                            ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date))?objStory.DueDate.ToShortDateString():""),
                            strHead));
                    }

                    if (objStory.TaskType == Story.StoryTaskTypeEnum.Feature 
                        && objStory.StoryType != Story.StoryTypeEnum.Queue)
                    {
                        foreach (Column objColumnTmp in ColumnList)
                        {
                            if (objStory.StoryStatus == objColumnTmp.ID)
                            {
                                objColumnTmp.StoryNum++;
                            }
                        }
                    }
                }

                sbSubHtml = new StringBuilder();
                foreach (KeyValuePair<Int64, StringBuilder> item in dicColumn)
                {
                    sbSubHtml.Append(String.Format(COLUMN_TEMPLATE, lane.ID, item.Key, item.Value.ToString(), GetCellCSSClass(ColumnDic[item.Key])));
                }

                strLaneTemplate = SWIMLANE_TEMPLATE;
                if (lane.Type == SwimmingLane.SwimingLaneTypeEnum.Task) strLaneTemplate = SWIMLANE_TEMPLATE_TASK;
                sbHtml.Append(String.Format(strLaneTemplate,
                    lane.ID, lane.Name,
                    sbSubHtml.ToString()));
            }

            nCount = 0;
            foreach (Column objColumnTmp in ColumnList)
            {
                strHead = "";
                if (objColumnTmp.StoryNum > 0)
                {
                    strHead = String.Format(COLUMN_HEAD_STORY_NUM_TEMPLATE, objColumnTmp.StoryNum.ToString());
                }
                if (String.IsNullOrEmpty(objColumnTmp.Link))
                {
                    if (nCount >= ColumnList.Count) strColumnTemplate = COLUMN_HEAD_LAST_TEMPLATE;
                    else strColumnTemplate = COLUMN_HEAD_TEMPLATE;
                    sbColumnHeader.Append(String.Format(strColumnTemplate, objColumnTmp.Name + strHead, GetColumnCSSClass(objColumnTmp)));
                }
                else
                {
                    if (nCount >= ColumnList.Count) strColumnTemplate = COLUMN_HEAD_LAST_TEMPLATE_WITH_LINK;
                    else strColumnTemplate = COLUMN_HEAD_TEMPLATE_WITH_LINK;
                    sbColumnHeader.Append(String.Format(strColumnTemplate, objColumnTmp.Name + COLUMN_LINK_BULB + strHead, GetColumnCSSClass(objColumnTmp), objColumnTmp.Link));
                }
            }

            StepIDList = sbStep.ToString();
            StoryIDList = sbStory.ToString();
            ColumnsIDList = sbColumn.ToString();
            litColumnsHead.Text = sbColumnHeader.ToString();
            litLanes.Text = sbHtml.ToString();
            KanBanWidth = 300 * ColumnList.Count + 400;
        }

        protected String GetStoryHTML(Story objStory)
        {
            String strHTML = "";
            strHTML = String.Format(STORY_TEMPLATE, objStory.ID, objStory.Name,"");
            return strHTML;
        }

        #region "Lane"
        protected void btnLane_Click(object sender, EventArgs e)
        {
            SwimmingLane objLane = new SwimmingLane();
            if (String.IsNullOrEmpty(txtLaneID.Value) || Convert.ToInt64(txtLaneID.Value) == 0)
            {
                // new
                if (!String.IsNullOrEmpty(txtLaneName.Text))
                {
                    BuildLane(ref objLane);
                    KanBanBL.CreateLane(ref objLane);
                    KanBanBL.LogLaneStatus(UserName, objLane.ID, SwimmingLane.SwimmingLaneStatusEnum.Active);
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                        "addLane",
                        "KanBan.CloseLane(function(){KanBan.AddLane(" + objLane.ID + ",'" + objLane.Name.Replace("'","\\'")  + "');});",
                        true);
                }
            }
            else
            {
                // update
                if (!String.IsNullOrEmpty(txtLaneName.Text))
                {
                    BuildLane(ref objLane);
                    KanBanBL.UpdateLane(objLane);
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                        "refreshLane",
                        "KanBan.CloseLane(function(){KanBan.RefreshLane(" + objLane.ID + ",'" + objLane.Name.Replace("'", "\\'") + "');});",
                        true);
                }
            }
        }

        protected void btnUpdateLane_Click(object sender, EventArgs e)
        {
            Int64 nID;
            SwimmingLane objLane;
            if (String.IsNullOrEmpty(txtLaneID.Value) || Convert.ToInt64(txtLaneID.Value) == 0)
            {
                // new 
                txtLane_Title.Text = "New Lane";
                CurLane = new SwimmingLane();
                ClearLane();
                FunctionButtonStyle = "display:none;";
            }
            else
            {
                // update
                nID = Convert.ToInt64(txtLaneID.Value);
                objLane = KanBanBL.GetLane(nID);
                CurLane = objLane;
                txtLane_Title.Text = "Lane - " + objLane.Name;
                FunctionButtonStyle = "";
                RefreshLane(objLane);
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                "showLane",
                "KanBan.ShowLane();",
                true);
        }

        protected void btnUpdateLaneStatus_Click(object sender, EventArgs e)
        {
            String strStatus = Request["__EVENTARGUMENT"];
            SwimmingLane objLane = CurLane;
            Boolean bNeedRemove = false;

            BuildLane(ref objLane);
            KanBanBL.UpdateLane(objLane);

            switch (strStatus)
            {
                case "Finish":
                    KanBanBL.UpdateLaneStatus(objLane.ID,SwimmingLane.SwimmingLaneStatusEnum.Finished);
                    KanBanBL.FinishStoryStatusByLane(objLane.ID, Story.StoryStatusEnum.Finished);
                    KanBanBL.LogLaneStatus(UserName, objLane.ID, SwimmingLane.SwimmingLaneStatusEnum.Finished, objLane.Status);
                    bNeedRemove = true;
                    break;
                case "Remove":
                    KanBanBL.UpdateLaneStatus(objLane.ID, SwimmingLane.SwimmingLaneStatusEnum.Deleted);
                    KanBanBL.FinishStoryStatusByLane(objLane.ID, Story.StoryStatusEnum.Deleted);
                    KanBanBL.LogLaneStatus(UserName, objLane.ID, SwimmingLane.SwimmingLaneStatusEnum.Deleted, objLane.Status);
                    bNeedRemove = true;
                    break;
                default:
                    bNeedRemove = false;
                    break;
            }

            if (bNeedRemove)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                    "removeLane",
                    "KanBan.CloseLane(function(){KanBan.RemoveLane(" + objLane.ID + ");});",
                    true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                    "refreshLane",
                    "KanBan.CloseLane(function(){KanBan.RefreshLane(" + objLane.ID + ",'" + objLane.Name.Replace("'", "\\'") + "');});",
                    true);
            }
        }
        #endregion

        #region "Story"
        protected void btnUpdateStoryStatus_Click(object sender, EventArgs e)
        {
            String strStatus = Request["__EVENTARGUMENT"];
            Story objStory = CurStory;
            Boolean bNeedRemove = false;

            try
            {

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
                        "KanBan.CloseStory(function(){ KanBan.RemoveStory(" + objStory.ID.ToString() + ");});",
                        true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                        "refreshStory",
                        "KanBan.CloseStory(function(){ KanBan.RefreshStory(" + objStory.SwimLaneID.ToString()
                            + ", " + objStory.StoryStatus.ToString() + ", " + objStory.ID.ToString() + ", '"
                            + KanBanUtil.GetTicketStyle(UserName, objStory) + "', '" + objStory.Name.Replace("'", "\\'") + "', '" + BuildUserList(objStory).Replace("'", "\\'") + "','"
                            + GenerateHoverContent(objStory).Replace("'", "\\'") + "','"
                            + ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#") + "','"
                            + ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date)) ? objStory.DueDate.ToShortDateString() : "") + "');});",
                        true);
                }
            }
            catch(Exception ex)
            {
                // do nothing for now
            }
        }

        protected void btnUpdateStoryStep_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txtStepID.Value) && !String.IsNullOrEmpty(txtStoryID.Value))
            {
                Boolean needUpdate = false;
                Int64 nNew;
                Int64 nID = Convert.ToInt64(txtStoryID.Value);
                nNew = Convert.ToInt64(txtStepID.Value);
                Story objStory = KanBanBL.GetStory(nID);
                if (objStory.StoryStatus != nNew)
                {
                    KanBanBL.LogStoryColumn(UserName, nID, nNew, objStory.StoryStatus);
                    objStory.StoryStatus = nNew;
                    // set story to ready if column is a ready column
                    if (ColumnDic[nNew].Type == Column.ColumnTypeEnum.Ready
                        && objStory.StoryType != Story.StoryTypeEnum.Ready)
                    {
                        objStory.StoryType = Story.StoryTypeEnum.Ready;
                        needUpdate = true;
                    }
                    // set stay days and life day if need
                    if (objStory.TaskType == Story.StoryTaskTypeEnum.Feature &&
                        objStory.StoryType != Story.StoryTypeEnum.Queue)
                    {
                        Int32 nStay, nLife;
                        KanBanBL.GetStoryDays(objStory, out nStay, out nLife);
                        objStory.StayDay = nStay;
                        objStory.LifeDay = nLife;
                        needUpdate = true;
                    }

                    KanBanBL.UpdateStory(objStory);

                    if (needUpdate)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                            "refreshStory",
                            "KanBan.CloseStory(function(){ KanBan.RefreshStory(" + objStory.SwimLaneID.ToString()
                                + ", " + objStory.StoryStatus.ToString() + ", " + objStory.ID.ToString() + ", '"
                                + KanBanUtil.GetTicketStyle(UserName, objStory) + "', '" + objStory.Name.Replace("'", "\\'") + "', '" + BuildUserList(objStory).Replace("'", "\\'") + "','"
                                + GenerateHoverContent(objStory).Replace("'", "\\'") + "','"
                                + ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#") + "','"
                                + ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date)) ? objStory.DueDate.ToShortDateString() : "") + "');"
                                + "KanBan.RefreshStoryFloating(" + objStory.ID.ToString() + "," + objStory.StayDay.ToString() + "," + objStory.LifeDay.ToString() + ");});",
                            true);
                    }
                }
            }
        }

        protected void btnStory_Click(object sender, EventArgs e)
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
                        KanBanBL.LogStoryStatus(UserName, objStory.ID, Story.StoryStatusEnum.Active);
                        KanBanBL.LogStoryColumn(UserName, objStory.ID, objStory.StoryStatus);
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                            "addStory",
                            "KanBan.CloseStory(function(){ KanBan.AddStory(" + objStory.SwimLaneID.ToString()
                                + ", " + objStory.StoryStatus.ToString() + ", " + objStory.ID.ToString() + ", '"
                                + KanBanUtil.GetTicketStyle(UserName, objStory) + "', '" + objStory.Name.Replace("'", "\\'") + "', '" + BuildUserList(objStory).Replace("'", "\\'") + "','"
                                + GenerateHoverContent(objStory).Replace("'","\\'") + "','"
                                + ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#") + "','"
                                +  ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date))?objStory.DueDate.ToShortDateString():"") + "');});",
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
                                + KanBanUtil.GetTicketStyle(UserName, objStory) + "', '" + objStory.Name.Replace("'", "\\'") + "', '" + BuildUserList(objStory).Replace("'", "\\'") + "','"
                                + GenerateHoverContent(objStory).Replace("'","\\'") + "','"
                                + ((objStory.TFS > 0 && objStory.TFSServer > 0) ? Global.GetTFServerByID(objStory.TFSServer).GenerateLink(objStory.TFS) : "#") + "','"
                                + ((!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date)) ? objStory.DueDate.ToShortDateString() : "") + "');});",
                            true);
                    }
                }
            }
            catch(Exception ex)
            {
                // do nothing
            }
        }

        protected void btnUpdateStory_Click(object sender, EventArgs e)
        {
            Story objStory;
            Int64 nID;
            if (String.IsNullOrEmpty(txtStoryID.Value) || Convert.ToInt64(txtStoryID.Value) == 0)
            {
                // new
                SwimmingLane objLane = GetLaneByID(Convert.ToInt64(txtStoryLaneID.Value));
                txtStory_Title.Text = "New Story";
                CurStory = new Story();
                switch(objLane.Type)
                {
                    case SwimmingLane.SwimingLaneTypeEnum.Feature:
                        CurStory.TaskType = Story.StoryTaskTypeEnum.Feature;
                        break;
                    case SwimmingLane.SwimingLaneTypeEnum.Task:
                        CurStory.TaskType = Story.StoryTaskTypeEnum.Task;
                        break;
                }
                ClearStory();
                RefreshUserAddList(CurStory);

                FunctionButtonStyle = "display:none;";
                btnLeft.Visible = false;
                btnRight.Visible = false;
            }
            else
            {
                // update
                nID = Convert.ToInt64(txtStoryID.Value);
                objStory = KanBanBL.GetStory(nID);
                CurStory = objStory;
                txtStory_Title.Text = objStory.Name;
                RefreshStory(objStory);
                RefreshUserAddList(objStory);
                RefreshLogView(objStory);

                FunctionButtonStyle = "";
                btnLeft.Visible = true;
                btnRight.Visible = true;
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                "showStory",
                "KanBan.ShowStory();",
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
            catch(Exception ex)
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
                foreach(User user in objStory.PMs)
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

        protected void lnkRetrieve_Click(object sender, EventArgs e)
        {
            Int64 nTFS = 0;
            Story curStory = CurStory;

            if(Int64.TryParse(txtStoryTFS.Text,out nTFS))
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
        #endregion

        #region "KanBan"
        protected void btnKanBan_Click(object sender, EventArgs e)
        {
            KanBan objKanBan = new KanBan();
            if (!String.IsNullOrEmpty(txtKanBanID.Value))
            {
                if (!String.IsNullOrEmpty(txtKanBanName.Text))
                {
                    BuildKanBan(ref objKanBan);
                    KanBanBL.UpdateKanBan(objKanBan);
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                        "refreshobjKanBan",
                        "KanBan.CloseKanBan(function(){ KanBan.RefreshKanBan("+objKanBan.ID.ToString()+",'"+objKanBan.Name.Replace("'","\\'")+"');});",
                        true);
                }
            }
        }

        protected void btnUpdateKanBan_Click(object sender, EventArgs e)
        {
            KanBan objKanBan;
            Int64 nID;
            if (!String.IsNullOrEmpty(txtKanBanID.Value))
            {
                nID = Convert.ToInt64(txtKanBanID.Value);
                objKanBan = KanBanBL.GetKanBan(nID);
                txtKanBan_Title.Text = objKanBan.Name;
                RefreshKanBan(objKanBan);
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                    "showKanBan",
                    "KanBan.ShowKanBan();",
                    true);
            }
        }
        #endregion

        #region "Master Data"
        public void BuildLane(ref SwimmingLane objLane)
        {
            if (!String.IsNullOrEmpty(txtLaneID.Value))
            {
                objLane.ID = Convert.ToInt64(txtLaneID.Value);
            }
            objLane.Name = txtLaneName.Text;
            objLane.KanBanID = KanBanObj.ID;
            objLane.Status = (SwimmingLane.SwimmingLaneStatusEnum)Convert.ToInt16(txtStatusLane.Value);
            objLane.Type = (SwimmingLane.SwimingLaneTypeEnum)Convert.ToInt16(ddlLaneType.SelectedValue);
        }

        public void RefreshLane(SwimmingLane objLane)
        {
            txtLaneID.Value = objLane.ID.ToString();
            txtLaneName.Text = objLane.Name;
            ddlLaneType.SelectedValue = Convert.ToInt16(objLane.Type).ToString();
            txtStatusLane.Value = Convert.ToInt16(objLane.Status).ToString();
        }

        public void ClearLane()
        {
            txtLaneID.Value = "";
            txtLaneName.Text = "";
            ddlLaneType.SelectedIndex = 0;
            txtStatusLane.Value = Convert.ToInt16(SwimmingLane.SwimmingLaneStatusEnum.Active).ToString();
        }

        public void BuildStory(ref Story objStory)
        {
            if (!String.IsNullOrEmpty(txtStoryID.Value))
            {
                objStory.ID = Convert.ToInt64(txtStoryID.Value);
            }
            objStory.Name = txtStoryName.Text;
            objStory.SwimLaneID = Convert.ToInt64(txtStoryLaneID.Value);
            objStory.KanBanID = KanBanObj.ID;
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
            objStory.TFSServer = Convert.ToInt64(ddlTFSServer.SelectedValue);
            if (!String.IsNullOrEmpty(txtStoryTFS.Text))
            {
                objStory.TFS = Convert.ToInt64(txtStoryTFS.Text);
            }
            else
            {
                objStory.TFS = 0;
            }
             
            objStory.Status = (Story.StoryStatusEnum)Convert.ToInt16(txtStatusStory.Value);
            if (!String.IsNullOrEmpty(txtDueDate.Text))
                objStory.DueDate = Convert.ToDateTime(txtDueDate.Text);
            else
                objStory.DueDate = Story.DEFAULT_DATE;

            // Added by Peter on 0714
            objStory.StageDueDate = objStory.DueDate;
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

        public void ClearStory()
        {
            SwimmingLane objLane = GetLaneByID(Convert.ToInt64(txtStoryLaneID.Value));
            if (objLane != null)
            {
                switch (objLane.Type)
                {
                    case SwimmingLane.SwimingLaneTypeEnum.Feature:
                        ddlStoryTaskType.SelectedIndex = 0;
                        break;
                    case SwimmingLane.SwimingLaneTypeEnum.Task:
                        ddlStoryTaskType.SelectedIndex = 1;
                        break;
                }
            }

            txtStoryID.Value = "";
            txtStoryName.Text = "";
            txtStepID.Value = "";
            ddlStoryType.SelectedIndex = 4;
            txtStoryStatus.Text = "";
            ddlStoryPrior.SelectedIndex = 0;
            txtPMEst.Text = "0";
            txtPM.Text = "0";
            txtDevEst.Text = "0";
            txtDev.Text = "0";
            txtTestEst.Text = "0";
            txtTest.Text = "0";
            txtStoryDesc.Text = "";
            txtStoryTFS.Text = "0";
            ddlTFSServer.SelectedIndex = 0;
            if (ColumnList.Count > 0)
            {
                txtStepID.Value = ColumnList[0].ID.ToString();
                txtStoryStatus.Text = GetStatusString(ColumnList[0].ID);
            }
            lstEngineer.DataSource = new List<User>();
            lstEngineer.DataBind();
            lstPM.DataSource = new List<User>();
            lstPM.DataBind();
            lnkEmail.HRef = "#";
            txtStatusStory.Value = Convert.ToInt16(Story.StoryStatusEnum.Active).ToString();
            litColumnLog.Text = "";
            txtDueDate.Text = "";
        }

        public void BuildKanBan(ref KanBan objKanBan)
        {
            if (!String.IsNullOrEmpty(txtKanBanID.Value))
            {
                objKanBan.ID = Convert.ToInt64(txtKanBanID.Value);
            }
            objKanBan.Name = txtKanBanName.Text;
        }

        public void RefreshKanBan(KanBan objKanBan)
        {
            txtKanBanID.Value = objKanBan.ID.ToString();
            txtKanBanName.Text = objKanBan.Name;
        }

        public void ClearKanBan()
        {
            txtKanBanID.Value = "";
            txtKanBanName.Text = "";
        }
        #endregion

        #region "UI"
        public void RefreshLogView(Story objStory)
        {
            StringBuilder sb = new StringBuilder();
            List<StoryColumnLog> lst = KanBanBL.GetStoryColumnLog(objStory.ID);

            foreach(StoryColumnLog log in lst)
            {
                sb.Append(String.Format(LOG_STATUS_TEMPLATE, log.ToColumnName, log.LogDatetime.ToString("yyyy-MM-dd"), log.UserName));
            }

            litColumnLog.Text = sb.ToString();
        }

        public String GenerateHoverContent(Story objStory)
        {
            return String.Format(
                HOVER_CONTENT_TEMPLATE,
                objStory.PMEffort.ToString() + "/" + objStory.PMEffortEstimated.ToString(),
                objStory.DevEffort.ToString() + "/" + objStory.DevEffortEstimated.ToString(),
                objStory.TestEffort.ToString() + "/" + objStory.TestEffortEstimated.ToString(),
                objStory.Name,
                (!objStory.DueDate.Date.Equals(Story.DEFAULT_DATE.Date))?@"<div class=""StoryDiv_Hover_Pair""><div class=""StoryDiv_Hover_Label"">Due Date&nbsp;:</div><div class=""StoryDiv_Hover_Value"">&nbsp;" + objStory.DueDate.ToShortDateString() + "</div></div>":"");
        }

        public String GenerateEmailString(Story objStory)
        {
            StringBuilder sb = new StringBuilder();
            Boolean bMulti = false;
            if (objStory.PMs.Count > 0 || objStory.Engineers.Count > 0 )
            {
                sb.Append("mailto:");
                foreach(User user in objStory.PMs)
                {
                    if (bMulti)
                        sb.Append(EMAIL_SEPERATOR);
                    else
                        bMulti = true;
                    sb.Append(user.Alias+"@microsoft.com");
                }
                foreach(User user in objStory.Engineers)
                {
                    if (bMulti)
                        sb.Append(EMAIL_SEPERATOR);
                    else
                        bMulti = true;
                    sb.Append(user.Alias+"@microsoft.com");
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

        public User GetUser(Int64 nID)
        {
            foreach(User user in UserList)
            {
                if (user.ID == nID) return user;
            }
            return null;
        }

        public void RefreshUserAddList(Story objStory)
        {
            Boolean bAssigned = false;

            ddlPM.Items.Clear();
            ddlEngineer.Items.Clear();
            foreach(User user in UserList)
            {
                bAssigned = false;
                foreach (User pm in objStory.PMs)
                {
                    if (pm.ID == user.ID)
                        bAssigned = true;
                }

                foreach(User eng in objStory.Engineers)
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

        public String GetColumnCSSClass(Column objColumn)
        {
            switch (objColumn.Type)
            {
                case Column.ColumnTypeEnum.Common:
                    return "";
                case Column.ColumnTypeEnum.Ready:
                    return "DoneColumn";
            }
            return "";
        }
        public String GetCellCSSClass(Column objColumn)
        {
            switch (objColumn.Type)
            {
                case Column.ColumnTypeEnum.Common:
                    return "";
                case Column.ColumnTypeEnum.Ready:
                    return "DoneCell";
            }
            return "";
        }

        public String GetStatusString(Int64 nID)
        {
            foreach(Column col in ColumnList)
            {
                if (col.ID == nID)
                    return col.Name;
            }
            return "";
        }

        public SwimmingLane GetLaneByID(Int64 nID)
        {
            foreach(SwimmingLane lane in LaneList)
            {
                if (lane.ID == nID) return lane;
            }
            return null;
        }
        #endregion
    }
}