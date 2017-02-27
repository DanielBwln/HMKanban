using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HMKanBan.Source.Entity.Log;
using System.Data.SqlClient;
using System.Web.Configuration;
using HMKanBan.Source.Entity;
using HMKanBan.Source.DAL.Base;

namespace HMKanBan.Source.DAL
{
    public class LogDAL : BaseDAL
    {
        public static List<StoryColumnLog> ListStoryColumnLog(Int64 _SotryID)
        {
            List<StoryColumnLog> lst = new List<StoryColumnLog>();
            SqlConnection conn = new SqlConnection(ConnString);
            StoryColumnLog log = null;
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    l.*,
                    f.Name as FromName,
                    t.Name as ToName
                from 
                    KanBan_Story_ColumnLog l
                    left join KanBan_Column f on f.ID = l.Column_ID_Prev
                    left join KanBan_Column t on t.ID = l.Column_ID_New
                where
                    l.Story_ID = @story
                order by l.CurDateTime DESC
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@story", _SotryID);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    log = new StoryColumnLog();
                    MapStoryColumnLog(reader, ref log);
                    if (reader["FromName"] != null && !reader.IsDBNull(reader.GetOrdinal("FromName"))) log.FromColumnName = reader["FromName"].ToString();
                    if (reader["ToName"] != null && !reader.IsDBNull(reader.GetOrdinal("ToName"))) log.ToColumnName = reader["ToName"].ToString();
                    lst.Add(log);
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

        public static List<StoryColumnLog> GetColumnLog(Int64 _SotryID, Int64 _ColumnID)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            DateTime dtValue = Story.DEFAULT_DATE;
            List<StoryColumnLog> lst = new List<StoryColumnLog>();
            StoryColumnLog log = null;

            SqlDataReader reader = null;

            String strSQL = @"
                select
                    cl.*
                from KanBan_Story_ColumnLog cl
                where
                    cl.Story_ID = @story_id and 
                    ( cl.Column_ID_New = @column or cl.Column_ID_Prev = @column)
                order by 
                    cl.CurDateTime asc;
            ";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.AddWithValue("@story_id", _SotryID);
                cmd.Parameters.AddWithValue("@column", _ColumnID);
                reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    log = new StoryColumnLog();
                    MapStoryColumnLog(reader, ref log);
                    lst.Add(log);
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
                }
            }

