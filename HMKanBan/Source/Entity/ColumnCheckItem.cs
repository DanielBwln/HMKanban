using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyKanBan.Source.Entity
{
    [Serializable]
    public class ColumnCheckItem
    {
        public enum ColunmCheckItemTypeEnum { Activities = 1, Deliverable = 2}
        public Int64 ID { set; get; }
        public String Name { set; get; }
        public Int64 ColumnChecklistID { set; get; }
        public ColunmCheckItemTypeEnum CheckItemType { set; get; }

    }
}