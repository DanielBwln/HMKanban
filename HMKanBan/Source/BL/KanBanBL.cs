using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyKanBan.Source.Entity;
using MyKanBan.Source.DAL;
using MyKanBan.Source.Entity.TFS;
using MyKanBan.Source.Util;
using MyKanBan.Source.Entity.Log;
using MyKanBan.Source.View;

namespace MyKanBan.Source.BL
{
    public class KanBanBL
    {
        private static Int64 KanBanID = 0;
        private static List<User> _userList = new List<User>();
        public static List<User> UserList 
        {
            set { _userList = value; }
            get { return _userList; }
        }
    
        public static void InitUserList(Int64 _KanBan)
        {
            if (KanBanBL.KanBanID != _KanBan)
            {
                KanBanBL.KanBanID = _KanBan;
                KanBanBL.UserList = KanBanBL.GetUsers(_KanBan);
            }
        }

        #region "KanBan"
        public static void CreateKanBan(ref KanBan objKanBan)
        {
            KanBanDAL.AddKanBan(ref objKanBan);
        }

        public static void UpdateKanBan(KanBan objKanBan)
        {
            KanBanDAL.UpdateKanBan(objKanBan);
        }

        public static KanBan GetKanBan(Int64 nID)
        {
            return KanBanDAL.GetKanBan(nID);
        }

        public static List<KanBan> ListKanBan()
        {
            return KanBanDAL.ListKanBan();
        }
        #endregion

        #region "Lane"
        public static void GetStoryDays(Story objStory, out Int32 nStayDays, out Int32 nLifeDays)
        {
            DateTime dtTmp1 = Story.DEFAULT_DATE, dtTmp2 = Story.DEFAULT_DATE, dtQueue = Story.DEFAULT_DATE;
            Int32 nDays = 0;
            Boolean bStart = false;
            List<StoryColumnLog> lstColumnLog = LogDAL.GetColumnLog(objStory.ID, objStory.StoryStatus);
            List<StoryChangeLog> lstChangeLog = LogDAL.GetChangeLog(objStory.ID, "StoryStatus", Convert.ToInt16(Story.StoryTypeEnum.Queue).ToString());

            nDays = 0;
            foreach (StoryChangeLog log in lstChangeLog)
            {
                if (log.PrevValue == Convert.ToInt16(Story.StoryTypeEnum.Queue).ToString())
                {
                    // leave queue
                    dtQueue = log.LogDatetime;
                    break;
                }
                /*
                else if (bStart && log.NewValue == Convert.ToInt16(Story.StoryTypeEnum.Queue).ToString())
                {
                    // enter queue
                    dtTmp2 = log.LogDatetime;
                    nDays += Convert.ToInt32(dtTmp2.Subtract(dtTmp1).TotalDays);
                    bStart = false;
                }
                */
            }
            if (dtQueue != Story.DEFAULT_DATE)
                nDays = Convert.ToInt32(DateTime.Now.Subtract(dtQueue).TotalDays);
            else
                nDays = -1;
            nLifeDays = nDays;

            if (dtQueue != Story.DEFAULT_DATE)
            {
                nDays = 0;
                bStart = false;
                foreach (StoryColumnLog log in lstColumnLog)
                {
                    if (bStart && log.FromColumnID == objStory.StoryStatus)
                    {
                        // leave stage
                        dtTmp2 = log.LogDatetime;
                        if (dtQueue < dtTmp1)
                            nDays += Convert.ToInt32(dtTmp2.Subtract(dtTmp1).TotalDays);
                        else if (dtQueue >= dtTmp1 && dtQueue <= dtTmp2)
                            nDays += Convert.ToInt32(dtTmp2.Subtract(dtQueue).TotalDays);
                        bStart = false;
                    }
                    else if (!bStart && log.ToColumnID == objStory.StoryStatus)
                    {
                        // enter stage
                        dtTmp1 = log.LogDatetime;
                        bStart = true;
                    }
                }
                if (bStart)
                {
                    if (dtQueue < dtTmp1)
                        nDays += Convert.ToInt32(DateTime.Now.Subtract(dtTmp1).TotalDays);
                    else
                        nDays += Convert.ToInt32(DateTime.Now.Subtract(dtQueue).TotalDays);
                }
            }
            else
            {
                nDays = -1;
            }
            nStayDays = nDays;
        }

