export class OnlineReturn {
  id: number;
  onlineReturnID: string;
  productID: string;
  retailerID: string;
  productNumber: string;
  orderID: string;
  orderNumber: number;
  quantityOfReturn: number;
  productPrice: number;
  purpose: string;
  totalAmount: number;
  creationDateTime: string;
  lastModifiedDateTime: string;

  constructor(ID: number, OnlineReturnID: string, OrderNumber: number, OrderID: string, ProductID: string,
    ProductNumber: string, RetailerID: string, QuantityOfReturn: number, Purpose: string, ProductPrice: number, TotalAmount: number,
    CreationDateTime: string, LastModifiedDateTime: string) {
    this.id = ID;
    this.onlineReturnID = OnlineReturnID;
    this.productID = ProductID;
    this.productNumber = ProductNumber;
    this.orderID = OrderID;
    this.retailerID = RetailerID;
    this.orderNumber = OrderNumber;
    this.quantityOfReturn = QuantityOfReturn;
    this.productPrice = ProductPrice;
    this.purpose = Purpose;
    this.totalAmount = TotalAmount;
    this.creationDateTime = CreationDateTime;
    this.lastModifiedDateTime = LastModifiedDateTime;
  }
}


