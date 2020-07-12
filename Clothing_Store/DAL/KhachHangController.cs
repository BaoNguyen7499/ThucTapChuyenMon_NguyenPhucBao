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
    public class KhachHangDAL:SqlDataProvider
    {
        public List<KhachHang> KhachHang_GetByTop(string Top, string Where, string Order)
        {
            List<Entity.KhachHang> list = new List<Entity.KhachHang>();
            using (SqlCommand dbCmd = new SqlCommand("sp_KhachHang_GetByTop", GetConnection()))
            {
                Entity.KhachHang obj = new Entity.KhachHang();
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
                        list.Add(obj.KhachHangIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        public bool KhachHang_Insert(Entity.KhachHang Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_KhachHang_Insert", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@tenKH", Data.TenKH));
                    dbCmd.Parameters.Add(new SqlParameter("@GioiTinh", Data.GioiTinh));
                    dbCmd.Parameters.Add(new SqlParameter("@NgaySinh", Data.NgaySinh));
                    dbCmd.Parameters.Add(new SqlParameter("@TaiKhoan", Data.TaiKhoan));
                    dbCmd.Parameters.Add(new SqlParameter("@MatKhau", Data.MatKhau));
                    dbCmd.Parameters.Add(new SqlParameter("@Email", Data.Email));
                    dbCmd.Parameters.Add(new SqlParameter("@SDT", Data.SDT));
                    dbCmd.Parameters.Add(new SqlParameter("@Tinh", Data.Tinh));
                    dbCmd.Parameters.Add(new SqlParameter("@Quan", Data.Quan));
                    dbCmd.Parameters.Add(new SqlParameter("@DiaChi", Data.DiaChi));
                    dbCmd.Parameters.Add(new SqlParameter("@Link_Fb", Data.Link_Fb));
                    //dbCmd.Parameters.Add(new SqlParameter("@HinhThucThanhToan", Data.HinhThucThanhToan));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("KhachHang");
                return true;
            }
            catch
            {
                return false;
            }
        }


        public bool KhachHang_UpdateDatHang(KhachHang Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_KhachHangDatHang_Update", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", Data.Id));
                    dbCmd.Parameters.Add(new SqlParameter("@tenKH", Data.TenKH));

                    dbCmd.Parameters.Add(new SqlParameter("@Email", Data.Email));
                    dbCmd.Parameters.Add(new SqlParameter("@SDT", Data.SDT));
                    dbCmd.Parameters.Add(new SqlParameter("@Tinh", Data.Tinh));
                    dbCmd.Parameters.Add(new SqlParameter("@Quan", Data.Quan));
                    dbCmd.Parameters.Add(new SqlParameter("@DiaChi", Data.DiaChi));

                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("KhachHang");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool KhachHang_Update(KhachHang Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_KhachHang_Update", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", Data.Id));
                    dbCmd.Parameters.Add(new SqlParameter("@tenKH", Data.TenKH));
                    dbCmd.Parameters.Add(new SqlParameter("@GioiTinh", Data.GioiTinh));
                    dbCmd.Parameters.Add(new SqlParameter("@NgaySinh", Data.NgaySinh));
                    dbCmd.Parameters.Add(new SqlParameter("@MatKhau", Data.MatKhau));
                    dbCmd.Parameters.Add(new SqlParameter("@Email", Data.Email));
                    dbCmd.Parameters.Add(new SqlParameter("@SDT", Data.SDT));
                    dbCmd.Parameters.Add(new SqlParameter("@Tinh", Data.Tinh));
                    dbCmd.Parameters.Add(new SqlParameter("@Quan", Data.Quan));
                    dbCmd.Parameters.Add(new SqlParameter("@DiaChi", Data.DiaChi));

                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("KhachHang");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool KhachHang_Delete(string ID)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_KhachHang_Delete", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", ID));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("KhachHang");
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
