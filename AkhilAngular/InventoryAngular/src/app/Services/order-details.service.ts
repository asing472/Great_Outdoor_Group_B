//author: C Akhil Chowdary
//service for order details
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { OrderDetail } from '../Models/order-detail';

@Injectable({
  providedIn: 'root'
})
export class OrderDetailsService {

  //constructor to inject httpclient
  constructor(private httpClient: HttpClient) {
  }

  //adding orderdetails
  AddOrderDetail(orderDetail: OrderDetail): Observable<boolean> {
    orderDetail.creationDateTime = new Date().toLocaleDateString();
    orderDetail.lastModifiedDateTime = new Date().toLocaleDateString();
    orderDetail.orderDetailID = this.uuidv4();
    return this.httpClient.post<boolean>(`api.orderdetails`, orderDetail);
    //return this.httpClient.post<boolean>(`/api/suppliers`, supplier);
  }

  //updating orderdetails
  UpdateOrderDetail(orderDetail: OrderDetail): Observable<boolean> {
    orderDetail.lastModifiedDateTime = new Date().toLocaleDateString();
    return this.httpClient.put<boolean>(`api.orderdetails`, orderDetail);
  }

  //deleting orderdetails
  DeleteOrderDetail(orderDetailID: string, id: number): Observable<boolean> {
    return this.httpClient.delete<boolean>(`/api/orderdetails/${id}`);
  }

  //get orderdetails by order id
  GetOrderDetailsByOrderID(OrderID: string): Observable<OrderDetail[]> {
    return this.httpClient.get<OrderDetail[]>(`/api/orderdetails?orderID=${OrderID}`);
  }

  //get current orderdetails
  GetOrderDetails() : Observable<OrderDetail[]> {
    return this.httpClient.get<OrderDetail[]>(`/api/orderdetails`);
  }

  //generate orderdetail id
  uuidv4() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
      var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
      return v.toString(16);
    });
  }
}
