using System;
using static System.Console;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using System.Collections;
using GreatOutdoor.Exceptions;

namespace GreatOutdoor.Entities
{
    public class Retailers
    {
        private string _retailerName;
        private string _retaileremail;
        private string _retailermobile;
        private static int _retailerID =0;


       

       

       
        public string RetailerName { get => _retailerName; set => _retailerName = value; }
        public string Retaileremail { get => _retaileremail; set => _retaileremail = value; }
        public string Retailermobile { get => _retailermobile; set => _retailermobile = value; }
        public static int RetailerID { get => _retailerID; set => _retailerID = value; }

        public Retailers()
        {
            
            _retailerName = string.Empty;
            _retailermobile = string.Empty;
            _retaileremail = string.Empty;


        }
    }

   public class SalesPerson
    {
        
     }
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
