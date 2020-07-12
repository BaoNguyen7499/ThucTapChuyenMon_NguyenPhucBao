using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class KhachHangService
    {
        private static KhachHangDAL cmb = new KhachHangDAL();
        public static List<Entity.KhachHang> KhachHang_GetByTop(string Top, string Where, string Order)
        {
            return cmb.KhachHang_GetByTop(Top, Where, Order);
        }

        public static bool KhachHang_Insert(Entity.KhachHang data)
        {
            return cmb.KhachHang_Insert(data);
        }


        public static bool KhachHang_Update(Entity.KhachHang data)
        {
            return cmb.KhachHang_Update(data);
        }

        public static bool KhachHang_Delete(string ID)
        {
            return cmb.KhachHang_Delete(ID);
        }
        public static bool KhachHang_UpdateDatHang(Entity.KhachHang data)
        {
            return cmb.KhachHang_UpdateDatHang(data);
        }
    }
}
