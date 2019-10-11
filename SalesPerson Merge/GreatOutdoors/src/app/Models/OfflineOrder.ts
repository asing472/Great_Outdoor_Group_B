export class OfflineOrder {
  id: number;
  offlineorderID: string;
  offlineorderDate: string;
  retailerID: string;
  salespersonID : string
  totalQuantity: number;
  totalAmount: number;
  creationDateTime: string;
  lastModifiedDateTime: string;

  constructor(ID: number, OrderID: string, OrderDate: string, RetailerID: string, SalesPersonID:string, TotalQuantity: number, TotalAmount: number, CreationDateTime: string, LastModifiedDateTime: string) {
    this.id = ID;
    this.offlineorderID = OrderID;
    this.offlineorderDate = OrderDate;
    this.retailerID = RetailerID;
    this.salespersonID = SalesPersonID;
    this.totalQuantity = TotalQuantity;
    this.totalAmount = TotalAmount;
    this.creationDateTime = CreationDateTime;
    this.lastModifiedDateTime = LastModifiedDateTime;
  }
}
