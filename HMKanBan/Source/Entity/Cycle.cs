using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMKanBan.Source.Entity
{
    [Serializable]
    public class Cycle
    {
        public Int64 ID { set; get; }
        public String Name { set; get; }
        public Int64 KanBanID { set; get; }
        public Boolean IsDefault { set; get; }
    }
}