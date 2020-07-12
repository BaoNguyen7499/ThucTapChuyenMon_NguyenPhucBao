using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class QuanLyMeNuService
    {
        private static QuanLyMeNuDAL cmb = new QuanLyMeNuDAL();
        public static List<Entity.QuanLyMeNu> QuanLyMeNu_GetByTop(string Top, string Where, string Order)
        {
            return cmb.QuanLyMeNu_GetByTop(Top, Where, Order);
        }

        public static bool QuanLyMeNu_Insert(Entity.QuanLyMeNu data)
        {
            return cmb.QuanLyMeNu_Insert(data);
        }

        public static bool QuanLyMeNu_Update(Entity.QuanLyMeNu data)
        {
            return cmb.QuanLyMeNu_Update(data);
        }

        public static bool QuanLyMeNu_Delete(string ID)
        {
            return cmb.QuanLyMeNu_Delete(ID);
        }
    }
}
