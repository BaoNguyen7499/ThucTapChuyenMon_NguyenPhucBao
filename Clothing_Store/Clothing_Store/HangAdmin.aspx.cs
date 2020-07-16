using BUS;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clothing_Store
{
    public partial class HangAdmin : System.Web.UI.Page
    {
        khdbDataContext db = new khdbDataContext();
        public static bool insert = true;
        public static string fileUpLoad_nho, fileUpLoad_lon;
        void LoadDropDowlist()
        {

            List<Entity.NhomHang> lst = new List<Entity.NhomHang>();
            lst = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            ddltennhomhang.DataSource = lst;
            ddltennhomhang.DataTextField = "TenNhomHang";
            ddltennhomhang.DataValueField = "id";
            ddltennhomhang.DataBind();
        }
        void getData()
        {
            List<Entity.SanPham> lst = new List<Entity.SanPham>();
            lst = SanPhamService.SanPham_GetByTop("", "", "");
            for (int i = 0; i < lst.Count; i++)
            {
                lst[i].Image = "~/" + lst[i].Image;
            }
            grvHang.DataSource = lst;
            grvHang.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDropDowlist();
                getData();
            }
        }
        public void ClearText()
        {
            txtID.Text = "";
            txtchatlieu.Text = "";
            txtgiacu.Text = "";
            txtgiamoi.Text = "";
            txtsoluong.Text = "";
            txttenhang.Text = "";
            txttomtat.Text = "";
            txtNoidung.Text = "";
            ddltennhomhang.SelectedIndex = -1;
            ckbActive.Checked = true;
        }

        protected void btnRefresh_Top_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnAdd_Top_Click(object sender, EventArgs e)
        {
            insert = true;
            pnData.Visible = false;
            pnInfo.Visible = true;
            ClearText();
        }

        protected void btnAdd_Top_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnEdit_Top_Click(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Top_Command(object sender, CommandEventArgs e)
        {
            int i = 0;
            string id;
            foreach (GridViewRow gvrow in grvHang.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("CkDelete");
                if (chk != null && chk.Checked)
                {
                    id = grvHang.Rows[i].Cells[1].Text;
                    List<Entity.SanPham> lst = new List<Entity.SanPham>();

                    lst = SanPhamService.SanPham_GetByTop("", " id = " + id, "");
                    pnInfo.Visible = true;
                    pnData.Visible = false;

                    insert = false;
                    fileUpLoad_nho = lst[0].Image;
                    fileUpLoad_lon = lst[0].ImageLarge;
                    txtID.Text = lst[0].Id;
                    txttenhang.Text = lst[0].TenHang;
                    ddltennhomhang.SelectedValue = lst[0].Id_Menu;
                    txtchatlieu.Text = lst[0].ChatLieu;
                    txtgiamoi.Text = lst[0].GiaMoi;
                    txtgiacu.Text = lst[0].GiaCu;
                    txtsoluong.Text = lst[0].Soluong;
                    txttomtat.Text = lst[0].TomTat;
                    txtNoidung.Text = lst[0].Mota;

                    ckbActive.Checked = lst[0].Active == "True" ? true : false;
                }
                i++;
            }
        }

        protected void grvHang_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
                e.Row.TableSection = TableRowSection.TableHeader;
        }

        protected void grvHang_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lbAddSub_Command(object sender, CommandEventArgs e)
        {
            insert = true;
            pnData.Visible = false;
            pnInfo.Visible = true;
            ClearText();
        }

        protected void lbEdit_Command(object sender, CommandEventArgs e)
        {
            int i = Int32.Parse(e.CommandArgument.ToString());
            List<Entity.SanPham> lst = new List<Entity.SanPham>();

            lst = SanPhamService.SanPham_GetByTop("", " ID = " + i, "");
            pnInfo.Visible = true;
            pnData.Visible = false;

            insert = false;
            fileUpLoad_nho = lst[0].Image;
            fileUpLoad_lon = lst[0].ImageLarge;
            txtID.Text = lst[0].Id;
            txttenhang.Text = lst[0].TenHang;
            ddltennhomhang.SelectedValue = lst[0].Id_Menu;
            txtchatlieu.Text = lst[0].ChatLieu;
            txtgiamoi.Text = lst[0].GiaMoi;
            txtgiacu.Text = lst[0].GiaCu;
            txtsoluong.Text = lst[0].Soluong;
            txttomtat.Text = lst[0].TomTat;
            txtNoidung.Text = lst[0].Mota;

            ckbActive.Checked = lst[0].Active == "True" ? true : false;
        }

        protected void lbDelete_Command(object sender, CommandEventArgs e)
        {
            int i = Int32.Parse(e.CommandArgument.ToString());
            List<Entity.SanPham> lst = new List<Entity.SanPham>();
            SanPhamService.SanPham_Delete(i.ToString());
            getData();
        }

        protected void btnSave_Top_Click(object sender, EventArgs e)
        {
            Entity.SanPham dts = new Entity.SanPham();
            tbl_Hang dt = new tbl_Hang();
            if (insert == true)
            {

                dt.TenHang = txttenhang.Text;
                dt.id_Menu = int.Parse(ddltennhomhang.SelectedValue);
                dt.ChatLieu = txtchatlieu.Text;
                dt.giaMoi = decimal.Parse(txtgiamoi.Text);
                dt.giaCu = decimal.Parse(txtgiacu.Text);
                dt.Soluong = int.Parse(txtsoluong.Text);
                dt.TomTat = txttomtat.Text;

                if (int.Parse(txtsoluong.Text) > 0)
                    dt.TinhTrang = "Còn";

                dt.Mota = txtNoidung.Text;
                if (ful_hinhanhlon.HasFile)
                {
                    try
                    {
                        string Duoi_filename = Path.GetExtension(ful_hinhanhlon.FileName);
                        string filename = ful_hinhanhlon.FileName.ToString(); ;
                        if (Duoi_filename == ".jpeg" || Duoi_filename == ".jpg" || Duoi_filename == ".png" || Duoi_filename == ".PNG" || Duoi_filename == ".JPG" || filename == ".JPEG")
                        {
                            ful_hinhanhlon.SaveAs(Server.MapPath("~/images/") + filename);
                            dt.image_large = "images/" + filename;
                        }
                        else
                        {
                            Response.Write("<script>alert('Bạn chỉ được upload jpg,png,jpeg')</script>");
                            return;
                        }

                    }
                    catch (Exception ex)
                    {

                    }
                }
                if (ful_hinhanhnho.HasFile)
                {
                    try
                    {
                        string Duoi_filename = Path.GetExtension(ful_hinhanhnho.FileName);
                        string filename = ful_hinhanhnho.FileName.ToString(); ;
                        if (Duoi_filename == ".jpeg" || Duoi_filename == ".jpg" || Duoi_filename == ".png" || Duoi_filename == ".PNG" || Duoi_filename == ".JPG" || filename == ".JPEG")
                        {
                            ful_hinhanhnho.SaveAs(Server.MapPath("~/images/") + filename);
                            dt.image = "images/" + filename;
                        }
                        else
                        {
                            Response.Write("<script>alert('Bạn chỉ được upload jpg,png,jpeg')</script>");
                            return;
                        }

                    }
                    catch (Exception ex)
                    {

                    }
                }


                dt.Active = bool.Parse(ckbActive.Checked == true ? "True" : "False");
                //SanPhamService.SanPham_Insert(dts);
                db.tbl_Hangs.InsertOnSubmit(dt);
                db.SubmitChanges();
                Response.Write("<script>alert('Thêm mới thành công!!!')</script>");
                getData();
            }
            else
            {
                dts.Id = txtID.Text;
                dts.TenHang = txttenhang.Text;
                dts.Id_Menu = ddltennhomhang.SelectedValue;
                dts.ChatLieu = txtchatlieu.Text;
                dts.GiaMoi = txtgiamoi.Text;
                dts.GiaCu = txtgiacu.Text;
                dts.Soluong = txtsoluong.Text;
                dts.TomTat = txttomtat.Text;
                if (int.Parse(txtsoluong.Text) > 0)
                    dts.TinhTrang = "Còn";
                dts.Mota = txtNoidung.Text;
                if (ful_hinhanhlon.HasFile)
                {
                    try
                    {
                        string Duoi_filename = Path.GetExtension(ful_hinhanhlon.FileName);
                        string filename = ful_hinhanhlon.FileName.ToString(); ;
                        if (Duoi_filename == ".jpeg" || Duoi_filename == ".jpg" || Duoi_filename == ".png" || Duoi_filename == ".PNG" || Duoi_filename == ".JPG" || filename == ".JPEG")
                        {
                            ful_hinhanhlon.SaveAs(Server.MapPath("~/images/") + filename);
                            dts.ImageLarge = "images/" + filename;
                        }
                        else
                        {
                            Response.Write("<script>alert('Bạn chỉ được upload jpg,png,jpeg')</script>");
                            return;
                        }

                    }
                    catch (Exception ex)
                    {

                    }
                }
                else
                {
                    dts.Image = fileUpLoad_nho;
                }
                if (ful_hinhanhnho.HasFile)
                {
                    try
                    {
                        string Duoi_filename = Path.GetExtension(ful_hinhanhnho.FileName);
                        string filename = ful_hinhanhnho.FileName.ToString(); ;
                        if (Duoi_filename == ".jpeg" || Duoi_filename == ".jpg" || Duoi_filename == ".png" || Duoi_filename == ".PNG" || Duoi_filename == ".JPG" || filename == ".JPEG")
                        {
                            ful_hinhanhnho.SaveAs(Server.MapPath("~/images/") + filename);
                            dts.Image = "images/" + filename;
                        }
                        else
                        {
                            Response.Write("<script>alert('Bạn chỉ được upload jpg,png,jpeg')</script>");
                            return;
                        }

                    }
                    catch (Exception ex)
                    {

                    }
                }
                else
                {
                    dts.ImageLarge = fileUpLoad_lon;
                }


                dts.Active = ckbActive.Checked == true ? "True" : "False";
                SanPhamService.SanPham_Update(dts);
                Response.Write("<script>alert('Update thành công!!!')</script>");
                getData();
            }
            insert = true;
            pnData.Visible = true;
            pnInfo.Visible = false;
            ClearText();
        }

        protected void btnReturn_Top_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int i = 0;
            string id;
            foreach (GridViewRow gvrow in grvHang.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("CkDelete");
                if (chk != null && chk.Checked)
                {
                    id = grvHang.Rows[i].Cells[1].Text;
                    SanPhamService.SanPham_Delete(id);
                }
                i++;
            }
            getData();
        }

        protected void btnReturn_Top_Command(object sender, CommandEventArgs e)
        {
            ClearText();
            pnData.Visible = true;
            pnInfo.Visible = false;
            getData();
        }
    }
}