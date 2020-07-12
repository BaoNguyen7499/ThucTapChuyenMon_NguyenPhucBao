using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class KhachHang
    {
        private string _id;
        private string _tenKH;
        private string _GioiTinh;
        private string _NgaySinh;
        private string _TaiKhoan;
        private string _MatKhau;
        private string _Email;
        private string _SDT;
        private string _Tinh;
        private string _Quan;

        private string _TinhTrang;
        private string _DiaChi;
        private string _Link_Fb;

        public string Link_Fb
        {
            get { return _Link_Fb; }
            set { _Link_Fb = value; }
        }

        public string DiaChi
        {
            get { return _DiaChi; }
            set { _DiaChi = value; }
        }
        public string Id
        {
            get { return _id; }
            set { _id = value; }
        }


        public string TenKH
        {
            get { return _tenKH; }
            set { _tenKH = value; }
        }


        public string GioiTinh
        {
            get { return _GioiTinh; }
            set { _GioiTinh = value; }
        }


        public string NgaySinh
        {
            get { return _NgaySinh; }
            set { _NgaySinh = value; }
        }


        public string TaiKhoan
        {
            get { return _TaiKhoan; }
            set { _TaiKhoan = value; }
        }


        public string MatKhau
        {
            get { return _MatKhau; }
            set { _MatKhau = value; }
        }


        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }


        public string SDT
        {
            get { return _SDT; }
            set { _SDT = value; }
        }


        public string Tinh
        {
            get { return _Tinh; }
            set { _Tinh = value; }
        }


        public string Quan
        {
            get { return _Quan; }
            set { _Quan = value; }
        }





        public string TinhTrang
        {
            get { return _TinhTrang; }
            set { _TinhTrang = value; }
        }
        public Entity.KhachHang KhachHangIDataReader(IDataReader dr)
        {
            Entity.KhachHang obj = new Entity.KhachHang();
            obj.Id = (dr["Id"] is DBNull) ? string.Empty : dr["Id"].ToString();
            obj.TenKH = (dr["TenKH"] is DBNull) ? string.Empty : dr["TenKH"].ToString();
            obj.GioiTinh = (dr["GioiTinh"] is DBNull) ? string.Empty : dr["GioiTinh"].ToString();
            obj.NgaySinh = (dr["NgaySinh"] is DBNull) ? string.Empty : dr["NgaySinh"].ToString();
            obj.TaiKhoan = (dr["TaiKhoan"] is DBNull) ? string.Empty : dr["TaiKhoan"].ToString();
            obj.MatKhau = (dr["MatKhau"] is DBNull) ? string.Empty : dr["MatKhau"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            obj.SDT = (dr["SDT"] is DBNull) ? string.Empty : dr["SDT"].ToString();
            obj.Tinh = (dr["Tinh"] is DBNull) ? string.Empty : dr["Tinh"].ToString();
            obj.Quan = (dr["Quan"] is DBNull) ? string.Empty : dr["Quan"].ToString();
            obj.DiaChi = (dr["DiaChi"] is DBNull) ? string.Empty : dr["DiaChi"].ToString();
            obj.TinhTrang = (dr["TinhTrang"] is DBNull) ? string.Empty : dr["TinhTrang"].ToString();
            obj.Link_Fb = (dr["Link_Fb"] is DBNull) ? string.Empty : dr["Link_Fb"].ToString();
            return obj;
        }
    }
}
