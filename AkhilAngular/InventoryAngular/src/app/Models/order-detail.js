"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var OrderDetail = /** @class */ (function () {
    function OrderDetail(ID, Ordernumber, OrderDetailID, OrderID, addressID, Quantity, UnitPrice, TotalAmount, CreationDateTime, LastModifiedDateTime, Productname) {
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
    return OrderDetail;
}());
exports.OrderDetail = OrderDetail;
//# sourceMappingURL=order-detail.js.map