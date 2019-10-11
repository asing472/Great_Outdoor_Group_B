import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { OnlineReturn } from '../Models/OnlineReturn';

@Injectable({
  providedIn: 'root'
})
export class OnlineReturnsService
{
  constructor(private httpClient: HttpClient)
  {
  }

  AddOnlineReturn(onlineReturn: OnlineReturn): Observable<boolean>
  {
    onlineReturn.creationDateTime = new Date().toLocaleDateString();
    onlineReturn.lastModifiedDateTime = new Date().toLocaleDateString();
    onlineReturn.onlineReturnID = this.uuidv4();
    return this.httpClient.post<boolean>(`/api/onlineReturns`, onlineReturn);
  }

  UpdateOnlineReturn(onlineReturn: OnlineReturn): Observable<boolean>
  {
    onlineReturn.lastModifiedDateTime = new Date().toLocaleDateString();
    return this.httpClient.put<boolean>(`/api/onlineReturns`, onlineReturn);
  }

  DeleteOnlineReturn(onlineReturnID: string, id: number): Observable<boolean>
  {
    return this.httpClient.delete<boolean>(`/api/onlineReturns/${id}`);
  }

  GetAllOnlineReturns(): Observable<OnlineReturn[]>
  {
    return this.httpClient.get<OnlineReturn[]>(`/api/onlineReturns`);
  }

  GetOnlineReturnByOnlineReturnID(OnlineReturnID: number): Observable<OnlineReturn>
  {
    return this.httpClient.get<OnlineReturn>(`/api/onlineReturns?onlineReturnID=${OnlineReturnID}`);
  }

  GetOnlineReturnByPurpose(Purpose: string): Observable<OnlineReturn>
  {
    return this.httpClient.get<OnlineReturn>(`/api/onlineReturns?purpose=${Purpose}`);
  }

  GetOnlineReturnByOnlineRetailerID(RetailerID: number): Observable<OnlineReturn>
  {
    return this.httpClient.get<OnlineReturn>(`/api/onlineReturns?retailerID=${RetailerID}`);
  }

  

  uuidv4()
  {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c)
    {
      var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
      return v.toString(16);
    });
  }
}



