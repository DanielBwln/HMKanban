using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMKanBan.Source.Entity
{
    [Serializable]
    public class ColumnChecklist
    {
        public Int64 ID { set; get; }
        public Int64 ColumnID { set; get; }
        public String Name { set; get; }
    }
}