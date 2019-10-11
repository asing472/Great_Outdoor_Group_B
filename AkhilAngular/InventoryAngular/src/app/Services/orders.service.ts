//author: C Akhil Chowdary
//service for order 
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Order } from '../Models/order';

@Injectable({
  providedIn: 'root'
})
export class OrdersService
{
  //constructor to inject httpclient
  constructor(private httpClient: HttpClient)
  {
  }

  //adding order
  AddOrder(order: Order): Observable<boolean>
  {
    order.orderNumber = 5;
    order.orderID = this.uuidv4();
    order.retailerID = "401476EE-0A3B-482E-BD5B-B94A32355859";
    order.creationDateTime = new Date().toLocaleDateString();
    order.lastModifiedDateTime = new Date().toLocaleDateString();
    order.orderDate = new Date().toLocaleDateString();
    return this.httpClient.post<boolean>(`/api/orders`, order);
  }

  //updating order
  UpdateOrder(order: Order): Observable<boolean>
  {
    order.lastModifiedDateTime = new Date().toLocaleDateString();
    return this.httpClient.put<boolean>(`/api/orders`, order);
  }

  //delete order
  DeleteOrder(orderID: string, id: number): Observable<boolean>
  {
    return this.httpClient.delete<boolean>(`/api/orders/${id}`);
  }

  //get all orders
  GetAllOrders(): Observable<Order[]>
  {
    return this.httpClient.get<Order[]>(`/api/orders`);
  }

  //get all orders of a retailer
  GetOrdersByRetailerID(RetailerID: number): Observable<Order>
  {
    return this.httpClient.get<Order>(`/api/orders?retailerID=${RetailerID}`);
  }

  //generate order id
  uuidv4() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
      var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
      return v.toString(16);
    });
  }
}



