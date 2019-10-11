import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { OfflineOrder } from '../Models/OfflineOrder';

@Injectable({
  providedIn: 'root'
})
export class OfflineOrdersService {
  constructor(private httpClient: HttpClient) {
  }

  AddOrder(offlineorder: OfflineOrder): Observable<boolean> {
    offlineorder.creationDateTime = new Date().toLocaleDateString();
    offlineorder.lastModifiedDateTime = new Date().toLocaleDateString();
    offlineorder.offlineorderID = this.uuidv4();
    offlineorder.salespersonID = "B264DF21-062A-43A8-B18A-ECE25AC7682F";
    return this.httpClient.post<boolean>(`/api/offlineorders`, offlineorder);
  }

  UpdateOrder(offlineorder: OfflineOrder): Observable<boolean> {
    offlineorder.lastModifiedDateTime = new Date().toLocaleDateString();
    return this.httpClient.put<boolean>(`/api/offlineorders`, offlineorder);
  }

  DeleteOrder(offlineorderID: string, id: number): Observable<boolean> {
    return this.httpClient.delete<boolean>(`/api/offlineorders/${id}`);
  }

  GetAllOrders(): Observable<OfflineOrder[]> {
    return this.httpClient.get<OfflineOrder[]>(`/api/offlineorders`);
  }

  GetOrderByOrderID(OrderID: number): Observable<OfflineOrder> {
    return this.httpClient.get<OfflineOrder>(`/api/offlineorders?offlineorderID=${OrderID}`);
  }

  uuidv4() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
      var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
      return v.toString(16);
    });
  }
}



