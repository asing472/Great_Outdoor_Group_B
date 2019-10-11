import { Injectable } from '@angular/core';
import { InMemoryDbService } from 'angular-in-memory-web-api';
import { Retailer } from '../Models/retailer';
import { Admin } from '../Models/admin';
import { Address } from '../Models/address';
// Create By Prafull Sharma on 08/10/2019
@Injectable({
  providedIn: 'root'
})
export class GreatOutdoorDataService implements InMemoryDbService {
  constructor() { }

  createDb() {
    let admins = [
      new Admin(1, '101', 'Admin', 'admin', 'manager')
    ];

    let retailers = [
      new Retailer(1, "401476EE-0A3B-482E-BD5B-B94A32355959", "Scott", "9876543210", "scott", "Scott123#", "10/3/2019", "10/4/2019"),
      new Retailer(2, "C628855C-FE7A-4D94-A1BB-167157D3F4EA", "Smith", "9988776655", "smith", "Smith123#", "9/6/2019", "5/7/2019"),
      new Retailer(3, "6D68849C-8FA8-4049-A111-B431C76C6548", "Arun", "7781994834", "arun@capgemini.com", "Arun123#", "1/5/2017", "15/11/2018"),
      new Retailer(4, "53E8748F-61D6-494B-BF72-E18B27511EFA", "Jones", "6989493491", "jones@capgemini.com", "Jones123#", "2/7/2019", "12/1/2019")
    ];

    let addresses = [
      new Address(1,"C628855C-FE7A-4D94-A1BB-167157D3F4EA","CKP","Airoli","Thane","Mumbai","Maharastra","407008","401476EE-0A3B-482E-BD5B-B94A32355959","10/3/2019","10/4/2019"),
      new Address(1, "6D68849C-8FA8-4049-A111-B431C76C6548", "Yesomite", "Airoli", "Thane", "Mumbai", "Maharastra", "407008", "401476EE-0A3B-482E-BD5B-B94A32355959", "10/3/2019", "10/4/2019"),
      new Address(1, "53E8748F-61D6-494B-BF72-E18B27511EFA", "Andheri", "Airoli", "Thane", "Mumbai", "Maharastra", "407008", "401476EE-0A3B-482E-BD5B-B94A32355959", "10/3/2019", "10/4/2019"),

    ];
    return { admins, retailers,addresses };
  }
}


