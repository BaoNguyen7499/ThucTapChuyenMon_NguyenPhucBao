using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class NhanVien
    {
        private string _id;

        public string Id
        {
            get { return _id; }
            set { _id = value; }
        }
        private string _tenNV;

        public string TenNV
        {
            get { return _tenNV; }
            set { _tenNV = value; }
        }
        private string _NgaySinh;

        public string NgaySinh
        {
            get { return _NgaySinh; }
            set { _NgaySinh = value; }
        }
        private string _gioitinh;

        public string Gioitinh
        {
            get { return _gioitinh; }
            set { _gioitinh = value; }
        }
        private string _ChucVu;

        public string ChucVu
        {
            get { return _ChucVu; }
            set { _ChucVu = value; }
        }
        private string _id_quyen;

        public string Id_quyen
        {
            get { return _id_quyen; }
            set { _id_quyen = value; }
        }
        private string _UserName;

        public string UserName
        {
            get { return _UserName; }
            set { _UserName = value; }
        }
        private string _Password;

        public string Password
        {
            get { return _Password; }
            set { _Password = value; }
        }
        public Entity.NhanVien NhanVienIDataReader(IDataReader dr)
        {
            Entity.NhanVien obj = new Entity.NhanVien();
            obj.Id = (dr["Id"] is DBNull) ? string.Empty : dr["Id"].ToString();
            obj.TenNV = (dr["TenNV"] is DBNull) ? string.Empty : dr["TenNV"].ToString();
            obj.NgaySinh = (dr["NgaySinh"] is DBNull) ? string.Empty : dr["NgaySinh"].ToString();
            obj.Gioitinh = (dr["Gioitinh"] is DBNull) ? string.Empty : dr["Gioitinh"].ToString();
            obj.ChucVu = (dr["ChucVu"] is DBNull) ? string.Empty : dr["ChucVu"].ToString();
            obj.Id_quyen = (dr["Id_quyen"] is DBNull) ? string.Empty : dr["Id_quyen"].ToString();
            obj.UserName = (dr["UserName"] is DBNull) ? string.Empty : dr["UserName"].ToString();
            obj.Password = (dr["Password"] is DBNull) ? string.Empty : dr["Password"].ToString();
            return obj;
        }
    }
}
