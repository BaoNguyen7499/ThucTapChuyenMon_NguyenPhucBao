using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class DatHang
    {
        private string _id;

        public string Id
        {
            get { return _id; }
            set { _id = value; }
        }
        private string _NgaylapHD;

        public string NgaylapHD
        {
            get { return _NgaylapHD; }
            set { _NgaylapHD = value; }
        }
        private string _id_KhachHang;

        public string Id_KhachHang
        {
            get { return _id_KhachHang; }
            set { _id_KhachHang = value; }
        }
        private string _IdPay;

        public string IdPay
        {
            get { return _IdPay; }
            set { _IdPay = value; }
        }
        public Entity.DatHang DatHangIDataReader(IDataReader dr)
        {
            Entity.DatHang obj = new Entity.DatHang();
            obj.Id = (dr["Id"] is DBNull) ? string.Empty : dr["Id"].ToString();
            obj.IdPay = (dr["IdPay"] is DBNull) ? string.Empty : dr["IdPay"].ToString();
            obj.NgaylapHD = (dr["NgaylapHD"] is DBNull) ? string.Empty : dr["NgaylapHD"].ToString();
            obj.Id_KhachHang = (dr["Id_KhachHang"] is DBNull) ? string.Empty : dr["Id_KhachHang"].ToString();
            return obj;
        }
    }
}
