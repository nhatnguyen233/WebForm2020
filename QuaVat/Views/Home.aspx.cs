﻿using System;
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
            list1.DataSource = food.ShowAllFood();
            list1.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            HienThi();
        }
    }
}