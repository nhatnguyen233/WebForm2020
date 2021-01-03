using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using QuaVat.BUS;
using QuaVat.DTO;

namespace QuaVat.Views.BackEnd.Foods
{
    public partial class FoodEdit : System.Web.UI.Page
    {
        FoodBUS foodBUS = new FoodBUS();
        FoodDTO dto = new FoodDTO();
        DataTable data = null;
        protected double amount, oldAmount;
        protected int food_id, category_id, quantity, discount, oldCatID, oldQuantity, oldDiscount;
        protected string food_name, description, image, oldName, oldDesc, oldImage;

        void LoadData()
        {
            food_id = Convert.ToInt32(Request.QueryString["food_id"]);
            data = foodBUS.GetWithID(food_id);
        }

        protected void DiscountID_Init(object sender, EventArgs e)
        {
            LoadData();
            if(data.Rows[0][4] == DBNull.Value)
            {
                DiscountID.Text = "";
            } else
            {
                DiscountID.Text = data.Rows[0].Field<int>("discount").ToString();
                oldDiscount = Convert.ToInt32(DiscountID.Text);
            }    
        }

        protected void Img_Init(object sender, EventArgs e)
        {
            LoadData();
            oldImage = data.Rows[0].Field<string>("image");
        }

        protected void AmountID_Init(object sender, EventArgs e)
        {
            LoadData();
            AmountID.Text = String.Format("{0:#}", data.Rows[0][3].ToString());
            oldAmount = Convert.ToDouble(AmountID.Text);
        }

        protected void Desc_Init(object sender, EventArgs e)
        {
            LoadData();
            Desc.Text = data.Rows[0].Field<string>("description");
            oldDesc = Desc.Text.Trim();
        }

        protected void Qty_Init(object sender, EventArgs e)
        {
            LoadData();
            Qty.Text = data.Rows[0].Field<int>("quantity").ToString();
            oldQuantity = Convert.ToInt32(Qty.Text);
        }

        protected void CatList_Init(object sender, EventArgs e)
        {
            LoadData();
            CatList.SelectedValue = "1";
            oldCatID = 1;
            if (data.Rows[0][3] != DBNull.Value)
            {
                CatList.SelectedValue = data.Rows[0].Field<int>("category_id").ToString();
                oldCatID = Convert.ToInt32(data.Rows[0].Field<int>("category_id").ToString());
            }
        }

        protected void FoodName_Init(object sender, EventArgs e)
        {
            LoadData();
            FoodName.Text = data.Rows[0].Field<string>("food_name");
            oldName = FoodName.Text;
        }

        protected void CatList_SelectedIndexChanged(object sender, EventArgs e)
        {
            category_id = Convert.ToInt32(CatList.Text);
        }

        protected void Qty_TextChanged(object sender, EventArgs e)
        {
            quantity = Convert.ToInt32(Qty.Text);
        }

        protected void Desc_TextChanged(object sender, EventArgs e)
        {
            description = Desc.Text.Trim();
        }

        protected void AmountID_TextChanged(object sender, EventArgs e)
        {
            amount = Convert.ToDouble(AmountID.Text);
        }

        protected void DiscountID_TextChanged(object sender, EventArgs e)
        {
            discount = Convert.ToInt32(DiscountID.Text);
        }

        protected void FoodName_TextChanged(object sender, EventArgs e)
        {
            food_name = FoodName.Text.Trim();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Cancel.PostBackUrl = Request.UrlReferrer.ToString();
        }

        void getRequest()
        {
            if (category_id == 0)
            {
                category_id = oldCatID;
            }

            if (food_name == null)
            {
                food_name = oldName;
            }

            if (description == null)
            {
                description = oldDesc;
            }

            if(quantity == 0)
            {
                quantity = oldQuantity;
            }

            if(amount == 0)
            {
                amount = oldAmount;
            }
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
                if (FoodName.Text.Equals("") || Desc.Text.Equals("") || CatList.SelectedValue == "" || AmountID.Text.Equals("") || Qty.Text.Equals(""))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.error('Oops...Please fill Complete Form!', 'Error')", true);
                }
                else
                {
                    if (DiscountID.Text.Equals(""))
                    {
                        DiscountID.Text = "0";
                    }
                    getRequest();
                    dto.FoodName = food_name;
                    dto.Description = description;
                    dto.Amount = amount;
                    dto.Discount = discount;
                    dto.Quantity = quantity;
                    dto.CategoryID = category_id;
                    dto.Image = "/imgs/" + Img.FileName;
                    dto.UpdatedAt = DateTime.Now;
                    SaveFileUpload();
                    foodBUS.Update(dto.FoodName, dto.Description, dto.Amount, dto.Discount, dto.Quantity, dto.Image, dto.CategoryID, dto.UpdatedAt, food_id);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.warning('Update Successfully!', 'Success')", true);
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