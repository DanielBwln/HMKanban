using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyKanBan.Source.Entity
{
    [Serializable]
    public class SwimmingLane
    {
        public enum SwimmingLaneStatusEnum { None = 0, Active = 1, Finished = 10, Deleted = 99, Archived = 100 }
        public enum SwimingLaneTypeEnum { Feature = 1, Task = 2 }

        public Int64 ID { set; get; }
        public String Name { set; get; }
        public Int64 KanBanID { set; get; }
        public List<Story> StoryList { set; get; }
        public SwimmingLaneStatusEnum Status { set; get; }
        public SwimingLaneTypeEnum Type { set; get; }
    }
}