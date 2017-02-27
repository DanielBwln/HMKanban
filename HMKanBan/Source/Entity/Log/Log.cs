using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyKanBan.Source.Entity.Log
{
    [Serializable]
    public class Log
    {
        public Int64 KanBanID { set; get; }
        public User User { set; get; }
        public String Alias { set; get; }
        public DateTime LogDatetime { set; get; }
        public String UserName
        {
            get
            {
                if (User != null)
                    return User.FullName;
                return Alias;
            }
        }
        public String GetContent()
        {
            return "";
        }
    }
}