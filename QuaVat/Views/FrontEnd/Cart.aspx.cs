using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuaVat.BUS;

namespace QuaVat.Views.FrontEnd
{
    public partial class Cart : System.Web.UI.Page
    {
        CartBUS cart = new CartBUS();
        DataTable countList = null;
        public void LoadData()
        {
            list.DataSource = cart.GetList(Session["sId"].ToString());
            list.DataBind();
            countList = cart.count(Session["sId"].ToString());
        }

        public static string randomSession()
        {
            int length = 7;

            // creating a StringBuilder object()
            StringBuilder str_build = new StringBuilder();
            Random random = new Random();

            char letter;

            for (int i = 0; i < length; i++)
            {
                double flt = random.NextDouble();
                int shift = Convert.ToInt32(Math.Floor(25 * flt));
                letter = Convert.ToChar(shift + 65);
                str_build.Append(letter);
            }
            return str_build.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["sId"] == "")
            {
                Session["sId"] = randomSession();
                Session["count"] = 0;
            }  else
            {
                if(countList != null)
                {
                    Session["count"] = countList.Rows[0].Field<int>("count").ToString();
                }    
            }
            int soluong = Convert.ToInt32(Request.QueryString["soluong"]);
            int food_id = Convert.ToInt32(Request.QueryString["food_id"]);
            int gia = Convert.ToInt32(Request.QueryString["gia"]);
            DateTime createdAt = DateTime.Now;
            DateTime updatedAt = DateTime.Now;
            try
            {
                cart.Insert(food_id, Session["sId"].ToString(), gia * soluong, soluong, createdAt, updatedAt);
            } catch(Exception)
            {

            }
           
            LoadData();
            Response.Write(Request.QueryString["delete"] == 1.ToString());
            
        }
    }
}