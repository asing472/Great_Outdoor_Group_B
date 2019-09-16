using System;
using System.Collections.Generic;
using System.Text;

namespace GreatOutdoor.Entities
{
    public interface ISalesPerson
    {
        string SalesPersonName { get; set; }
        string SalesPersonemail { get; set; }
        string SalesPersonMobileNumber { get; set; }
        int SalesPersonID { get; set; }

    }

    //Sales Person Class
   public class SalesPerson:ISalesPerson
    {

        public string SalesPersonName { get ; set ; }
        public string SalesPersonemail { get; set; }
        public string SalesPersonMobileNumber { get; set; }
        public  int SalesPersonID { get; set; }

    }
}
