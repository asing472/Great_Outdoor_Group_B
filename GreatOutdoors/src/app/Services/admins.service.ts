import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Admin } from '../Models/admin';

@Injectable({
  providedIn: 'root'
})
export class AdminsService {
  constructor(private httpClient: HttpClient) {
  }

  UpdateProfile(admin: Admin): Observable<boolean> {
    admin.lastModifiedDateTime = new Date().toLocaleDateString();
    return this.httpClient.put<boolean>(`/api/admins`,admin);
  }
  GetAdminByAdminID(AdminID: number): Observable<Admin[]> {
    return this.httpClient.get<Admin[]>(`/api/admins?adminID=${AdminID}`);
  }
  ChangeAdminPassword(admin: Admin): Observable<boolean> {
    admin.lastModifiedDateTime = new Date().toLocaleDateString();
    return this.httpClient.put<boolean>(`/api/admins`, admin);
  }


}
