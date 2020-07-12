using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class KhuyenMai
    {
        private string _id;

        public string Id
        {
            get { return _id; }
            set { _id = value; }
        }
        private string _GiaTri;

        public string GiaTri
        {
            get { return _GiaTri; }
            set { _GiaTri = value; }
        }
        public Entity.KhuyenMai KhuyenMaiIDataReader(IDataReader dr)
        {
            Entity.KhuyenMai obj = new Entity.KhuyenMai();
            obj.Id = (dr["Id"] is DBNull) ? string.Empty : dr["Id"].ToString();
            obj.GiaTri = (dr["GiaTri"] is DBNull) ? string.Empty : dr["GiaTri"].ToString();
            return obj;
        }
    }
}
