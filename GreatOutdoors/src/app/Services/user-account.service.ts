import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from '../Models/user';
import { GreatOutdoorDataService } from 'src/app/InMemoryWebAPIServices/GreatOutdoor-data.service';


@Injectable({
  providedIn: 'root'
})
export class UserAccountService
{
  currentUser: User;
  isLoggedIn: boolean;
  currentUserType: string;
    currentUserID: any;

  constructor(private httpClient: HttpClient)
  {
    this.currentUser = new User(null, null);
    this.isLoggedIn = false;
    this.currentUserType = null;
    this.currentUserID = null;
  }

  authenticate(email: string, password: string,Usertype: string): Observable<any>
  {
    //debugger;
    if (Usertype == "Admin")
    {
      return this.httpClient.get(`/api/admins?password=${password}`);
    }
    else if (Usertype == "SalesPerson")
    {
    return this.httpClient.get(`/api/salesPersons?password=${password}`);
    }
    else if (Usertype == "Retailer")
    {
      return this.httpClient.get(`/api/retailers?password=${password}`);
   }
    
  }
  
}



