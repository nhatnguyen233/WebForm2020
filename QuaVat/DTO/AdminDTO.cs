using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuaVat.DTO
{
    public class AdminDTO
    {
        int _adminID, _level;
        string _accountName, _adminName, _email, _password, _phone, _address, _token, _avatar;
        DateTime _createdAt, _updated_at;

        public int AdminID { get => _adminID; set => _adminID = value; }
        public int Level { get => _level; set => _level = value; }
        public string AccountName { get => _accountName; set => _accountName = value; }
        public string AdminName { get => _adminName; set => _adminName = value; }
        public string Email { get => _email; set => _email = value; }
        public string Password { get => _password; set => _password = value; }
        public string Phone { get => _phone; set => _phone = value; }
        public string Address { get => _address; set => _address = value; }
        public string Avatar { get => _avatar; set => _avatar = value; }
        public string Token { get => _token; set => _token = value; }
        public DateTime CreatedAt { get => _createdAt; set => _createdAt = value; }
        public DateTime Updated_at { get => _updated_at; set => _updated_at = value; }
    }
}