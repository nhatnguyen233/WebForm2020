using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuaVat.BUS;

namespace QuaVat.Views.FrontEnd
{
    public partial class DetailFood : System.Web.UI.Page
    {
        FoodBUS bus = new FoodBUS();
        DataTable data = null;
        public static int food_id, quantity;
        public static decimal amount;
        public static string name, desc, img;

        protected void SoLuongMua_Init(object sender, EventArgs e)
        {
            SoLuongMua.Text = "1";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Views/FrontEnd/Cart.aspx");
        }

        void LoadData()
        {
            food_id = Convert.ToInt32(Request.QueryString["food_id"]);
            data = bus.GetWithID(food_id);
            amount = data.Rows[0].Field<decimal>("amount");
            quantity = data.Rows[0].Field<int>("quantity");
            name = data.Rows[0].Field<string>("food_name");
            desc = data.Rows[0].Field<string>("description");
            img = data.Rows[0].Field<string>("image");
        }

        protected void FoodID_Load(object sender, EventArgs e)
        {
            FoodID.Text = food_id.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}