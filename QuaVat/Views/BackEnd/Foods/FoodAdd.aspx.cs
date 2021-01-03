using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuaVat.DTO;
using QuaVat.BUS;

namespace QuaVat.Views.BackEnd.Foods
{
    public partial class FoodAdd : System.Web.UI.Page
    {
        FoodBUS food = new FoodBUS();
        FoodDTO dto = new FoodDTO();
        protected void Page_Load(object sender, EventArgs e)
        {
            Cancel.PostBackUrl = Request.UrlReferrer.ToString();
        }

        private void SaveFileUpload()
        {
            string strFilePath;
            if (Img.FileName != "")
            {
                strFilePath = Server.MapPath("/imgs/" + Img.FileName);
                Img.PostedFile.SaveAs(strFilePath);
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (FoodName.Text.Equals("") || Description.Text.Equals("") || CatList.SelectedValue == "" || Amount.Text.Equals("") || Quantity.Text.Equals(""))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.error('Oops...Please fill Complete Form!', 'Error')", true);
                }
                else
                {
                    if (Discount.Text.Equals(""))
                    {
                        Discount.Text = "0";
                    }
                    dto.FoodName = FoodName.Text;
                    dto.Description = Description.Text;
                    dto.Amount = Convert.ToDouble(Amount.Text);
                    dto.Discount = Convert.ToInt32(Discount.Text);
                    dto.Quantity = Convert.ToInt32(Quantity.Text);
                    dto.CategoryID = Convert.ToInt32(CatList.Text);
                    dto.Image = "~/imgs/" + Img.FileName;
                    dto.CreatedAt = DateTime.Now;
                    dto.UpdatedAt = DateTime.Now;
                    SaveFileUpload();
                    food.Insert(dto.FoodName, dto.Description, dto.Amount, dto.Discount, dto.Quantity, dto.Image, dto.CategoryID, dto.CreatedAt, dto.UpdatedAt);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.warning('Add Successfully!', 'Success')", true);
                    // Response.Redirect(Request.RawUrl);
                }
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('Error: " + error + "')</script>");
            }
        }
    }
}