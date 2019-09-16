using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using System.Collections;

namespace GreatOutdoor.Entities
{
    public class SalesPerson
    {

        private string _salesPersonName;
        private string _salesPersonemail;
        private string _salesPersonMobileNumber;
        private static int _salesPersonID;

        public string SalesPersonName { get => _salesPersonName; set => _salesPersonName = value; }
        public string SalesPersonemail { get => _salesPersonemail; set => _salesPersonemail = value; }
        public string SalesPersonMobileNumber { get => _salesPersonMobileNumber; set => _salesPersonMobileNumber = value; }
        public static int SalesPersonID { get => _salesPersonID; set => _salesPersonID = value; }

        public SalesPerson()
        {

            _salesPersonName = string.Empty;
            _salesPersonMobileNumber = string.Empty;
            _salesPersonemail = string.Empty;
            _salesPersonID = 0;


        }
      

    }

   
}

