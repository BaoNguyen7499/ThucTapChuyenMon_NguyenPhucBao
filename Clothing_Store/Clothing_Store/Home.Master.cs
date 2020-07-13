using BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clothing_Store
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                lblsonguoiOnline.Text = Application["OnlineUsers"].ToString();
                if (Session["slspgiohang"] != null)
                    lblslgiohang.Text = Session["slspgiohang"].ToString();

                if (Session["display_name"] != null)
                {
                    //lblsonguoidangnhap.Text = Application["LoggedInUsers"].ToString();
                    btndangki.Text = Session["display_name"].ToString() + " / ";
                    btndangnhap.Text = "Đăng xuất";

                }
                khdbDataContext db = new khdbDataContext();
                rptTinTuc.DataSource = TinTucService.TinTuc_GetByTop("4", "Active='true'", "");
                rptTinTuc.DataBind();
                // rptTinTucMoiNhat.DataSource = TinTucService.TinTuc_GetByTop("", " Active='true' AND ngayviet=(SELECT MAX(ngayviet) from tbl_TinTuc)", "");
                rptTinTucMoiNhat.DataSource = db.tbl_TinTucs.OrderByDescending(x => x.id).Where(x => x.Active == true).Take(1).ToList();
                rptTinTucMoiNhat.DataBind();
            }

        }

        protected void btnsearchs_Click(object sender, EventArgs e)
        {
            if (txtsearchs.Text == "")
            {
                Response.Write("<script>alert('Bạn chưa nhập từ khóa tìm kiếm')</script>");
                return;
            }
            else
                Response.Redirect("~/TimKiem.aspx?TenSanPham=" + txtsearchs.Text + "");
        }

        protected void btndangki_Click(object sender, EventArgs e)
        {
            //if (Session["Facebook"] != null)
            //{
            //    Response.Redirect("~/Thongtincanhan.aspx?TenDangNhap=" + Session["TenDangNhap"] + "");
            //}
            /*else */
            if (Session["TenDangNhap"] != null)
                Response.Redirect("~/Thongtincanhan.aspx?TenDangNhap=" + Session["TenDangNhap"] + "");
            else
                Response.Redirect("DangKiThanhVien.aspx");
        }

        protected void btndangnhap_Click(object sender, EventArgs e)
        {
            if (Session["display_name"] != null)
            {
                Session.Clear();

                btndangki.Text = "Đăng kí";
                btndangnhap.Text = "Đăng nhập";
                Response.Redirect("Dangnhap.aspx");

            }
            else
            {
                Response.Redirect("Dangnhap.aspx");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GioHang.aspx");
            
        }
    }
}