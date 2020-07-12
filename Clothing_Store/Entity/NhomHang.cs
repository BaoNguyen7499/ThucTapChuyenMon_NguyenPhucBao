using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class NhomHang
    {
        private string _id;

        public string Id
        {
            get { return _id; }
            set { _id = value; }
        }
        private string _TenNhomHang;

        public string TenNhomHang
        {
            get { return _TenNhomHang; }
            set { _TenNhomHang = value; }
        }
        private string _Active;

        public string Active
        {
            get { return _Active; }
            set { _Active = value; }
        }

        private string _khongdau;

        public string khongdau
        {
            get { return _khongdau; }
            set { _khongdau = value; }
        }
        public Entity.NhomHang NhomHangIDataReader(IDataReader dr)
        {
            Entity.NhomHang obj = new Entity.NhomHang();
            obj.Id = (dr["Id"] is DBNull) ? string.Empty : dr["Id"].ToString();
            obj.TenNhomHang = (dr["TenNhomHang"] is DBNull) ? string.Empty : dr["TenNhomHang"].ToString();
            obj.Active = (dr["Active"] is DBNull) ? string.Empty : dr["Active"].ToString();
            obj.khongdau = (dr["khongdau"] is DBNull) ? string.Empty : dr["khongdau"].ToString();
            return obj;
        }
    }
}
