using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyKanBan.Source.DAL.Base;
using MyKanBan.Source.Entity.TFS;
using System.Data.SqlClient;
using MyKanBan.Source.Entity;

namespace MyKanBan.Source.DAL
{
    public class SYSDAL : BaseDAL
    {
        #region "User"
        public static void AddUser(ref SYSUser objUser)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                insert into SYS_User (Alias, Status, Config_TicketColor)
                output Inserted.ID
                values (@alias, @status, @color)
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@alias", objUser.Alias);
                cmd.Parameters.AddWithValue("@status", objUser.Status);
                cmd.Parameters.AddWithValue("@color", objUser.ConfigTicketColor);
                objUser.ID = (Int64)cmd.ExecuteScalar();
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

        public static void UpdateUser(SYSUser objUser)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                update SYS_User 
                    set Config_TicketColor = @color
                where Alias = @alias
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@alias", objUser.Alias);
                cmd.Parameters.AddWithValue("@color", objUser.ConfigTicketColor);
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

        public static SYSUser GetUser(String strAlias)
        {
            SYSUser objUser = new SYSUser();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select * from SYS_User where Alias = @alias;
            ";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@alias", strAlias);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    MapUser(ref objUser, reader);
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

            return objUser;
        }

        private static void MapUser(ref SYSUser user, SqlDataReader reader)
        {
            if (reader["ID"] != null && !reader.IsDBNull(reader.GetOrdinal("ID"))) user.ID = Convert.ToInt64(reader["ID"]);
            if (reader["Alias"] != null && !reader.IsDBNull(reader.GetOrdinal("Alias"))) user.Alias = reader["Alias"].ToString();
            if (reader["Status"] != null && !reader.IsDBNull(reader.GetOrdinal("Status"))) user.Status = (SYSUser.UserStatusEnum)Convert.ToInt16(reader["Status"]);
            if (reader["Config_TicketColor"] != null && !reader.IsDBNull(reader.GetOrdinal("Config_TicketColor"))) user.ConfigTicketColor = (SYSUser.ConfigTicketColorEnum)Convert.ToInt16(reader["Config_TicketColor"]);
        }
        #endregion
    }
}