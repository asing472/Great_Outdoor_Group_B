import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { OfflineOrderDetail } from '../Models/OfflineOrderDetail';

@Injectable({
  providedIn: 'root'
})
export class OfflineOrderDetailsService {
  constructor(private httpClient: HttpClient) {
  }

  AddOfflineOrderDetail(offlineorderdetail: OfflineOrderDetail): Observable<boolean> {
    offlineorderdetail.creationDateTime = new Date().toLocaleDateString();
    offlineorderdetail.lastModifiedDateTime = new Date().toLocaleDateString();
    offlineorderdetail.offlineorderDetaiID = this.uuidv4();
    return this.httpClient.post<boolean>(`/api/offlineorderdetails`, offlineorderdetail);
  }

  UpdateOfflineOrderDetail(offlineorderdetail: OfflineOrderDetail): Observable<boolean> {
    offlineorderdetail.lastModifiedDateTime = new Date().toLocaleDateString();
    return this.httpClient.put<boolean>(`/api/offlineorderdetails`, offlineorderdetail);
  }

  DeleteOfflineOrderDetail(orderDetailID: string, id: number): Observable<boolean> {
    return this.httpClient.delete<boolean>(`/api/offlineorderdetails/${id}`);
  }

  GetAllOfflineOrderDetails(): Observable<OfflineOrderDetail[]> {
    return this.httpClient.get<OfflineOrderDetail[]>(`/api/offlineorderdetails`);
  }

  GetOfflineOrderDetailByOfflineOrderDetailID(OfflineOrderDetailID: number): Observable<OfflineOrderDetail> {
    return this.httpClient.get<OfflineOrderDetail>(`/api/offlineorderdetails?offlineorderdetailID=${OfflineOrderDetailID}`);
  }

  GetOfflineOrderDetailByOfflineOrderID(OfflineOrderID: number): Observable<OfflineOrderDetail> {
    return this.httpClient.get<OfflineOrderDetail>(`/api/offlineorderdetails?orderID=${OfflineOrderID}`);
  }

  uuidv4() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
      var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
      return v.toString(16);
    });
  }
}



