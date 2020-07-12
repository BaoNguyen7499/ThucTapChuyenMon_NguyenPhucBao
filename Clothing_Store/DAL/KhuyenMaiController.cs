using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class KhuyenMaiDAL:SqlDataProvider
    {
        public List<Entity.KhuyenMai> KhuyenMai_GetByTop(string Top, string Where, string Order)
        {
            List<Entity.KhuyenMai> list = new List<Entity.KhuyenMai>();
            using (SqlCommand dbCmd = new SqlCommand("sp_KhuyenMai_getByTop", GetConnection()))
            {
                Entity.KhuyenMai obj = new Entity.KhuyenMai();
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
                        list.Add(obj.KhuyenMaiIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
    }
}
