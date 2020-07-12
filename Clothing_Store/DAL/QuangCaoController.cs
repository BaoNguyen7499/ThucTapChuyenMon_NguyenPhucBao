using Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class QuangCaoDAL:SqlDataProvider
    {
        public List<QuangCao> QuangCao_GetByTop(string Top, string Where, string Order)
        {
            List<Entity.QuangCao> list = new List<Entity.QuangCao>();
            using (SqlCommand dbCmd = new SqlCommand("sp_QuangCao_GetByTop", GetConnection()))
            {
                Entity.QuangCao obj = new Entity.QuangCao();
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Parameters.Add(new SqlParameter("@Top", Top));
                dbCmd.Parameters.Add(new SqlParameter("@Where", Where));
                dbCmd.Parameters.Add(new SqlParameter("@Order", Order));
                SqlDataReader dr = dbCmd.ExecuteReader();
                dr.Close();
                dr = dbCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(obj.QuangCaoIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        public bool QuangCaoClick_Update(string Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_QuangCao_Count_Update", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", Data));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("QuangCao");
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
