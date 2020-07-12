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
    public class QuanLyMeNuDAL:SqlDataProvider
    {
        public List<QuanLyMeNu> QuanLyMeNu_GetByTop(string Top, string Where, string Order)
        {
            List<Entity.QuanLyMeNu> list = new List<Entity.QuanLyMeNu>();
            using (SqlCommand dbCmd = new SqlCommand("sp_QuanLyMeNu_GetByTop", GetConnection()))
            {
                Entity.QuanLyMeNu obj = new Entity.QuanLyMeNu();
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
                        list.Add(obj.QuanLyMeNuIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        public bool QuanLyMeNu_Insert(Entity.QuanLyMeNu Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_QuanLyMeNu_Insert", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@TenMenu", Data.TenMenu));
                    dbCmd.Parameters.Add(new SqlParameter("@Active", Data.Active));
                    dbCmd.Parameters.Add(new SqlParameter("@Type", Data.Type));
                    dbCmd.Parameters.Add(new SqlParameter("@Ord", Data.Ord));
                    dbCmd.Parameters.Add(new SqlParameter("@Level", Data.Level));
                    dbCmd.Parameters.Add(new SqlParameter("@Link", Data.Link));
                    dbCmd.Parameters.Add(new SqlParameter("@TypeClick", Data.TypeClick));
                    dbCmd.Parameters.Add(new SqlParameter("@Icon", Data.Icon));

                    //dbCmd.Parameters.Add(new SqlParameter("@HinhThucThanhToan", Data.HinhThucThanhToan));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("QuanLyMeNu");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool QuanLyMeNu_Update(QuanLyMeNu Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_QuanLyMeNu_Update", GetConnection()))
                {

                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@TenMenu", Data.TenMenu));
                    dbCmd.Parameters.Add(new SqlParameter("@Active", Data.Active));
                    dbCmd.Parameters.Add(new SqlParameter("@Type", Data.Type));
                    dbCmd.Parameters.Add(new SqlParameter("@Ord", Data.Ord));
                    dbCmd.Parameters.Add(new SqlParameter("@Level", Data.Level));
                    dbCmd.Parameters.Add(new SqlParameter("@Link", Data.Link));
                    dbCmd.Parameters.Add(new SqlParameter("@TypeClick", Data.TypeClick));
                    dbCmd.Parameters.Add(new SqlParameter("@Icon", Data.Icon));

                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("QuanLyMeNu");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool QuanLyMeNu_Delete(string ID)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_QuanLyMeNu_Delete", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", ID));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("QuanLyMeNu");
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
