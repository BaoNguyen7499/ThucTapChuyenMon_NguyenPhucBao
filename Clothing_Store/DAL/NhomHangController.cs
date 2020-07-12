using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class NhomHangDAL:SqlDataProvider
    {
        public List<Entity.NhomHang> NhomHang_GetByTop(string Top, string Where, string Order)
        {
            List<Entity.NhomHang> list = new List<Entity.NhomHang>();
            using (SqlCommand dbCmd = new SqlCommand("sp_NhomHang_GetByTop", GetConnection()))
            {
                Entity.NhomHang obj = new Entity.NhomHang();
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
                        list.Add(obj.NhomHangIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
    }
}
