using BUS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Collections;

namespace Clothing_Store
{
    public partial class Tintuc : System.Web.UI.Page
    {
        public int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] != null)
                {
                    return Convert.ToInt32(ViewState["CurrentPage"]);
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            remenu.DataSource = NhomHangService.NhomHang_GetByTop("", " Active='True'", "");
            remenu.DataBind();

            if (!IsPostBack)
            {
                LoadData(3);
                //rptcontent.DataSource = TinTucService.TinTuc_GetByTop("", "", " id DESC");
                //rptcontent.DataBind();
            }
        }
        public static DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);

            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Defining type of data column gives proper data table 
                var type = (prop.PropertyType.IsGenericType && prop.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>) ? Nullable.GetUnderlyingType(prop.PropertyType) : prop.PropertyType);
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name, type);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            //put a breakpoint here and check datatable
            return dataTable;
        }
        private void LoadData(int pageSize)
        {
            DataTable dataTable = new DataTable();
            dataTable = ToDataTable(TinTucService.TinTuc_GetByTop("", "Active='True'", " id DESC"));
            PagedDataSource pageSource = new PagedDataSource();
            pageSource.DataSource = dataTable.DefaultView;
            pageSource.AllowPaging = true;

            pageSource.PageSize = pageSize;
            pageSource.CurrentPageIndex = this.CurrentPage;
            if (pageSource.PageCount > 1)
            {
                repeaterPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pageSource.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                repeaterPaging.DataSource = pages;
                repeaterPaging.DataBind();
            }
            else
            {
                repeaterPaging.Visible = false;
            }

            rptcontent.DataSource = pageSource;
            rptcontent.DataBind();

        }
        protected void repeaterPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            this.CurrentPage = Convert.ToInt32(e.CommandArgument) - 1;
            LoadData(3);
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