﻿using System;
using System.Collections.Generic;
using System.Text;

namespace GreatOutdoor.Entities
{
    public interface ISalesPerson
    {
        string SalesPersonName { get; set; }
        string SalesPersonEmail { get; set; }
        string SalesPersonMobile { get; set; }
        int SalesPersonID { get; set; }

    }

    //Sales Person Class
   public class SalesPerson:ISalesPerson
    {

        public string SalesPersonName { get ; set ; }
        public string SalesPersonEmail { get; set; }
        public string SalesPersonMobile { get; set; }
        public  int SalesPersonID { get; set; }

    }
}
