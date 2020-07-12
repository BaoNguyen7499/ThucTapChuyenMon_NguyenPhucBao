using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class QuanLyMeNu
    {
        private string _ID;

        public string ID
        {
            get { return _ID; }
            set { _ID = value; }
        }
        private string _TenMenu;

        public string TenMenu
        {
            get { return _TenMenu; }
            set { _TenMenu = value; }
        }
        private string _Type;

        public string Type
        {
            get { return _Type; }
            set { _Type = value; }
        }
        private string _Ord;

        public string Ord
        {
            get { return _Ord; }
            set { _Ord = value; }
        }
        private string _Level;

        public string Level
        {
            get { return _Level; }
            set { _Level = value; }
        }
        private string _Link;

        public string Link
        {
            get { return _Link; }
            set { _Link = value; }
        }
        private string _TypeClick;

        public string TypeClick
        {
            get { return _TypeClick; }
            set { _TypeClick = value; }
        }
        private string _Icon;

        public string Icon
        {
            get { return _Icon; }
            set { _Icon = value; }
        }
        private string _Active;

        public string Active
        {
            get { return _Active; }
            set { _Active = value; }
        }
        public Entity.QuanLyMeNu QuanLyMeNuIDataReader(IDataReader dr)
        {
            Entity.QuanLyMeNu obj = new Entity.QuanLyMeNu();
            obj.ID = (dr["ID"] is DBNull) ? string.Empty : dr["ID"].ToString();
            obj.TenMenu = (dr["TenMenu"] is DBNull) ? string.Empty : dr["TenMenu"].ToString();
            obj.Type = (dr["Type"] is DBNull) ? string.Empty : dr["Type"].ToString();
            obj.Ord = (dr["Ord"] is DBNull) ? string.Empty : dr["Ord"].ToString();
            obj.Level = (dr["Level"] is DBNull) ? string.Empty : dr["Level"].ToString();
            obj.Link = (dr["Link"] is DBNull) ? string.Empty : dr["Link"].ToString();
            obj.TypeClick = (dr["TypeClick"] is DBNull) ? string.Empty : dr["TypeClick"].ToString();
            obj.Icon = (dr["Icon"] is DBNull) ? string.Empty : dr["Icon"].ToString();
            obj.Active = (dr["Active"] is DBNull) ? string.Empty : dr["Active"].ToString();

            return obj;
        }
    }
}
