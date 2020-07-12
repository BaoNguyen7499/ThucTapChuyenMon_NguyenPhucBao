using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class QuangCao
    {
        private string _id;

        public string Id
        {
            get { return _id; }
            set { _id = value; }
        }
        private string _urlImage;

        public string UrlImage
        {
            get { return _urlImage; }
            set { _urlImage = value; }
        }
        private string _Active;

        public string Active
        {
            get { return _Active; }
            set { _Active = value; }
        }
        private string _Count_Click;

        public string Count_Click
        {
            get { return _Count_Click; }
            set { _Count_Click = value; }
        }
        public Entity.QuangCao QuangCaoIDataReader(IDataReader dr)
        {
            Entity.QuangCao obj = new Entity.QuangCao();
            obj.Id = (dr["Id"] is DBNull) ? string.Empty : dr["Id"].ToString();
            obj.UrlImage = (dr["UrlImage"] is DBNull) ? string.Empty : dr["UrlImage"].ToString();
            obj.Active = (dr["Active"] is DBNull) ? string.Empty : dr["Active"].ToString();
            obj.Count_Click = (dr["Count_Click"] is DBNull) ? string.Empty : dr["Count_Click"].ToString();

            return obj;
        }
    }
}
