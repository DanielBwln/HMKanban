using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using MyKanBan.Source.Entity.TFS;
using MyKanBan.Source.DAL;
using System.IO.Compression;

namespace MyKanBan
{
    public class Global : System.Web.HttpApplication
    {
        public static List<TFSServer> TFSServerList 
        {
            set { m_TFSServerList = value; }
            get 
            {
                if (m_TFSServerList == null)
                    m_TFSServerList = TFSDAL.ListAllServer();
                return m_TFSServerList;
            }
        }
        private static List<TFSServer> m_TFSServerList;
        
        public static TFSServer GetTFServerByID(Int64 _nID)
        {
            TFSServer objServer = null;
            foreach(TFSServer tmp in TFSServerList)
            {
                if (tmp.ID == _nID)
                {
                    objServer = tmp;
                    break;
                }
            }
            return objServer;
        }
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            //this.PreSendRequestHeaders += new EventHandler(Application_PreSendRequestHeaders);

        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

        void Application_PreSendRequestHeaders(object sender, EventArgs e)
        {
            /*
            HttpResponse response = ((HttpApplication)sender).Response;
            if (response.Filter is GZipStream && response.Headers["Content-encoding"] != "gzip")
                response.AppendHeader("Content-encoding", "gzip");
            else if (response.Filter is DeflateStream && response.Headers["Content-encoding"] != "deflate")
                response.AppendHeader("Content-encoding", "deflate");
             * */
        }
    }
}