        public static List<SwimmingLane> GetKanBanLanes(Int64 _KanBan)
        {
            List<SwimmingLane> lstLanes = null;
            List<Story> lstStory = null;
            List<Assignment> lstAssign = null;

            lstStory = KanBanDAL.GetStoryByKanBan(_KanBan);
            lstLanes = KanBanDAL.GetSwimLaneByKanBan(_KanBan);
            lstAssign = KanBanDAL.GetAssignmentsByKanBan(_KanBan);

            foreach(SwimmingLane lane in lstLanes)
            {
                lane.StoryList = new List<Story>();
                foreach(Story story in lstStory)
                {
                    story.PMs = new List<User>();
                    story.Engineers = new List<User>();

                    foreach(Assignment assign in lstAssign)
                    {
                        if (assign.StoryID == story.ID)
                        {
                            switch(assign.Type)
                            {
                                case Assignment.AssignTypeEnum.Engineer:
                                    story.Engineers.Add(assign.User);
                                    break;
                                case Assignment.AssignTypeEnum.PM:
                                    story.PMs.Add(assign.User);
                                    break;
                            }
                        }
                    }

                    // LIYAN: insert related StoryCheckItem
                    story.StoryChecklist = KanBanDAL.GetStoryChecklistByStoryID(story.ID);

                    if (story.SwimLaneID == lane.ID)
                    {
                        lane.StoryList.Add(story);
                    }
                }
            }

            Int32 nStay = 0, nLife = 0;
            foreach (Story story in lstStory)
            {
                if (story.TaskType == Story.StoryTaskTypeEnum.Feature &&
                    story.StoryType != Story.StoryTypeEnum.Queue)
                    GetStoryDays(story, out nStay, out nLife);
                story.StayDay = nStay;
                story.LifeDay = nLife;
            }

            return lstLanes;
        }

        public static List<SwimmingLane> GetNonActiveKanBanLanes(Int64 _KanBan)
        {
            List<SwimmingLane> lstLanes = GetAllKanBanLanes(_KanBan);
            List<SwimmingLane> lstResult = new List<SwimmingLane>();
            List<Story> lstStory = KanBanDAL.GetInactiveStoryByKanBan(_KanBan);
            List<Assignment> lstAssign = KanBanDAL.GetInactiveAssignmentByKanBan(_KanBan);

            foreach (SwimmingLane lane in lstLanes)
            {
                lane.StoryList = new List<Story>();
                foreach (Story story in lstStory)
                {
                    story.PMs = new List<User>();
                    story.Engineers = new List<User>();

                    foreach (Assignment assign in lstAssign)
                    {
                        if (assign.StoryID == story.ID)
                        {
                            switch (assign.Type)
                            {
                                case Assignment.AssignTypeEnum.Engineer:
                                    story.Engineers.Add(assign.User);
                                    break;
                                case Assignment.AssignTypeEnum.PM:
                                    story.PMs.Add(assign.User);
                                    break;
                            }
                        }
                    }

                    if (story.SwimLaneID == lane.ID)
                    {
                        lane.StoryList.Add(story);
                    }
                }

                if (lane.Status == SwimmingLane.SwimmingLaneStatusEnum.Deleted
                     || lane.Status == SwimmingLane.SwimmingLaneStatusEnum.Finished
                     || lane.StoryList.Count > 0)
                {
                    lstResult.Add(lane);
                }
            }

            return lstResult;
        }

        public static List<SwimmingLane> GetKanBanLanesSimple(Int64 _KanBan)
        {
            return KanBanDAL.GetSwimLaneByKanBan(_KanBan);
        }

        public static List<SwimmingLane> GetAllKanBanLanes(Int64 _KanBan)
        {
            return KanBanDAL.GetAllSwimLaneByKanBan(_KanBan);
        }

        public static void CreateLane(ref SwimmingLane objLane)
        {
            KanBanDAL.AddSwimLane(ref objLane);
        }

        public static void UpdateLane(SwimmingLane objLane)
        {
            KanBanDAL.UpdateSwimLane(objLane);
        }

        public static void UpdateLaneStatus(Int64 _nID, SwimmingLane.SwimmingLaneStatusEnum _status)
        {
            KanBanDAL.UpdateSwimLaneStatus(_nID, _status);
        }

