using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMKanBan.Source.Entity
{
    [Serializable]
    public class Column
    {
        public enum ColumnStatusEnum { Active = 1, Deleted = 99}
        public enum ColumnTypeEnum { Common = 1, Ready = 10 }
        public enum ColumnRoleTypeEnum { All = 1, None = 10, PM = 2, Engineer = 3}
        public enum ColumnTraceTypeEnum { None = 0, Start = 1, End = 2}

        public Column()
        {
            StoryNum = 0;
            ColumnChecklist = new List<ColumnCheckItem>();
        }

        public Int64 ID { set; get; }
        public Int32 Seq { set; get; }
        public Int32 StoryNum { set; get; }
        public String Name { set; get; }
        public Int64 KanBanID { set; get; }
        public ColumnStatusEnum Status { set; get; }
        public ColumnTypeEnum Type { set; get; }
        public ColumnRoleTypeEnum RoleType { set; get; }
        public ColumnTraceTypeEnum TraceType { set; get; }
        public String Link { set; get; }

        public DateTime StageDueDate { set; get; }

        public Boolean CheckValidUser(Story objStory, User objUser)
        {
            Boolean isPM = false, isEngineer = false;

            foreach(User user in objStory.PMs)
            {
                if (user.ID == objUser.ID)
                    isPM = true;
            }
            foreach(User user in objStory.Engineers)
            {
                if (user.ID == objUser.ID)
                    isEngineer = true;
            }

            switch(RoleType)
            {
                case ColumnRoleTypeEnum.All:
                    if (isPM || isEngineer)
                        return true;
                    break;
                case ColumnRoleTypeEnum.None:
                    break;
                case ColumnRoleTypeEnum.Engineer:
                    if (isEngineer) return true;
                    break;
                case ColumnRoleTypeEnum.PM:
                    if (isPM) return true;
                    break;
            }

            return false;
        }

        public List<ColumnCheckItem> ColumnChecklist;
    }
}