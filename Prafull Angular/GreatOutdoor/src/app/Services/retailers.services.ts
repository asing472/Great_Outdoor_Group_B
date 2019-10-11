import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Retailer } from '../Models/retailer';

// Create By Prafull Sharma on 08/10/2019
@Injectable({
  providedIn: 'root'
})
  //Retailer Service Class
export class RetailersService {
  constructor(private httpClient: HttpClient) {
  }
  // Add Retailer To Database
  //Take Reatiler as Input
  AddRetailer(retailer: Retailer): Observable<boolean> {
    retailer.creationDateTime = new Date().toLocaleDateString();
    retailer.lastModifiedDateTime = new Date().toLocaleDateString();
    retailer.retailerID = this.uuidv4();
    return this.httpClient.post<boolean>(`/api/retailers`, retailer);
  }

  //Update Retailer to DataBase
  //Take Retailer as Input
  UpdateRetailer(retailer: Retailer): Observable<boolean> {
    retailer.lastModifiedDateTime = new Date().toLocaleDateString();
    return this.httpClient.put<boolean>(`/api/retailers`, retailer);
  }

  ChangeRetailerPassword(retailer: Retailer): Observable<boolean> {
    retailer.lastModifiedDateTime = new Date().toLocaleDateString();
    return this.httpClient.put<boolean>(`/api/retailers`, retailer);
  }

  //Delete Retailer Method
  DeleteRetailer(retailerID: string, id: number): Observable<boolean> {
    return this.httpClient.delete<boolean>(`/api/retailers/${id}`);
  }

  //Get All Retailers Method
  GetAllRetailers(): Observable<Retailer[]> {
    return this.httpClient.get<Retailer[]>(`/api/retailers`);
  }

  //Get Retailer By Retailer ID
  GetRetailerByRetailerID(RetailerID: string): Observable<Retailer[]> {
    return this.httpClient.get<Retailer[]>(`/api/retailers?retailerID=${RetailerID}`);
  }

  //Retailer By Retailer ID
  GetRetailerByID(id: number): Observable<Retailer[]> {
    return this.httpClient.get<Retailer[]>(`/api/retailers?retailerID=${id}`);
  }

  //Get Retailer By Retailer Name Method
  GetRetailersByRetailerName(RetailerName: string): Observable<Retailer[]> {
    return this.httpClient.get<Retailer[]>(`/api/retailers?retailerName=${RetailerName}`);
  }

  // Get Retailr By Email
  GetRetailerByEmail(Email: string): Observable<any> {
    return this.httpClient.get<Retailer>(`/api/retailers?email=${Email}`);
  }

  // Get Retailer By User ID and Password
  GetRetailerByEmailAndPassword(Email: string, Password: string): Observable<Retailer> {
    return this.httpClient.get<Retailer>(`/api/retailers?email=${Email}&password=${Password}`);
  }

  // Creating a new GUID
  uuidv4() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
      var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
      return v.toString(16);
    });
  }
}



