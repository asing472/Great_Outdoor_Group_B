export class OrderDetail
{
  id: number;
  ordernumber: number;
  orderDetailID: string;
  orderID: string;
  quantity: number;
  unitPrice: number;
  totalAmount: number;
  creationDateTime: string;
  lastModifiedDateTime: string;
  addressID: string;
  productname: string;

  constructor(ID: number, Ordernumber: number, OrderDetailID: string, OrderID: string, addressID: string, Quantity: number, UnitPrice: number, TotalAmount: number, CreationDateTime: string, LastModifiedDateTime: string, Productname: string)
  {
    this.id = ID;
    this.ordernumber = Ordernumber;
    this.orderDetailID = OrderDetailID;
    this.orderID = OrderID;
    this.quantity = Quantity;
    this.unitPrice = UnitPrice;
    this.totalAmount = TotalAmount;
    this.creationDateTime = CreationDateTime;
    this.lastModifiedDateTime = LastModifiedDateTime;
    this.productname = Productname;
  }
}


