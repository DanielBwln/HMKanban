using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.TeamFoundation.WorkItemTracking.Client;
using HMKanBan.Source.BL;
using HMKanBan.Source.Util;

namespace HMKanBan.Source.Entity.TFS
{
    [Serializable]
    public class TFSObject
    {
        public static readonly DateTime DEFAULT_DATE = new DateTime(1,1,1);
        public const String FeatureType = "Feature";
        public const String TaskType = "Task";
        public const String BugType = "Bug";
        public const String WorkItemType = "Work Item";

        public Int64 TFSID { set; get; }
        public String Title { set; get; }
        public String AssignedTo { set; get; }
        public String State { set; get; }
        public String NodeName { set; get; }
        public String Description { set; get; }
        public String Type { set; get; }
        public String Project { set; get; }
        public DateTime ETA_SLA { set; get; }

        public virtual void FillTFSObject(FieldCollection _fields)
        {
            if (_fields.Contains("System.Id")) this.TFSID = Convert.ToInt32(_fields["System.Id"].Value);
            if (_fields.Contains("System.TeamProject")) this.Project = _fields["System.TeamProject"].Value.ToString();
            if (_fields.Contains("System.WorkItemType")) this.Type = _fields["System.WorkItemType"].Value.ToString();
            if (_fields.Contains("System.Title")) this.Title = _fields["System.Title"].Value.ToString();
            if (_fields.Contains("System.AssignedTo")) this.AssignedTo = _fields["System.AssignedTo"].Value.ToString();
            if (_fields.Contains("System.State")) this.State = _fields["System.State"].Value.ToString();
            if (_fields.Contains("System.NodeName")) this.NodeName = _fields["System.NodeName"].Value.ToString();
            if (_fields.Contains("System.Description")) this.Description = _fields["System.Description"].Value.ToString();
            if (_fields.Contains("Microsoft.Dynamics.ETADate")) this.ETA_SLA = Convert.ToDateTime(_fields["Microsoft.Dynamics.ETADate"].Value).Date;
        }

        public virtual void ToStory(ref Story _objStory)
        {
            _objStory.TFS = this.TFSID;
            _objStory.Name = this.Title;
            _objStory.Description = KanBanUtil.HTML2Text(this.Description);
            if (!this.ETA_SLA.Date.Equals(TFSObject.DEFAULT_DATE.Date))
                _objStory.DueDate = this.ETA_SLA;
        }
    }
}