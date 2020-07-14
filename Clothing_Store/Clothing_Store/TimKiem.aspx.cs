using BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clothing_Store
{
    public partial class TimKiem : System.Web.UI.Page
    {
        khdbDataContext db = new khdbDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            string TenspSearch = Request.QueryString["TenSanPham"];

            List<Entity.SanPham> lst = new List<Entity.SanPham>();
            lst = SanPhamService.SanPham_GetByTop("", " [dbo].[fuChuyenCoDauThanhKhongDau](TenHang) like N'%' +dbo.fuChuyenCoDauThanhKhongDau('" + TenspSearch + "')+'%' AND Active='True'", "");
            // dtltimkiem.DataSource = db.tbl_Hangs.Where(x=> x.TenHang.Contains(TenspSearch)).ToList();
            dtltimkiem.DataSource = lst;
            dtltimkiem.DataBind();

            remenu.DataSource = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            remenu.DataBind();
        }

        protected void dtltimkiem_ItemCommand(object source, DataListCommandEventArgs e)
        {

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
    }
}