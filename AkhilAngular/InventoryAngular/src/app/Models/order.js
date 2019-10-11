"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var Order = /** @class */ (function () {
    function Order(ID, OrderNumber, OrderID, OrderDate, RetailerID, TotalQuantity, TotalAmount, CreationDateTime, LastModifiedDateTime) {
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
    return Order;
}());
exports.Order = Order;
//# sourceMappingURL=order.js.map