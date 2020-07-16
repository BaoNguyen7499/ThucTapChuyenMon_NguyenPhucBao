using BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clothing_Store
{
    public partial class ChiTietTinTuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            remenu.DataSource = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            remenu.DataBind();

            int? so = null;
            int id = Convert.ToInt32(Request["Id"]);
            List<Entity.TinTuc> lst = new List<Entity.TinTuc>();
            TinTucService.TinTucView_Update(id.ToString());
            rptbantin.DataSource = TinTucService.TinTuc_GetByTop("", " id='" + id + "'", "");
            rptbantin.DataBind();
            rptcacbaikhac.DataSource = TinTucService.TinTuc_GetByTop("2", "", " NEWID()");
            rptcacbaikhac.DataBind();
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