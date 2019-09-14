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
        private int adminmobileno;

        public int Adminmobileno
        {
            get { return adminmobileno; }
            set { adminmobileno = value; }
        }
        private string adminusername;
        public string Adminusername
        {
            get { return adminusername; }
            set { adminusername = value; }
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
    }
}
