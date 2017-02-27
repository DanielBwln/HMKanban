using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMKanBan.Source.Entity
{
    [Serializable]
    public class User
    {
        public enum RoleEnum { PUM = 1, AA = 2, Leader = 3, PM = 4, Engineer = 5, Intern = 6, Vendor = 7}
        public enum UserStatusEnum { Active = 1, Inactive = 99}

        public Int64 ID { set; get; }
        public Int64 KanBanID { set; get; }
        public String Alias { set; get; }
        public String FirstName { set; get; }
        public String LastName { set; get; }
        public RoleEnum Role { set; get; }
        public UserStatusEnum Status { set; get; }
        public String FullName
        {
            get
            {
                return String.Format("{0} {1}", FirstName, LastName);
            }
        }
        
    }
}