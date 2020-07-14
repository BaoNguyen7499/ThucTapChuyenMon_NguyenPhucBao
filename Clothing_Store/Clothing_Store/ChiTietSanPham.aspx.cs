using BUS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clothing_Store
{
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
        static DataTable tbGioHang = new DataTable();
        public static List<Entity.SanPham> lst = new List<Entity.SanPham>();
        protected void Page_Load(object sender, EventArgs e)
        {
            remenu.DataSource = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            remenu.DataBind();
            //Khoi tao gio hang
            if (Session["GioHang"] != null)
            {
                tbGioHang = Session["GioHang"] as DataTable;
            }
            else
            {
                tbGioHang.Rows.Clear();
                tbGioHang.Columns.Clear();
                tbGioHang.Columns.Add("TenSP", typeof(string));
                tbGioHang.Columns.Add("Size", typeof(string));
                tbGioHang.Columns.Add("UrlImage", typeof(string));
                tbGioHang.Columns.Add("Gia", typeof(double));
                tbGioHang.Columns.Add("SoLuong", typeof(int));
                tbGioHang.Columns.Add("TongGia", typeof(double), "SoLuong*Gia");
                Session["GioHang"] = tbGioHang;
            }





            string Id = Request.QueryString["Id"];

            SanPhamService.SanPhamView_Update(Id);



            lst = SanPhamService.SanPham_GetByTop("", " id=N'" + Id + "'", "");
            rptlarge.DataSource = lst;
            rptlarge.DataBind();
            imganhsp.ImageUrl = lst[0].Image;
            string s;
            s = "<div>";
            s += "<h1>" + lst[0].TenHang + "</h1>";
            s += "<p>";
            s += "   <strong style='font-weight:bold;'> Giá bán:</strong>";
            s += "</p>";
            s += "<div class='giamoi'>";
            s += " <span>" + string.Format("{0:#,0.#}", float.Parse(lst[0].GiaMoi)) + "</span>";
            s += "</div>";
            s += " <div class='giacu'>";
            s += "  <span >Giá cũ:";
            s += "  <span style='color:#F00;text-decoration:line-through;font-size:16px; font-weight:normal;'> " + string.Format("{0:#,0.#}", float.Parse(lst[0].GiaCu)) + "</span>";
            s += "</span>";
            s += "</div>";
            s += "<div>";
            s += "<span>Chất liệu:";
            s += "<span style='font-weight:normal;'>" + lst[0].ChatLieu + "</span>";
            s += " </span>";
            s += " </div>";
            s += "<div>";
            s += "<span>";
            s += "<span style='font-weight:normal;'>" + lst[0].TomTat + "</span>";
            s += "</div>";
            s += "</div>";
            ltrctsp.Text = s;
            frmviewChitiet.DataSource = lst;
            frmviewChitiet.DataBind();
            lblluotxem.Text = lst[0].LuotXem;
            ltr_ChiTiet.Text = lst[0].Mota;
            List<Entity.SanPham> lst_CungLoai = new List<Entity.SanPham>();
            lst_CungLoai = SanPhamService.SanPham_GetByTop("", "id_Menu=" + lst[0].Id_Menu + " and Active='True' and id !=" + lst[0].Id + "", "");
            rptSanPhamCungloai.DataSource = lst_CungLoai;
            rptSanPhamCungloai.DataBind();
        }
        public static int SPdacotronggiohang(string tenSP, string size, DataTable dt)
        {
            int dong = -1;
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (String.Compare(dt.Rows[i]["TenSP"].ToString(), tenSP) == 0 && String.Compare(dt.Rows[i]["Size"].ToString(), size) == 0)
                    {
                        dong = i;
                        break;
                    }
                }

            }
            return dong;

        }

        public void ThemVaoGioHang(string TenSP, string size, string UrlImage, double Gia, int SoLuong)
        {


            DataTable dt;

            dt = (DataTable)Session["GioHang"];
            int dong = SPdacotronggiohang(TenSP, size, dt);
            if (dong != -1)
                dt.Rows[dong]["SoLuong"] = Convert.ToInt32(dt.Rows[dong]["SoLuong"]) + SoLuong;
            else
            {

                dt.Rows.Add(new Object[]{TenSP,size,UrlImage,Gia,SoLuong,Gia*SoLuong
                    });

            }
            Session["GioHang"] = dt;

            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int Soluong = Convert.ToInt32(txtsl.Text);
            string size;
            if (rdbtnL.Checked)
                size = rdbtnL.Text;
            else if (rdbtnM.Checked)
                size = rdbtnM.Text;
            else if (rdbtnXL.Checked)
                size = rdbtnXL.Text;
            else if (rdbtnXXL.Checked)
                size = rdbtnXXL.Text;
            else
                size = rdobtnS.Text;




            ThemVaoGioHang(lst[0].TenHang, size, lst[0].Image, double.Parse(lst[0].GiaMoi), Soluong);

            tbGioHang = Session["GioHang"] as DataTable;

            Response.Redirect("GioHang.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton myButton = sender as LinkButton;
            if (myButton != null)
            {
                int id = Convert.ToInt32(myButton.CommandArgument);
                Response.Redirect("~/ChiTietSanPham.aspx?Id=" + id + "");
            }
        }

        protected void rptSanPhamCungloai_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void rptSanPhamCungloai_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}