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
    public class DatHangDAL:SqlDataProvider
    {
        public List<DatHang> DatHang_GetByTop(string Top, string Where, string Order)
        {
            List<Entity.DatHang> list = new List<Entity.DatHang>();
            using (SqlCommand dbCmd = new SqlCommand("sp_DatHang_GetByTop", GetConnection()))
            {
                Entity.DatHang obj = new Entity.DatHang();
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
                        list.Add(obj.DatHangIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        public bool DatHang_Insert(Entity.DatHang Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_DatHang_Insert", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@NgaylapHD", Data.NgaylapHD));
                    dbCmd.Parameters.Add(new SqlParameter("@id_KhachHang", Data.Id_KhachHang));
                    dbCmd.Parameters.Add(new SqlParameter("@IdPay", Data.IdPay));

                    //dbCmd.Parameters.Add(new SqlParameter("@HinhThucThanhToan", Data.HinhThucThanhToan));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("DatHang");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool DatHang_Update(DatHang Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_DatHang_Update", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@NgaylapHD", Data.NgaylapHD));
                    dbCmd.Parameters.Add(new SqlParameter("@id_KhachHang", Data.Id_KhachHang));
                    dbCmd.Parameters.Add(new SqlParameter("@IdPay", Data.IdPay));
                    dbCmd.Parameters.Add(new SqlParameter("@id", Data.Id));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("DatHang");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool DatHang_Delete(string ID)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_DatHang_Delete", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", ID));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("DatHang");
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
