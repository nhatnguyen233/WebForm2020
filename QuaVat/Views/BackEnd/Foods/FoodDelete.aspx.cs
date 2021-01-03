using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuaVat.BUS;

namespace QuaVat.Views.BackEnd.Foods
{
    public partial class FoodDelete : System.Web.UI.Page
    {
        FoodBUS food = new FoodBUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["food_id"] != null)
            {
                try
                {
                    food.Delete(Convert.ToInt32(Request.QueryString["food_id"]));
                    Response.Redirect(Request.UrlReferrer.ToString());
                }
                catch (Exception error)
                {
                    Response.Write("<script>alert('Delete Failed Error: " + error + "')</script>");
                }

            }
        }
    }
}