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

        public int OfflineOrderID { get => _offlineOrderID; set => _offlineOrderID = value; }
        public int RetailerID { get => _retailerID; set => _retailerID = value; }
        public int SalespersonID { get => _salespersonID; set => _salespersonID = value; }
        public int ProductID { get => _productID; set => _productID = value; }
        public int Quantity { get => _quantity; set => _quantity = value; }
        public int PriceAtOrder { get => _priceAtOrder; set => _priceAtOrder = value; }
        public int TotalAmount { get => _totalAmount; set => _totalAmount = value; }
        public DateTime DateOfOfflineOrder { get => _dateOfOfflineOrder; set => _dateOfOfflineOrder = value; }
    }
}
