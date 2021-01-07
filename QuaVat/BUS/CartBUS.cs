using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using QuaVat.DAL;
using QuaVat.DTO;

namespace QuaVat.BUS
{
    public class CartBUS
    {
        Data data = new Data();
        public static bool check = false;

        public DataTable GetList(string session_id)
        {
            string sql = "SELECT carts.session_id, foods.food_id, foods.image, foods.food_name, foods.amount, carts.quantity, carts.price FROM carts INNER JOIN foods ON carts.food_id = foods.food_id WHERE session_id='" + session_id + "' AND carts.session_id <> ''";
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }

        public bool checkCart(string session_id, int food_id)
        {
            string sql = "select * from carts where session_id='" + session_id + "' AND food_id='" + food_id + "'";
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            foreach (DataRow dr in dt.Rows)
            {
                if (dr != null)
                {
                    return true;
                }
            }
            return false;
        }

        public DataTable count(string session_id)
        {
            string sql = "SELECT COUNT(*) as count FROM carts INNER JOIN foods ON carts.food_id = foods.food_id WHERE session_id='" + session_id + "'";
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }

        public void Insert(int food_id, string session_id, double money, int quantity, DateTime createdAt, DateTime updatedAt)
        {
            string sql = "INSERT INTO carts(food_id, session_id, price, quantity, created_at, updated_at) VALUES('" + food_id + "','" + session_id + "','" + money + "','" + quantity +"','" + createdAt + "','" + updatedAt + "')";
            data.ExecuteNonQuery(sql); 
        }

        public void DeleteAllCart()
        {
            string sql = "DELETE FROM carts WHERE status = 0";
            data.ExecuteNonQuery(sql);
        }

        public void Delete(int food_id, string session_id)
        {
            string sql = "DELETE FROM carts WHERE food_id ='" + food_id + "' AND session_id='" + session_id + "'";
            data.ExecuteNonQuery(sql);
        }
    }
}