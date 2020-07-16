using BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clothing_Store
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        public void Menu()
        {
            List<Entity.QuanLyMeNu> lst = new List<Entity.QuanLyMeNu>();
            lst = QuanLyMeNuService.QuanLyMeNu_GetByTop("", "Active = 1 and Type = 1", "[Level] ASC");
            string menu = "<ul class='nav' id='side-menu'>";
            menu += "<li class='sidebar-search'>";
            menu += "<div class='input-group custom-search-form'>";
            menu += "<input type='text' class='form-control' placeholder='Search...'>";
            menu += "<span class='input-group-btn'>";
            menu += "<button class='btn btn-default' type='button'>";
            menu += "<i class='fa fa-search'></i>";
            menu += "</button>";
            menu += "</span>";
            menu += "</div>";
            menu += "<!-- /input-group -->";
            menu += "</li>";

            bool kt = false;
            //int dem = 0;
            for (int i = 0; i < lst.Count; i++)
            {
                if (lst[i].Level.Length == 4)
                {
                    if (kt == true)
                    {
                        menu += "</ul>";
                        menu += "<!-- /.nav-second-level -->";
                        menu += "</li>";
                    }
                    if (i + 1 == lst.Count || lst[i + 1].Level.Length == 4)
                    {
                        kt = false;
                        menu += "<li>";
                        menu += "<a href='" + lst[i].Link + "' target='" + lst[i].TypeClick + "'><i class='" + lst[i].Icon + "'></i>" + lst[i].TenMenu + "</a>";
                        menu += "</li>";
                    }
                    else
                    {
                        //dem++;
                        kt = true;
                        //if (dem == 1) menu += "<li class='active'>";
                        menu += "<li>";
                        menu += "<a href='" + lst[i].Link + "'><i class='" + lst[i].Icon + "'></i>" + lst[i].TenMenu + "<span class='fa arrow'></span></a>";
                        menu += "<ul class='nav nav-second-level'>";
                    }
                }
                else
                {
                    menu += "<li>";
                    menu += "<a href='" + lst[i].Link + "' target='" + lst[i].TypeClick + "'>" + lst[i].TenMenu + "</a>";
                    menu += "</li>";
                }
            }

            menu += "</ul>";


            ltrMenu.Text = menu;

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Menu();
            if (string.IsNullOrEmpty(Convert.ToString(Session["User"])))
            {
                Response.Redirect("login.aspx");
            }   
        }

        protected void lblogout_Click(object sender, EventArgs e)
        {
            Session.Remove("User");
            Response.Redirect("login.aspx");
        }
    }
}