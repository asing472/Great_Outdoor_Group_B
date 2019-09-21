using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreatOutdoors.Entities
{
    public class Order
    {
        public static int OrderId = 0;//order id for the retailer
        public DateTime DateOfOrder { get; set; } // date of the order 
        public int CartId { get; set; } //id of the cart
    }
}
