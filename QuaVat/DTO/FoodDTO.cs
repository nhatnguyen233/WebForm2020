using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuaVat.DTO
{
    public class FoodDTO
    {
        string _foodName, _description, image;
        int _foodID, _discount, _quantity, categoryID;
        double _amount;
        DateTime _createdAt, _updatedAt;

        public string FoodName { get => _foodName; set => _foodName = value; }
        public string Description { get => _description; set => _description = value; }
        public string Image { get => image; set => image = value; }
        public int FoodID { get => _foodID; set => _foodID = value; }
        public int Discount { get => _discount; set => _discount = value; }
        public int Quantity { get => _quantity; set => _quantity = value; }
        public int CategoryID { get => categoryID; set => categoryID = value; }
        public double Amount { get => _amount; set => _amount = value; }
        public DateTime CreatedAt { get => _createdAt; set => _createdAt = value; }
        public DateTime UpdatedAt { get => _updatedAt; set => _updatedAt = value; }
    }
}