import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from '../Models/user';
// Create By Prafull Sharma on 08/10/2019
@Injectable({
  providedIn: 'root'
})
  //User Account Class
export class UserAccountService {
  currentUser: User;
  currentUserID: string;
  id: number;
  isLoggedIn: boolean;
  currentUserType: string;

  constructor(private httpClient: HttpClient) {
    this.currentUser = new User(null, null);
    this.isLoggedIn = false;
    this.currentUserID = null;
    this.currentUserType = null;
  }

  authenticate(email: string, password: string): Observable<any> {
    //return this.httpClient.get(`/api/admins?email=${email}&password=${password}`);
    return this.httpClient.get(`/api/retailers?password=${password}`);
  }
}



