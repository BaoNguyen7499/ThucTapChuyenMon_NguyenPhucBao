using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class TinTuc
    {
        private string _id;

        public string Id
        {
            get { return _id; }
            set { _id = value; }
        }
        private string _tieuDe;

        public string TieuDe
        {
            get { return _tieuDe; }
            set { _tieuDe = value; }
        }
        private string _tomtat;

        public string Tomtat
        {
            get { return _tomtat; }
            set { _tomtat = value; }
        }


        private string _noidung;

        public string Noidung
        {
            get { return _noidung; }
            set { _noidung = value; }
        }
        private string _ngayviet;

        public string Ngayviet
        {
            get { return _ngayviet; }
            set { _ngayviet = value; }
        }
        private string _id_nhanvien;

        public string Id_nhanvien
        {
            get { return _id_nhanvien; }
            set { _id_nhanvien = value; }
        }
        private string _urlHinhAnh;

        public string UrlHinhAnh
        {
            get { return _urlHinhAnh; }
            set { _urlHinhAnh = value; }
        }
        private string _LuotXem;

        public string LuotXem
        {
            get { return _LuotXem; }
            set { _LuotXem = value; }
        }
        private string _Active;

        public string Active
        {
            get { return _Active; }
            set { _Active = value; }
        }
        public Entity.TinTuc TinTucIDataReader(IDataReader dr)
        {
            Entity.TinTuc obj = new Entity.TinTuc();
            obj.Id = (dr["Id"] is DBNull) ? string.Empty : dr["Id"].ToString();
            obj.TieuDe = (dr["TieuDe"] is DBNull) ? string.Empty : dr["TieuDe"].ToString();
            obj.Tomtat = (dr["Tomtat"] is DBNull) ? string.Empty : dr["Tomtat"].ToString();
            obj.Noidung = (dr["Noidung"] is DBNull) ? string.Empty : dr["Noidung"].ToString();
            obj.Ngayviet = (dr["Ngayviet"] is DBNull) ? string.Empty : dr["Ngayviet"].ToString();
            obj.Id_nhanvien = (dr["Id_nhanvien"] is DBNull) ? string.Empty : dr["Id_nhanvien"].ToString();
            obj.UrlHinhAnh = (dr["UrlHinhAnh"] is DBNull) ? string.Empty : dr["UrlHinhAnh"].ToString();
            obj.LuotXem = (dr["LuotXem"] is DBNull) ? string.Empty : dr["LuotXem"].ToString();
            obj.Active = (dr["Active"] is DBNull) ? string.Empty : dr["Active"].ToString();
            return obj;
        }
    }
}
