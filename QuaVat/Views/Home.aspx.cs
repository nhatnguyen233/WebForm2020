using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuaVat.BUS;

namespace QuaVat.Views
{
    public partial class Home : System.Web.UI.Page
    {
        FoodBUS food = new FoodBUS();
        public void HienThi()
        {
            list1.DataSource = food.GetAll();
            list1.DataBind();
            list2.DataSource = food.ShowFoodTop4WithCategory(1);
            list2.DataBind();
            list3.DataSource = food.ShowFoodTop4WithCategory(2);
            list3.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            HienThi();
        }
    }
}