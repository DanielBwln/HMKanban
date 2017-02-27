using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMKanBan.Source.Entity.TFS
{
    [Serializable]
    public class TFSWorkItemQuery
    {
        public Int64 ID { set; get; }
        public Int64 KanBanID { set; get; }
        public String Name { set; get; }
        public String Query { set; get; }
    }
}