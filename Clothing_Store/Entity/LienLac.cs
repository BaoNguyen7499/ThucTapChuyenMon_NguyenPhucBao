using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class LienLac
    {
        private string _id;

        public string Id
        {
            get { return _id; }
            set { _id = value; }
        }
        private string _Ten;

        public string Ten
        {
            get { return _Ten; }
            set { _Ten = value; }
        }
        private string _DiaChi;

        public string DiaChi
        {
            get { return _DiaChi; }
            set { _DiaChi = value; }
        }
        private string _DienThoai;

        public string DienThoai
        {
            get { return _DienThoai; }
            set { _DienThoai = value; }
        }
        private string _Email;

        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }
        private string _ChuDe;

        public string ChuDe
        {
            get { return _ChuDe; }
            set { _ChuDe = value; }
        }
        private string _NoiDung;

        public string NoiDung
        {
            get { return _NoiDung; }
            set { _NoiDung = value; }
        }
        public Entity.LienLac LienLacIDataReader(IDataReader dr)
        {
            Entity.LienLac obj = new Entity.LienLac();
            obj.Id = (dr["Id"] is DBNull) ? string.Empty : dr["Id"].ToString();
            obj.Ten = (dr["Ten"] is DBNull) ? string.Empty : dr["Ten"].ToString();
            obj.DiaChi = (dr["DiaChi"] is DBNull) ? string.Empty : dr["DiaChi"].ToString();
            obj.DienThoai = (dr["DienThoai"] is DBNull) ? string.Empty : dr["DienThoai"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            obj.ChuDe = (dr["ChuDe"] is DBNull) ? string.Empty : dr["ChuDe"].ToString();
            obj.NoiDung = (dr["NoiDung"] is DBNull) ? string.Empty : dr["NoiDung"].ToString();

            return obj;
        }
    }
}
