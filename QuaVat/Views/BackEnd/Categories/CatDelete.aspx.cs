using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuaVat.BUS;

namespace QuaVat.Views.BackEnd.Categories
{
    public partial class CatDelete : System.Web.UI.Page
    {
        CategoryBUS category = new CategoryBUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["cat_id"] != null)
            {
                try
                {
                    category.Delete(Convert.ToInt32(Request.QueryString["cat_id"]));
                    Response.Redirect("/Views/BackEnd/Categories/CatList.aspx");
                } catch(Exception error)
                {
                    Response.Write("<script>alert('Delete Failed')</script>");
                }
               
            }
        }
    }
}