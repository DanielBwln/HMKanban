using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HMKanBan.Source.DAL.Base;
using HMKanBan.Source.Entity;
using System.Data.SqlClient;
using HMKanBan.Source.View;

namespace HMKanBan.Source.DAL
{
    public class CycleDAL : BaseDAL
    {
        #region "Cycle"
        public static List<Cycle> ListCycleByKanBan(Int64 nKanban)
        {
            List<Cycle> lstCycle = new List<Cycle>();
            Cycle objCycle = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    c.* 
                from
                    KanBan_Cycle c
                where
                    c.KanBan_ID = @kanban
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban", nKanban);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    objCycle = new Cycle();
                    MapCycle(reader, ref objCycle);
                    lstCycle.Add(objCycle);
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

            return lstCycle;
        }

        public static List<CyclePeriod> ListCyclePeriodByCycle(Int64 nCycle)
        {
            CyclePeriod objPeriod = null;
            List<CyclePeriod> lstPeriod = new List<CyclePeriod>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    p.*
                from
                    dbo.KanBan_Cycle_Period p
                where 
                    p.Cycle_ID = @cycle_id;       
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@cycle_id", nCycle);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    objPeriod = new CyclePeriod();
                    MapCyclePeriod(reader, ref objPeriod);
                    lstPeriod.Add(objPeriod);
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

            return lstPeriod;
        }

        public static void GeneratePeriodStatus(StoryPeriodStatusVO vo)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strAddSQL = @"
                insert into 
                    KanBan_Cycle_Period_Status(KanBan_ID,Cycle_Period_ID,Inventory_Num,Income_Num,Outcome_Num,Fire_Num,Resolve_Num,Income_Num_Cu,Outcome_Num_Cu,Fire_Num_Cu,Resolve_Num_Cu) 
                output Inserted.ID
                values(@kanban, @period, @inv, @in, @out, @fire, @resolve, @in_cu, @out_cu, @fire_cu, @resolve_cu);";
            String strDelSQL = @"delete from KanBan_Cycle_Period_Status where KanBan_ID = @kanban and Cycle_Period_ID = @period;";
            
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strDelSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban", vo.KanBanID);
                cmd.Parameters.AddWithValue("@period", vo.CycleID);
                cmd.ExecuteScalar();

                cmd.CommandText = strAddSQL;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban", vo.KanBanID);
                cmd.Parameters.AddWithValue("@period", vo.CycleID);
                cmd.Parameters.AddWithValue("@inv", vo.InventoryNum);
                cmd.Parameters.AddWithValue("@in", vo.IncomeNum);
                cmd.Parameters.AddWithValue("@out", vo.OutcomeNum);
                cmd.Parameters.AddWithValue("@fire", vo.FireNum);
                cmd.Parameters.AddWithValue("@resolve", vo.ResolveNum);
                cmd.Parameters.AddWithValue("@in_cu", vo.IncomeNumCu);
                cmd.Parameters.AddWithValue("@out_cu", vo.OutcomeNumCu);
                cmd.Parameters.AddWithValue("@fire_cu", vo.FireNumCu);
                cmd.Parameters.AddWithValue("@resolve_cu", vo.ResolveNumCu);
                cmd.ExecuteScalar();
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

        public static void UpdateFollowingPeriod(StoryPeriodStatusVO vo, Int64 nCycle)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            String strSQL = @"
                update s
                set
                    s.Inventory_Num = @inv_num,
                    s.Income_Num_Cu = @in_cu,
                    s.Outcome_Num_Cu = @out_cu
                from KanBan_Cycle_Period_Status s
                inner join KanBan_Cycle_Period p on p.ID = s.Cycle_Period_ID
                where
                    s.Cycle_Period_ID > @period and p.Cycle_ID = @cycle;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@inv_num", vo.InventoryNum);
                cmd.Parameters.AddWithValue("@in_cu", vo.IncomeNumCu);
                cmd.Parameters.AddWithValue("@out_cu", vo.OutcomeNumCu);
                cmd.Parameters.AddWithValue("@period", vo.CycleID);
                cmd.Parameters.AddWithValue("@cycle", nCycle);
                cmd.ExecuteScalar();
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

        public static CyclePeriod GetCyclePeriod(Int64 nID)
        {
            CyclePeriod objPeriod = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    p.*
                from
                    dbo.KanBan_Cycle_Period p
                where 
                    p.ID = @pid;       
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@pid", nID);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    objPeriod = new CyclePeriod();
                    MapCyclePeriod(reader, ref objPeriod);
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

            return objPeriod;
        }
        