            return lst;
        }

        public static List<StoryChangeLog> GetChangeLog(Int64 _SotryID, String _Field, String _Value)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            DateTime dtValue = Story.DEFAULT_DATE;
            List<StoryChangeLog> lst = new List<StoryChangeLog>();
            StoryChangeLog log = null;
            SqlDataReader reader = null;

            String strSQL = @"
                select
                    cl.*
                from KanBan_Story_ChangeLog cl
                where
                    cl.Story_ID = @story_id and 
                    cl.Field = @field and 
                    ( cl.Value_Prev = @value or cl.Value_Prev = @value )
                order by 
                    cl.CurDateTime asc;
            ";
             try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.AddWithValue("@story_id", _SotryID);
                cmd.Parameters.AddWithValue("@field", _Field);
                cmd.Parameters.AddWithValue("@value", _Value);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    log = new StoryChangeLog();
                    MapStoryChangeLog(reader, ref log);
                    lst.Add(log);
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
                }
            }

             return lst;
        }

        public static void LogLaneStatus(String _strAlias, Int64 _nID, SwimmingLane.SwimmingLaneStatusEnum _new, SwimmingLane.SwimmingLaneStatusEnum _prev)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                insert into KanBan_SwimLane_StatusLog
                    (Alias, CurDatetime, Lane_ID, Status_Prev, Status_New)
                values
                    (@alias, @datetime, @lane, @prev, @new);
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@alias", _strAlias);
                cmd.Parameters.AddWithValue("@datetime", DateTime.Now);
                cmd.Parameters.AddWithValue("@lane", _nID);
                cmd.Parameters.AddWithValue("@prev", Convert.ToInt16(_prev));
                cmd.Parameters.AddWithValue("@new", Convert.ToInt16(_new));
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public static void LogStoryStatus(String _strAlias, Int64 _nID, Story.StoryStatusEnum _new, Story.StoryStatusEnum _prev)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                insert into KanBan_Story_StatusLog
                    (Alias, CurDatetime, Story_ID, Status_Prev, Status_New)
                values
                    (@alias, @datetime, @story, @prev, @new);
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@alias", _strAlias);
                cmd.Parameters.AddWithValue("@datetime", DateTime.Now);
                cmd.Parameters.AddWithValue("@story", _nID);
                cmd.Parameters.AddWithValue("@prev", Convert.ToInt16(_prev));
                cmd.Parameters.AddWithValue("@new", Convert.ToInt16(_new));
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public static void LogStoryColumn(String _strAlias, Int64 _nID, Int64 _new, Int64 _prev)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                insert into KanBan_Story_ColumnLog
                    (Alias, CurDatetime, Story_ID, Column_ID_Prev, Column_ID_New)
                values
                    (@alias, @datetime, @story, @prev, @new);
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@alias", _strAlias);
                cmd.Parameters.AddWithValue("@datetime", DateTime.Now);
                cmd.Parameters.AddWithValue("@story", _nID);
                cmd.Parameters.AddWithValue("@prev", _prev);
                cmd.Parameters.AddWithValue("@new", _new);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public static void LogStoryChange(String _strAlias, Int64 _nID, String _strField, String _new, String _prev)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                insert into KanBan_Story_ChangeLog
                    (Alias, CurDatetime, Story_ID, Field, Value_Prev, Value_New)
                values
                    (@alias, @datetime, @story, @field, @prev, @new);
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@alias", _strAlias);
                cmd.Parameters.AddWithValue("@datetime", DateTime.Now);
                cmd.Parameters.AddWithValue("@story", _nID);
                cmd.Parameters.AddWithValue("@field", _strField);
                cmd.Parameters.AddWithValue("@prev", _prev);
                cmd.Parameters.AddWithValue("@new", _new);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public static Int32 CountChangeLog(Int64 nKanBan, String strField, String strPrev, DateTime _from, DateTime _to)
        {
            Int32 nCount = 0;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;

            String strSQL = @"
                select
                    count( distinct s.ID ) as StoryNum
                from
                    KanBan_Story s
                    inner join KanBan_Story_ChangeLog l on l.Story_ID = s.ID
                where
                    s.KanBan_ID = @kanban_id and
                    s.TaskType  = @task_type and
                    l.Field = @field and
                    l.Value_Prev = @prev and
                    l.CurDatetime >= @from and
                    l.CurDatetime <= @to;
            ";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", nKanBan);
                cmd.Parameters.AddWithValue("@prev", strPrev);
                cmd.Parameters.AddWithValue("@field", strField);
                cmd.Parameters.AddWithValue("@from", _from);
                cmd.Parameters.AddWithValue("@to", _to);
                cmd.Parameters.AddWithValue("@task_type", Convert.ToInt16(Story.StoryTaskTypeEnum.Feature));
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    nCount = Convert.ToInt32(reader["StoryNum"]);
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

            return nCount;
        }

        public static Int32 CountActiveStoryWithInactiveLane(Int64 nKanBan, DateTime _from, DateTime _to)
        {
            Int32 nCount = 0;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;

            String strSQL = @"
                select
                    count( distinct s.ID ) as StoryNum
                from
                    KanBan_Story s
                    inner join KanBan_SwimLane l on l.ID = s.SwimLane_ID
                    inner join KanBan_SwimLane_StatusLog sl on l.ID = sl.Lane_ID
                    left join KanBan_Story_StatusLog ssl on ssl.Story_ID = s.ID and (ssl.Status_New = 99 or ssl.Status_New = 10)
                where
                    s.KanBan_ID = @kanban_id and
                    sl.Status_Prev = 1 and
                    (sl.Status_New = 99 or sl.Status_New = 10) and
                    ssl.Story_ID is null and 
                    sl.CurDatetime >= @from and
                    sl.CurDatetime <= @to;
            ";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", nKanBan);
                cmd.Parameters.AddWithValue("@from", _from);
                cmd.Parameters.AddWithValue("@to", _to);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    nCount = Convert.ToInt32(reader["StoryNum"]);
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

            return nCount;
        }

        public static Int32 CountStoryStatus(Int64 nKanBan, Story.StoryStatusEnum _new, Story.StoryStatusEnum _prev, DateTime _from, DateTime _to)
        {
            Int32 nCount = 0;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;

            String strSQL = @"
                select
                    count( distinct s.ID ) as StoryNum
                from
                    KanBan_Story s
                    inner join KanBan_Story_StatusLog l on l.Story_ID = s.ID
                where
                    s.KanBan_ID = @kanban_id and
                    s.TaskType  = @task_type and
                    l.Status_Prev = @prev and
                    l.Status_New = @new and
                    l.CurDatetime >= @from and
                    l.CurDatetime <= @to;
            ";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", nKanBan);
                cmd.Parameters.AddWithValue("@prev", Convert.ToInt16(_prev));
                cmd.Parameters.AddWithValue("@new", Convert.ToInt16(_new));
                cmd.Parameters.AddWithValue("@from", _from);
                cmd.Parameters.AddWithValue("@to", _to);
                cmd.Parameters.AddWithValue("@task_type", Convert.ToInt16(Story.StoryTaskTypeEnum.Feature));
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    nCount = Convert.ToInt32(reader["StoryNum"]);
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

            return nCount;
        }

        public static Int32 CountStoryColumnIn(Int64 nKanBan, Int32 nSeqFrom, Int32 nSeqTo, DateTime dtFrom, DateTime dtTo)
        {
            Int32 nCount = 0;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    count( distinct s.ID ) as StoryNum
                from
                    KanBan_Story s
                    inner join KanBan_Story_ColumnLog l on l.Story_ID = s.ID
                    left join KanBan_Column cp on cp.ID = l.Column_ID_Prev
                    left join KanBan_Column cn on cn.ID = l.Column_ID_New
                where
                    s.KanBan_ID = @kanban_id and
                    s.TaskType  = @task_type and
                    l.CurDatetime >= @from and
                    l.CurDatetime <= @to and
                    cn.Seq <= @seqTo and
                    cn.Seq >= @seqFrom and
                    ( cp.Seq < @seqFrom or cp.Seq = 0 );
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", nKanBan);
                cmd.Parameters.AddWithValue("@seqFrom", nSeqFrom);
                cmd.Parameters.AddWithValue("@seqTo", nSeqTo);
                cmd.Parameters.AddWithValue("@from", dtFrom);
                cmd.Parameters.AddWithValue("@to", dtTo);
                cmd.Parameters.AddWithValue("@task_type", Convert.ToInt16(Story.StoryTaskTypeEnum.Feature));
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    nCount = Convert.ToInt32(reader["StoryNum"]);
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

            return nCount;
        }

        public static Int32 CountStoryColumnOut(Int64 nKanBan, Int32 nSeqFrom, Int32 nSeqTo, DateTime dtFrom, DateTime dtTo)
        {
            Int32 nCount = 0;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    count( distinct s.ID ) as StoryNum
                from
                    KanBan_Story s
                    inner join KanBan_Story_ColumnLog l on l.Story_ID = s.ID
                    left join KanBan_Column cp on cp.ID = l.Column_ID_Prev
                    left join KanBan_Column cn on cn.ID = l.Column_ID_New
                where
                    s.KanBan_ID = @kanban_id and
                    s.TaskType  = @task_type and
                    l.CurDatetime >= @from and
                    l.CurDatetime <= @to and
                    cp.Seq <= @seqTo and
                    cp.Seq >= @seqFrom and
                    cn.Seq > @seqTo;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", nKanBan);
                cmd.Parameters.AddWithValue("@seqFrom", nSeqFrom);
                cmd.Parameters.AddWithValue("@seqTo", nSeqTo);
                cmd.Parameters.AddWithValue("@from", dtFrom);
                cmd.Parameters.AddWithValue("@to", dtTo);
                cmd.Parameters.AddWithValue("@task_type", Convert.ToInt16(Story.StoryTaskTypeEnum.Feature));
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    nCount = Convert.ToInt32(reader["StoryNum"]);
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

            return nCount;
        }

        public static void MapStoryColumnLog(SqlDataReader reader, ref StoryColumnLog log)
        {
            if (reader["Alias"] != null && !reader.IsDBNull(reader.GetOrdinal("Alias"))) log.Alias = reader["Alias"].ToString();
            if (reader["CurDatetime"] != null && !reader.IsDBNull(reader.GetOrdinal("CurDatetime"))) log.LogDatetime = Convert.ToDateTime(reader["CurDatetime"]);
            if (reader["Story_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("Story_ID"))) log.StoryID = Convert.ToInt64(reader["Story_ID"]);
            if (reader["Column_ID_Prev"] != null && !reader.IsDBNull(reader.GetOrdinal("Column_ID_Prev"))) log.FromColumnID = Convert.ToInt64(reader["Column_ID_Prev"]);
            if (reader["Column_ID_New"] != null && !reader.IsDBNull(reader.GetOrdinal("Column_ID_New"))) log.ToColumnID = Convert.ToInt64(reader["Column_ID_New"]);
        }

        public static void MapStoryChangeLog(SqlDataReader reader, ref StoryChangeLog log)
        {
            if (reader["Alias"] != null && !reader.IsDBNull(reader.GetOrdinal("Alias"))) log.Alias = reader["Alias"].ToString();
            if (reader["CurDatetime"] != null && !reader.IsDBNull(reader.GetOrdinal("CurDatetime"))) log.LogDatetime = Convert.ToDateTime(reader["CurDatetime"]);
            if (reader["Story_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("Story_ID"))) log.StoryID = Convert.ToInt64(reader["Story_ID"]);
            if (reader["Field"] != null && !reader.IsDBNull(reader.GetOrdinal("Field"))) log.Field = reader["Field"].ToString();
            if (reader["Value_Prev"] != null && !reader.IsDBNull(reader.GetOrdinal("Value_Prev"))) log.PrevValue = reader["Value_Prev"].ToString();
            if (reader["Value_New"] != null && !reader.IsDBNull(reader.GetOrdinal("Value_New"))) log.NewValue = reader["Value_New"].ToString();
        }
    }
}