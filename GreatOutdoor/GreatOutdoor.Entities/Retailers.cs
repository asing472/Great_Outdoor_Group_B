using System;
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
        private string _retailerEmail;
        private string _retailerMobile;
        private static int _retailerID =0;


       

       

       
        public string RetailerName { get => _retailerName; set => _retailerName = value; }
        public string RetailerEmail { get => _retailerEmail; set => _retailerEmail = value; }
        public string RetailerMobile { get => _retailerMobile; set => _retailerMobile = value; }
        public  int RetailerID { get => _retailerID; set => _retailerID = value; }

        public Retailers()
        {
            _retailerID = 0;
            _retailerName = string.Empty;
            _retailerMobile = string.Empty;
            _retailerEmail = string.Empty;


        }
    }

}

    
