using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class LienLacService
    {
        private static LienLacDAL cmb = new LienLacDAL();
        public static List<Entity.LienLac> LienLac_GetByTop(string Top, string Where, string Order)
        {
            return cmb.LienLac_GetByTop(Top, Where, Order);
        }

        public static bool LienLac_Insert(Entity.LienLac data)
        {
            return cmb.LienLac_Insert(data);
        }
    }
}