        public static SwimmingLane GetLane(Int64 nID)
        {
            return KanBanDAL.GetSwimLane(nID);
        }
        #endregion

        #region "Story"
        public static List<Story> GetStoryListByKanBan(Int64 _KanBan)
        {
            List<Story> lstStory = null;
            List<Assignment> lstAssign = null;
            lstStory = KanBanDAL.GetStoryByKanBan(_KanBan);
            lstAssign = KanBanDAL.GetAssignmentsByKanBan(_KanBan);

            foreach (Story story in lstStory)
            {
                story.PMs = new List<User>();
                story.Engineers = new List<User>();

                foreach (Assignment assign in lstAssign)
                {
                    if (assign.StoryID == story.ID)
                    {
                        switch (assign.Type)
                        {
                            case Assignment.AssignTypeEnum.Engineer:
                                story.Engineers.Add(assign.User);
                                break;
                            case Assignment.AssignTypeEnum.PM:
                                story.PMs.Add(assign.User);
                                break;
                        }
                    }
                }
            }
            
            return lstStory;
        }

        public static List<Story> GetStoryListByKanBanOrderByType(Int64 _KanBan)
        {
            List<Story> lstStory = null;
            List<Assignment> lstAssign = null;
            lstStory = KanBanDAL.ByKanBanOrderByType(_KanBan, Story.StoryTaskTypeEnum.Feature);
            lstAssign = KanBanDAL.GetAssignmentsByKanBan(_KanBan);

            foreach (Story story in lstStory)
            {
                story.PMs = new List<User>();
                story.Engineers = new List<User>();

                foreach (Assignment assign in lstAssign)
                {
                    if (assign.StoryID == story.ID)
                    {
                        switch (assign.Type)
                        {
                            case Assignment.AssignTypeEnum.Engineer:
                                story.Engineers.Add(assign.User);
                                break;
                            case Assignment.AssignTypeEnum.PM:
                                story.PMs.Add(assign.User);
                                break;
                        }
                    }
                }
            }

            return lstStory;
        }

        public static void AddStory(ref Story objStory)
        {
            Story objTmp = new Story();
            KanBanDAL.AddStory(ref objStory);
            objTmp.ID = objStory.ID;
            TraceChangeLog(objStory, objTmp);
        }

        public static void UpdateStory(Story objStory)
        {
            Story objTmp = KanBanDAL.GetStory(objStory.ID);

            KanBanDAL.UpdateStory(objStory);
            TraceChangeLog(objStory, objTmp);
        }

        public static void UpdateStoryStatus(Int64 _nID, Story.StoryStatusEnum _status)
        {
            KanBanDAL.UpdateStoryStatus(_nID, _status);
        }

        public static void UpdateStoryLane(Int64 _nID, Int64 _nLane)
        {
            KanBanDAL.UpdateStoryLane(_nID, _nLane);
        }

        public static void FinishStoryStatusByLane(Int64 _nID, Story.StoryStatusEnum _status)
        {
            if ( _status != Story.StoryStatusEnum.Active)
            {
                KanBanDAL.UpdateStoryStatusByLane(_nID, _status);
            }
        }

        public static Story GetStory(Int64 nID)
        {
            Story objStory = KanBanDAL.GetStory(nID);
            List<Assignment> lstAssign = KanBanDAL.GetAssignmentsByStory(nID);

            foreach (Assignment assign in lstAssign)
            {
                if (assign.StoryID == objStory.ID)
                {
                    switch (assign.Type)
                    {
                        case Assignment.AssignTypeEnum.Engineer:
                            objStory.Engineers.Add(assign.User);
                            break;
                        case Assignment.AssignTypeEnum.PM:
                            objStory.PMs.Add(assign.User);
                            break;
                    }
                }
            }

            return objStory;
        }

        public static List<StoryCheckItem> GetStoryChecklist(Int64 _nID)
        {
            List<StoryCheckItem> lst = KanBanDAL.GetStoryChecklistByStoryID(_nID);
            return lst;
        }

