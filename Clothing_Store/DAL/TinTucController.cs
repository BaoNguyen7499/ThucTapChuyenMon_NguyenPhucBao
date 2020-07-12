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
    public class TinTucDAL:SqlDataProvider
    {
        public List<TinTuc> TinTuc_GetByTop(string Top, string Where, string Order)
        {
            List<Entity.TinTuc> list = new List<Entity.TinTuc>();
            using (SqlCommand dbCmd = new SqlCommand("sp_TinTuc_GetByTop", GetConnection()))
            {
                Entity.TinTuc obj = new Entity.TinTuc();
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
                        list.Add(obj.TinTucIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        public bool TinTuc_Insert(Entity.TinTuc Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_TinTuc_Insert", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@tieuDe", Data.TieuDe));
                    dbCmd.Parameters.Add(new SqlParameter("@tomtat", Data.Tomtat));
                    dbCmd.Parameters.Add(new SqlParameter("@noidung", Data.Noidung));
                    dbCmd.Parameters.Add(new SqlParameter("@ngayviet", Data.Ngayviet));
                    dbCmd.Parameters.Add(new SqlParameter("@id_nhanvien", Data.Id_nhanvien));
                    dbCmd.Parameters.Add(new SqlParameter("@urlHinhAnh", Data.UrlHinhAnh));
                    dbCmd.Parameters.Add(new SqlParameter("@Active", Data.Active));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("TinTuc");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool TinTuc_Update(TinTuc Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_TinTuc_Update", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", Data.Id));

                    dbCmd.Parameters.Add(new SqlParameter("@tieuDe", Data.TieuDe));
                    dbCmd.Parameters.Add(new SqlParameter("@tomtat", Data.Tomtat));
                    dbCmd.Parameters.Add(new SqlParameter("@noidung", Data.Noidung));
                    dbCmd.Parameters.Add(new SqlParameter("@ngayviet", Data.Ngayviet));
                    dbCmd.Parameters.Add(new SqlParameter("@id_nhanvien", Data.Id_nhanvien));
                    dbCmd.Parameters.Add(new SqlParameter("@urlHinhAnh", Data.UrlHinhAnh));
                    dbCmd.Parameters.Add(new SqlParameter("@Active", Data.Active));

                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("TinTuc");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool TinTuc_Delete(string ID)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_TinTuc_Delete", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", ID));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("TinTuc");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool TinTucView_Update(string Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_TinTucView_Update", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", Data));



                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("TinTuc");
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
