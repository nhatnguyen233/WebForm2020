using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuaVat.DTO
{
    public class CategoryDTO
    {
        int _categoryID, _parentID;
        string _categoryName, _description;
        DateTime _createdAt, _updatedAt;

        public int CategoryID { get => _categoryID; set => _categoryID = value; }
        public int ParentID { get => _parentID; set => _parentID = value; }
        public string CategoryName { get => _categoryName; set => _categoryName = value; }
        public string Description { get => _description; set => _description = value; }
        public DateTime CreatedAt { get => _createdAt; set => _createdAt = value; }
        public DateTime UpdatedAt { get => _updatedAt; set => _updatedAt = value; }
    }
}