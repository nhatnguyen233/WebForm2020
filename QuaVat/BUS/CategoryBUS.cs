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

        public DataTable GetList(int offset = 0, int perpage = 10)
        {
            string sql = "SELECT * FROM categories ORDER BY category_id OFFSET " + offset + " ROWS FETCH NEXT "+ perpage+ " ROWS ONLY";
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }

        public DataTable GetAll()
        {
            string sql = "SELECT * FROM categories";
            DataTable dt = new DataTable();
            dt = data.GetTable(sql);
            return dt;
        }

        public DataTable GetWithID(int category_id)
        {
            string sql = "SELECT * FROM categories WHERE category_id=" + category_id;
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

        public void Insert(string category_name = null, string description ="", int parent_id = 0)
        {
            string sql = "INSERT INTO categories(category_name,description,parent_id) VALUES(N'" + category_name + "',N'" + description + "','" + parent_id + "')";
            data.ExecuteNonQuery(sql);
        }

        public void Update(string category_name = null, string description = "", int parent_id = 0, int category_id = 0)
        {
            string sql = "UPDATE categories SET category_name = N'" + category_name + "', description = N'"+ description + "', parent_id = '"+ parent_id + "' where category_id = '" + category_id + "'";
            data.ExecuteNonQuery(sql);
        }

        public void Delete(int category_id)
        {
            string sql = "DELETE categories WHERE category_id = '" + category_id + "'";
            data.ExecuteNonQuery(sql);
        }
    }
}