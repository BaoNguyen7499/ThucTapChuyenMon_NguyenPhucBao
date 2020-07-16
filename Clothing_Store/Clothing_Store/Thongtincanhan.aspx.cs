using BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clothing_Store
{
    public partial class Thongtincanhan : System.Web.UI.Page
    {
        khdbDataContext db = new khdbDataContext();
        string MatKhau, TenDangNhap;
        List<Entity.KhachHang> lst = new List<Entity.KhachHang>();
        protected void Page_Load(object sender, EventArgs e)
        {
            remenu.DataSource = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            remenu.DataBind();

            if (!IsPostBack)
            {
                TenDangNhap = Request.QueryString["TenDangNhap"];
                //load tỉnh
                ddlthanhpho.DataSource = from tp in db.devvn_tinhthanhphos select new { tp.name, tp.matp };
                ddlthanhpho.DataTextField = "name";
                ddlthanhpho.DataValueField = "matp";
                ddlthanhpho.DataBind();

                List<Entity.KhachHang> lst = new List<Entity.KhachHang>();
                lst = KhachHangService.KhachHang_GetByTop("", " TaiKhoan='" + TenDangNhap + "' ", "");

                devvn_quanhuyen qh = new devvn_quanhuyen();

                // var id = from tps in db.devvn_tinhthanhphos where tps.name == lst[0].Tinh.ToString() select new { tps.matp };


                lbltendangnhap.Text = lst[0].TaiKhoan;
                txthovaten.Text = lst[0].TenKH;
                string gt = lst[0].GioiTinh;
                if (String.Compare(gt, "True") == 0)
                {
                    rdobtnNam.Checked = true;
                }
                else
                {
                    rdobtnNu.Checked = true;
                }

                txtngaysinh.Text = lst[0].NgaySinh;
                txtemail.Text = lst[0].Email;
                txtdienthoai.Text = lst[0].SDT;

                if (lst[0].Quan != "")
                {

                    ddlthanhpho.Items.FindByText(lst[0].Tinh).Selected = true;
                }
                txtdiachi.Text = lst[0].DiaChi;

                MatKhau = lst[0].MatKhau;

                string id = ddlthanhpho.SelectedValue;
                var q = from x in db.devvn_quanhuyens where (x.matp == id) select new { x.maqh, x.name };
                ddlquan.DataSource = q;
                ddlquan.DataTextField = "name";
                ddlquan.DataValueField = "maqh";
                ddlquan.DataBind();

                if (lst[0].Tinh != "")
                {
                    ddlquan.Items.FindByText(lst[0].Quan).Selected = true;
                }


            }
        }

        protected void btndangki_Click(object sender, EventArgs e)
        {
            TenDangNhap = Request.QueryString["TenDangNhap"];
            var kh = db.tbl_KhachHangs.Where(x => x.TaiKhoan == TenDangNhap).First();
            if (txtpassword.Text != "" && txtrepressPassword.Text != "" && txtrepressPassword.Text == txtpassword.Text)
            {
                kh.MatKhau = txtpassword.Text;
            }
            kh.tenKH = txthovaten.Text;




            if (rdobtnNam.Checked == true)
            {
                kh.GioiTinh = true;
            }
            else
            {
                kh.GioiTinh = false;
            }
            kh.NgaySinh = Convert.ToDateTime(txtngaysinh.Text);

            kh.SDT = txtdienthoai.Text.Trim();
            kh.Tinh = ddlthanhpho.SelectedItem.ToString();
            kh.Quan = ddlquan.SelectedItem.ToString();
            kh.DiaChi = txtdiachi.Text.Trim();
            db.SubmitChanges();
            Response.Write("<script>alert('Cật nhật thành công')</script>");
            Response.Redirect("TrangChu.aspx");
        }

        protected void ddlthanhpho_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = ddlthanhpho.SelectedValue;

            ddlquan.DataSource = from tp in db.devvn_quanhuyens where (tp.matp == id) select new { tp.name, tp.matp };
            ddlquan.DataTextField = "name";
            ddlquan.DataValueField = "matp";
            ddlquan.DataBind();
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

        protected void btnhuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangChu.aspx");
        }
    }
}