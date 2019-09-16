using System;
using System.Collections.Generic;
using System.Text;

namespace GreatOutdoor.Entities
{
    public class Admin
    {
        private int adminID;

        public int AdminID
        {
            get { return adminID; }
            set { adminID = value; }
        }
        private string adminName;

        public string AdminName
        {
            get { return adminName; }
            set { adminName = value; }
        }
        private int adminContactNumber;

        public int AdminContactNumber
        {
            get { return adminContactNumber; }
            set { adminContactNumber = value; }
        }
     
        private string adminEmail;
        public string AdminEmail
        {
            get { return adminEmail; }
            set { adminEmail = value; }
        }
        private string adminpassword;
        public string Adminpassword
        {
            get { return adminpassword; }
            set { adminpassword = value; }
        }
        //intializing the default values of admin fields to null
        public Admin()
        {
            adminID = 0;
            adminName = string.Empty;
            adminContactNumber = 0;
            adminEmail = string.Empty;
            adminpassword = string.Empty;

        }
    }
}
