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
    //Interface for Retailer
    public interface IRetailer
    {
        string RetailerName { get; set; }
        string RetailerEmail { get; set; }
        string RetailerMobile { get; set; }
        int RetailerID { get; set; }

    }
    //Class of Retailer
    public class Retailer : IRetailer
    {
<<<<<<< HEAD
        private string _retailerName;
        private string _retailerEmail;
        private string _retailerMobile;
        private static int _retailerID =0;
        private string _retailerpassword;
=======
>>>>>>> 5071d02a43807b675473011462fbbb5171d23d17

        public string RetailerName { get ; set; }
        public string RetailerEmail { get; set; }
        public string RetailerMobile { get ; set; }
        public int RetailerID { get; set ; }

<<<<<<< HEAD
       

       

       
        public string RetailerName { get => _retailerName; set => _retailerName = value; }
        public string RetailerEmail { get => _retailerEmail; set => _retailerEmail = value; }
        public string RetailerMobile { get => _retailerMobile; set => _retailerMobile = value; }
        public  int RetailerID { get => _retailerID; set => _retailerID = value; }
        public string Retailerpassword { get => _retailerpassword; set => _retailerpassword = value; }
=======
>>>>>>> 5071d02a43807b675473011462fbbb5171d23d17
    }

}

