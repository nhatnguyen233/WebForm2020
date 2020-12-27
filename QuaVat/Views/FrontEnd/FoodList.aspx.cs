using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuaVat.BUS;

namespace QuaVat.Views.FrontEnd
{
    public partial class FoodList : System.Web.UI.Page
    {
        FoodBUS bus = new FoodBUS();

        public void HienThi()
        {
            int cat_id = Int32.Parse(Request.QueryString["cat_id"].ToString());
            list.DataSource = bus.ShowFoodWithCategory(cat_id);
            list.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            HienThi();
        }
    }
}