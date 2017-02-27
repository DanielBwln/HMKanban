using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyKanBan.Source.Entity
{
    [Serializable]
    public class StoryCheckItem
    {
        public Int64 ID { set; get; }
        public Int64 ColumnCheckID { set; get; }
        public Int64 StoryID { set; get; }
        public Boolean Checked { set; get; }
        public string Name { set; get; }
    }
}