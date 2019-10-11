import { Injectable } from '@angular/core';
import { InMemoryDbService } from 'angular-in-memory-web-api';
import { Admin } from '../Models/admin';
import { Product } from '../Models/product';

@Injectable({
  providedIn: 'root'
})
export class GreatOutdoorsDataService implements InMemoryDbService {
  constructor() { }

  createDb() {
    let admins = [
      new Admin(1, '101', 'Admin', 'admin_arshpreet@capgemini.com', 'manager')
    ];

    let products = [
      new Product(1, "401476EE-0A3B-482E-BD5B-B94A32355959", "Wallet", "Personal Accessories","brown", "standard", "leather", 800, "10/3/2019", "10/4/2019"),
      new Product(2, "C628855C-FE7A-4D94-A1BB-167157D3F4EA", "Body Wash", "Personal Accessories","lavender", "L", "NA", 500,"9/6/2019", "5/7/2019"),
      new Product(3, "6D68849C-8FA8-4049-A111-B431C76C6548", "Jacket", "Personal Accessories", "navy blue", "XL", "Denim", 2500,"1/5/2017", "15/11/2018"),
      new Product(4, "53E8748F-61D6-494B-BF72-E18B27511EFA", "Tent", "Camping Equipment", "olive green", "L", "polystyrene", 8500,"2/7/2019", "12/1/2019"),
      new Product(5, "5D3034E3-ED22-4C24-9D2B-EEE4B187058E", "Frisbee", "Camping Equipment", "blue", "L", "plastic", 850, "3/7/2012", "8/9/2019"),
      new Product(6, "ED3DCF6D-1A93-4F94-B91C-18546B04DB34", "Sleeping Bag", "Camping Equipment", "green", "L", "tafetta", 5000, "8/1/2002", "8/9/2003"),
      new Product(7, "59D6BD5D-9B05-435F-80DF-74647301B835", "Golf Club", "Golf Equipment", "silver", "standard", "steel", 5000, "12/10/2009", "8/9/2017"),
      new Product(8, "E58BCC33-A90D-43B5-B365-D51CEA3B2A82", "Golf Ball", "Golf Equipment", "white", "standard", "rubber and resin", 1000, "21/9/2010", "8/9/2018"),
      new Product(9, "BB090BE7-6F82-4C90-B89D-E9682D4A10A2", "Push Cart", "Golf Equipment", "black", "standard", "nylon", 4500, "21/9/2010", "8/9/2018"),
      new Product(10, "D1993EE6-1A68-4421-B590-08101550CE23", "Carbon Pair", "Mountaineering Equipment", "grey and blue", "standard", "pyrolitic carbon", 7500, "21/9/2010", "8/9/2018"),
      new Product(11, "1C5D013C-EAE3-45A6-A1B7-B01CAF309AD9", "Rope", "Mountaineering Equipment", "pastel green", "50 m", "nylon", 2000, "21/9/2010", "8/9/2018"),
      new Product(12, "1737F7E9-5828-427D-8A64-519F3BD29020", "Knife", "Mountaineering Equipment", "blue", "standard", "stainless steel", 1500, "21/9/2010", "8/9/2018"),
      new Product(13, "ECA65A9D-0CD4-49FB-BB02-4C670CED9066", "Face-mask", "Outdoor Protection", "black", "standard", "polypropylene", 1500, "21/9/2010", "8/9/2018"),
      new Product(14, "A4164940-E4F2-446A-82FA-E6C01A175B24", "Sunglasses", "Outdoor Protection", "black", "standard", "plastic", 4000, "21/9/2010", "8/9/2018"),
      new Product(15, "1082FE80-37A0-4C23-BFBA-9765B2E6A9B5", "Backpack Cover", "Outdoor Protection", "grey", "L", "polyester", 500, "21/9/2010", "8/9/2018"),
      new Product(16, "EB8C13BC-57BD-46EB-85CD-A0B48877CE12", "Cap", "Personal Accessories", "white", "standard", "cotton", 800, "21/9/2010", "8/9/2018")
    ];

    let suppliers = [];

    let rawmaterials = [];

    let orders = [];

    let orderdetails = [];

    return { admins, products, suppliers, rawmaterials, orders, orderdetails };
  }
}


