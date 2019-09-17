using System;
using System.Collections.Generic;
using System.Text;

namespace GreatOutdoor.Entities
{
     public class OfflineReturns

    {
        

            // Auto implemented Properties
            public int OfflineReturnID { get ; set ; }
            public int OfflineOrderID { get; set; }
            public int ProductID { get; set; }
            public double ReturnValue { get; set; }
            public int ReturnQuantity { get; set; }
            public string ReasonForReturn { get; set; }
     }
}

