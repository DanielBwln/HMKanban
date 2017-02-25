using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyKanBan.Source.Entity
{
    [Serializable]
    public class SYSUser
    {
        public SYSUser()
        {
            Status = UserStatusEnum.Active;
            ConfigTicketColor = ConfigTicketColorEnum.Stauts;
        }

        public static readonly String GUEST_USER = "Guest";

        public enum ConfigTicketColorEnum { Stauts = 1, Prior = 10 }
        public enum UserStatusEnum { Active = 1, Inactive = 99 }

        public Int64 ID { set; get; }
        public String Alias { set; get; }
        public UserStatusEnum Status { set; get; }
        public ConfigTicketColorEnum ConfigTicketColor { set; get; }
    }
}