        public static List<Story> GetBacklog(Int64 _nID)
        {
            List<Story> lstStory = KanBanDAL.GetStoryByStatusSortPrior(_nID, Story.StoryStatusEnum.Waiting);
            List<Assignment> lstAssign = KanBanDAL.GetBacklogAssignmentsByKanBan(_nID);

            foreach (Story story in lstStory)
            {
                story.PMs = new List<User>();
                story.Engineers = new List<User>();

                foreach (Assignment assign in lstAssign)
                {
                    if (assign.StoryID == story.ID)
                    {
                        switch (assign.Type)
                        {
                            case Assignment.AssignTypeEnum.Engineer:
                                story.Engineers.Add(assign.User);
                                break;
                            case Assignment.AssignTypeEnum.PM:
                                story.PMs.Add(assign.User);
                                break;
                        }
                    }
                }
            }

            return lstStory;
        }
        #endregion

        #region "Story CheckItem"

        public static void RemoveCheckItemByStoryCheckItemID(Int64 _StoryCheckItemID)
        {
           
            KanBanDAL.RemoveStoryCheckItemByItemID(_StoryCheckItemID);
            
        }

        #endregion

        #region "Column"
        public static List<ColumnGroup> GetColumnGroup(Int64 _KanBan)
        {
            List<ColumnGroup> lst = KanBanDAL.GetColumnGroupByKanBan(_KanBan);
            List<KeyValuePair<Int64, Int64>> lstMap = KanBanDAL.GetColumnGroupMapping(_KanBan);
            List<Story> lstStory = KanBanDAL.GetStoryInGroup(_KanBan);

            foreach(ColumnGroup group in lst)
            {
                foreach(KeyValuePair<Int64,Int64> pair in lstMap)
                {
                    if (pair.Key == group.ID)
                    {
                        foreach (Story story in lstStory)
                        {
                            if (pair.Value == story.StoryStatus)
                            {
                                group.AddStory(story);
                            }
                        }
                    }
                }
            }

            return lst;
        }

        public static List<Column> GetKanBanColumns(Int64 _KanBan)
        {
            // LIYAN: insert related ColumnCheckList
            List<Column> lst = KanBanDAL.GetColumnByKanBan(_KanBan);
            foreach(Column col in lst)
            {
                col.ColumnChecklist = KanBanDAL.GetColumnCheckItemByColumnID(col.ID);
            }

            return lst;
        }

        public static List<Column> GetAllKanBanColumns(Int64 _KanBan)
        {
            return KanBanDAL.GetAllColumnByKanBan(_KanBan);
        }
        #endregion

        #region "User"
        public static List<User> GetUsersByKanBan(Int64 _KanBan)
        {
            return KanBanDAL.GetUsersByKanBan(_KanBan); ;
        }
        
        public static void AddAssignment(Assignment objAssign)
        {
            KanBanDAL.AddAssignment(objAssign);
        }

        public static List<User> GetUsers(Int64 _KanBan)
        {
            return KanBanDAL.GetUsers(_KanBan);
        }

        public static void DeleteAssignment(Assignment objAssign)
        {
            KanBanDAL.DeleteAssignment(objAssign);
        }
        #endregion

        #region "SYS User"
        public static SYSUser GetSYSUser(String strAlias)
        {
            SYSUser objUser = SYSDAL.GetUser(strAlias);
            if (objUser.ID <= 0)
            {
                objUser.Alias = strAlias;
                SYSDAL.AddUser(ref objUser);
            }

            return objUser;
        }

        public static void UpdateSYSUser(SYSUser objUser)
        {
            SYSDAL.UpdateUser(objUser);
        }
        #endregion

        #region "Cycle"
        public static List<Cycle> ListCycleByKanBan(Int64 nKanBan)
        {
            return CycleDAL.ListCycleByKanBan(nKanBan);
        }
        public static List<CyclePeriod> ListCyclePeriodByCycle(Int64 nCycle)
        {
            return CycleDAL.ListCyclePeriodByCycle(nCycle);
        }

        public static Cycle GetDefaultCycle(Int64 nKanBan)
        {
            return CycleDAL.GetDefaultCycle(nKanBan);
        }
        public static CyclePeriod GetCurrentCyclePeriod(Int64 nKanBan, Int64 nCycleID)
        {
            CyclePeriod objPeriod = null;
            objPeriod = CycleDAL.GetCyclePeriodByDate(nKanBan, nCycleID, DateTime.Now.Date);
            return objPeriod;
        }
        public static CyclePeriod GetCyclePeriod(Int64 nKanBan, Int64 nCycleID, DateTime dtDate)
        {
            CyclePeriod objPeriod = null;
            objPeriod = CycleDAL.GetCyclePeriodByDate(nKanBan, nCycleID, dtDate);
            return objPeriod;
        }

