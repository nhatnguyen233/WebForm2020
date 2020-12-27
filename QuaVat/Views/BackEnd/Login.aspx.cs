using QuaVat.BUS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuaVat.Views.BackEnd
{
    public partial class Login : System.Web.UI.Page
    {
        AdminBUS admin = new AdminBUS();

        protected void Page_Load(object sender, EventArgs e)
        {
            string account = Request.Form.Get("Account");
            if (Session["Admin"].Equals(account))
            {
                Response.Redirect("/Views/BackEnd/DashBoard.aspx");
            }
        }

        protected void LogIn_Click(object sender, EventArgs e)
        {
            string account = Request.Form.Get("Account");
            string password = Request.Form.Get("Password");
            if (admin.CheckLogin(account, password) == true)
            {
                Session["Admin"] = account;
                Response.Redirect("/Views/BackEnd/DashBoard.aspx");
            }
            else
            {
                Response.Write("Something Wrong!");
            }
        }
    }
}