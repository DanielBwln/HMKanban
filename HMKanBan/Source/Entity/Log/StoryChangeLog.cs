using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMKanBan.Source.Entity.Log
{
    [Serializable]
    public class StoryChangeLog : Log
    {
        public Int64 StoryID { set; get; }
        public String Field { set; get; }
        public String PrevValue { set; get; }
        public String NewValue { set; get; }
    }
}