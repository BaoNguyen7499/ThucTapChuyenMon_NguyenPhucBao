using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class SanPhamService
    {
        private static SanPhamDAL cmb = new SanPhamDAL();
        public static List<Entity.SanPham> SanPham_GetByTop(string Top, string Where, string Order)
        {
            return cmb.SanPham_GetByTop(Top, Where, Order);
        }
        public static bool SanPhamView_Update(string data)
        {
            return cmb.SanPhamView_Update(data);
        }
        public static bool SanPham_Insert(Entity.SanPham data)
        {
            return cmb.SanPham_Insert(data);
        }

        public static bool SanPham_Update(Entity.SanPham data)
        {
            return cmb.SanPham_Update(data);
        }

        public static bool SanPham_Delete(string ID)
        {
            return cmb.SanPham_Delete(ID);
        }
    }
}
