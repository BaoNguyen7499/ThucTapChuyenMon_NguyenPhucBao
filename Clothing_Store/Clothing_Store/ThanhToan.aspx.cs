using BUS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Drawing;
namespace Clothing_Store
{
    public partial class ThanhToan : System.Web.UI.Page
    {
        khdbDataContext db = new khdbDataContext();
        static DataTable tbGioHang = new DataTable();
        khdbDataContext dbs = new khdbDataContext();
        Label lblsl = new Label();
        protected void Page_Load(object sender, EventArgs e)
        {
            remenu.DataSource = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            remenu.DataBind();

            if (!IsPostBack)
            {
                if (Request.QueryString["IDSanPham"] != null)
                {
                    tbGioHang = (DataTable)Session["GioHang"];
                }
                grvsanpham.DataSource = tbGioHang;
                grvsanpham.DataBind();
                string strTongTien = tbGioHang.Compute("Sum(TongGia)", "").ToString();
                //string strTongTien = Session["tongtien"].ToString();
                lbltongtien.Text = "Tổng giá: " + string.Format("{0:#.000}", Convert.ToDecimal(strTongTien) / 1000) + " VNĐ";
                lblsl = (Label)Master.FindControl("lblslgiohang");
                Session["slspgiohang"] = tbGioHang.Compute("Sum(SoLuong)", "").ToString();
                lblsl.Text = Session["slspgiohang"].ToString();


                //load tỉnh
                ddlthanhpho.DataSource = from tp in db.devvn_tinhthanhphos select new { tp.name, tp.matp };
                ddlthanhpho.DataTextField = "name";
                ddlthanhpho.DataValueField = "matp";
                ddlthanhpho.DataBind();

                //load hình thức thanh toán
                ddlhinhthucthanhtoan.DataSource = from x in db.PayMeThods select new { x.HinhThucThanhToan, x.IdPay };
                ddlhinhthucthanhtoan.DataTextField = "HinhThucThanhToan";
                ddlhinhthucthanhtoan.DataValueField = "IdPay";
                ddlhinhthucthanhtoan.DataBind();

                if (Session["display_name"] != null && Session["email"] != null)
                {
                    txtemail.Text = Session["email"].ToString();
                    txthovaten.Text = Session["display_name"].ToString();
                }
            }
        }

        protected void grvsanpham_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void grvsanpham_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int dong = e.RowIndex;
            tbGioHang.Rows.RemoveAt(dong);
            Session["GioHang"] = tbGioHang;
            grvsanpham.DataSource = tbGioHang;
            grvsanpham.DataBind();
            lblsl = (Label)Master.FindControl("lblslgiohang");
            string strTongTien = tbGioHang.Compute("Sum(TongGia)", "").ToString();
            if (strTongTien != "")
                lbltongtien.Text = "Tổng giá: " + string.Format("{0:#.000}", Convert.ToDecimal(strTongTien) / 1000) + " VNĐ";
            else
            {
                lbltongtien.Text = "Tổng giá: 0 VNĐ";
                Session["slspgiohang"] = grvsanpham.Rows.Count.ToString();
                lblsl.Text = Session["slspgiohang"].ToString();
                Response.Redirect("TrangChu.aspx");
            }
        }