        public static CyclePeriod GetCyclePeriodByDate(Int64 nKanBan, Int64 nCycle, DateTime dtDate)
        {
            CyclePeriod objPeriod = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    p.*
                from
                    dbo.KanBan_Cycle_Period p
                where 
                    p.KanBan_ID = @kanban_id and
                    p.Cycle_ID = @cycle_id and
                    p.StartDate <= @dt_date and
                    p.EndDate >= @dt_date;       
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", nKanBan);
                cmd.Parameters.AddWithValue("@cycle_id", nCycle);
                cmd.Parameters.AddWithValue("@dt_date", dtDate.Date);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    objPeriod = new CyclePeriod();
                    MapCyclePeriod(reader, ref objPeriod);
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

            return objPeriod;
        }

        public static List<CyclePeriod> GetAllCyclePeriod(Int64 nKanBan, Int64 nCycle)
        {
            CyclePeriod objPeriod = null;
            List<CyclePeriod> lstPeriod = new List<CyclePeriod>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    p.*
                from
                    dbo.KanBan_Cycle_Period p
                where 
                    p.KanBan_ID = @kanban_id and
                    p.Cycle_ID = @cycle_id;       
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", nKanBan);
                cmd.Parameters.AddWithValue("@cycle_id", nCycle);
                reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    objPeriod = new CyclePeriod();
                    MapCyclePeriod(reader, ref objPeriod);
                    lstPeriod.Add(objPeriod);
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

            return lstPeriod;
        }

        public static Cycle GetDefaultCycle(Int64 nKanBan)
        {
            Cycle objCycle = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    c.*
                from
                    dbo.KanBan_Cycle c
                where 
                    c.KanBan_ID = @kanban_id and 
                    c.IsDefault = 1;       
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", nKanBan);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    objCycle = new Cycle();
                    MapCycle(reader, ref objCycle);
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

            return objCycle;
        }

        public static CyclePeriod GetPreviousCycle(Int64 nCycle, DateTime dtDate)
        {
            CyclePeriod objPeriod = null;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select top 1
                    p.*
                from
                    dbo.KanBan_Cycle_Period p
                where 
                    p.Cycle_ID = @cycle_id and
                    p.EndDate < @dt_date
                order by p.EndDate desc;       
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@cycle_id", nCycle);
                cmd.Parameters.AddWithValue("@dt_date", dtDate.Date);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    objPeriod = new CyclePeriod();
                    MapCyclePeriod(reader, ref objPeriod);
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

            return objPeriod;
        }

        public static void CountSumUp(Int64 nKanBan, Int64 nCycle, Int64 nCyclePeriod, out Int32 nIn, out Int32 nOut, out Int32 nFire, out Int32 nResolved)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            nIn = 0;
            nOut = 0;
            nFire = 0;
            nResolved = 0;

            String strSQL = @"
                select
                    sum(Income_Num) as InNum,
                    sum(Outcome_Num) as OutNum,
                    sum(Fire_Num) as FireNum,
                    sum(Resolve_Num) as ResolveNum
                from
                    KanBan_Cycle_Period_Status s
                    inner join KanBan_Cycle_Period p on p.ID = s.Cycle_Period_ID
                where
                    p.KanBan_ID = @kanban_id and
                    p.Cycle_ID = @cycle and
                    p.ID < @period;
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", nKanBan);
                cmd.Parameters.AddWithValue("@cycle", nCycle);
                cmd.Parameters.AddWithValue("@period", nCyclePeriod);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    nIn = Convert.ToInt32(reader["InNum"]);
                    nOut = Convert.ToInt32(reader["OutNum"]);
                    nFire = Convert.ToInt32(reader["FireNum"]);
                    nResolved = Convert.ToInt32(reader["ResolveNum"]);
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
        }

        public static StoryPeriodStatusVO GetPeriodStatus(Int64 nPeriod)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            StoryPeriodStatusVO objVO = null;
            String strSQL = @"
                select
                    s.*
                from
                    KanBan_Cycle_Period p 
                    inner join KanBan_Cycle_Period_Status s on p.ID = s.Cycle_Period_ID
                where 
                    p.ID = @pid;       
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@pid", nPeriod);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    objVO = new StoryPeriodStatusVO();
                    MapCycleStatusView(reader, ref objVO);
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

