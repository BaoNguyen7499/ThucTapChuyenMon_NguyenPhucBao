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
    public class ChiTietDatHangDAL:SqlDataProvider
    {
        public List<ChiTietDatHang> ChiTietDatHang_GetByTop(string Top, string Where, string Order)
        {
            List<Entity.ChiTietDatHang> list = new List<Entity.ChiTietDatHang>();
            using (SqlCommand dbCmd = new SqlCommand("sp_ChiTietDatHang_GetByTop", GetConnection()))
            {
                Entity.ChiTietDatHang obj = new Entity.ChiTietDatHang();
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
                        list.Add(obj.ChiTietDatHangIDataReader(dr));
                    }
                }
                dr.Close();
                obj = null;
            }
            return list;
        }
        public bool ChiTietDatHang_Insert(Entity.ChiTietDatHang Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_ChiTietDatHang_Insert", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id_hoadon", Data.Id_hoadon));
                    dbCmd.Parameters.Add(new SqlParameter("@id_hang", Data.Id_hang));
                    dbCmd.Parameters.Add(new SqlParameter("@SoLuongMua", Data.SoLuongMua));
                    dbCmd.Parameters.Add(new SqlParameter("@ThanhTien", Data.ThanhTien));
                    dbCmd.Parameters.Add(new SqlParameter("@Size", Data.Size));
                    dbCmd.Parameters.Add(new SqlParameter("@Gia", Data.Gia));


                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("ChiTietDatHang");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool ChiTietDatHang_Update(ChiTietDatHang Data)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_ChiTietDatHang_Update", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id_hoadon", Data.Id_hoadon));
                    dbCmd.Parameters.Add(new SqlParameter("@id_hang", Data.Id_hang));
                    dbCmd.Parameters.Add(new SqlParameter("@SoLuongMua", Data.SoLuongMua));
                    dbCmd.Parameters.Add(new SqlParameter("@ThanhTien", Data.ThanhTien));
                    dbCmd.Parameters.Add(new SqlParameter("@Size", Data.Size));
                    dbCmd.Parameters.Add(new SqlParameter("@Gia", Data.Gia));



                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("ChiTietDatHang");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool ChiTietDatHang_Delete(string ID)
        {
            try
            {
                using (SqlCommand dbCmd = new SqlCommand("sp_ChiTietDatHang_Delete", GetConnection()))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;
                    dbCmd.Parameters.Add(new SqlParameter("@id", ID));
                    dbCmd.ExecuteNonQuery();
                }
                //Clear cache
                System.Web.HttpContext.Current.Cache.Remove("ChiTietDatHang");
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
