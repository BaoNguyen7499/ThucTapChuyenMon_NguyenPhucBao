using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class QuangCaoService
    {
        private static QuangCaoDAL cmb = new QuangCaoDAL();
        public static List<Entity.QuangCao> QuangCao_GetByTop(string Top, string Where, string Order)
        {
            return cmb.QuangCao_GetByTop(Top, Where, Order);
        }
        public static bool QuangCaoClick_Update(string data)
        {
            return cmb.QuangCaoClick_Update(data);
        }
    }
}
