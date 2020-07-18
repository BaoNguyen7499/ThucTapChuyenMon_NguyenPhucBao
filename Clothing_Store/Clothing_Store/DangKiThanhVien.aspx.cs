using BUS;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clothing_Store
{
    public partial class DangKiThanhVien : System.Web.UI.Page
    {
        khdbDataContext db = new khdbDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            remenu.DataSource = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            remenu.DataBind();

            txtusername.Focus();
            loader.Visible = false;
            if (!IsPostBack)
            {
                //load tỉnh
                ddlthanhpho.DataSource = from tp in db.devvn_tinhthanhphos select new { tp.name, tp.matp };
                ddlthanhpho.DataTextField = "name";
                ddlthanhpho.DataValueField = "matp";
                ddlthanhpho.DataBind();
            }
        }
        void resetControl()
        {
            txtusername.Text = string.Empty; ;
            txtpassword.Text = string.Empty; ;
            txtrepressPassword.Text = string.Empty; ;
            txthovaten.Text = string.Empty; ;
            rdobtnNam.Checked = true;
            rdobtnNu.Checked = false;
            txtngaysinh.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtdienthoai.Text = string.Empty;
            ddlthanhpho.SelectedIndex = 0;
            ddlquan.SelectedIndex = 0;
            txtdiachi.Text = string.Empty;
            txtusername.Focus();
        }

        protected void txtusername_TextChanged(object sender, EventArgs e)
        {
            lblcheck.Text = txtusername.Text;
        }

        protected void txtusername_Load(object sender, EventArgs e)
        {

        }

        protected void loader_PreRender(object sender, EventArgs e)
        {

        }

        protected void loader_Unload(object sender, EventArgs e)
        {

        }

        protected void loader_DataBinding(object sender, EventArgs e)
        {

        }

        protected void loader_Disposed(object sender, EventArgs e)
        {

        }

        protected void loader_Init(object sender, EventArgs e)
        {

        }

        protected void loader_Load(object sender, EventArgs e)
        {

        }

        protected void txtngaysinh_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ddlthanhpho_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = ddlthanhpho.SelectedValue;

            ddlquan.DataSource = from tp in db.devvn_quanhuyens where (tp.matp == id) select new { tp.name, tp.matp };
            ddlquan.DataTextField = "name";
            ddlquan.DataValueField = "matp";
            ddlquan.DataBind();
        }

        protected void btndangki_Click(object sender, EventArgs e)
        {
            KhachHang obj = new KhachHang();
            obj.TaiKhoan = txtusername.Text;
            obj.MatKhau = txtpassword.Text;
            obj.TenKH = txthovaten.Text;
            if (rdobtnNam.Checked == true)
                obj.GioiTinh = "1";
            else
                obj.GioiTinh = "0";
            obj.NgaySinh = txtngaysinh.Text;
            obj.Email = txtemail.Text;
            obj.SDT = txtdienthoai.Text;
            obj.Tinh = ddlthanhpho.SelectedItem.ToString();
            obj.Quan = ddlquan.SelectedItem.ToString();
            obj.DiaChi = txtdiachi.Text;
            obj.Link_Fb = "false";
            if (KhachHangService.KhachHang_Insert(obj) == true)
                Response.Write("<script>alert('Đăng kí thành công!!')</script>");
            resetControl();
        }

        protected void btnhuy_Click(object sender, EventArgs e)
        {
            resetControl();
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