using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMKanBan.Source.Entity
{
    [Serializable]
    public class ColumnGroup
    {
        public ColumnGroup()
        {
            StoryList = new List<Story>();
            InProgressCount = 0;
            PendingCount = 0;
            BlockingCount = 0;
            ReadyCount = 0;
        }

        public Int64 ID { set; get; }
        public Int64 KanBanID { set; get; }
        public String Name { set; get; }
        public Int32 Seq { set; get; }
        public List<Story> StoryList { set; get; }

        public Int32 InProgressCount { set; get; }
        public Int32 PendingCount { set; get; }
        public Int32 BlockingCount { set; get; }
        public Int32 ReadyCount { set; get; }

        public void AddStory(Story objStory)
        {
            StoryList.Add(objStory);
            switch(objStory.StoryType)
            {
                case Story.StoryTypeEnum.InProgress:
                    InProgressCount++;
                    break;
                case Story.StoryTypeEnum.Blocking:
                    BlockingCount++;
                    break;
                case Story.StoryTypeEnum.Pending:
                    PendingCount++;
                    break;
                case Story.StoryTypeEnum.Ready:
                    ReadyCount++;
                    break;
            }
        }
    }
}