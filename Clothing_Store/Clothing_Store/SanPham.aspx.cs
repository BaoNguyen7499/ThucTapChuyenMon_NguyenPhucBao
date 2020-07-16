using BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clothing_Store
{
    public partial class SanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            remenu.DataSource = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            remenu.DataBind();

            List<Entity.SanPham> lst = new List<Entity.SanPham>();
            string ID_Menu = Request.QueryString["IDMenu"];
            if (String.Compare(ID_Menu, "1") == 0)
            {
                lst = SanPhamService.SanPham_GetByTop("", " id_Menu=1", "");
                lblsanpham.Text = "ÁO KHOÁC";
            }
            else if (String.Compare(ID_Menu, "2") == 0)
            {
                lst = SanPhamService.SanPham_GetByTop("", " id_Menu=2", "");
                lblsanpham.Text = "ÁO SƠ MI";
            }
            else if (String.Compare(ID_Menu, "3") == 0)
            {
                lst = SanPhamService.SanPham_GetByTop("", " id_Menu=3", "");
                lblsanpham.Text = "QUẦN JEANS";
            }
            else if (String.Compare(ID_Menu, "4") == 0)
            {
                lst = SanPhamService.SanPham_GetByTop("", " id_Menu=4", "");
                lblsanpham.Text = "QUẦN DÀI";
            }
            else if (String.Compare(ID_Menu, "5") == 0)
            {
                lst = SanPhamService.SanPham_GetByTop("", " id_Menu=5", "");
                lblsanpham.Text = "QUẦN SHORTS";
            }
            
            dtlsanpham.DataSource = lst;
            dtlsanpham.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton myButton = sender as LinkButton;
            if (myButton != null)
            {
                int id = Convert.ToInt32(myButton.CommandArgument);
                Response.Redirect("~/ChiTietSanPham.aspx?Id=" + id + "");
            }
        }

        protected void dtlsanpham_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void lbndamlien_Click(object sender, EventArgs e)
        {
            LinkButton myButton = sender as LinkButton;
            if (myButton != null)
            {
                int id = Convert.ToInt32(myButton.CommandArgument);
                Response.Redirect("~/SanPham.aspx?IDMenu=" + id + "");
            }
        }
    }
}