using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMKanBan.Source.Entity.TFS
{
    public class TFSObjectFactory
    {
        public static TFSObject CreateTFSObject(String _strTFS)
        {
            TFSObject obj = null;
            switch (_strTFS)
            {
                case TFSObject.FeatureType:
                    obj = new Feature();
                    break;
                case TFSObject.BugType:
                    obj = new Bug();
                    break;
                case TFSObject.WorkItemType:
                    obj = new WorkItem();
                    break;
                default:
                    obj = new TFSObject();
                    break;
            }
            return obj;
        }
    }
}