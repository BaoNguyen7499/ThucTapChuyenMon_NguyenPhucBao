using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class HinhThucThanhToan
    {
        private string _IdPay;

        public string IdPay
        {
            get { return _IdPay; }
            set { _IdPay = value; }
        }
        private string _HinhThucThanhToan;

        public string HinhThucThanhToan1
        {
            get { return _HinhThucThanhToan; }
            set { _HinhThucThanhToan = value; }
        }
        private string _Visible;

        public string Visible
        {
            get { return _Visible; }
            set { _Visible = value; }
        }
        public Entity.HinhThucThanhToan HinhThucThanhToanIDataReader(IDataReader dr)
        {
            Entity.HinhThucThanhToan obj = new Entity.HinhThucThanhToan();
            obj.HinhThucThanhToan1 = (dr["HinhThucThanhToan"] is DBNull) ? string.Empty : dr["HinhThucThanhToan"].ToString();
            obj.IdPay = (dr["IdPay"] is DBNull) ? string.Empty : dr["IdPay"].ToString();
            obj.Visible = (dr["Visible"] is DBNull) ? string.Empty : dr["Visible"].ToString();
            return obj;
        }
    }
}
