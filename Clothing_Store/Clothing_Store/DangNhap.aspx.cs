using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.GoogleAPI;
using BUS;

namespace Clothing_Store
{
    public partial class DangNhap : System.Web.UI.Page
    {
        khdbDataContext db = new khdbDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            remenu.DataSource = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            remenu.DataBind();
            tbl_KhachHang kh = new tbl_KhachHang();
            GoogleConnect.ClientId = "520808312902-5al7h79mvjmk9jil2du85jenb6stla5q.apps.googleusercontent.com";
            GoogleConnect.ClientSecret = "QF8LkNiAPNTvAvbJJvQqTR9E";
            GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];

            if (!string.IsNullOrEmpty(Request.QueryString["code"]))
            {
                string code = Request.QueryString["code"];
                string json = GoogleConnect.Fetch("me", code);
                GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);

                Session["TenDangNhap"] = profile.Id;
                Session["display_name"] = profile.DisplayName;
                Session["email"] = profile.Emails.Find(email => email.Type == "account").Value;
                kh.TaiKhoan = profile.Id;
                kh.Email = profile.Emails.Find(email => email.Type == "account").Value.ToString();
                kh.tenKH = profile.DisplayName;
                var a = from i in db.tbl_KhachHangs where i.TaiKhoan == profile.Id select i;
                if (a.Count() <= 0)
                {
                    db.tbl_KhachHangs.InsertOnSubmit(kh);
                    db.SubmitChanges();
                }

                Response.Redirect("TrangChu.aspx");
            }
            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
            }
        }
        public class Email
        {
            public string Value { get; set; }
            public string Type { get; set; }
        }

        public class Image
        {
            public string Url { get; set; }
        }
        public class GoogleProfile
        {
            public string Id { get; set; }
            public string DisplayName { get; set; }
            public Image Image { get; set; }
            public List<Email> Emails { get; set; }
            public string Gender { get; set; }
            public string ObjectType { get; set; }
        }
        protected void btndangnhap_Click(object sender, EventArgs e)
        {

            if (txtusername.Text == "" || txtpassword.Text == "")
            {
                lblcheck.Text = "Bạn phải nhập đầy đủ user và password!!!";
                return;
            }
            else if (txtusername.Text != "" || txtpassword.Text != "")
            {
                List<Entity.KhachHang> lst = KhachHangService.KhachHang_GetByTop("", " TaiKhoan='" + txtusername.Text + "' AND MatKhau='" + txtpassword.Text + "' ", "");
                if (lst.Count > 0)
                {
                    Session["display_name"] = lst[0].TaiKhoan;
                    Session["TenDangNhap"] = lst[0].TaiKhoan;
                    Response.Redirect("TrangChu.aspx");
                }
                else
                {
                    lblcheck.Text = "Tài khoản và mật khẩu không đúng!!";
                }
            }
            else
            {
                List<Entity.NhanVien> lst = NhanVienService.NhanVien_GetByTop("", " UserName='" + txtusername.Text + "' AND Password='" + txtpassword.Text + "' ", "");
                if (lst.Count > 0)
                {
                    Session["display_name"] = lst[0].UserName;
                    Session["TenDangNhap"] = lst[0].UserName;
                    Response.Redirect("TrangChu.aspx");
                }
                else
                {
                    lblcheck.Text = "Tài khoản và mật khẩu không đúng!!";
                }
            }
        }

        protected void btngoogle_Click(object sender, EventArgs e)
        {
            GoogleConnect.Authorize("profile", "email");
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