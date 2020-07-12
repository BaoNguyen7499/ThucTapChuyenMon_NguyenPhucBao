using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class TinTucService
    {
        private static TinTucDAL cmb = new TinTucDAL();
        public static List<Entity.TinTuc> TinTuc_GetByTop(string Top, string Where, string Order)
        {
            return cmb.TinTuc_GetByTop(Top, Where, Order);
        }
        public static bool TinTucView_Update(string data)
        {
            return cmb.TinTucView_Update(data);
        }
        public static bool TinTuc_Insert(Entity.TinTuc data)
        {
            return cmb.TinTuc_Insert(data);
        }
        public static bool TinTuc_Update(Entity.TinTuc data)
        {
            return cmb.TinTuc_Update(data);
        }

        public static bool TinTuc_Delete(string ID)
        {
            return cmb.TinTuc_Delete(ID);
        }
    }
}
