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
    public class LienLacDAL:SqlDataProvider
    {
        public List<LienLac> LienLac_GetByTop(string Top, string Where, string Order)
        {
            List<Entity.LienLac> list = new List<Entity.LienLac>();
            using (SqlCommand dbCmd = new SqlCommand("sp_LienLac_GetByTop", GetConnection()))
            {
                Entity.LienLac obj = new Entity.LienLac();
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
                        list.Add(obj.LienLacIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        public bool LienLac_Insert(Entity.LienLac Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_LienLac_Insert", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;

                    dbCmd.Parameters.Add(new SqlParameter("@Ten", Data.Ten));
                    dbCmd.Parameters.Add(new SqlParameter("@DiaChi", Data.DiaChi));
                    dbCmd.Parameters.Add(new SqlParameter("@DienThoai", Data.DienThoai));
                    dbCmd.Parameters.Add(new SqlParameter("@Email", Data.Email));
                    dbCmd.Parameters.Add(new SqlParameter("@ChuDe", Data.ChuDe));
                    dbCmd.Parameters.Add(new SqlParameter("@NoiDung", Data.NoiDung));
                    //dbCmd.Parameters.Add(new SqlParameter("@HinhThucThanhToan", Data.HinhThucThanhToan));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("LienLac");
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
