using System;
using System.Collections.Generic;
using System.Text;

namespace GreatOutdoor.Entities
{
    public class OfflineOrderDetails
    {
        public Guid OfflineOrderDetailsID { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public int PriceAtOrder { get; set; }
    }
}
