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
using MyKanBan.Source.Util;

namespace MyKanBan
{
    public partial class KanBan_ColumnGroup : System.Web.UI.Page
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
        public List<ColumnGroup> ColumnGroupList
        {
            set { ViewState["VS_ColumnGroupList"] = value; }
            get { return (List<ColumnGroup>)ViewState["VS_ColumnGroupList"]; }
        }
        public List<SwimmingLane> LaneList
        {
            set { ViewState["VS_LanList"] = value; }
            get { return (List<SwimmingLane>)ViewState["VS_LanList"]; }
        }
        #endregion

        #region "Template"
        public static String HEADER_TEMPLATE = @"<th id=""header_{0}"" name=""header_{0}"" class=""{2}""><div class=""FloatingHeader"" id=""Flyer"" name=""Flyer"" class=""FloatingHeader"">{1}</div></th>";
        public static String ROW_TEMPLATE = @"<tr id=""row_{0}"" name=""row_{0}"" class=""LaneRow""><td class=""FirstColumn"">{1}</td>{2}</tr>";
        public static String CELL_TEMPLATE = @"<td id=""cell_{0}_{1}""><div class=""tile_big""><div class=""tile_progress_num"" style=""{6}"">{2}</div><div class=""tile_pending_num"" style=""{7}"">{3}</div><div class=""tile_blocking_num"" style=""{8}"">{4}</div><div class=""tile_ready_num"" style=""{9}"">{5}</div></div></td>";
        #endregion

        #region "Events"
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ((SiteMaster)this.Master).SUMMARY_STYLE = "menuitem_sel";
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

            ColumnGroupList = KanBanBL.GetColumnGroup(KanBanObj.ID);
            LaneList = KanBanBL.GetKanBanLanesSimple(KanBanObj.ID);

            litLegend.Text = KanBanUtil.STATUS_LEGEND;
        }

        protected void PinStories()
        {
            StringBuilder sbHeader = new StringBuilder();
            StringBuilder sbBody = new StringBuilder();
            StringBuilder sbTmp;
            Int64 nReady, nProgress, nPending, nBlocking;
            Int32 nCount = 0;
            String strClass = "";

            foreach(ColumnGroup grp in ColumnGroupList)
            {
                nCount++;
                if (nCount < ColumnGroupList.Count)
                    strClass = "";
                else
                    strClass = "LastColumn";

                sbHeader.Append(String.Format(HEADER_TEMPLATE, grp.ID, grp.Name, strClass));
            }

            foreach(SwimmingLane lane in LaneList)
            {
                sbTmp = new StringBuilder();
                
                foreach (ColumnGroup grp in ColumnGroupList)
                {
                    nReady = 0;
                    nProgress = 0;
                    nPending = 0;
                    nBlocking = 0;
                    foreach(Story story in grp.StoryList)
                    {
                        if (story.SwimLaneID == lane.ID)
                        {
                            switch (story.StoryType)
                            {
                                case Story.StoryTypeEnum.Ready:
                                    nReady++;
                                    break;
                                case Story.StoryTypeEnum.InProgress:
                                    nProgress++;
                                    break;
                                case Story.StoryTypeEnum.Pending:
                                    nPending++;
                                    break;
                                case Story.StoryTypeEnum.Blocking:
                                    nBlocking++;
                                    break;
                            }
                        }
                    }
                    sbTmp.Append(String.Format(CELL_TEMPLATE, 
                        lane.ID, grp.ID, 
                        nProgress, 
                        nPending, 
                        nBlocking, 
                        nReady,
                        ((nProgress > 0) ? "" : "display:none;"),
                        ((nPending > 0) ? "" : "display:none;"),
                        ((nBlocking > 0) ? "" : "display:none;"),
                        ((nReady > 0) ? "" : "display:none;")));
                }

                sbBody.Append(String.Format(ROW_TEMPLATE, lane.ID,lane.Name, sbTmp.ToString()));
            }

            litHeader.Text = sbHeader.ToString();
            litBody.Text = sbBody.ToString();
        }
        #endregion
    }
}