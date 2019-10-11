import { Injectable } from '@angular/core';
import { InMemoryDbService } from 'angular-in-memory-web-api';
import { SalesPerson } from '../Models/salesPerson';
import { Admin } from '../Models/admin';
import { OnlineReturn } from '../Models/OnlineReturn';

@Injectable({
  providedIn: 'root'
})
export class GreatOutdoorsDataService implements InMemoryDbService {
  constructor() { }

  createDb() {
    let admins = [
      new Admin(1, '101', 'Admin', 'admin', 'manager')
    ];

    let salesPersons = [
      new SalesPerson(1, "401476EE-0A3B-482E-BD5B-B94A32355959", "Scott", "9876543210", "scott", "Scott123#", "10/3/2019", "10/4/2019"),
      new SalesPerson(2, "C628855C-FE7A-4D94-A1BB-167157D3F4EA", "Smith", "9988776655", "smith", "Smith123#", "9/6/2019", "5/7/2019"),
      new SalesPerson(3, "6D68849C-8FA8-4049-A111-B431C76C6548", "Arun", "7781994834", "arun@capgemini.com", "Arun123#", "1/5/2017", "15/11/2018"),
      new SalesPerson(4, "53E8748F-61D6-494B-BF72-E18B27511EFA", "Jones", "6989493491", "jones@capgemini.com", "Jones123#", "2/7/2019", "12/1/2019")
    ];

    let onlineReturns = [
      new OnlineReturn(1, "5D3034E3-ED22-4C24-9D2B-EEE4B187058E", 100, "3E4B0A36-134A-4E18-9BC1-19D32647FCAB", "FFF546FF-77FC-4D43-B305-D2E2B7C9582C", "1000","BD10F304-47A0-4893-99F5-BCD08ADDF8D2", 20, "DefectiveProduct", 1000,  20000,  "3/7/2012", "8/9/2019"),
      new OnlineReturn(1, "6D3034E3-ED22-4C24-9D2B-EEE4B187058E", 200, "3E3B0A36-134A-4E18-9BC1-19D32647FCAB", "FFF546FF-77FC-4D43-B305-D2E2B7C9582D", "2000", "BD10F304-47A0-4893-99F5-BCD08ADDF8E2", 30, "WrongProduct", 1000, 30000, "3/7/2012", "8/9/2019"),

    ];

    return { admins, salesPersons, onlineReturns};
  }
}


