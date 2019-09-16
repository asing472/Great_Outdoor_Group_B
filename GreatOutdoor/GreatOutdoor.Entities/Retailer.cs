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
    public interface IRetailer
    {
        string RetailerName { get; set; }
        string RetailerEmail { get; set; }
        string RetailerMobile { get; set; }
        int RetailerID { get; set; }

    }

    public class Retailer : IRetailer
    {

        public string RetailerName { get ; set; }
        public string RetailerEmail { get; set; }
        public string RetailerMobile { get ; set; }
        public int RetailerID { get; set ; }

    }

}

