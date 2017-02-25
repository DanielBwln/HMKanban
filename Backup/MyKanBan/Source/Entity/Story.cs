using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyKanBan.Source.Entity
{
    [Serializable]
    public class Story
    {
        public static readonly String STORY_STATUS_FIELD = "StoryStatus";

        public static readonly DateTime DEFAULT_DATE = new DateTime(1900,1,1);
        public enum PriorEnum { P0 = 0, P1 = 1, P2 = 2, P3 = 3, P4 = 4}
        public enum StoryTypeEnum { InProgress = 1, Pending = 2, Blocking = 3, Ready = 10, Queue = 99}
        public enum StoryStatusEnum { None = 0, Active = 1, Finished = 10, Waiting = 50, Deleted = 99}
        public enum StoryTaskTypeEnum { Feature = 1, Task = 2 }
        public enum StoryChecklistStatus { None = 1, Part = 1, All = 2 }

        public Story(){
            PMs = new List<User>();
            Engineers = new List<User>();

            StoryChecklist = new List<StoryCheckItem>();

            PMWorkLogs = new List<PMWorkLog>();
            DevWorkLogs = new List<DevWorkLog>();
            TestWorkLogs = new List<TestWorkLog>();


            PMEffortEstimated = 0;
            DevEffortEstimated = 0;
            TestEffortEstimated = 0;
            PMEffort = 0;
            DevEffort = 0;
            TestEffort = 0;

            StoryType = StoryTypeEnum.Queue;
            Status = StoryStatusEnum.Waiting;
            Prior = PriorEnum.P4;
            TaskType = StoryTaskTypeEnum.Feature;
            TFS = 0;
            TFSServer = 0;
            DueDate = Story.DEFAULT_DATE;
            checklistStatus = StoryChecklistStatus.None;
            

            SwimLaneID = 0;
            KanBanID = 0;

            StayDay = 0;
            LifeDay = 0;
        }


        #region "View Object"
        public Int32 StayDay { set; get; }
        public Int32 LifeDay { set; get; }
        #endregion

        public Int64 ID { set; get; }
        public Int64 TFS { set; get; }
        public Int64 TFSServer { set; get; }
        public String Name { set; get; }
        public String Description { set; get; }
        public DateTime DueDate { set; get; }
        public PriorEnum Prior { set; get; }

        public Int64 SwimLaneID { set; get; }
        public Int64 KanBanID { set; get; }

        public List<User> PMs { set; get; }
        public List<User> Engineers { set; get; }
        public DateTime StageDueDate { set; get; }
        

        public Double PMEffortEstimated { set; get; }
        public Double DevEffortEstimated { set; get; }
        public Double TestEffortEstimated { set; get; }

        public Double PMEffort { set; get; }
        public Double DevEffort { set; get; }
        public Double TestEffort { set; get; }

        public List<StoryCheckItem> StoryChecklist { set; get; }

        public List<PMWorkLog> PMWorkLogs { set; get; }
        public List<DevWorkLog> DevWorkLogs { set; get; }
        public List<TestWorkLog> TestWorkLogs { set; get; }

        public Int64 StoryStatus { set; get; }
        public StoryTypeEnum StoryType { set; get; }
        public StoryStatusEnum Status { set; get; }
        public StoryTaskTypeEnum TaskType { set; get; }
        public StoryChecklistStatus checklistStatus { set; get; }

        public StoryChecklistStatus GetChecklistStatus(Column col)
        {
            if (StoryChecklist.Count() == 0)  checklistStatus = StoryChecklistStatus.None;
            else if (StoryChecklist.Count() == col.ColumnChecklist.Count()) checklistStatus = StoryChecklistStatus.All;
            else checklistStatus = StoryChecklistStatus.Part;
            return checklistStatus;
        }
    }
}