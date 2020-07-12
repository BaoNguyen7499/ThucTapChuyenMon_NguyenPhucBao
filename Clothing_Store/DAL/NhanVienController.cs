using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class NhanVienDAL:SqlDataProvider
    {
        public List<Entity.NhanVien> NhanVien_GetByTop(string Top, string Where, string Order)
        {
            List<Entity.NhanVien> list = new List<Entity.NhanVien>();
            using (SqlCommand dbCmd = new SqlCommand("sp_NhanVien_GetByTop", GetConnection()))
            {
                Entity.NhanVien obj = new Entity.NhanVien();
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
                        list.Add(obj.NhanVienIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
    }
}
