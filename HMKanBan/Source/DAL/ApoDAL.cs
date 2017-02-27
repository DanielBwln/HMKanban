using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HMKanBan.Source.DAL.Base;
using System.Data.SqlClient;
using HMKanBan.Source.Entity;

namespace HMKanBan.Source.DAL
{
    public class ApoDAL : BaseDAL
    {
        public static void CreateFakeLog()
        {
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            Story objStory;
            List<Story> lstStory = new List<Story>();
            String strSQL = @"
                select 
                    s.*
                from
                    KanBan_Story s
                    left join KanBan_Story_ChangeLog l on l.Story_ID = s.ID and l.Field = 'StoryStatus' and l.Value_Prev = '99'
                where
                    l.Story_ID is null and
                    s.Status = 1 and
                    s.StoryType <> 99;
            ";
            String strAdd = @"
                insert into KanBan_Story_ChangeLog
                    (Alias, CurDatetime, Story_ID, Field, Value_Prev, Value_New)
                values
                    ('apsong', @datetime, @story, 'StoryStatus', '99', @new);
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    objStory = MapStory(reader);
                    lstStory.Add(objStory);
                }
                if (reader != null)
                {
                    reader.Close();
                }

                foreach(Story obj in lstStory)
                {
                    SqlCommand cmdTmp = new SqlCommand(strAdd, conn);
                    cmdTmp.Parameters.Clear();
                    cmdTmp.Parameters.AddWithValue("@datetime", DateTime.Now);
                    cmdTmp.Parameters.AddWithValue("@story", obj.ID);
                    cmdTmp.Parameters.AddWithValue("@new", Convert.ToInt16(obj.StoryType).ToString());
                    cmdTmp.ExecuteNonQuery();
                }

            }
            catch (Exception ex)
            {
                // empty for now
            }
            finally
            {

                if (conn != null)
                {
                    conn.Close();
                };
            }
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

            return story;
        }
    }
}