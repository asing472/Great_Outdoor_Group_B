using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreatOutdoors.Entities
{
    class Cart
    {
        public int CartId { get; set; } //id of the cart
        public int AddressID { get; set; } //address id of the retailer 
        public int RetailerID { get; set; } //id of the retailer
        public int ProductID { get; set; } //id of the product
        public int Quantity { get; set; } //quantity of the product ordererd
        public int PriceAtOrder { get; set; } //cost of the product while ordering
        public int TotalAmount { get; set; } //cart value
       
    }
}