        protected void btnmuatiep_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangChu.aspx");
        }

        protected void btndathang_Click(object sender, EventArgs e)
        {
            List<Entity.KhachHang> lstKh = new List<Entity.KhachHang>();
            Entity.DatHang dh = new Entity.DatHang();
            List<Entity.DatHang> lstdh = new List<Entity.DatHang>();
            Entity.ChiTietDatHang lstctdh = new Entity.ChiTietDatHang();
            string Id_SP;
            if (txtdiachi.Text == "" || txtdienthoai.Text == "" || txtemail.Text == "" || txthovaten.Text == "") //|| ddlquan.SelectedIndex == 0 || ddlthanhpho.SelectedIndex == 0
            {
                Response.Write("<script>alert('" + ddlquan.SelectedValue + "')</script>");
                Response.Write("<script>alert('Bạn phải nhập đầy đủ thông tin!!1')</script>");
                return;
            }
            else
            {
                if (Session["TenDangNhap"] == null)
                {
                    Entity.KhachHang obj = new Entity.KhachHang();
                    //Response.Write("<script>alert('Vào đây')</script>");
                    obj.TenKH = txthovaten.Text;
                    obj.TaiKhoan = "";
                    obj.MatKhau = "";
                    obj.NgaySinh = "";
                    obj.GioiTinh = "True";

                    obj.Email = txtemail.Text;
                    obj.SDT = txtdienthoai.Text;
                    obj.DiaChi = txtdiachi.Text;
                    obj.Tinh = ddlthanhpho.SelectedItem.ToString();
                    obj.Quan = ddlquan.SelectedItem.ToString();
                    obj.Link_Fb = "false";
                    KhachHangService.KhachHang_Insert(obj);
                    lstKh = KhachHangService.KhachHang_GetByTop("", " id=(SELECT MAX(id) from tbl_KhachHang) ", "");

                    tbl_DatHang dhs = new tbl_DatHang();
                    dhs.id_KhachHang = int.Parse(lstKh[0].Id);
                    dhs.NgaylapHD = DateTime.Now;
                    dhs.IdPay = int.Parse(ddlhinhthucthanhtoan.SelectedValue);
                    ///////////////////////////////////////////////////////////////////
                    dbs.tbl_DatHangs.InsertOnSubmit(dhs);
                    dbs.SubmitChanges();
                    lstdh = DatHangService.DatHang_GetByTop("", " id=(SELECT MAX(id) from tbl_DatHang)", "");
                    lstctdh.Id_hoadon = lstdh[0].Id;
                    for (int i = 0; i < tbGioHang.Rows.Count; i++)
                    {
                        string tenSP = tbGioHang.Rows[i]["TenSP"].ToString();
                        Id_SP = SanPhamService.SanPham_GetByTop("", " TenHang=N'" + tenSP + "'", "")[0].Id;
                        lstctdh.Id_hang = Id_SP;
                        lstctdh.Size = tbGioHang.Rows[i]["Size"].ToString();
                        lstctdh.SoLuongMua = tbGioHang.Rows[i]["SoLuong"].ToString();
                        lstctdh.ThanhTien = tbGioHang.Rows[i]["TongGia"].ToString();
                        lstctdh.Gia = tbGioHang.Rows[i]["Gia"].ToString();
                        ChiTietDatHangService.ChiTietDatHang_Insert(lstctdh);

                    }
                }
                else
                {
                    string TenDangNhap = Session["TenDangNhap"].ToString();

                    lstKh = KhachHangService.KhachHang_GetByTop("", " TaiKhoan='" + TenDangNhap + "'", "");
                    Entity.KhachHang kh = new Entity.KhachHang();
                    kh.Id = lstKh[0].Id;
                    kh.TenKH = txthovaten.Text;
                    kh.Email = txtemail.Text;
                    kh.DiaChi = txtdiachi.Text;
                    kh.SDT = txtdienthoai.Text;
                    kh.Tinh = ddlthanhpho.SelectedItem.ToString();
                    kh.Quan = ddlquan.SelectedItem.ToString();
                    KhachHangService.KhachHang_UpdateDatHang(kh);

                    tbl_DatHang dhs = new tbl_DatHang();
                    dhs.id_KhachHang = int.Parse(kh.Id);
                    dhs.NgaylapHD = DateTime.Now;
                    dhs.IdPay = int.Parse(ddlhinhthucthanhtoan.SelectedValue);
                    ///////////////////////////////////////////////////////////////////
                    dbs.tbl_DatHangs.InsertOnSubmit(dhs);
                    dbs.SubmitChanges();

                    lstdh = DatHangService.DatHang_GetByTop("", " id=(SELECT MAX(id) from tbl_DatHang where id_KhachHang=" + kh.Id + ")", "");

                    lstctdh.Id_hoadon = lstdh[0].Id;
                    for (int i = 0; i < tbGioHang.Rows.Count; i++)
                    {
                        string tenSP = tbGioHang.Rows[i]["TenSP"].ToString();
                        Id_SP = SanPhamService.SanPham_GetByTop("", " TenHang=N'" + tenSP + "'", "")[0].Id;
                        lstctdh.Id_hang = Id_SP;
                        lstctdh.Size = tbGioHang.Rows[i]["Size"].ToString();
                        lstctdh.SoLuongMua = tbGioHang.Rows[i]["SoLuong"].ToString();
                        lstctdh.ThanhTien = tbGioHang.Rows[i]["TongGia"].ToString();
                        lstctdh.Gia = tbGioHang.Rows[i]["Gia"].ToString();
                        ChiTietDatHangService.ChiTietDatHang_Insert(lstctdh);

                    }
                }
            }

            Response.Write("<script>alert('Đặt hàng thành công!! Cảm ơn bạn nhiều nhé!! ')</script>");

            // MailMessage message = new MailMessage("nguyenphucbao07041999@gmail.com",txtemail.Text, "Shop Fashion(Clothing Store) ",grvsanpham.Rows[0].Cells[0].Text);
            // message.IsBodyHtml = true;

            //  SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            //client.EnableSsl = true;
            //client.UseDefaultCredentials = false;
            //client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.Credentials = new System.Net.NetworkCredential("nguyenphucbao07041999@gmail.com", "Baonguyen741999@!");
            //client.Send(message);
            
            for (int i = 0; i < tbGioHang.Rows.Count; i++)
            {
                var from = "nguyenphucbao07041999@gmail.com";
                var to = txtemail.Text;
                const string Password = "Baonguyen741999@!";
                string mail_subject = "Clothing Store";
                string mail_message = "From : Clothing Store" + "\n";
                mail_message += "From : nguyenphucbao07041999@gmail.com " + "\n";
                mail_message += "Thông tin mua hàng của quý khách" + "\n";
                string tenSP = tbGioHang.Rows[i]["TenSP"].ToString();
                Id_SP = SanPhamService.SanPham_GetByTop("", " TenHang=N'" + tenSP + "'", "")[0].Id;

                mail_message +="ID sản phẩm : " +Id_SP+"\n";
                mail_message +="Tên sản phẩm :" + tbGioHang.Rows[i]["TenSP"].ToString()+"\n";
                mail_message +="Size: " +tbGioHang.Rows[i]["Size"].ToString()+"\n";
                mail_message +="Số lượng: " +tbGioHang.Rows[i]["SoLuong"].ToString()+"\n";
                mail_message +="Tổng giá: "  +tbGioHang.Rows[i]["TongGia"].ToString()+"\n";
                mail_message +="Giá: " +tbGioHang.Rows[i]["Gia"].ToString()+"\n";
                var smtp = new SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(from, Password);
                    smtp.Timeout = 10000;
                }
                smtp.Send(from, to, mail_subject, mail_message);
                
            }



            Session["GioHang"] = null;
            Session["slspgiohang"] = null;
            lblsl = (Label)Master.FindControl("lblslgiohang");
            lblsl.Text = "0";
            lbltongtien.Text = "0 VNĐ";
            tbGioHang = null;
            grvsanpham.DataSource = tbGioHang;
            grvsanpham.DataBind();
            Response.AddHeader("REFRESH", "1;URL=TrangChu.aspx");
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
    }
}