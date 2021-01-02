using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuaVat.BUS;

namespace QuaVat.Views.BackEnd.Categories
{
    public partial class CatList : System.Web.UI.Page
    {
        protected static int item_per_page;
        protected static int current_page;
        protected static int offset;
        protected static int totalRecords;
        protected static double totalPages;
        CategoryBUS category = new CategoryBUS();
        void ListTable()
        {
            totalRecords = category.GetAll().Rows.Count;
            
            if (Request.QueryString["page"] == null)
            {
                current_page = 1;
            } else
            {
                current_page = Int32.Parse(Request.QueryString["page"]);
            }

            if (Request.QueryString["page"] == null)
            {
                item_per_page = 10;
            } else
            {
                item_per_page = Int32.Parse(Request.QueryString["per_page"]);
            }

            offset = (current_page - 1) * item_per_page;
            double pages = (double)totalRecords /(double)item_per_page;
            totalPages = Math.Ceiling(pages);
            list.DataSource = category.GetList(offset, item_per_page);
            list.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ListTable();
        }
    }
}