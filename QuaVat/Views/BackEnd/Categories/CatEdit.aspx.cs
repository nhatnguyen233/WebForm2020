using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using QuaVat.BUS;
using QuaVat.DTO;

namespace QuaVat.Views.BackEnd.Categories
{
    public partial class CatEdit : System.Web.UI.Page
    {
        CategoryBUS categoryBUS = new CategoryBUS();
        CategoryDTO dto = new CategoryDTO();
        DataTable data = null;
        protected int category_id, parent_id, oldParentID;
        protected string category_name, description, oldName, oldDesc;
        void LoadData()
        {
            category_id = Convert.ToInt32(Request.QueryString["cat_id"]);
            data = categoryBUS.GetWithID(category_id);
        }

        protected void CatName_Init(object sender, EventArgs e)
        {
            LoadData();
            CatName.Text = data.Rows[0].Field<string>("category_name");
            oldName = CatName.Text;
        }
        protected void Desc_Init(object sender, EventArgs e)
        {
            LoadData();
            Desc.Text = data.Rows[0].Field<string>("description");
            oldDesc = Desc.Text;
        }

        protected void ParentID_Init(object sender, EventArgs e)
        {
            LoadData();
            ParentID.SelectedValue = "1";
            oldParentID = 1;
            if (data.Rows[0][3] != DBNull.Value)
            {
                ParentID.SelectedValue = data.Rows[0].Field<int>("parent_id").ToString();
                oldParentID = Convert.ToInt32(data.Rows[0].Field<int>("parent_id").ToString());
            }
        }

        protected void CatName_TextChanged(object sender, EventArgs e)
        {
            category_name = CatName.Text.Trim();
        }

        protected void ParentID_SelectedIndexChanged(object sender, EventArgs e)
        {
            parent_id = Convert.ToInt32(ParentID.Text);
        }

        protected void Desc_TextChanged(object sender, EventArgs e)
        {
            description = Desc.Text.Trim();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Back.PostBackUrl = Request.UrlReferrer.ToString();
        }

        void getRequest()
        {
            if (parent_id == 0)
            {
                parent_id = oldParentID;
            }

            if (category_name == null)
            {
                category_name = oldName;
            }

            if (description == null)
            {
                description = oldDesc;
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                
                if (CatName.Text.Equals("") || Desc.Text.Equals("") || ParentID.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.error('Oops...Please fill Complete Form!', 'Error')", true);
                }
                else
                {
                    getRequest();
                    dto.CategoryID = category_id;
                    dto.CategoryName = category_name;
                    dto.Description = description;
                    dto.ParentID = parent_id;
                    categoryBUS.Update(dto.CategoryName, dto.Description, dto.ParentID, dto.CategoryID);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.warning('Update Successfully!', 'Success')", true);
                }
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('Error: " + error + "')</script>");
            }
        }
    }
}