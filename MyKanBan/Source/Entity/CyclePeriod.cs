using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyKanBan.Source.Entity
{
    [Serializable]
    public class CyclePeriod
    {
        public Int64 ID { set; get; }
        public Int64 KanBanID { set; get; }
        public Int64 CycleID { set; get; }
        public DateTime StartDate { set; get; }
        public DateTime EndDate { set; get; }
        public String Name { set; get; }
    }
}