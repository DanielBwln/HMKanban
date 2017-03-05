using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using HMKanBan.Source.Entity;
using System.Data.SqlClient;
using HMKanBan.Source.DAL.Base;

namespace HMKanBan.Source.DAL
{
    public class KanBanDAL : BaseDAL
    {
        #region "KanBan"
        public static void AddKanBan(ref KanBan objKanBan)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                insert into KanBan(Name)
                output Inserted.ID
                values(@name);
            ";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@name", objKanBan.Name);

                objKanBan.ID = (Int64)cmd.ExecuteScalar();
            }
            catch(Exception ex)
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

        public static void UpdateKanBan(KanBan objKanBan)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                update KanBan
                set Name = @name
                where 
                    ID = @id;
            ";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", objKanBan.ID);
                cmd.Parameters.AddWithValue("@name", objKanBan.Name);
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
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

        public static KanBan GetKanBan(Int64 nID)
        {
            KanBan objKanBan = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    k.* 
                from 
                    KanBan k
                where 
                    k.ID = @id;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", nID);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    objKanBan = MapKanBan(reader);
                }
            }
            catch (Exception ex)
            {
                throw ex;
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

            return objKanBan;
        }

        public static List<KanBan> ListKanBan()
        {
            List<KanBan> lstKanBan = new List<KanBan>();
            KanBan objKanBan = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    k.* 
                from 
                    KanBan k
                where 
                    k.Status = @status;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@status", Convert.ToInt16(KanBan.KanBanStatusEnum.Active));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    objKanBan = MapKanBan(reader);
                    lstKanBan.Add(objKanBan);
                }
            }
            catch (Exception ex)
            {
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

            return lstKanBan;
        }

        public static KanBan MapKanBan(SqlDataReader reader)
        {
            KanBan kanban = new KanBan();

            if (reader["ID"] != null && !reader.IsDBNull(reader.GetOrdinal("ID"))) kanban.ID = Convert.ToInt64(reader["ID"]);
            if (reader["Name"] != null && !reader.IsDBNull(reader.GetOrdinal("Name"))) kanban.Name = reader["Name"].ToString();
            if (reader["Status"] != null && !reader.IsDBNull(reader.GetOrdinal("Status"))) kanban.Status = (KanBan.KanBanStatusEnum)Convert.ToInt16(reader["Status"]);

            return kanban;
        }
        #endregion

        #region "Story"
        public static List<Story> ByKanBanOrderByType(Int64 _KanBanID, Story.StoryTaskTypeEnum _taskType)
        {
            List<Story> lst = new List<Story>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    s.* 
                from 
                    KanBan_Story s
                inner join KanBan_SwimLane l on s.SwimLane_ID = l.ID
                inner join KanBan k on l.KanBan_ID = k.ID
                where 
                    k.ID = @kanban_id and
                    s.Status = @status and
                    s.TaskType  = @task_type
                order by 
                    s.StoryType;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _KanBanID);
                cmd.Parameters.AddWithValue("@status", Convert.ToInt16(Story.StoryStatusEnum.Active));
                cmd.Parameters.AddWithValue("@task_type", Convert.ToInt16(_taskType));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(MapStory(reader));
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

        public static List<Story> GetStoryByKanBan(Int64 _KanBanID)
        {
            List<Story> lst = new List<Story>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            Story objStory = null;
            String strSQL = @"
                select 
                    s.*
                from 
                    KanBan_Story s
                inner join KanBan_SwimLane l on s.SwimLane_ID = l.ID
                inner join KanBan k on l.KanBan_ID = k.ID
                where 
                    k.ID = @kanban_id and
                    s.Status = @status;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _KanBanID);
                cmd.Parameters.AddWithValue("@status", Convert.ToInt16(Story.StoryStatusEnum.Active));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    objStory = MapStory(reader);
                    // cache the checklist data for story
                    objStory.StoryChecklist = GetStoryChecklistByStoryID(objStory.ID);
                    lst.Add(objStory);
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
        
        public static List<Story> GetStoryInGroup(Int64 _KanBanID)
        {
            List<Story> lst = new List<Story>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    s.* 
                from 
                    KanBan_Story s
                inner join KanBan_Column c on s.StoryStatus = c.ID
                inner join KanBan_ColumnGroup_Mapping m on m.Column_ID = c.ID
                inner join KanBan_ColumnGroup g on g.ID = m.ColumnGroup_ID
                inner join KanBan k on g.KanBan_ID = k.ID
                where 
                    k.ID = @kanban_id and
                    s.Status = @status;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _KanBanID);
                cmd.Parameters.AddWithValue("@status", Convert.ToInt16(Story.StoryStatusEnum.Active));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(MapStory(reader));
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

        public static List<Story> GetInactiveStoryByKanBan(Int64 _KanBanID)
        {
            List<Story> lst = new List<Story>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    s.* 
                from 
                    KanBan_Story s
                inner join KanBan_SwimLane l on s.SwimLane_ID = l.ID and l.Status <> @status_l
                inner join KanBan k on l.KanBan_ID = k.ID
                where 
                    k.ID = @kanban_id and
                    ( s.Status = @status_f or s.Status = @status_d);
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _KanBanID);
                cmd.Parameters.AddWithValue("@status_f", Convert.ToInt16(Story.StoryStatusEnum.Finished));
                cmd.Parameters.AddWithValue("@status_d", Convert.ToInt16(Story.StoryStatusEnum.Deleted));
                cmd.Parameters.AddWithValue("@status_l", Convert.ToInt16(SwimmingLane.SwimmingLaneStatusEnum.Archived));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(MapStory(reader));
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

        public static List<Story> GetStoryByStatusSortPrior(Int64 _KanBanID, Story.StoryStatusEnum nStatus)
        {
            List<Story> lst = new List<Story>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    s.* 
                from 
                    KanBan_Story s
                where 
                    s.KanBan_ID = @kanban and 
                    s.Status = @status
                order by 
                    s.Prior;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban", _KanBanID);
                cmd.Parameters.AddWithValue("@status", Convert.ToInt16(nStatus));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(MapStory(reader));
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

        public static void AddStory(ref Story objStory)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            SqlTransaction trans = null;
            String strSQL = @"
                insert into KanBan_Story
                    (Name,TFS, TFS_Server,Description,PMWork, TestWork, DevWork, PMWorkEst, TestWorkEst, DevWorkEst,StoryStatus, StoryType, SwimLane_ID, KanBan_ID, Prior, Status, DueDate, TaskType, StageDueDate) 
                output Inserted.ID
                values
                    (@name, @tfs, @server, @desc, @pm, @test, @dev, @pmest, @testest, @devest, @status, @type, @swimlane_id, @kanban_id, @prior, @db_status, @due_date, @task_type, @stage_due_date);
            ";
            String strAssign = @"
                insert into KanBan_Assignment
                    (StoryID, UserID, AssignType)
                values
                    (@story_id, @user_id, @type);
            ";
            try
            {
                conn.Open();
                trans = conn.BeginTransaction();

                SqlCommand cmd = new SqlCommand(strSQL, conn, trans);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@name", objStory.Name);
                cmd.Parameters.AddWithValue("@tfs", objStory.TFS);
                cmd.Parameters.AddWithValue("@server", objStory.TFSServer);
                cmd.Parameters.AddWithValue("@desc",objStory.Description);
                cmd.Parameters.AddWithValue("@pm", objStory.PMEffort);
                cmd.Parameters.AddWithValue("@test",objStory.TestEffort);
                cmd.Parameters.AddWithValue("@dev", objStory.DevEffort);
                cmd.Parameters.AddWithValue("@pmest", objStory.PMEffortEstimated);
                cmd.Parameters.AddWithValue("@testest", objStory.TestEffortEstimated);
                cmd.Parameters.AddWithValue("@devest", objStory.DevEffortEstimated);
                cmd.Parameters.AddWithValue("@status", objStory.StoryStatus);
                cmd.Parameters.AddWithValue("@type", objStory.StoryType);
                cmd.Parameters.AddWithValue("@swimlane_id", objStory.SwimLaneID);
                cmd.Parameters.AddWithValue("@kanban_id", objStory.KanBanID);
                cmd.Parameters.AddWithValue("@prior", objStory.Prior);
                cmd.Parameters.AddWithValue("@db_status", objStory.Status);
                cmd.Parameters.AddWithValue("@due_date", objStory.DueDate.Date);
                cmd.Parameters.AddWithValue("@task_type", objStory.TaskType);
                cmd.Parameters.AddWithValue("@stage_due_date", objStory.StageDueDate);
                objStory.ID = (Int64)cmd.ExecuteScalar();

                cmd.CommandText = strAssign;
                foreach(User user in objStory.PMs)
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@story_id", objStory.ID);
                    cmd.Parameters.AddWithValue("@user_id", user.ID);
                    cmd.Parameters.AddWithValue("@type", Convert.ToInt16(Assignment.AssignTypeEnum.PM));
                    cmd.ExecuteNonQuery();
                }
                foreach (User user in objStory.Engineers)
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@story_id", objStory.ID);
                    cmd.Parameters.AddWithValue("@user_id", user.ID);
                    cmd.Parameters.AddWithValue("@type", Convert.ToInt16(Assignment.AssignTypeEnum.Engineer));
                    cmd.ExecuteNonQuery();
                }

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null) trans.Rollback();
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public static void UpdateStory(Story objStory)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            SqlTransaction trans = null;
            String strSQL = @"
                update KanBan_Story
                set 
                    Name=@name,
                    TFS=@tfs,
                    TFS_Server=@server,
                    Description=@desc,
                    PMWork=@pm, 
                    TestWork=@test, 
                    DevWork=@dev, 
                    PMWorkEst=@pmest, 
                    TestWorkEst=@testest, 
                    DevWorkEst=@devest,
                    StoryStatus=@status, 
                    StoryType=@type, 
                    Prior=@prior,
                    DueDate=@due_date,
                    TaskType=@task_type,
                    StageDueDate=@stage_due_date
                    
                where ID = @id;
            ";
            String strDelAssign = @"
                delete from KanBan_Assignment where StoryID = @story_id;
            ";
            String strAssign = @"
                insert into KanBan_Assignment
                    (StoryID, UserID, AssignType)
                values
                    (@story_id, @user_id, @type);
            ";
            try
            {
                conn.Open();
                trans = conn.BeginTransaction();

                SqlCommand cmd = new SqlCommand(strSQL,conn, trans);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", objStory.ID);
                cmd.Parameters.AddWithValue("@name", objStory.Name);
                cmd.Parameters.AddWithValue("@tfs", objStory.TFS);
                cmd.Parameters.AddWithValue("@server", objStory.TFSServer);
                cmd.Parameters.AddWithValue("@desc", objStory.Description);
                cmd.Parameters.AddWithValue("@pm", objStory.PMEffort);
                cmd.Parameters.AddWithValue("@test", objStory.TestEffort);
                cmd.Parameters.AddWithValue("@dev", objStory.DevEffort);
                cmd.Parameters.AddWithValue("@pmest", objStory.PMEffortEstimated);
                cmd.Parameters.AddWithValue("@testest", objStory.TestEffortEstimated);
                cmd.Parameters.AddWithValue("@devest", objStory.DevEffortEstimated);
                cmd.Parameters.AddWithValue("@status", objStory.StoryStatus);
                cmd.Parameters.AddWithValue("@type", objStory.StoryType);
                cmd.Parameters.AddWithValue("@prior", objStory.Prior);
                cmd.Parameters.AddWithValue("@due_date", objStory.DueDate.Date);
                cmd.Parameters.AddWithValue("@task_type", objStory.TaskType);
                cmd.Parameters.AddWithValue("@stage_due_date", objStory.StageDueDate);
                cmd.ExecuteNonQuery();

                cmd.CommandText = strDelAssign;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@story_id", objStory.ID);
                cmd.ExecuteNonQuery();

                cmd.CommandText = strAssign;
                foreach (User user in objStory.PMs)
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@story_id", objStory.ID);
                    cmd.Parameters.AddWithValue("@user_id", user.ID);
                    cmd.Parameters.AddWithValue("@type", Convert.ToInt16(Assignment.AssignTypeEnum.PM));
                    cmd.ExecuteNonQuery();
                }
                foreach (User user in objStory.Engineers)
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@story_id", objStory.ID);
                    cmd.Parameters.AddWithValue("@user_id", user.ID);
                    cmd.Parameters.AddWithValue("@type", Convert.ToInt16(Assignment.AssignTypeEnum.Engineer));
                    cmd.ExecuteNonQuery();
                }

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                    trans.Rollback();
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public static void UpdateStoryStatus(Int64 _nID, Story.StoryStatusEnum _status)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                update KanBan_Story
                set Status = @status
                where ID = @id;
            ";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", _nID);
                cmd.Parameters.AddWithValue("@status", Convert.ToInt16(_status));

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

        public static void UpdateStoryLane(Int64 _nID, Int64 _nLane)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                update KanBan_Story
                set SwimLane_ID = @lane
                where ID = @id;
            ";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", _nID);
                cmd.Parameters.AddWithValue("@lane", _nLane);

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

        public static void UpdateStoryStatusByLane(Int64 _nID, Story.StoryStatusEnum _status)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                update KanBan_Story
                set Status = @status
                where SwimLane_ID = @id and Status = @activeStatus;
            ";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", _nID);
                cmd.Parameters.AddWithValue("@status", Convert.ToInt16(_status));
                cmd.Parameters.AddWithValue("@activeStatus", Convert.ToInt16(Story.StoryStatusEnum.Active));

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

        public static Story GetStory(Int64 nID)
        {
            Story objStory = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    s.* 
                from 
                    dbo.KanBan_Story s
                where 
                    s.ID = @id;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", nID);
                reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    objStory = MapStory(reader);
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

            return objStory;
        }

        
        private static Story MapStory(SqlDataReader reader)
        {
            Story story = new Story();

            if (reader["ID"] != null && !reader.IsDBNull(reader.GetOrdinal("ID"))) story.ID = Convert.ToInt64(reader["ID"]);
            if (reader["Name"] != null && !reader.IsDBNull(reader.GetOrdinal("Name"))) story.Name = reader["Name"].ToString();
            if (reader["TFS"] != null && !reader.IsDBNull(reader.GetOrdinal("TFS"))) story.TFS = Convert.ToInt64(reader["TFS"]);
            if (reader["TFS_Server"] != null && !reader.IsDBNull(reader.GetOrdinal("TFS_Server"))) story.TFSServer = Convert.ToInt64(reader["TFS_Server"]);
            if (reader["Description"] != null && !reader.IsDBNull(reader.GetOrdinal("Description"))) story.Description = reader["Description"].ToString();
            if (reader["PMWork"] != null && !reader.IsDBNull(reader.GetOrdinal("PMWork"))) story.PMEffort = Convert.ToDouble(reader["PMWork"]);
            if (reader["TestWork"] != null && !reader.IsDBNull(reader.GetOrdinal("TestWork"))) story.TestEffort = Convert.ToDouble(reader["TestWork"]);
            if (reader["DevWork"] != null && !reader.IsDBNull(reader.GetOrdinal("DevWork"))) story.DevEffort = Convert.ToDouble(reader["DevWork"]);
            if (reader["PMWorkEst"] != null && !reader.IsDBNull(reader.GetOrdinal("PMWorkEst"))) story.PMEffortEstimated = Convert.ToDouble(reader["PMWorkEst"]);
            if (reader["TestWorkEst"] != null && !reader.IsDBNull(reader.GetOrdinal("TestWorkEst"))) story.TestEffortEstimated = Convert.ToDouble(reader["TestWorkEst"]);
            if (reader["DevWorkEst"] != null && !reader.IsDBNull(reader.GetOrdinal("DevWorkEst"))) story.DevEffortEstimated = Convert.ToDouble(reader["DevWorkEst"]);
            if (reader["SwimLane_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("SwimLane_ID"))) story.SwimLaneID = Convert.ToInt64(reader["SwimLane_ID"]);
            if (reader["KanBan_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("KanBan_ID"))) story.KanBanID = Convert.ToInt64(reader["KanBan_ID"]);
            if (reader["StoryStatus"] != null && !reader.IsDBNull(reader.GetOrdinal("StoryStatus"))) story.StoryStatus = Convert.ToInt64(reader["StoryStatus"]);
            if (reader["StoryType"] != null && !reader.IsDBNull(reader.GetOrdinal("StoryType"))) story.StoryType = (Story.StoryTypeEnum)Convert.ToInt16(reader["StoryType"]);
            if (reader["Prior"] != null && !reader.IsDBNull(reader.GetOrdinal("Prior"))) story.Prior = (Story.PriorEnum)Convert.ToInt16(reader["Prior"]);
            if (reader["Status"] != null && !reader.IsDBNull(reader.GetOrdinal("Status"))) story.Status = (Story.StoryStatusEnum)Convert.ToInt16(reader["Status"]);
            if (reader["DueDate"] != null && !reader.IsDBNull(reader.GetOrdinal("DueDate"))) story.DueDate = Convert.ToDateTime(reader["DueDate"]).Date;
            if (reader["TaskType"] != null && !reader.IsDBNull(reader.GetOrdinal("TaskType"))) story.TaskType = (Story.StoryTaskTypeEnum)Convert.ToInt16(reader["TaskType"]);
            if (reader["StageDueDate"] != null && !reader.IsDBNull(reader.GetOrdinal("StageDueDate"))) story.StageDueDate = Convert.ToDateTime(reader["DueDate"]).Date;
            return story;
        }

        #endregion

        #region "SwimmingLane"
        public static List<SwimmingLane> GetSwimLaneByKanBan(Int64 _KanBanID)
        {
            List<SwimmingLane> lst = new List<SwimmingLane>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    l.* 
                from 
                    KanBan_SwimLane l
                inner join KanBan k on l.KanBan_ID = k.ID
                where 
                    k.ID = @kanban_id and
                    l.Status = @status
                order by l.Type;
            ";

            try
            {
                conn.Open(); 
                
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _KanBanID);
                cmd.Parameters.AddWithValue("@status", Convert.ToInt16(SwimmingLane.SwimmingLaneStatusEnum.Active));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(MapSwimmingLane(reader));
                }
            }
            catch(Exception ex)
            {
                // do nothing for now
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

        public static List<SwimmingLane> GetAllSwimLaneByKanBan(Int64 _KanBanID)
        {
            List<SwimmingLane> lst = new List<SwimmingLane>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    l.* 
                from 
                    KanBan_SwimLane l
                inner join KanBan k on l.KanBan_ID = k.ID
                where 
                    k.ID = @kanban_id and
                    l.Status <> @status
                order by l.ID desc;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _KanBanID);
                cmd.Parameters.AddWithValue("@status", Convert.ToInt16(SwimmingLane.SwimmingLaneStatusEnum.Archived));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(MapSwimmingLane(reader));
                }
            }
            catch (Exception ex)
            {
                // do nothing for now
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

        public static void AddSwimLane(ref SwimmingLane objLane)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                insert into KanBan_SwimLane(Name,KanBan_ID, Type) 
                output Inserted.ID
                values(@name, @kanban_id, @type);
            ";
            try
            {
                conn.Open(); 
                
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", objLane.KanBanID);
                cmd.Parameters.AddWithValue("@name", objLane.Name);
                cmd.Parameters.AddWithValue("@type", objLane.Type);

                objLane.ID = (Int64)cmd.ExecuteScalar();
            }
            catch(Exception ex)
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

        public static void UpdateSwimLane(SwimmingLane objLane)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                update KanBan_SwimLane
                set Name = @name,
                    Type = @type
                where ID = @id;
            ";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", objLane.ID);
                cmd.Parameters.AddWithValue("@name", objLane.Name);
                cmd.Parameters.AddWithValue("@type", objLane.Type);

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

        public static void UpdateSwimLaneStatus(Int64 _nID, SwimmingLane.SwimmingLaneStatusEnum _status)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                update KanBan_SwimLane
                set Status = @status
                where ID = @id;
            ";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", _nID);
                cmd.Parameters.AddWithValue("@status", Convert.ToInt16(_status));

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

        public static SwimmingLane GetSwimLane(Int64 nID)
        {
            SwimmingLane objLane = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    l.* 
                from 
                    KanBan_SwimLane l
                where 
                    l.ID = @id;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", nID);
                reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    objLane = MapSwimmingLane(reader);
                }
            }
            catch (Exception ex)
            {
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

            return objLane;
        }

        private static SwimmingLane MapSwimmingLane(SqlDataReader reader)
        {
            SwimmingLane lane = new SwimmingLane();

            if (reader["ID"] != null && !reader.IsDBNull(reader.GetOrdinal("ID"))) lane.ID = Convert.ToInt64(reader["ID"]);
            if (reader["Name"] != null && !reader.IsDBNull(reader.GetOrdinal("Name"))) lane.Name = reader["Name"].ToString();
            if (reader["KanBan_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("KanBan_ID"))) lane.KanBanID = Convert.ToInt64(reader["KanBan_ID"]);
            if (reader["Status"] != null && !reader.IsDBNull(reader.GetOrdinal("Status"))) lane.Status = (SwimmingLane.SwimmingLaneStatusEnum)Convert.ToInt16(reader["Status"]);
            if (reader["Type"] != null && !reader.IsDBNull(reader.GetOrdinal("Type"))) lane.Type = (SwimmingLane.SwimingLaneTypeEnum)Convert.ToInt16(reader["Type"]);

            return lane;
        }
        #endregion

        #region "Column"
        public static List<ColumnGroup> GetColumnGroupByKanBan(Int64 _KanBanID)
        {
            List<ColumnGroup> lst = new List<ColumnGroup>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            ColumnGroup obj = null;
            String strSQL = @"
                select 
                    g.* 
                from 
                    KanBan_ColumnGroup g
                inner join KanBan k on g.KanBan_ID = k.ID
                where 
                    k.ID = @kanban_id
                order by g.Seq;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _KanBanID);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    obj = new ColumnGroup();
                    MapColumnGroup(reader, ref obj);
                    lst.Add(obj);
                }
            }
            catch (Exception ex)
            {
                // do nothing for now
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

        public static List<Column> GetColumnInGroup(Int64 _KanBanID)
        {
            List<Column> lst = new List<Column>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    c.* 
                from 
                    KanBan_Column c
                inner join KanBan_ColumnGroup_Mapping m on m.Column_ID = c.ID
                inner join KanBan_ColumnGroup g on g.ID = m.ColumnGroup_ID
                inner join KanBan k on g.KanBan_ID = k.ID
                where 
                    k.ID = @kanban_id and
                    c.Status = @status
                order by c.Seq;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _KanBanID);
                cmd.Parameters.AddWithValue("@status", Convert.ToInt16(Column.ColumnStatusEnum.Active));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(MapColumn(reader));
                }
            }
            catch (Exception ex)
            {
                // do nothing for now
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

        public static List<Column> GetColumnByKanBan(Int64 _KanBanID)
        {
            List<Column> lst = new List<Column>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    c.* 
                from 
                    KanBan_Column c
                inner join KanBan k on c.KanBan_ID = k.ID
                where 
                    k.ID = @kanban_id and
                    c.Status = @status
                order by c.Seq;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _KanBanID);
                cmd.Parameters.AddWithValue("@status", Convert.ToInt16(Column.ColumnStatusEnum.Active));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(MapColumn(reader));
                }
            }
            catch (Exception ex)
            {
                // do nothing for now
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

        public static List<Column> GetAllColumnByKanBan(Int64 _KanBanID)
        {
            List<Column> lst = new List<Column>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    c.* 
                from 
                    KanBan_Column c
                inner join KanBan k on c.KanBan_ID = k.ID
                where 
                    k.ID = @kanban_id;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _KanBanID);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(MapColumn(reader));
                }
            }
            catch (Exception ex)
            {
                // do nothing for now
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

        public static Column GetColumnByTraceType(Int64 nKanBan, Column.ColumnTraceTypeEnum nTraceType)
        {
            Column objColumn = new Column();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    c.* 
                from 
                    KanBan_Column c
                where 
                    c.KanBan_ID = @kanban_id and
                    c.TraceType = @trace
                order by c.Seq;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", nKanBan);
                cmd.Parameters.AddWithValue("@trace", Convert.ToInt16(nTraceType));
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    objColumn = MapColumn(reader);
                }
            }
            catch (Exception ex)
            {
                // do nothing for now
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

            return objColumn;
        }

        public static List<KeyValuePair<Int64,Int64>> GetColumnGroupMapping(Int64 _KanBanID)
        {
            List<KeyValuePair<Int64, Int64>> lst = new List<KeyValuePair<Int64, Int64>>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select 
                    m.* 
                from 
                    KanBan_ColumnGroup_Mapping m
                inner join KanBan_ColumnGroup g on m.ColumnGroup_ID = g.ID
                inner join KanBan k on g.KanBan_ID = k.ID
                where 
                    k.ID = @kanban_id;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", _KanBanID);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(new KeyValuePair<Int64, Int64>(Convert.ToInt64(reader["ColumnGroup_ID"]), Convert.ToInt64(reader["Column_ID"])));
                }
            }
            catch (Exception ex)
            {
                // do nothing for now
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

        private static Column MapColumn(SqlDataReader reader)
        {
            Column column = new Column();

            if (reader["ID"] != null && !reader.IsDBNull(reader.GetOrdinal("ID"))) column.ID = Convert.ToInt64(reader["ID"]);
            if (reader["Seq"] != null && !reader.IsDBNull(reader.GetOrdinal("Seq"))) column.Seq = Convert.ToInt32(reader["Seq"]);
            if (reader["Name"] != null && !reader.IsDBNull(reader.GetOrdinal("Name"))) column.Name = reader["Name"].ToString();
            if (reader["KanBan_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("KanBan_ID"))) column.KanBanID = Convert.ToInt64(reader["KanBan_ID"]);
            if (reader["Status"] != null && !reader.IsDBNull(reader.GetOrdinal("Status"))) column.Status = (Column.ColumnStatusEnum)Convert.ToInt16(reader["Status"]);
            if (reader["Type"] != null && !reader.IsDBNull(reader.GetOrdinal("Type"))) column.Type = (Column.ColumnTypeEnum)Convert.ToInt16(reader["Type"]);
            if (reader["RoleType"] != null && !reader.IsDBNull(reader.GetOrdinal("RoleType"))) column.RoleType = (Column.ColumnRoleTypeEnum)Convert.ToInt16(reader["RoleType"]);
            if (reader["TraceType"] != null && !reader.IsDBNull(reader.GetOrdinal("TraceType"))) column.TraceType = (Column.ColumnTraceTypeEnum)Convert.ToInt16(reader["TraceType"]);
            if (reader["Link"] != null && !reader.IsDBNull(reader.GetOrdinal("Link"))) column.Link = reader["Link"].ToString();

            return column;
        }

        private static void MapColumnGroup(SqlDataReader reader, ref ColumnGroup grp)
        {
            if (reader["ID"] != null && !reader.IsDBNull(reader.GetOrdinal("ID"))) grp.ID = Convert.ToInt64(reader["ID"]);
            if (reader["Seq"] != null && !reader.IsDBNull(reader.GetOrdinal("Seq"))) grp.Seq = Convert.ToInt32(reader["Seq"]);
            if (reader["Name"] != null && !reader.IsDBNull(reader.GetOrdinal("Name"))) grp.Name = reader["Name"].ToString();
            if (reader["KanBan_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("KanBan_ID"))) grp.KanBanID = Convert.ToInt64(reader["KanBan_ID"]);
        }
        #endregion

        #region "ColumnChecklist"

        public static ColumnChecklist GetColumnChecklistByColumn(Int64 _ColumnID)
        {
            ColumnChecklist checklist = new ColumnChecklist();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select top 1
                    c.* 
                from 
                    KanBan_Column_ColumnChecklist c
                inner join KanBan_Column k on c.Column_ID = k.ID
                where 
                    k.ID = @column_id;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@column_id", _ColumnID);
                reader = cmd.ExecuteReader();
                checklist = MapChecklist(reader);
            }
            catch (Exception ex)
            {
                // do nothing for now
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

            return checklist;
        }

        public static ColumnChecklist MapChecklist(SqlDataReader reader)
        {
            ColumnChecklist columnChecklist = new ColumnChecklist();

            if (reader["ID"] !=null && !reader.IsDBNull(reader.GetOrdinal("ID"))) columnChecklist.ID = Convert.ToInt64(reader["ID"]);
            if (reader["Column_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("Column_ID"))) columnChecklist.ColumnID = Convert.ToInt64(reader["Column_ID"]);
            if (reader["Name"] != null && !reader.IsDBNull(reader.GetOrdinal("Name"))) columnChecklist.Name = reader["Name"].ToString();
            
            return columnChecklist;
        }

        public static void AddColumnChecklist(ref ColumnChecklist objChecklist)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            SqlTransaction trans = null;
            String strSQL = @"
                insert into KanBan_Column_Checklist
                    (ID, Column_ID, Name, Status)
                output Inserted.ID
                values
                    (@id, @column_id, @name, @status);
            ";
            try
            {
                conn.Open();
                trans = conn.BeginTransaction();

                SqlCommand cmd = new SqlCommand(strSQL, conn, trans);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@name", objChecklist.Name);
                cmd.Parameters.AddWithValue("@column_id", objChecklist.ColumnID);
                cmd.Parameters.AddWithValue("@name", objChecklist.Name);

                objChecklist.ID = (Int64)cmd.ExecuteScalar();

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null) trans.Rollback();
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        #endregion

        #region "ColumnCheckItem"

        public static List<ColumnCheckItem> GetColumnCheckItemByColumnID(Int64 _ColumnID)
        {
            List<ColumnCheckItem> lst = new List<ColumnCheckItem>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
           
            String strSQL = @"
                select 
                    c.* 
                from 
                    KanBan_Column_Check c
                inner join KanBan_Column_Checklist_Mapping m on m.CheckItem_ID = c.ID
                inner join KanBan_Column_Checklist l on m.Checklist_ID = l.ID
                inner join Kanban_Column k on l.Column_ID = k.ID
                
                where 
                    k.ID = @column_id
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@column_id", _ColumnID);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(MapColumnCheckItem(reader));
                }
            }
            catch (Exception ex)
            {
                // do nothing for now
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

        public static ColumnCheckItem MapColumnCheckItem(SqlDataReader reader)
        {
            ColumnCheckItem item = new ColumnCheckItem();

            if (reader["ID"] != null && !reader.IsDBNull(reader.GetOrdinal("ID"))) item.ID = Convert.ToInt64(reader["ID"]);
            if (reader["Name"] != null && reader.IsDBNull(reader.GetOrdinal("Name"))) item.Name = reader["Name"].ToString();
            if (reader["Type"] != null && reader.IsDBNull(reader.GetOrdinal("Type"))) item.CheckItemType = (ColumnCheckItem.ColunmCheckItemTypeEnum)Convert.ToInt16(reader["Type"]);
            if (reader["Column_CheckList_ID"] !=null && reader.IsDBNull(reader.GetOrdinal("Column_CheckList_ID"))) item.ColumnChecklistID = Convert.ToInt64(reader["Column_CheckList_ID"]);

            return item;
        }

        public static void AddColumnCheckItem(ref ColumnCheckItem objColumnCheckItem)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            SqlTransaction trans = null;
            String strSQL = @"
                insert into KanBan_Column_CheckItem
                    (ID, Name, Type, Column_Checklist_ID)
                output Inserted.ID
                values
                    (@id, @name, @type, @column_checklist_id);
            ";
            try
            {
                conn.Open();
                trans = conn.BeginTransaction();

                SqlCommand cmd = new SqlCommand(strSQL, conn, trans);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@name", objColumnCheckItem.Name);
                cmd.Parameters.AddWithValue("@type", objColumnCheckItem.CheckItemType);
                cmd.Parameters.AddWithValue("@column_checklist_id", objColumnCheckItem.ColumnChecklistID);

                objColumnCheckItem.ID = (Int64)cmd.ExecuteScalar();

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null) trans.Rollback();
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        #endregion

        #region "StoryCheckItem"

        public static List<StoryCheckItem> GetStoryChecklistByStoryID(Int64 _StoryID)
        {
            List<StoryCheckItem> lst = new List<StoryCheckItem>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select c.*,
                from
                    KanBan_Story_Check c
                where 
                    l.Story_ID = @story_id;
            ";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@story_id", _StoryID);
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    lst.Add(MapStoryCheckItem(reader));
                }
            }
            catch (Exception ex)
            {
                // do nothing for now
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
        
        public static StoryCheckItem MapStoryCheckItem(SqlDataReader reader)
        {
            StoryCheckItem item = new StoryCheckItem();

            if (reader["ID"] != null && reader.IsDBNull(reader.GetOrdinal("ID"))) item.ID = Convert.ToInt64(reader["ID"]);
            if (reader["Column_Check_ID"] != null && reader.IsDBNull(reader.GetOrdinal("Column_Check_ID"))) item.ColumnCheckID = Convert.ToInt64(reader["Column_Check_ID"]);
            if (reader["Checked"] != null && reader.IsDBNull(reader.GetOrdinal("Column_Check_ID"))) item.Checked = Convert.ToBoolean(reader["Checked"]);
            if (reader["Story_ID"] != null && reader.IsDBNull(reader.GetOrdinal("Story_ID"))) item.StoryID = Convert.ToInt64(reader["ID"]);
            if (reader["Name"] != null && reader.IsDBNull(reader.GetOrdinal("Name"))) item.Name = reader["Name"].ToString();

            return item;
        }

        public static void AddStoryCheckItem(ref StoryCheckItem objStoryCheckItem)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            SqlTransaction trans = null;
            String strSQL = @"
                insert into KanBan_Story_Check
                    (ID, Story_ID, Column_Check_ID, Checked)
                output Inserted.ID
                values
                    (@id, @story_id, @column_check_id, @checked);
            ";
            try
            {
                conn.Open();
                trans = conn.BeginTransaction();

                SqlCommand cmd = new SqlCommand(strSQL, conn, trans);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@story_id", objStoryCheckItem.StoryID);
                cmd.Parameters.AddWithValue("@column_check_id", objStoryCheckItem.ColumnCheckID);
                cmd.Parameters.AddWithValue("@checked", objStoryCheckItem.Checked);

                objStoryCheckItem.ID = (Int64)cmd.ExecuteScalar();

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null) trans.Rollback();
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        public static void RemoveStoryCheckItemByItemID(Int64 _StoryCheckItemID)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            SqlTransaction trans = null;
            String strSQL = @"
                delete from KanBan_Story_Check
                where ID=@story_checkitem_id;
            ";
            try
            {
                conn.Open();
                trans = conn.BeginTransaction();

                SqlCommand cmd = new SqlCommand(strSQL, conn, trans);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@story_checkitem_id", _StoryCheckItemID);
                cmd.ExecuteReader();
                
                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null) trans.Rollback();
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        #endregion

        #region "User"
        public static List<User> GetUsersByKanBan(Int64 _KanBan)
        {
            List<User> lst = new List<User>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            User user = null;
            String strSQL = @"
                select
                    u.ID, 
                    max(u.Alias) as Alias, 
                    max(u.FirstName) as FirstName, 
                    max(u.LastName) as LastName, 
                    count(s.ID) AS Number
                from
                    KanBan_User u
                inner join KanBan_Assignment a on a.UserID = u.ID
                inner join KanBan_Story s on s.ID = a.StoryID
                inner join KanBan_SwimLane l on l.ID = s.SwimLane_ID and l.KanBan_ID = u.KanBan_ID
                where
                    l.KanBan_ID = @kanbanID and
                    s.Status = @story_status and
                    u.Status = @user_status 
                group by u.ID
                having count(s.ID) > 0
				order by Number desc;
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanbanID", _KanBan);
                cmd.Parameters.AddWithValue("@story_status", Convert.ToInt16(Story.StoryStatusEnum.Active));
                cmd.Parameters.AddWithValue("@user_status", Convert.ToInt16(User.UserStatusEnum.Active));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    user = new User();
                    user.ID = Convert.ToInt64(reader["ID"]);
                    user.Alias = reader["Alias"].ToString();
                    user.FirstName = reader["FirstName"].ToString();
                    user.LastName = reader["LastName"].ToString();
            
                    lst.Add(user);
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                if (reader != null) reader.Close();
                if (conn != null) conn.Close();
            }

            return lst;
        }

        public static void AddAssignment(Assignment objAssign)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                insert into KanBan_Assignment
                    (StoryID, UserID, AssignType)
                values
                    (@story_id, @user_id, @type);
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@story_id", objAssign.StoryID);
                cmd.Parameters.AddWithValue("@user_id", objAssign.UserID);
                cmd.Parameters.AddWithValue("@type", Convert.ToInt16(objAssign.Type));
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
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

        public static List<Assignment> GetAssignmentsByKanBan(Int64 _kanbanID)
        {
            List<Assignment> lst = new List<Assignment>();
            Assignment assign = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    a.*,
                    u.*
                from
                    KanBan_Story s
                inner join KanBan_Assignment a on s.ID = a.StoryID
                inner join KanBan_User u on u.ID = a.UserID
                inner join KanBan_SwimLane l on l.ID = s.SwimLane_ID
                where
                    l.KanBan_ID = @kanbanID and
                    s.Status = @story_status and
                    u.Status = @user_status;
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanbanID", _kanbanID);
                cmd.Parameters.AddWithValue("@story_status", Convert.ToInt16(Story.StoryStatusEnum.Active));
                cmd.Parameters.AddWithValue("@user_status", Convert.ToInt16(User.UserStatusEnum.Active));
                reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    assign = MapAssignment(reader);
                    assign.User = MapUser(reader);
                    lst.Add(assign);
                }
            }
            catch(Exception ex)
            {
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                if (conn != null)
                    conn.Close();
            }

            return lst;
        }

        public static List<Assignment> GetBacklogAssignmentsByKanBan(Int64 _kanbanID)
        {
            List<Assignment> lst = new List<Assignment>();
            Assignment assign = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    a.*,
                    u.*
                from
                    KanBan_Story s
                inner join KanBan_Assignment a on s.ID = a.StoryID
                inner join KanBan_User u on u.ID = a.UserID
                where
                    s.KanBan_ID = @kanbanID and
                    s.Status = @story_status and
                    u.Status = @user_status;
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanbanID", _kanbanID);
                cmd.Parameters.AddWithValue("@story_status", Convert.ToInt16(Story.StoryStatusEnum.Waiting));
                cmd.Parameters.AddWithValue("@user_status", Convert.ToInt16(User.UserStatusEnum.Active));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    assign = MapAssignment(reader);
                    assign.User = MapUser(reader);
                    lst.Add(assign);
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                if (conn != null)
                    conn.Close();
            }

            return lst;
        }

        public static List<Assignment> GetInactiveAssignmentByKanBan(Int64 _kanbanID)
        {
            List<Assignment> lst = new List<Assignment>();
            Assignment assign = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    a.*,
                    u.*
                from
                    KanBan_Story s
                inner join KanBan_Assignment a on s.ID = a.StoryID
                inner join KanBan_User u on u.ID = a.UserID
                inner join KanBan_SwimLane l on l.ID = s.SwimLane_ID
                where
                    l.KanBan_ID = @kanbanID and
                    s.Status <> @story_status;
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanbanID", _kanbanID);
                cmd.Parameters.AddWithValue("@story_status", Convert.ToInt16(Story.StoryStatusEnum.Active));
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    assign = MapAssignment(reader);
                    assign.User = MapUser(reader);
                    lst.Add(assign);
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                if (conn != null)
                    conn.Close();
            }

            return lst;
        }

        public static List<Assignment> GetAssignmentsByStory(Int64 _storyID)
        {
            List<Assignment> lst = new List<Assignment>();
            Assignment assign = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    a.*,
                    u.*
                from
                    KanBan_Story s
                inner join KanBan_Assignment a on s.ID = a.StoryID
                inner join KanBan_User u on u.ID = a.UserID
                where
                    s.ID = @storyID;
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@storyID", _storyID);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    assign = MapAssignment(reader);
                    assign.User = MapUser(reader);
                    lst.Add(assign);
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                if (conn != null)
                    conn.Close();
            }

            return lst;
        }

        public static List<User> GetUsers(Int64 _KanBan)
        {
            List<User> lst = new List<User>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select * from KanBan_User where KanBan_ID = @kanbanID;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanbanID", _KanBan);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst.Add(MapUser(reader));
                }
            }
            catch(Exception ex)
            {
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                if (conn != null)
                    conn.Close();
            }

            return lst;
        }
        
        public static void DeleteAssignment(Assignment objAssign)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                delete from KanBan_Assignment
                where UserID = @user_id and
                    StoryID = @story_id;
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@user_id", objAssign.UserID);
                cmd.Parameters.AddWithValue("@story_id", objAssign.StoryID);
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
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

        private static User MapUser(SqlDataReader reader)
        {
            User user = new User();

            if (reader["ID"] != null && !reader.IsDBNull(reader.GetOrdinal("ID"))) user.ID = Convert.ToInt64(reader["ID"]);
            if (reader["KanBan_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("KanBan_ID"))) user.KanBanID = Convert.ToInt64(reader["KanBan_ID"]);
            if (reader["Alias"] != null && !reader.IsDBNull(reader.GetOrdinal("Alias"))) user.Alias = reader["Alias"].ToString();
            if (reader["FirstName"] != null && !reader.IsDBNull(reader.GetOrdinal("FirstName"))) user.FirstName = reader["FirstName"].ToString();
            if (reader["LastName"] != null && !reader.IsDBNull(reader.GetOrdinal("LastName"))) user.LastName = reader["LastName"].ToString();
            if (reader["Role"] != null && !reader.IsDBNull(reader.GetOrdinal("Role"))) user.Role = (User.RoleEnum)Convert.ToInt16(reader["Role"]);
            if (reader["Status"] != null && !reader.IsDBNull(reader.GetOrdinal("Status"))) user.Status = (User.UserStatusEnum)Convert.ToInt16(reader["Status"]);

            return user;
        }

        private static Assignment MapAssignment(SqlDataReader reader)
        {
            Assignment assign = new Assignment();

            if (reader["StoryID"] != null && !reader.IsDBNull(reader.GetOrdinal("StoryID"))) assign.StoryID = Convert.ToInt64(reader["StoryID"]);
            if (reader["UserID"] != null && !reader.IsDBNull(reader.GetOrdinal("UserID"))) assign.UserID = Convert.ToInt64(reader["UserID"]);
            if (reader["AssignType"] != null && !reader.IsDBNull(reader.GetOrdinal("AssignType"))) assign.Type = (Assignment.AssignTypeEnum)Convert.ToInt16(reader["AssignType"]);
            
            return assign;
        }
        #endregion

    }
}