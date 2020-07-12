using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class SanPham
    {
        private string _id;
        private string _TenHang;
        private string _image;
        private string _ChatLieu;
        private string _Mota;
        private string _LuotXem;
        private string _giaMoi;
        private string _giaCu;
        private string _id_Menu;
        private string _Soluong;
        private string _TinhTrang;
        private string _imageLarge;
        private string _TomTat;

        public string TomTat
        {
            get { return _TomTat; }
            set { _TomTat = value; }
        }
        public string ImageLarge
        {
            get { return _imageLarge; }
            set { _imageLarge = value; }
        }
        private string _Active;

        public string Active
        {
            get { return _Active; }
            set { _Active = value; }
        }
        public string Id
        {
            get { return _id; }
            set { _id = value; }
        }


        public string TenHang
        {
            get { return _TenHang; }
            set { _TenHang = value; }
        }


        public string Image
        {
            get { return _image; }
            set { _image = value; }
        }


        public string ChatLieu
        {
            get { return _ChatLieu; }
            set { _ChatLieu = value; }
        }


        public string Mota
        {
            get { return _Mota; }
            set { _Mota = value; }
        }


        public string LuotXem
        {
            get { return _LuotXem; }
            set { _LuotXem = value; }
        }


        public string GiaMoi
        {
            get { return _giaMoi; }
            set { _giaMoi = value; }
        }


        public string GiaCu
        {
            get { return _giaCu; }
            set { _giaCu = value; }
        }


        public string Id_Menu
        {
            get { return _id_Menu; }
            set { _id_Menu = value; }
        }


        public string Soluong
        {
            get { return _Soluong; }
            set { _Soluong = value; }
        }


        public string TinhTrang
        {
            get { return _TinhTrang; }
            set { _TinhTrang = value; }
        }
        public Entity.SanPham SanPhamIDataReader(IDataReader dr)
        {
            Entity.SanPham obj = new Entity.SanPham();
            obj.Id = (dr["Id"] is DBNull) ? string.Empty : dr["Id"].ToString();
            obj.TenHang = (dr["TenHang"] is DBNull) ? string.Empty : dr["TenHang"].ToString();
            obj.Image = (dr["Image"] is DBNull) ? string.Empty : dr["Image"].ToString();
            obj.ChatLieu = (dr["ChatLieu"] is DBNull) ? string.Empty : dr["ChatLieu"].ToString();
            obj.Mota = (dr["Mota"] is DBNull) ? string.Empty : dr["Mota"].ToString();
            obj.LuotXem = (dr["LuotXem"] is DBNull) ? string.Empty : dr["LuotXem"].ToString();
            obj.GiaMoi = (dr["GiaMoi"] is DBNull) ? string.Empty : dr["GiaMoi"].ToString();
            obj.GiaCu = (dr["GiaCu"] is DBNull) ? string.Empty : dr["GiaCu"].ToString();
            obj.Id_Menu = (dr["Id_Menu"] is DBNull) ? string.Empty : dr["Id_Menu"].ToString();
            obj.Soluong = (dr["Soluong"] is DBNull) ? string.Empty : dr["Soluong"].ToString();
            obj.TinhTrang = (dr["TinhTrang"] is DBNull) ? string.Empty : dr["TinhTrang"].ToString();
            obj.Active = (dr["Active"] is DBNull) ? string.Empty : dr["Active"].ToString();
            obj.ImageLarge = (dr["image_large"] is DBNull) ? string.Empty : dr["image_large"].ToString();
            obj.TomTat = (dr["TomTat"] is DBNull) ? string.Empty : dr["TomTat"].ToString();
            return obj;
        }
    }
}
