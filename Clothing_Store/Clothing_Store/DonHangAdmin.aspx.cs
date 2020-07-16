using BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Clothing_Store
{
    public partial class DonHangAdmin : System.Web.UI.Page
    {
        khdbDataContext db = new khdbDataContext();
        void getData()
        {

            tbl_DatHang dh = new tbl_DatHang();

            //List<Entity.DatHang> lst = new List<Entity.DatHang>();
            //lst = DatHangService.DatHang_GetByTop("", "", "");
            grvDatHang.DataSource = inhd();
            grvDatHang.DataBind();


        }
        public List<inhoadon> inhd()
        {          
            return db.tbl_DatHangs.Select(x => new inhoadon { id = x.id, ngaydat = Convert.ToDateTime(x.NgaylapHD), hotenkhachang = x.id_KhachHang.ToString(), phuongthucthanhtoan = x.PayMeThod.HinhThucThanhToan }).ToList();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();

            }
        }

        protected void btnRefresh_Top_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void grvDatHang_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                string id = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "id"));


                grvChiTietDonHang.DataSource = db.tbl_ChiTietDatHangs.Where(x => x.id_hoadon == int.Parse(id)).Select(x => new chitiethoadon { idhd = x.id_hoadon, tenhang = x.tbl_Hang.TenHang, size = x.Size, soluong = x.SoLuongMua, gia = Convert.ToDouble(x.Gia), thanhtien = Convert.ToDouble(x.ThanhTien), UrlImage = "../" + x.tbl_Hang.image_large }).ToList();
                grvChiTietDonHang.DataBind();
            }
        }

        protected void grvDatHang_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grvChiTietDonHang_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grvChiTietDonHang_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grvDatHang_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void grvDatHang_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}