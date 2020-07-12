using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class ChiTietDatHangService
    {
        private static ChiTietDatHangDAL cmb = new ChiTietDatHangDAL();
        public static List<Entity.ChiTietDatHang> ChiTietDatHang_GetByTop(string Top, string Where, string Order)
        {
            return cmb.ChiTietDatHang_GetByTop(Top, Where, Order);
        }

        public static bool ChiTietDatHang_Insert(Entity.ChiTietDatHang data)
        {
            return cmb.ChiTietDatHang_Insert(data);
        }
        public static bool ChiTietDatHang_Update(Entity.ChiTietDatHang data)
        {
            return cmb.ChiTietDatHang_Update(data);
        }
        public static bool ChiTietDatHang_Delete(string ID)
        {
            return cmb.ChiTietDatHang_Delete(ID);
        }
    }
}
