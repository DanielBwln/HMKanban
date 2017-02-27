using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyKanBan.Source.Entity.Log
{
    [Serializable]
    public class StoryColumnLog : Log
    {
        public Int64 StoryID { set; get; }
        public Int64 FromColumnID { set; get; }
        public String FromColumnName { set; get; }
        public Int64 ToColumnID { set; get; }
        public String ToColumnName { set; get; }
    }
}