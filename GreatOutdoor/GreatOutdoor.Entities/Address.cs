using System;
using System.Collections.Generic;
using System.Text;

namespace GreatOutdoor.Entities
{
    //Address  Interface
    public abstract class IAddress
    {
         int AddressID { get; set; }
         string Address_line1 { get; set; }
         string Address_line2 { get; set; }
         string Landmark { get; set; }
         string City { get; set; }
         string State { get; set; }
         int Pincode { get; set; }
         int RetailerID { get; set; }

    }
    //Address Class
    public class Address: IAddress
    {
        

        public int AddressID { get; set; }
        public string Address_line1 { get ; set ; }
        public string Address_line2 { get; set ; }
        public string Landmark { get ; set; }
        public string City { get; set ; }
        public string State { get; set; }
        public int Pincode { get; set ; }
        public int RetailerID { get; set; }
    }
}
