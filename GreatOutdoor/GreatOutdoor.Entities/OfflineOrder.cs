using System;
using System.Collections.Generic;
using System.Text;

namespace GreatOutdoor.Entities
{
    public class OfflineOrder
    {
        private int _offlineOrderID;
        private int _retailerID;
        private int _salespersonID;
        private int _productID;          
        private int _quantity;     
        private int _priceAtOrder;       
        private int _totalAmount;         
        private DateTime _dateOfOfflineOrder;

        public Guid OfflineOrderID { get ; set; }
        public Guid RetailerID { get; set; }
        public Guid SalespersonID { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public int PriceAtOrder { get; set; }
        public int TotalAmount { get; set; }
        public DateTime DateOfOfflineOrder { get; set; }
        public DateTime LastUpdateOfflineOrder { get; set; }
    }
}
