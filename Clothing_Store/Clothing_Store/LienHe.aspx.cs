using BUS;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clothing_Store
{
    public partial class LienHe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            remenu.DataSource = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            remenu.DataBind();

        }

        public static void Email_Without_Attachment(String toEmail, String Subj, String Message)
        {
            string HostAdd = ConfigurationManager.AppSettings["Host"].ToString();
            string FromEmailid = ConfigurationManager.AppSettings["FromMail"].ToString();
            string Pass = ConfigurationManager.AppSettings["Password"].ToString();
            MailMessage mailMessage = new MailMessage();

            mailMessage.From = new MailAddress(FromEmailid);
            mailMessage.Subject = Subj;
            mailMessage.Body = Message;
            mailMessage.IsBodyHtml = true;
            mailMessage.To.Add(new MailAddress(toEmail));
            SmtpClient smtp = new SmtpClient();
            smtp.Host = HostAdd;
            smtp.EnableSsl = true;
            NetworkCredential NetwordCred = new NetworkCredential();
            NetwordCred.UserName = mailMessage.From.Address;
            NetwordCred.Password = Pass;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetwordCred;
            smtp.Port = 587;
            smtp.Send(mailMessage);
        }

        public void ResetControl()
        {
            txtten.Text = "";
            txtnoidung.Text = "";
            txtemail.Text = "";
            txtdienthoai.Text = "";
            txtdiachi.Text = "";
            txtchude.Text = "";
        }

        protected void btnGui_Click(object sender, EventArgs e)
        {
            Entity.LienLac obj = new Entity.LienLac();
            obj.Ten = txtten.Text;
            obj.DiaChi = txtdiachi.Text;
            obj.DienThoai = txtdienthoai.Text;
            obj.Email = txtemail.Text;
            obj.ChuDe = txtchude.Text;
            obj.NoiDung = txtnoidung.Text;

            if (LienLacService.LienLac_Insert(obj) == true)
                Response.Write("<script>alert('Cám ơn bạn đã gửi phản hồi về cho chúng tối!!!')</script>");
            ResetControl();
        }

        protected void btnNhapLai_Click(object sender, EventArgs e)
        {
            ResetControl();
            txtten.Focus();
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