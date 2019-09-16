using System;
using System.Collections.Generic;
using System.Text;

namespace GreatOutdoor.Entities
{
     public class OfflineReturns

    {
        

            private int _offlineReturnID;
            private int _offlineOrderID;
            private int _productID;
            private string _reasonForReturn;
            private double _returnValue;
            private int _returnQuantity;
       
        // Auto implemented Properties
            public int OfflineReturnID { get => _offlineReturnID; set => _offlineReturnID = value; }
            public int OfflineOrderID { get => _offlineOrderID; set => _offlineOrderID = value; }
            public int ProductID { get => _productID; set => _productID = value; }
            public double ReturnValue { get => _returnValue; set => _returnValue = value; }
            public int ReturnQuantity { get => _returnQuantity; set => _returnQuantity = value; }
            public string ReasonForReturn { get => _reasonForReturn; set => _reasonForReturn = value; }
     }
}

