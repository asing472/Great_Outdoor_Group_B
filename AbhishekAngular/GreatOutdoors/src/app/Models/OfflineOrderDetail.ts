export class OfflineOrderDetail {
  id: number;
  offlineorderDetaiID: string;
  offlineorderID: string;
  productID: string;
  quantity: number;
  unitPrice: number;
  totalAmount: number;
  creationDateTime: string;
  lastModifiedDateTime: string;

  constructor(ID: number, OfflineOrderDetailID: string, OfflineOrderID: string, ProductID: string, Quantity: number, UnitPrice: number, TotalAmount: number, CreationDateTime: string, LastModifiedDateTime: string) {
    this.id = ID;
    this.offlineorderDetaiID = OfflineOrderDetailID;
    this.offlineorderID = OfflineOrderID;
    this.productID = ProductID;
    this.quantity = Quantity;
    this.unitPrice = UnitPrice;
    this.totalAmount = TotalAmount;
    this.creationDateTime = CreationDateTime;
    this.lastModifiedDateTime = LastModifiedDateTime;
  }
}
