using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMKanBan.Source.Entity.TFS
{
    [Serializable]
    public class TFSServer
    {
        public static String TFS_URL_TEMPLATE = "{0}{1}/{2}/_workitems#id={3}&_a=edit";
        public static String TFS_CONN_TEMPLATE = "{0}{1}";
        public Int64 ID { set; get; }
        public String Server { set; get; }
        public String Collection { set; get; }
        public String Project { set; get; }
        public String ConnString 
        { 
            get
            {
                return TFSServer.GenerateConnString(Server, Collection);
            }
        }
        public static String GenerateConnString(String _strServer, String _strCollection)
        {
            return String.Format(TFS_CONN_TEMPLATE, _strServer, _strCollection); 
        }
        public String GenerateLink(Int64 _nTFS)
        {
            return TFSServer.GenerateTFSLink(Server, Collection, Project, _nTFS);
        }
        public static String GenerateTFSLink(String _strServer, String _strCollection, String _strProject, Int64 _nTFS)
        {
            return String.Format(TFSServer.TFS_URL_TEMPLATE, _strServer, _strCollection, _strProject, _nTFS);
        }
    }
}