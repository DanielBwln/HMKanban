using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HMKanBan.Source.BL;
using Microsoft.TeamFoundation.WorkItemTracking.Client;
using HMKanBan.Source.Util;

namespace HMKanBan.Source.Entity.TFS
{
    [Serializable]
    public class Bug : TFSObject
    {
        public String AssignedPM { set; get; }
        public String AssignedDev { set; get; }
        public String AssignedTest { set; get; }
        public String ReproSteps { set; get; }

        public override void FillTFSObject(FieldCollection _fields)
        {
            base.FillTFSObject(_fields);
            if (_fields.Contains("Microsoft.Dynamics.PMAssigned")) this.AssignedPM = _fields["Microsoft.Dynamics.PMAssigned"].Value.ToString();
            if (_fields.Contains("Microsoft.Dynamics.DevAssigned")) this.AssignedDev = _fields["Microsoft.Dynamics.DevAssigned"].Value.ToString();
            if (_fields.Contains("Microsoft.Dynamics.TestAssigned")) this.AssignedTest = _fields["Microsoft.Dynamics.TestAssigned"].Value.ToString();
            if (_fields.Contains("Microsoft.VSTS.CMMI.StepsToReproduce")) this.ReproSteps = _fields["Microsoft.VSTS.CMMI.StepsToReproduce"].Value.ToString();
        }

        public override void ToStory(ref Story _objStory)
        {
            User user = null;

            base.ToStory(ref _objStory);
            _objStory.Description = KanBanUtil.HTML2Text(ReproSteps);
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