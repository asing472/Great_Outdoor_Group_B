using System;
using System.Collections.Generic;
using System.Text;

namespace GreatOutdoor.Entities
{
     public class OfflineReturn

    {
        

            // Auto implemented Properties
            public Guid OfflineReturnID { get ; set ; }
            public Guid OfflineOrderID { get; set; }
            public Guid OfflineReturnDetailsID { get; set; }
            public double ReturnValue { get; set; }
            public DateTime DateOfOfflineReturn { get; set; }


     }
}

