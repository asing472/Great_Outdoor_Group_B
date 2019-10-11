//back end
import { Injectable } from '@angular/core';
import { InMemoryDbService } from 'angular-in-memory-web-api';
import { Admin } from '../Models/admin';
import { FormGroup } from '@angular/forms';
import { Order } from '../Models/order';
import { OrderDetail } from '../Models/order-detail';

@Injectable({
  providedIn: 'root'
})
export class OrdersDataService implements InMemoryDbService
{
  getFormGroupErrors(newOrderForm: FormGroup): any {
        throw new Error("Method not implemented.");
    }
    
  constructor() { }

  //admin table
  createDb()
  {
    let admins = [
      new Admin(1, '101', 'Admin', 'admin@capgemini.com', 'manager')
    ];

   
   //orders table
    let orders = [
      new Order(1, 1, "401476EE-0A3B-482E-BD5B-B94A32355959", "1/1/2019","401476EE-0A3B-482E-BD5B-B94A32355859",10,1000,"1/1/2019","1/1/2019"),
      new Order(2, 2, "401476EE-0A3B-482E-BD5B-B94A32355955", "5/4/2018", "401476EE-0A3B-482E-BD5B-B94A32358959", 5, 400, "5/4/2018", "5/4/2018")

    ]

    //orderdetails table
    let orderdetails = [
      new OrderDetail(1, 1, "401476EE-0A3B-482E-BD5B-B94A32355949", "401476EE-0A3B-482E-BD5B-B94A32355959", "401476EE-0A3B-482E-BD5B-B94A32355959", 5, 100, 500, "1/1/2019", "1/1/2019","tent"),
      new OrderDetail(2, 1, "401476EE-0A3B-482E-BD5B-B94A32355947", "401476EE-0A3B-482E-BD5B-B94A32355959", "401476EE-0A3B-482E-BD5B-B94A32355959", 4, 50, 200, "1/1/2019", "1/1/2019", "tent"),
      new OrderDetail(3, 1, "401476EE-0A3B-482E-BD5B-B94A32355945", "401476EE-0A3B-482E-BD5B-B94A32355959", "401476EE-0A3B-482E-BD5B-B94A32355959", 1, 300, 300, "1/1/2019", "1/1/2019", "tent"),

      new OrderDetail(4, 2, "401476EE-0A3B-482E-BD5B-B94A32355939", "401476EE-0A3B-482E-BD5B-B94A32355955", "401476EE-0A3B-482E-BD5B-B94A32355959", 4, 50, 200, "5/4/2018", "5/4/2018", "tent"),
      new OrderDetail(5, 2, "401476EE-0A3B-482E-BD5B-B94A32355935", "401476EE-0A3B-482E-BD5B-B94A32355955", "401476EE-0A3B-482E-BD5B-B94A32355959", 1, 300, 300, "5/4/2018", "5/4/2018", "tent"),

    ]

    return { admins, orders, orderdetails };
  }
}


