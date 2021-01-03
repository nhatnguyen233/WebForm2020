using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using QuaVat.DAL;
using QuaVat.DTO;

namespace QuaVat.BUS
{
    public class AdminBUS
    {
        Data data = new Data();

        public DataTable ShowAll()
        {
            string sql = "select * from foods";
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }
        
        public bool CheckLogin(string account, string password)
        {
            string sql = "select * from admins where account_name='" + account + "' AND password='" + password + "'";
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            foreach(DataRow dr in dt.Rows)
            {
                if(dr != null)
                {
                    return true;
                }
            }
            return false;
        }

        public void Insert(FoodDTO dto)
        {
            string sql = "INSERT foods VALUES(N'" + dto.FoodName + "',N'" + dto.Description + "','" + dto.Amount + "','" + dto.Discount + "','" + dto.Quantity + "','" + dto.CategoryID + "','" + dto.CreatedAt + "','" + dto.UpdatedAt + "')";
            data.ExecuteNonQuery(sql);
        }
    }
}