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
    public class SanPhamDAL:SqlDataProvider
    {
        public List<Entity.SanPham> SanPham_GetByTop(string Top, string Where, string Order)
        {
            List<Entity.SanPham> list = new List<Entity.SanPham>();
            using (SqlCommand dbCmd = new SqlCommand("sp_Hang_getByTop", GetConnection()))
            {
                Entity.SanPham obj = new Entity.SanPham();
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
                        list.Add(obj.SanPhamIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        public bool SanPhamView_Update(string Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_SanPhamView_Update", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", Data));



                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("SanPham");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool SanPham_Insert(Entity.SanPham Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_Hang_Insert", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@TenHang", Data.TenHang));
                    dbCmd.Parameters.Add(new SqlParameter("@TomTat", Data.TomTat));
                    dbCmd.Parameters.Add(new SqlParameter("@Mota", Data.Mota));
                    dbCmd.Parameters.Add(new SqlParameter("@image", Data.Image));
                    dbCmd.Parameters.Add(new SqlParameter("@ChatLieu", Data.ChatLieu));
                    dbCmd.Parameters.Add(new SqlParameter("@giaMoi", Data.GiaMoi));
                    dbCmd.Parameters.Add(new SqlParameter("@giaCu", Data.GiaCu));
                    dbCmd.Parameters.Add(new SqlParameter("@id_Menu", Data.Id_Menu));
                    dbCmd.Parameters.Add(new SqlParameter("@Soluong", Data.Soluong));
                    dbCmd.Parameters.Add(new SqlParameter("@TinhTrang", Data.TinhTrang));
                    dbCmd.Parameters.Add(new SqlParameter("@Active", Data.Active));
                    dbCmd.Parameters.Add(new SqlParameter("@image_large", Data.ImageLarge));

                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("SanPham");
                return true;
            }
            catch
            {

                return false;
            }
        }
        public bool SanPham_Update(SanPham Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_Hang_Update", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", Data.Id));
                    dbCmd.Parameters.Add(new SqlParameter("@TenHang", Data.TenHang));
                    dbCmd.Parameters.Add(new SqlParameter("@TomTat", Data.TomTat));
                    dbCmd.Parameters.Add(new SqlParameter("@Mota", Data.Mota));
                    dbCmd.Parameters.Add(new SqlParameter("@image", Data.Image));
                    dbCmd.Parameters.Add(new SqlParameter("@ChatLieu", Data.ChatLieu));
                    dbCmd.Parameters.Add(new SqlParameter("@giaMoi", Data.GiaMoi));
                    dbCmd.Parameters.Add(new SqlParameter("@giaCu", Data.GiaCu));
                    dbCmd.Parameters.Add(new SqlParameter("@id_Menu", Data.Id_Menu));
                    dbCmd.Parameters.Add(new SqlParameter("@Soluong", Data.Soluong));
                    dbCmd.Parameters.Add(new SqlParameter("@Active", Data.Active));
                    dbCmd.Parameters.Add(new SqlParameter("@image_large", Data.ImageLarge));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("SanPham");
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool SanPham_Delete(string ID)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_Hang_Delete", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", ID));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("SanPham");
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
