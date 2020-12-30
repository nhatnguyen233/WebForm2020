using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuaVat.BUS;
using QuaVat.DTO;

namespace QuaVat.Views.BackEnd.Categories
{
    public partial class CatAdd : System.Web.UI.Page
    {
        CategoryBUS category = new CategoryBUS();
        CategoryDTO dto = new CategoryDTO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('"+ CatName.Text + "')</script>");
            dto.CategoryName = CatName.Text;
            dto.Description = Description.Text;
            dto.ParentID = Convert.ToInt32(ParentID.Text);
            category.Insert(dto.CategoryName, dto.Description, dto.ParentID);
        }
    }
}