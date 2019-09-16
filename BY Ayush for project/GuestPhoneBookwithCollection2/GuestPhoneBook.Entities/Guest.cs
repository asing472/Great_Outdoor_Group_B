using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuestPhoneBook.Entities
{
    public class SalesPerson
    {
        private static int _salesPersonID = 0;

        public int SalesPersonID
        {
            get { return _salesPersonID; }
            set { _salesPersonID = value; }
        }
        private string _salesPersonName;

        public string SalesPersonName
        {
            get { return _salesPersonName; }
            set { _salesPersonName = value; }
        }
        private string _salesPersonMobileNumber;

        public string SalesPersonMobileNumber
        {
            get { return _salesPersonMobileNumber; }
            set { _salesPersonMobileNumber = value; }
        }

        private string _salesPersonEmail;

        public string SalesPersonEmail
        {
            get { return _salesPersonEmail; }
            set { _salesPersonEmail = value; }
        }

        public SalesPerson()
        {
            _salesPersonID = 0;
            _salesPersonName = string.Empty;
            _salesPersonMobileNumber = string.Empty;
            _salesPersonEmail = string.Empty;
        }
    }
}
