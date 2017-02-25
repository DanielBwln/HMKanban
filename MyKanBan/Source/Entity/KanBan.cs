using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyKanBan.Source.Entity
{
    [Serializable]
    public class KanBan
    {
        public enum KanBanStatusEnum { Active = 1, Deleted = 99}

        public Int64 ID { set; get; }
        public String Name { set; get; }
        public KanBanStatusEnum Status { set; get; }
    }
}