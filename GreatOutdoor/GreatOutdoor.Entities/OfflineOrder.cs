using System;
using System.Collections.Generic;
using System.Text;

namespace GreatOutdoor.Entities
{
    public class OfflineOrder
    {
        

        public Guid OfflineOrderID { get ; set; }
        public Guid RetailerID { get; set; }
        public Guid SalespersonID { get; set; }
        public Guid OfflineOrderDetailsID { get; set; }
        public int TotalAmount { get; set; }
        public DateTime DateOfOfflineOrder { get; set; }
        public DateTime LastUpdateOfflineOrder { get; set; }
    }
}
