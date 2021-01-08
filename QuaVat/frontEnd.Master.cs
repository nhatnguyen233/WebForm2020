using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuaVat.BUS;

namespace QuaVat
{
    public partial class frontEnd : System.Web.UI.MasterPage
    {
        CategoryBUS category = new CategoryBUS();
        CartBUS cart = new CartBUS();
        public void HienThi()
        {
            categoryMain.DataSource = category.ShowMainCategory();
            categoryMain.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            HienThi();
            if(Session["sId"] == null)
            {
                cart.DeleteAllCart();
            }    
        }
    }
}