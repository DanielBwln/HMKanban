using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.TeamFoundation.Client;
using Microsoft.TeamFoundation.WorkItemTracking.Client;
using HMKanBan.Source.Entity.TFS;
using System.Web.Configuration;
using System.Data.SqlClient;
using HMKanBan.Source.DAL.Base;

namespace HMKanBan.Source.DAL
{
    public class TFSDAL : BaseDAL
    {
        public static String DEFAULT_TFS_SERVER = "http://vstfdax:8080/tfs/";
        public static String DEFAULT_TFS_COLLECTION = "MBS";
        private static String WiqlFeatureQueryTemplate = @"
            SELECT [System.Id], [System.TeamProject], [System.WorkItemType], [System.Title], [System.AssignedTo], [System.State], [System.NodeName], [Microsoft.Dynamics.PMAssigned], [Microsoft.Dynamics.DevAssigned], [Microsoft.Dynamics.TestAssigned], [Microsoft.Dynamics.PMSize], [Microsoft.Dynamics.DevSize], [Microsoft.Dynamics.TestSize], [System.Description], [Microsoft.VSTS.CMMI.StepsToReproduce], [Microsoft.Dynamics.ETADate] 
            FROM WorkItems 
            WHERE [System.Id] = {0}  AND [System.TeamProject] = '{1}'
        ";

        #region "server"
        public static List<TFSServer> ListAllServer()
        {
            List<TFSServer> lst = new List<TFSServer>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            TFSServer objServer = null;
            String strSQL = @"
                select
                    s.*
                from
                    KanBan_TFS_Server s;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    objServer = new TFSServer();
                    MapTFSServer(reader, ref objServer);
                    lst.Add(objServer);
                }
            }
            catch (Exception ex)
            {
                // empty for now
            }
            finally
            {
                if (reader != null)
                {
                    reader.Close();
                }

                if (conn != null)
                {
                    conn.Close();
                };
            }

            return lst;
        }
        public static void MapTFSServer(SqlDataReader reader, ref TFSServer server)
        {
            if (reader["ID"] != null && !reader.IsDBNull(reader.GetOrdinal("ID"))) server.ID = Convert.ToInt64(reader["ID"]);
            if (reader["Server"] != null && !reader.IsDBNull(reader.GetOrdinal("Server"))) server.Server = reader["Server"].ToString();
            if (reader["Collection"] != null && !reader.IsDBNull(reader.GetOrdinal("Collection"))) server.Collection = reader["Collection"].ToString();
            if (reader["Project"] != null && !reader.IsDBNull(reader.GetOrdinal("Project"))) server.Project = reader["Project"].ToString();
        }
        #endregion

        #region "Items"
        public static TFSObject RetrieveTFS(Int64 _nTFS, TFSServer _objServer)
        {
            Uri uriTFS = new Uri(_objServer.ConnString);
            TFSObject obj = null;
            String strSQL = "";

            using (var projectCollection = TfsTeamProjectCollectionFactory.GetTeamProjectCollection(uriTFS))
            {
                strSQL = String.Format(WiqlFeatureQueryTemplate, _nTFS, _objServer.Project);
                WorkItemStore workItemStore = projectCollection.GetService<WorkItemStore>();
                WorkItemCollection workItems = workItemStore.Query(strSQL);

                if (workItems.Count > 0)
                {
                    obj = TFSObjectFactory.CreateTFSObject(workItems[0].Fields["System.WorkItemType"].Value.ToString());
                    obj.FillTFSObject(workItems[0].Fields);
                }
            }

            return obj;
        }

        public static List<TFSObject> ListTFS(String _strQuery)
        {
            Uri uriTFS = new Uri(TFSServer.GenerateConnString(TFSDAL.DEFAULT_TFS_SERVER,TFSDAL.DEFAULT_TFS_COLLECTION));
            List<TFSObject> lst = new List<TFSObject>();
            TFSObject obj = null;

            using (var projectCollection = TfsTeamProjectCollectionFactory.GetTeamProjectCollection(uriTFS))
            {
                WorkItemStore workItemStore = projectCollection.GetService<WorkItemStore>();
                WorkItemCollection workItems = workItemStore.Query(_strQuery);

                foreach(Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItem item in workItems)
                {
                    obj = TFSObjectFactory.CreateTFSObject(item.Fields["System.WorkItemType"].Value.ToString());
                    obj.FillTFSObject(item.Fields);
                    lst.Add(obj);
                }
            }

            return lst;
        }
        #endregion

        #region "WIQ"
        public static List<TFSWorkItemQuery> ListQueryByKanBan(Int64 _nID)
        {
            List<TFSWorkItemQuery> lst = new List<TFSWorkItemQuery>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            TFSWorkItemQuery objQuery = null;
            String strSQL = @"
                select
                    w.*
                from
                    KanBan_TFS_WIQ w
                where 
                    w.KanBan_ID = @kanban_id;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _nID);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    objQuery = new TFSWorkItemQuery();
                    MapTFSWIQ(reader, ref objQuery);
                    lst.Add(objQuery);
                }
            }
            catch (Exception ex)
            {
                // empty for now
            }
            finally
            {
                if (reader != null)
                {
                    reader.Close();
                }

                if (conn != null)
                {
                    conn.Close();
                };
            }

            return lst;
        }
        public static void MapTFSWIQ(SqlDataReader reader, ref TFSWorkItemQuery query)
        {
            if (reader["ID"] != null && !reader.IsDBNull(reader.GetOrdinal("ID"))) query.ID = Convert.ToInt64(reader["ID"]);
            if (reader["KanBan_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("KanBan_ID"))) query.KanBanID = Convert.ToInt64(reader["KanBan_ID"]);
            if (reader["Name"] != null && !reader.IsDBNull(reader.GetOrdinal("Name"))) query.Name = reader["Name"].ToString();
            if (reader["WIQ"] != null && !reader.IsDBNull(reader.GetOrdinal("WIQ"))) query.Query = reader["WIQ"].ToString();
        }
        #endregion

        #region "LocalTFS"
        public static List<TFSObject> ListLocalTFS(Int64 _nKanBan)
        {
            List<TFSObject> lst = new List<TFSObject>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            TFSObject obj = null;
            String strSQL = @"
                select distinct 
                    s.TFS,
                    s.TFS_Server
                from
                    KanBan_Story s
                    inner join KanBan_SwimLane l on l.ID = s.SwimLane_ID
                where 
                    l.KanBan_ID = @kanban_id and
                    s.TFS > 0
                order by s.TFS;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _nKanBan);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    obj = new TFSObject();
                    obj.TFSID = Convert.ToInt64(reader["TFS"]);
                    obj.Project = Global.GetTFServerByID(Convert.ToInt64(reader["TFS_Server"])).Project;
                    lst.Add(obj);
                }
            }
            catch (Exception ex)
            {
                // empty for now
            }
            finally
            {
                if (reader != null)
                {
                    reader.Close();
                }

                if (conn != null)
                {
                    conn.Close();
                };
            }

            return lst;
        }
        #endregion
    }
}