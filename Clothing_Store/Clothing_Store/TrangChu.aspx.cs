using BUS;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace Clothing_Store
{
    public partial class TrangChu : System.Web.UI.Page
    {
        public void bind_SanPham()
        {
            List<Entity.KhuyenMai> km = new List<Entity.KhuyenMai>();
            km = KhuyenMaiService.KhuyenMai_GetByTop("", "", "");
            List<Entity.SanPham> lst = new List<Entity.SanPham>();
            List<Entity.SanPham> quandai = new List<Entity.SanPham>();
            List<Entity.SanPham> quanshorts = new List<Entity.SanPham>();
            List<Entity.SanPham> tonkho = new List<Entity.SanPham>();
            lst = SanPhamService.SanPham_GetByTop("", " Active='True' AND id_Menu=2", " ID ASC");
            dtlaokhoac.DataSource = lst;
            dtlaokhoac.DataBind();
            lst = SanPhamService.SanPham_GetByTop("", " Active='True' AND id_Menu=1", " ID ASC");
            dtlvaydamvasetbo.DataSource = lst;
            dtlvaydamvasetbo.DataBind();

            lst = SanPhamService.SanPham_GetByTop("", " Active='True' AND id_Menu=3", " ID ASC");
            dtldamkhuyenmai.DataSource = lst;
            dtldamkhuyenmai.DataBind();

            quandai = SanPhamService.SanPham_GetByTop("", " Active='True' AND id_Menu=4", " ID ASC");
            dtlquandai.DataSource = quandai;
            dtlquandai.DataBind();

            quanshorts = SanPhamService.SanPham_GetByTop("", " Active='True' AND id_Menu=5 ", " ID ASC");
            dtlquanshorts.DataSource = quanshorts;
            dtlquanshorts.DataBind();

            tonkho = SanPhamService.SanPham_GetByTop("", " Active='True' AND id_Menu=6", " ID ASC");
            dtltonkho.DataSource = tonkho;
            dtltonkho.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            bind_SanPham();

            string link_fb = Request.QueryString["s"];

            rptQuangCao.DataSource = QuangCaoService.QuangCao_GetByTop("", " Active='True'", "");
            rptQuangCao.DataBind();

            remenu.DataSource = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            remenu.DataBind();

            if (link_fb != null)
            {
                Session["link_fb"] = link_fb;
                List<Entity.KhachHang> lstKh = new List<Entity.KhachHang>();

                lstKh = KhachHangService.KhachHang_GetByTop("", " Link_Fb='" + Session["link_fb"].ToString() + "' ", "");
                if (lstKh.Count == 0)
                {
                    KhachHang objkh = new KhachHang();
                    objkh.TenKH = "";
                    objkh.GioiTinh = "true";
                    objkh.NgaySinh = "";
                    objkh.MatKhau = "";

                    objkh.Email = "";
                    objkh.TaiKhoan = Session["TenDangNhap"].ToString();
                    objkh.SDT = "";
                    objkh.Tinh = "";
                    objkh.Quan = "";
                    objkh.DiaChi = "";
                    objkh.Link_Fb = Session["Link_Fb"].ToString();
                    KhachHangService.KhachHang_Insert(objkh);
                }
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (sender as ImageButton);
            string id = btn.CommandArgument;
            QuangCaoService.QuangCaoClick_Update(id);
        }

        protected void lbtnMuatiep_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SanPham.aspx?IDMenu=1");
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

        protected void lbtnchitietvdsb_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SanPham.aspx?IDMenu=2");
        }

        protected void lbtndamkm_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SanPham.aspx?IDMenu=3");
        }

        protected void lbtnchitietquandai_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SanPham.aspx?IDMenu=4");
        }

        protected void lbtnchitietquanshorts_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SanPham.aspx?IDMenu=5");
        }

        protected void lbtnchitiettonkho_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SanPham.aspx?IDMenu=6");
        }

        protected void rptQuangCao_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void dtlaokhoac_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void dtlvaydamvasetbo_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void dtlquanshorts_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }
    }

}