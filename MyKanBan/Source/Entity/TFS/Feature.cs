using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.TeamFoundation.WorkItemTracking.Client;
using MyKanBan.Source.BL;

namespace MyKanBan.Source.Entity.TFS
{
    [Serializable]
    public class Feature : TFSObject
    {
        public String AssignedPM { set; get; }
        public String AssignedDev { set; get; }
        public String AssignedTest { set; get; }
        public Int32 PMSize { set; get; }
        public Int32 DevSize { set; get; }
        public Int32 TestSize { set; get; }

        public override void FillTFSObject(FieldCollection _fields)
        {
            base.FillTFSObject(_fields);
            if (_fields.Contains("Microsoft.Dynamics.PMAssigned")) this.AssignedPM = _fields["Microsoft.Dynamics.PMAssigned"].Value.ToString();
            if (_fields.Contains("Microsoft.Dynamics.DevAssigned")) this.AssignedDev = _fields["Microsoft.Dynamics.DevAssigned"].Value.ToString();
            if (_fields.Contains("Microsoft.Dynamics.TestAssigned")) this.AssignedTest = _fields["Microsoft.Dynamics.TestAssigned"].Value.ToString();
            if (_fields.Contains("Microsoft.Dynamics.PMSize")) this.PMSize = Convert.ToInt32(_fields["Microsoft.Dynamics.PMSize"].Value);
            if (_fields.Contains("Microsoft.Dynamics.DevSize")) this.DevSize = Convert.ToInt32(_fields["Microsoft.Dynamics.DevSize"].Value);
            if (_fields.Contains("Microsoft.Dynamics.TestSize")) this.TestSize = Convert.ToInt32(_fields["Microsoft.Dynamics.TestSize"].Value);
        }

        public override void ToStory(ref Story _objStory)
        {
            User user = null;

            base.ToStory(ref _objStory); 
            _objStory.PMEffortEstimated = this.PMSize;
            _objStory.DevEffortEstimated = this.DevSize;
            _objStory.TestEffortEstimated = this.TestSize;
            user = KanBanBL.GetUserByFullName(this.AssignedPM);
            if (user != null) _objStory.PMs.Add(user);
            user = KanBanBL.GetUserByFullName(this.AssignedDev);
            if (user != null) _objStory.Engineers.Add(user);
            if (this.AssignedDev != this.AssignedTest)
            {
                user = KanBanBL.GetUserByFullName(this.AssignedTest);
                if (user != null) _objStory.Engineers.Add(user);
            }
        }
    }
}