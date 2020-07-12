using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class DatHangService
    {
        private static DatHangDAL cmb = new DatHangDAL();
        public static List<Entity.DatHang> DatHang_GetByTop(string Top, string Where, string Order)
        {
            return cmb.DatHang_GetByTop(Top, Where, Order);
        }

        public static bool DatHang_Insert(Entity.DatHang data)
        {
            return cmb.DatHang_Insert(data);
        }
        public static bool DatHang_Update(Entity.DatHang data)
        {
            return cmb.DatHang_Update(data);
        }
        public static bool DatHang_Delete(string ID)
        {
            return cmb.DatHang_Delete(ID);
        }
    }
}
