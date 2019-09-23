using System;
using System.Collections.Generic;
using System.Text;

namespace GreatOutdoor.Entities
{
    public class OfflineReturnDetails
    {
        public Guid OfflineReturnDetailsID { get; set; } 
        public int ProductID { get; set; }
        public int ReturnQuantity { get; set; }
        public string ReasonForReturn { get; set; }
    }
}
