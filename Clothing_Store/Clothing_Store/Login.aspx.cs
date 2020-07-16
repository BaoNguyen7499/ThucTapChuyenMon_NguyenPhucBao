using BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clothing_Store
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["User"])))
            {
                Response.Redirect("HangAdmin.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            List<Entity.NhanVien> login = new List<Entity.NhanVien>();
            login = NhanVienService.Check_Login("", " UserName='" + txtUserName.Text + "' and Password='" + txtPassWord.Text + "' and id_quyen = 1", "");
            if (login.Count == 0)
            {
                lbError.Text = "Tài khoản hoặc mật khẩu không đúng!!";
            }
            else
            {
                Session["User"] = login;
                Response.Redirect("HangAdmin.aspx");
            }
        }
    }
}