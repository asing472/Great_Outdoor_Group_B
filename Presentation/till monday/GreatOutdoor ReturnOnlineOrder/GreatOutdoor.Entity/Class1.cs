using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace GreatOutdoor.Entity
{
    public class OnlineReturn
    {
        //fields
        private static int _returnId;
        private string _PurposeofReturn;
        private string _noOfReturn;
        private DateTime _dateOfReturn;


       

        public DateTime DateOfReturn { get => DateOfReturn; set => DateOfReturn = value; }
        public static int ReturnId { get => _returnId; set => _returnId = value; }
        public string PurposeofReturn { get => _PurposeofReturn; set => _PurposeofReturn = value; }
        public string NoOfReturn { get => _noOfReturn; set => _noOfReturn = value; }
        public DateTime DateOfReturn1 { get => _dateOfReturn; set => _dateOfReturn = value; }

        //constructor
        public OnlineReturn()
        {
            _PurposeofReturn = string.Empty;
            _noOfReturn = string.Empty;
            _returnId = 0;
        }



       
    }
}
