export class Order
{
  id: number;
  orderNumber: number;
  orderID: string;
  orderDate: string;
  retailerID: string;
  totalQuantity: number;
  totalAmount: number;
  creationDateTime: string;
  lastModifiedDateTime: string;

  constructor(ID: number, OrderNumber: number, OrderID: string, OrderDate: string, RetailerID: string, TotalQuantity: number, TotalAmount: number, CreationDateTime: string, LastModifiedDateTime: string)
  {
    this.id = ID;
    this.orderNumber = OrderNumber;
    this.orderID = OrderID;
    this.orderDate = OrderDate;
    this.retailerID = RetailerID;
    this.totalQuantity = TotalQuantity;
    this.totalAmount = TotalAmount;
    this.creationDateTime = CreationDateTime;
    this.lastModifiedDateTime = LastModifiedDateTime;
  }
}


