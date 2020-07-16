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
    public partial class TinTucAdmin : System.Web.UI.Page
    {
        public static bool insert = true;
        public static string fileUpLoad;
        void getData()
        {
            List<Entity.TinTuc> lst = new List<Entity.TinTuc>();
            lst = TinTucService.TinTuc_GetByTop("", "", "");



            grvTintuc.DataSource = lst;
            grvTintuc.DataBind();
            txtngayviet.Text = DateTime.Now.ToShortDateString();
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
            getData();
        }

        protected void btnAdd_Top_Click(object sender, EventArgs e)
        {
            insert = true;
            pnData.Visible = false;
            pnInfo.Visible = true;
            ClearText();
        }
        public void ClearText()
        {
            txtID.Text = "";
            txttieude.Text = "";
            txtngayviet.Text = DateTime.Now.ToString("yyyy-MM-dd");
            //FileUpload1.ID = "";
            txtnoidung.Text = "";
            txttomtat.Text = "";
            txtIdNhanvien.Text = "1";
            ckbActive.Checked = true;
        }

        protected void btnAdd_Top_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnEdit_Top_Command(object sender, CommandEventArgs e)
        {
            int i = 0;
            string id;
            foreach (GridViewRow gvrow in grvTintuc.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("CkDelete");
                if (chk != null && chk.Checked)
                {
                    id = grvTintuc.Rows[i].Cells[1].Text;
                    List<Entity.TinTuc> lst = new List<Entity.TinTuc>();

                    lst = TinTucService.TinTuc_GetByTop("", " ID = " + id, "");
                    pnInfo.Visible = true;
                    pnData.Visible = false;

                    insert = false;
                    fileUpLoad = lst[0].UrlHinhAnh;
                    txtID.Text = lst[0].Id;
                    txtIdNhanvien.Text = lst[0].Id_nhanvien;
                    txtngayviet.Text = lst[0].Ngayviet;
                    txttieude.Text = lst[0].TieuDe;
                    txtnoidung.Text = lst[0].Noidung;
                    txttomtat.Text = lst[0].Tomtat;
                    ckbActive.Checked = lst[0].Active == "True" ? true : false;
                }
                i++;
            }
            }

        protected void btnEdit_Top_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int i = 0;
            string id;
            foreach (GridViewRow gvrow in grvTintuc.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("CkDelete");
                if (chk != null && chk.Checked)
                {
                    id = grvTintuc.Rows[i].Cells[1].Text;
                    TinTucService.TinTuc_Delete(id);
                }
                i++;
            }




            getData();
        }

        protected void grvTintuc_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
                e.Row.TableSection = TableRowSection.TableHeader;
        }

        protected void grvTintuc_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void CkDelete_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void lbAddSub_Command(object sender, CommandEventArgs e)
        {
            insert = true;
            pnData.Visible = false;
            pnInfo.Visible = true;
            ClearText();
        }

        protected void btnSave_Top_Click(object sender, EventArgs e)
        {
            Entity.TinTuc dt = new Entity.TinTuc();
            if (insert == true)
            {
                dt.TieuDe = txttieude.Text;
                dt.Tomtat = txttomtat.Text;
                dt.Noidung = txtnoidung.Text;
                dt.Ngayviet = txtngayviet.Text;
                dt.Id_nhanvien = txtIdNhanvien.Text;
                if (FileUpload2.HasFile)
                {
                    try
                    {
                        string Duoi_filename = Path.GetExtension(FileUpload2.FileName);
                        string filename = FileUpload2.FileName.ToString();

                        if (Duoi_filename == ".jpeg" || Duoi_filename == ".jpg" || Duoi_filename == ".png" || Duoi_filename == ".PNG" || Duoi_filename == ".JPG" || Duoi_filename == ".JPEG")
                        {
                            FileUpload2.SaveAs(Server.MapPath("~/images/") + filename);
                            dt.UrlHinhAnh = "images/" + filename;
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

                }


                dt.Active = ckbActive.Checked == true ? "True" : "False";
                TinTucService.TinTuc_Insert(dt);
                Response.Write("<script>alert('Insert thành công!!!')</script>");
                getData();
            }
            else
            {
                dt.Id = txtID.Text;
                dt.TieuDe = txttieude.Text;
                dt.Tomtat = txttomtat.Text;
                dt.Noidung = txtnoidung.Text;
                dt.Ngayviet = txtngayviet.Text;
                dt.Id_nhanvien = txtIdNhanvien.Text;
                if (FileUpload2.HasFile)
                {
                    try
                    {
                        string Duoi_filename = Path.GetExtension(FileUpload2.FileName);
                        string filename = FileUpload2.FileName.ToString();

                        if (Duoi_filename == ".jpeg" || Duoi_filename == ".jpg" || Duoi_filename == ".png" || Duoi_filename == ".PNG" || Duoi_filename == ".JPG" || Duoi_filename == ".JPEG")
                        {
                            FileUpload2.SaveAs(Server.MapPath("~/images/") + filename);
                            dt.UrlHinhAnh = "images/" + filename;
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
                    dt.UrlHinhAnh = fileUpLoad;
                }

                dt.Active = ckbActive.Checked == true ? "True" : "False";
                TinTucService.TinTuc_Update(dt);
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

        protected void btnReturn_Top_Command(object sender, CommandEventArgs e)
        {
            ClearText();
            pnData.Visible = true;
            pnInfo.Visible = false;
            getData();
        }

        protected void lbDelete_Command(object sender, CommandEventArgs e)
        {
            int i = Int32.Parse(e.CommandArgument.ToString());
            List<Entity.TinTuc> lst = new List<Entity.TinTuc>();
            TinTucService.TinTuc_Delete(i.ToString());
            getData();
        }

        protected void lbEdit_Command(object sender, CommandEventArgs e)
        {
            int i = Int32.Parse(e.CommandArgument.ToString());
            List<Entity.TinTuc> lst = new List<Entity.TinTuc>();

            lst = TinTucService.TinTuc_GetByTop("", " ID = " + i, "");
            pnInfo.Visible = true;
            pnData.Visible = false;

            insert = false;
            fileUpLoad = lst[0].UrlHinhAnh;
            txtID.Text = lst[0].Id;
            txtIdNhanvien.Text = lst[0].Id_nhanvien;
            txtngayviet.Text = lst[0].Ngayviet;
            txttieude.Text = lst[0].TieuDe;
            txtnoidung.Text = lst[0].Noidung;
            txttomtat.Text = lst[0].Tomtat;
            ckbActive.Checked = lst[0].Active == "True" ? true : false;
        }
    }
}