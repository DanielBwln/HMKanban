using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMKanBan.Source.Entity
{
    [Serializable]
    public class Assignment
    {
        public enum AssignTypeEnum { Engineer = 1, PM = 2}

        public Int64 UserID { set; get; }
        public User User { set; get; }
        public Int64 StoryID { set; get; }
        public AssignTypeEnum Type { set; get; }
    }
}