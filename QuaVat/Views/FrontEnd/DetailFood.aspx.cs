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
        public static int food_id, quantity, soluongmua;
        public static decimal amount;
        public static string name, desc, img;

        protected void SoLuongMua_Load(object sender, EventArgs e)
        {
            soluongmua = Convert.ToInt32(SoLuongMua.Text);
        }

        protected void SoLuongMua_Init(object sender, EventArgs e)
        {
            SoLuongMua.Text = "1";
        }

        protected void SoLuongMua_TextChanged(object sender, EventArgs e)
        {
            soluongmua = Convert.ToInt32(SoLuongMua.Text);
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

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(soluongmua);
            LoadData();
        }
    }
}