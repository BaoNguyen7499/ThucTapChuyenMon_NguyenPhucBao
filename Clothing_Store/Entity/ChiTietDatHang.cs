using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class ChiTietDatHang
    {
        private string _id_hoadon;

        public string Id_hoadon
        {
            get { return _id_hoadon; }
            set { _id_hoadon = value; }
        }
        private string _id_hang;

        public string Id_hang
        {
            get { return _id_hang; }
            set { _id_hang = value; }
        }
        private string _SoLuongMua;

        public string SoLuongMua
        {
            get { return _SoLuongMua; }
            set { _SoLuongMua = value; }
        }
        private string _ThanhTien;

        public string ThanhTien
        {
            get { return _ThanhTien; }
            set { _ThanhTien = value; }
        }
        private string _Size;

        public string Size
        {
            get { return _Size; }
            set { _Size = value; }
        }
        private string _Gia;

        public string Gia
        {
            get { return _Gia; }
            set { _Gia = value; }
        }
        public Entity.ChiTietDatHang ChiTietDatHangIDataReader(IDataReader dr)
        {
            Entity.ChiTietDatHang obj = new Entity.ChiTietDatHang();
            obj.Id_hoadon = (dr["Id_hoadon"] is DBNull) ? string.Empty : dr["Id_hoadon"].ToString();
            obj.Id_hang = (dr["Id_hang"] is DBNull) ? string.Empty : dr["Id_hang"].ToString();
            obj.Gia = (dr["Gia"] is DBNull) ? string.Empty : dr["Gia"].ToString();
            obj.SoLuongMua = (dr["SoLuongMua"] is DBNull) ? string.Empty : dr["SoLuongMua"].ToString();
            obj.ThanhTien = (dr["ThanhTien"] is DBNull) ? string.Empty : dr["ThanhTien"].ToString();
            obj.Size = (dr["Size"] is DBNull) ? string.Empty : dr["Size"].ToString();

            return obj;
        }
    }
}