        public static void GenerateCycleStatus(Int64 nKanBan, Int64 nCyclePeriod)
        {
            StoryPeriodStatusVO vo = new StoryPeriodStatusVO();
            StoryPeriodStatusVO voPrev = new StoryPeriodStatusVO();
            CyclePeriod objPeriodPrev; 
            CyclePeriod objPeriod = CycleDAL.GetCyclePeriod(nCyclePeriod);
            Column objFromColumn = KanBanDAL.GetColumnByTraceType(nKanBan, Column.ColumnTraceTypeEnum.Start);
            Column objToColumn = KanBanDAL.GetColumnByTraceType(nKanBan, Column.ColumnTraceTypeEnum.End);
            Int32 nCreated = 0, nFinished = 0, nCanceled = 0, nMoveIn = 0, nMoveOut = 0, nRemovedByLane = 0;

            nCreated += LogDAL.CountStoryStatus(nKanBan, Story.StoryStatusEnum.Active, Story.StoryStatusEnum.None, objPeriod.StartDate, objPeriod.EndDate);
            nCreated += LogDAL.CountStoryStatus(nKanBan, Story.StoryStatusEnum.Active, Story.StoryStatusEnum.Waiting, objPeriod.StartDate, objPeriod.EndDate);
            //nCreated += LogDAL.CountChangeLog(nKanBan, "StoryStatus", "99", objPeriod.StartDate, objPeriod.EndDate);

            nFinished += LogDAL.CountStoryStatus(nKanBan, Story.StoryStatusEnum.Finished, Story.StoryStatusEnum.Active, objPeriod.StartDate, objPeriod.EndDate);
            nCanceled += LogDAL.CountStoryStatus(nKanBan, Story.StoryStatusEnum.Deleted, Story.StoryStatusEnum.Active, objPeriod.StartDate, objPeriod.EndDate);

            nMoveIn += LogDAL.CountStoryColumnIn(nKanBan, objFromColumn.Seq, objToColumn.Seq, objPeriod.StartDate, objPeriod.EndDate);
            nMoveOut += LogDAL.CountStoryColumnOut(nKanBan, objFromColumn.Seq, objToColumn.Seq, objPeriod.StartDate, objPeriod.EndDate);

            nRemovedByLane += LogDAL.CountActiveStoryWithInactiveLane(nKanBan, objPeriod.StartDate, objPeriod.EndDate);

            objPeriodPrev = CycleDAL.GetPreviousCycle(objPeriod.CycleID, objPeriod.StartDate);
            voPrev = CycleDAL.GetPeriodStatus(objPeriodPrev.ID);

            vo.KanBanID = nKanBan;
            vo.CycleID = nCyclePeriod;
            vo.IncomeNum = nCreated;
            vo.OutcomeNum = nFinished + nCanceled + nRemovedByLane;
            vo.InventoryNum = voPrev.InventoryNum + vo.IncomeNum - vo.OutcomeNum;
            vo.IncomeNumCu = voPrev.IncomeNumCu + vo.IncomeNum;
            vo.OutcomeNumCu = voPrev.OutcomeNumCu + vo.OutcomeNum;

            CycleDAL.GeneratePeriodStatus(vo);
            CycleDAL.UpdateFollowingPeriod(vo, objPeriod.CycleID);
        }
        public static List<CyclePeriod> GetAllPeriod(Int64 nKanBan, Int64 nCycleID)
        {
            return CycleDAL.GetAllCyclePeriod(nKanBan, nCycleID);
        }
        public static List<StoryPeriodStatusVO> GetPeriodStatus(Int64 nKanBanID, Int64 nCycleID, Int64 nFromPeriod, Int64 nToPeriod)
        {
            return CycleDAL.GetPeriodStatus(nKanBanID, nCycleID,nFromPeriod,nToPeriod);
        }
        #endregion

