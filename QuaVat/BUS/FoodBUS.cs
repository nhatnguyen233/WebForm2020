using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using QuaVat.DAL;
using QuaVat.DTO;

namespace QuaVat.BUS
{
    public class FoodBUS
    {
        Data data = new Data();

        public DataTable GetList(int offset = 0, int perpage = 10)
        {
            string sql = "SELECT * FROM foods INNER JOIN categories on foods.category_id = categories.category_id ORDER BY food_id OFFSET " + offset + " ROWS FETCH NEXT " + perpage + " ROWS ONLY";
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }

        public DataTable GetAll()
        {
            string sql = "SELECT * FROM foods";
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }

        public DataTable GetWithID(int food_id)
        {
            string sql = "SELECT * FROM foods WHERE food_id='" + food_id + "'";
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }

        public DataTable ShowFoodWithCategory(int category_id)
        {
            string sql = "select * from foods inner join categories on foods.category_id = categories.category_id or foods.category_id = categories.parent_id where foods.category_id=" + category_id + " or categories.parent_id=" + category_id;
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }

        public DataTable ShowFoodTop4WithCategory(int category_id)
        {
            string sql = "select top 4 * from foods inner join categories on foods.category_id = categories.category_id or foods.category_id = categories.parent_id where foods.category_id=" + category_id + " or categories.parent_id=" + category_id;
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }

        public void Insert(string food_name, string description, double amount, int discount, int quantity, string image, int category, DateTime createdAt, DateTime updatedAt)
        {
            string sql = "INSERT INTO foods(food_name, description, amount, discount, quantity, image, category_id, created_at, updated_at) VALUES(N'" + food_name + "',N'" + description + "','" + amount + "','" + discount + "','" + quantity + "','" + image + "','" + category + "','" + createdAt + "','" + updatedAt + "')";
            data.ExecuteNonQuery(sql);
        }

        public void Update(string food_name, string description, double amount, int discount, int quantity, string image, int category, DateTime updatedAt, int food_id)
        {
            string sql = "UPDATE foods SET food_name='" + food_name + "',description='" + description + "', amount='" + amount + "', discount='" + discount + "', quantity='" + quantity + "',image='" + image + "',category_id='" + category + "', updated_at='" + updatedAt + "' WHERE food_id = '" + food_id + "'";
            data.ExecuteNonQuery(sql);
        }

        public void Delete(int food_id)
        {
            string sql = "DELETE foods WHERE food_id='" + food_id + "'";
            data.ExecuteNonQuery(sql);
        }
    }
}