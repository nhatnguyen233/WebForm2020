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

        void HienThi()
        {
            ParentID.Items.Clear();
            ParentID.DataSource = SqlDataSource1;
            ParentID.DataTextField = "category_name";
            ParentID.DataValueField = "category_id";
            ParentID.DataBind();
            Back.PostBackUrl = Request.UrlReferrer.ToString();
            //ParentID.Items.Insert(0, new ListItem("---------Select---------", ""));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            HienThi();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (CatName.Text.Equals("") || Description.Text.Equals("") || ParentID.SelectedValue == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.error('Oops...Please fill Complete Form!', 'Error')", true);
                }
                else
                {
                    dto.CategoryName = CatName.Text;
                    dto.Description = Description.Text;
                    dto.ParentID = Convert.ToInt32(ParentID.Text);
                    category.Insert(dto.CategoryName, dto.Description, dto.ParentID);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.warning('Add Successfully!', 'Success')", true);
                    // Response.Redirect(Request.RawUrl);
                } 
            } catch(Exception error)
            {
                Response.Write("<script>alert('Error: " + error + "')</script>");
            }  
        }
    }
}