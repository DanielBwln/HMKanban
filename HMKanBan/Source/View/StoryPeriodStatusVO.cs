using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMKanBan.Source.View
{
    [Serializable]
    public class StoryPeriodStatusVO : BaseVO
    {
        public Int64 KanBanID { set; get; }
        public Int64 CycleID { set; get; }
        public Int32 InventoryNum { set; get; }
        public Int32 IncomeNum { set; get; }
        public Int32 OutcomeNum { set; get; }
        public Int32 FireNum { set; get; }
        public Int32 ResolveNum { set; get; }

        public Int32 IncomeNumCu { set; get; }
        public Int32 OutcomeNumCu { set; get; }
        public Int32 FireNumCu { set; get; }
        public Int32 ResolveNumCu { set; get; }
    }
}