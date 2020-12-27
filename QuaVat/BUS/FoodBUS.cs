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

        public DataTable ShowAllFood()
        {
            string sql = "select * from foods";
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

        public void Insert(FoodDTO dto)
        {
            string sql = "INSERT foods VALUES(N'" + dto.FoodName + "',N'" + dto.Description + "','" + dto.Amount + "','" + dto.Discount + "','" + dto.Quantity + "','" + dto.CategoryID + "','" + dto.CreatedAt + "','" + dto.UpdatedAt + "')";
            data.ExecuteNonQuery(sql);
        }
    }
}