        #region "Log"
        public static void TraceChangeLog(Story _objNew, Story _objPrev)
        {
            String strUserName = "";
            if (HttpContext.Current.Session["S_UserName"] != null)
                strUserName = HttpContext.Current.Session["S_UserName"].ToString();

            if (_objNew.StoryType != _objPrev.StoryType && _objNew.ID == _objPrev.ID)
            {
                LogStoryChange(
                    strUserName, 
                    _objNew.ID, 
                    Story.STORY_STATUS_FIELD,
                    Convert.ToInt16(_objNew.StoryType).ToString(),
                    Convert.ToInt16(_objPrev.StoryType).ToString());
            }
        }

        public static void LogLaneStatus(String _strAlias, Int64 _nID, SwimmingLane.SwimmingLaneStatusEnum _new, SwimmingLane.SwimmingLaneStatusEnum _prev = SwimmingLane.SwimmingLaneStatusEnum.None)
        {
            if (_new == _prev) return;
            LogDAL.LogLaneStatus(_strAlias, _nID, _new, _prev);
        }

        public static void LogStoryStatus(String _strAlias, Int64 _nID, Story.StoryStatusEnum _new, Story.StoryStatusEnum _prev = Story.StoryStatusEnum.None)
        {
            if (_new == _prev) return;
            LogDAL.LogStoryStatus(_strAlias, _nID, _new, _prev);
        }

        public static void LogStoryColumn(String _strAlias, Int64 _nID, Int64 _new, Int64 _prev=0)
        {
            if (_new == _prev) return;
            LogDAL.LogStoryColumn(_strAlias, _nID, _new, _prev);
        }

        public static void LogStoryChange(String _strAlias, Int64 _nID, String _strField, String _new, String _prev)
        {
            if (_new == _prev) return;
            LogDAL.LogStoryChange(_strAlias, _nID, _strField, _new, _prev);
        }

        public static List<StoryColumnLog> GetStoryColumnLog(Int64 _nStoryID)
        {
            List<StoryColumnLog> lst = LogDAL.ListStoryColumnLog(_nStoryID);

            foreach(StoryColumnLog log in lst)
            {
                log.User = GetUserByAlias(log.Alias);
            }

            return lst;
        }
        #endregion

        #region "TFS"
        public static void CreateStoryFromTFS(Int64 _nTFS, TFSServer _objServer, ref Story _objStory)
        {
            TFSObject obj = TFSDAL.RetrieveTFS(_nTFS, _objServer);
            if (obj != null)
            {
                obj.ToStory(ref _objStory);
            }
        }

        public static List<TFSWorkItemQuery> ListQueryByKanBan(Int64 _nID)
        {
            return TFSDAL.ListQueryByKanBan(_nID);
        }

        public static List<TFSObject> RunQuery(TFSWorkItemQuery _query)
        {
            return TFSDAL.ListTFS(_query.Query);
        }

        public static List<TFSObject> ListAllLocalTFS(Int64 _nKanBan)
        {
            return TFSDAL.ListLocalTFS(_nKanBan);
        }

        public static List<TFSObject> ListUnKanBannedTFS(Int64 _nKanBan, TFSWorkItemQuery _query)
        {
            List<TFSObject> lstRemote = RunQuery(_query);
            List<TFSObject> lstLocal = ListAllLocalTFS(_nKanBan);
            List<TFSObject> lst = new List<TFSObject>();
            Int32 nIndex = 0;
            Boolean bFire = true;

            foreach(TFSObject objRemote in lstRemote)
            {
                bFire = true;
                nIndex = 0;

                foreach(TFSObject objLocal in lstLocal)
                {
                    if (objLocal.TFSID == objRemote.TFSID && objLocal.Project == objRemote.Project)
                    {
                        bFire = false;
                        break;
                    }
                    nIndex++;
                }

                if (bFire)
                {
                    lst.Add(objRemote);
                }
                else
                {
                    lstLocal.RemoveAt(nIndex);
                }
            }

            return lst;
        }
        #endregion

        #region "Util"
        public static User GetUserByFullName(String _name)
        {
            User user = null;

            foreach(User tmp in UserList)
            {
                if (tmp.FullName.ToLower() == _name.ToLower())
                {
                    user = tmp;
                    break;
                }
            }

            return user;
        }

        public static User GetUserByAlias(String _alias)
        {
            User user = null;

            foreach (User tmp in UserList)
            {
                if (tmp.Alias.ToLower() == _alias.ToLower())
                {
                    user = tmp;
                    break;
                }
            }

            return user;
        }
        #endregion
    }
}