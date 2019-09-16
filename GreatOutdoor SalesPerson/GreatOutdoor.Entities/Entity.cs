using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreatOutdoor.Entities
{
    public class SalesPerson
    {

        public string _salesPersonName;
        public string _salesPersonemail;
        public string _salesPersonMobileNumber;
        public static int _salesPersonID;

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
        public SalesPerson(int SalesPersonID, string SalesPersonName, string SalesPersonEmail, string SalesPersonMobileNumber)
        {
            _salesPersonName = SalesPersonName;
            _salesPersonemail = SalesPersonEmail;
            _salesPersonMobileNumber = SalesPersonMobileNumber;
            _salesPersonID = SalesPersonID;

        }

    }
}

