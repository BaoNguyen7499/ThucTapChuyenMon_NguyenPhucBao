using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class HinhThucThanhToanDAL:SqlDataProvider
    {
        public List<Entity.HinhThucThanhToan> HinhThucThanhToan_GetByTop(string Top, string Where, string Order)
        {
            List<Entity.HinhThucThanhToan> list = new List<Entity.HinhThucThanhToan>();
            using (SqlCommand dbCmd = new SqlCommand("sp_HinhThucThanhToan_GetByTop", GetConnection()))
            {
                Entity.HinhThucThanhToan obj = new Entity.HinhThucThanhToan();
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
                        list.Add(obj.HinhThucThanhToanIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
    }
}
