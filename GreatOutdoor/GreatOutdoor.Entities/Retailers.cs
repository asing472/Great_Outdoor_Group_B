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

}

    
