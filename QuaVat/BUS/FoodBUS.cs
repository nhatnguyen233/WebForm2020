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
            string sql = "select * from foods where category_id = " + category_id;
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