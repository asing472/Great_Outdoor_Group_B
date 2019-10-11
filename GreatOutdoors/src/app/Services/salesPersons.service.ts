import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { SalesPerson } from '../Models/salesPerson';

@Injectable({
  providedIn: 'root'
})
export class SalesPersonsService
{
  constructor(private httpClient: HttpClient)
  {
  }

  AddSalesPerson(salesPerson: SalesPerson): Observable<boolean>
  {
    salesPerson.creationDateTime = new Date().toLocaleDateString();
    salesPerson.lastModifiedDateTime = new Date().toLocaleDateString();
    salesPerson.salesPersonID = this.uuidv4();
    return this.httpClient.post<boolean>(`/api/salesPersons`, salesPerson);
  }

  UpdateSalesPerson(salesPerson: SalesPerson): Observable<boolean>
  {
    salesPerson.lastModifiedDateTime = new Date().toLocaleDateString();
    return this.httpClient.put<boolean>(`/api/salesPersons`, salesPerson);
  }

  DeleteSalesPerson(salesPersonID: string, id: number): Observable<boolean>
  {
    return this.httpClient.delete<boolean>(`/api/salesPersons/${id}`);
  }

  GetAllSalesPersons(): Observable<SalesPerson[]>
  {
    return this.httpClient.get<SalesPerson[]>(`/api/salesPersons`);
  }

  GetSalesPersonBySalesPersonID(SalesPersonID: number): Observable<SalesPerson>
  {
    return this.httpClient.get<SalesPerson>(`/api/salesPersons?salesPersonID=${SalesPersonID}`);
  }

  GetSalesPersonsBySalesPersonName(SalesPersonName: string): Observable<SalesPerson[]>
  {
    return this.httpClient.get<SalesPerson[]>(`/api/salesPersons?salesPersonName=${SalesPersonName}`);
  }

  GetSalesPersonByEmail(Email: string): Observable<SalesPerson>
  {
    return this.httpClient.get<SalesPerson>(`/api/salesPersons?email=${Email}`);
  }

  GetSalesPersonByEmailAndPassword(Email: string, Password: string): Observable<SalesPerson>
  {
    return this.httpClient.get<SalesPerson>(`/api/salesPersons?email=${Email}&password=${Password}`);
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



