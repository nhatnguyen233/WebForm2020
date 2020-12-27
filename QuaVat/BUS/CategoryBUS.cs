using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using QuaVat.DAL;
using QuaVat.DTO;

namespace QuaVat.BUS
{
    public class CategoryBUS
    {
        Data data = new Data();

        public DataTable ShowAll()
        {
            string sql = "select * from categories";
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }

        public DataTable ShowMainCategory()
        {
            string sql = "select * from categories where parent_id is null and category_id <> 1";
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }

        public DataTable ShowChildCategory(int category_id)
        {
            string sql = "select * from categories where parend_id=" + category_id;
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }
    }
}