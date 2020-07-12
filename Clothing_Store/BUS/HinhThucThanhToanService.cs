using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class HinhThucThanhToanService
    {
        private static HinhThucThanhToanDAL cmb = new HinhThucThanhToanDAL();
        public static List<Entity.HinhThucThanhToan> HinhThucThanhToan_GetByTop(string Top, string Where, string Order)
        {
            return cmb.HinhThucThanhToan_GetByTop(Top, Where, Order);
        }
    }
}
