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
    public partial class GioHang : System.Web.UI.Page
    {
        static DataTable dt ;
        protected void Page_Load(object sender, EventArgs e)
        {
            remenu.DataSource = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            remenu.DataBind();

            if (!IsPostBack)
            {
                if (Session["GioHang"] != null)
                {
                    dt = Session["GioHang"] as DataTable;
                    grvsanpham.DataSource = dt;
                    grvsanpham.DataBind();
                    string strTongTien = dt.Compute("Sum(TongGia)", "").ToString();

                    Session["slspgiohang"] = dt.Compute("Sum(SoLuong)", "").ToString();


                    if (strTongTien != "")
                        lbltongtien.Text = "Tổng giá: " + string.Format("{0:#.000}", Convert.ToDecimal(strTongTien) / 1000) + " VNĐ";
                    else
                        lbltongtien.Text = "Tổng giá: 0 VNĐ";
                }
                else
                {
                    lblgiohang.Text = "Hiện tại không có sản phẩm nào trong giỏ hàng";
                }

            }

        }

        public void update_giohang(DataTable dt)
        {

            if (dt != null)
            {

                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    dt.Rows.Add(new Object[] { dt.Rows[i]["TenSP"], dt.Rows[i]["Size"], dt.Rows[i]["UrlImage"], dt.Rows[i]["Gia"], dt.Rows[i]["SoLuong"], Convert.ToDouble(dt.Rows[i]["SoLuong"]) * Convert.ToDouble(dt.Rows[i]["Gia"]) });
                    Session["GioHang"] = dt;
                }

            }

        }
        protected void grvsanpham_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void grvsanpham_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblsl;
            int dong = e.RowIndex;

            dt.Rows.RemoveAt(dong);


            Session["GioHang"] = dt;
            grvsanpham.DataSource = dt;
            grvsanpham.DataBind();

            lblsl = (Label)Master.FindControl("lblslgiohang");

            Session["slspgiohang"] = grvsanpham.Rows.Count.ToString();
            lblsl.Text = Session["slspgiohang"].ToString();
            string strTongTien = dt.Compute("Sum(TongGia)", "").ToString();
            if (strTongTien != "")
            {
                lbltongtien.Text = "Tổng giá: " + string.Format("{0:#.000}", Convert.ToDecimal(strTongTien) / 1000) + " VNĐ";
                Session["tongtien"] = strTongTien;
            }

            else
                lbltongtien.Text = "Tổng giá: 0 VNĐ";
        }

        protected void lbtnMuatiep_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangChu.aspx");
        }

        protected void lbtnXoaALL_Click(object sender, EventArgs e)
        {
            Session["slspgiohang"] = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i].Delete();
            }
            grvsanpham.DataSource = dt;
            grvsanpham.DataBind();
            lbltongtien.Text = "Tổng giá: 0 VNĐ";
            Label lblsl = new Label();
            lblsl = (Label)Master.FindControl("lblslgiohang");
            lblsl.Text = Session["slspgiohang"].ToString();
            Session["GioHang"] = dt;
        }

        protected void lbtnDatHang_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThanhToan.aspx?IDSanPham= 9999");
        }
    }
}