            return objVO;
        }

        public static List<StoryPeriodStatusVO> GetPeriodStatus(Int64 nKanBanID, Int64 nCycleID, Int64 nFromPeriod, Int64 nToPeriod)
        {
            StoryPeriodStatusVO objVO = null;
            List<StoryPeriodStatusVO> lstVO = new List<StoryPeriodStatusVO>();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataReader reader = null;
            String strSQL = @"
                select
                    s.*
                from
                    KanBan_Cycle_Period p 
                    inner join KanBan_Cycle_Period_Status s on p.ID = s.Cycle_Period_ID
                where 
                    p.KanBan_ID = @kanban_id and
                    p.Cycle_ID = @cycle_id and
                    p.ID >= @from_id and
                    p.ID <= @to_id
                order by p.ID;       
            ";

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kanban_id", nKanBanID);
                cmd.Parameters.AddWithValue("@cycle_id", nCycleID);
                cmd.Parameters.AddWithValue("@from_id", nFromPeriod);
                cmd.Parameters.AddWithValue("@to_id", nToPeriod);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    objVO = new StoryPeriodStatusVO();
                    MapCycleStatusView(reader, ref objVO);
                    lstVO.Add(objVO);
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

            return lstVO;
        }

        private static void MapCycleStatusView(SqlDataReader reader, ref StoryPeriodStatusVO vo)
        {
            if (reader["KanBan_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("KanBan_ID"))) vo.KanBanID = Convert.ToInt64(reader["KanBan_ID"]);
            if (reader["Cycle_Period_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("Cycle_Period_ID"))) vo.CycleID = Convert.ToInt64(reader["Cycle_Period_ID"]);
            if (reader["Inventory_Num"] != null && !reader.IsDBNull(reader.GetOrdinal("Inventory_Num"))) vo.InventoryNum = Convert.ToInt32(reader["Inventory_Num"]);
            if (reader["Income_Num"] != null && !reader.IsDBNull(reader.GetOrdinal("Income_Num"))) vo.IncomeNum = Convert.ToInt32(reader["Income_Num"]);
            if (reader["Outcome_Num"] != null && !reader.IsDBNull(reader.GetOrdinal("Outcome_Num"))) vo.OutcomeNum = Convert.ToInt32(reader["Outcome_Num"]);
            if (reader["Fire_Num"] != null && !reader.IsDBNull(reader.GetOrdinal("Fire_Num"))) vo.FireNum = Convert.ToInt32(reader["Fire_Num"]);
            if (reader["Resolve_Num"] != null && !reader.IsDBNull(reader.GetOrdinal("Resolve_Num"))) vo.ResolveNum = Convert.ToInt32(reader["Resolve_Num"]);
            if (reader["Income_Num_Cu"] != null && !reader.IsDBNull(reader.GetOrdinal("Income_Num_Cu"))) vo.IncomeNumCu = Convert.ToInt32(reader["Income_Num_Cu"]);
            if (reader["Outcome_Num_Cu"] != null && !reader.IsDBNull(reader.GetOrdinal("Outcome_Num_Cu"))) vo.OutcomeNumCu = Convert.ToInt32(reader["Outcome_Num_Cu"]);
            if (reader["Fire_Num_Cu"] != null && !reader.IsDBNull(reader.GetOrdinal("Fire_Num_Cu"))) vo.FireNumCu = Convert.ToInt32(reader["Fire_Num_Cu"]);
            if (reader["Resolve_Num_Cu"] != null && !reader.IsDBNull(reader.GetOrdinal("Resolve_Num_Cu"))) vo.ResolveNumCu = Convert.ToInt32(reader["Resolve_Num_Cu"]);
        }
        private static void MapCycle(SqlDataReader reader, ref Cycle cycle)
        {
            if (reader["ID"] != null && !reader.IsDBNull(reader.GetOrdinal("ID"))) cycle.ID = Convert.ToInt64(reader["ID"]);
            if (reader["KanBan_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("KanBan_ID"))) cycle.KanBanID = Convert.ToInt64(reader["KanBan_ID"]);
            if (reader["Name"] != null && !reader.IsDBNull(reader.GetOrdinal("Name"))) cycle.Name = reader["Name"].ToString();
            if (reader["IsDefault"] != null && !reader.IsDBNull(reader.GetOrdinal("IsDefault"))) cycle.IsDefault = Convert.ToBoolean(reader["IsDefault"]);
        }
        private static void MapCyclePeriod(SqlDataReader reader, ref CyclePeriod period)
        {
            if (reader["ID"] != null && !reader.IsDBNull(reader.GetOrdinal("ID"))) period.ID = Convert.ToInt64(reader["ID"]);
            if (reader["KanBan_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("KanBan_ID"))) period.KanBanID = Convert.ToInt64(reader["KanBan_ID"]);
            if (reader["Cycle_ID"] != null && !reader.IsDBNull(reader.GetOrdinal("Cycle_ID"))) period.CycleID = Convert.ToInt64(reader["Cycle_ID"]);
            if (reader["Name"] != null && !reader.IsDBNull(reader.GetOrdinal("Name"))) period.Name = reader["Name"].ToString();
            if (reader["StartDate"] != null && !reader.IsDBNull(reader.GetOrdinal("StartDate"))) period.StartDate = Convert.ToDateTime(reader["StartDate"]).Date;
            if (reader["EndDate"] != null && !reader.IsDBNull(reader.GetOrdinal("EndDate"))) period.EndDate = Convert.ToDateTime(reader["EndDate"]).Date;
        }
        #endregion
    }
}