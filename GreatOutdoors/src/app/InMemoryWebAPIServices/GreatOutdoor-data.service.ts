import { Injectable } from '@angular/core';
import { InMemoryDbService } from 'angular-in-memory-web-api';
import { SalesPerson } from '../Models/salesPerson';
import { Admin } from '../Models/admin';
import { Retailer } from '../Models/retailer';
import { OnlineReturn } from '../Models/OnlineReturn';
import { Product } from '../Models/product';
import { Order } from '../Models/order';
import { OrderDetail } from '../Models/order-detail';
import { Address } from '../Models/address';


@Injectable({
  providedIn: 'root'
})
export class GreatOutdoorDataService implements InMemoryDbService
{
  constructor() { }

  createDb()
  {
    let admins = [
      new Admin(1, '101', "Admin", "admin@capgemini.com", "Manager12*","10/3/2018","10/4/2018")
    ];

    let addresses = [
      new Address(1, "C628855C-FE7A-4D94-A1BB-167157D3F4EA", "CKP", "Airoli", "Thane", "Mumbai", "Maharastra", "407008", "6D68849C-8FA8-4049-A111-B431C76C6548", "10/3/2019", "10/4/2019"),
      new Address(1, "6D68849C-8FA8-4049-A111-B431C76C6548", "Yesomite", "Airoli", "Thane", "Mumbai", "Maharastra", "407008", "6D68849C-8FA8-4049-A111-B431C76C6548", "10/3/2019", "10/4/2019"),
      new Address(1, "53E8748F-61D6-494B-BF72-E18B27511EFA", "Andheri", "Airoli", "Thane", "Mumbai", "Maharastra", "407008", "6D68849C-8FA8-4049-A111-B431C76C6548", "10/3/2019", "10/4/2019"),

    ];

    let salesPersons = [
      new SalesPerson(1, "401476EE-0A3B-482E-BD5B-B94A32355959", "Scott", "9876543210", "scott@capgemini.com", "Scott123#", "10/3/2019", "10/4/2019"),
      new SalesPerson(2, "C628855C-FE7A-4D94-A1BB-167157D3F4EA", "Smith", "9988776655", "smith@capgemini.com", "Smith123#", "9/6/2019", "5/7/2019"),
      new SalesPerson(3, "C638855C-FE7A-4D94-A1BB-167157D3F4EA", "Shyam", "9988676655", "shyam@capgemini.com", "Shyam123#", "9/6/2019", "5/7/2019"),

    ];
    let retailers = [
      new Retailer(1, "6D68849C-8FA8-4049-A111-B431C76C6548", "Arun", "7781994834", "arun@capgemini.com", "Arun123#", "1/5/2017", "15/11/2018"),
      new Retailer(4, "53E8748F-61D6-494B-BF72-E18B27511EFA", "Jones", "6989493491", "jones@capgemini.com", "Jones123#", "2/7/2019", "12/1/2019")
    ];
    let onlineReturns = [
      new OnlineReturn(1, "5D6034E3-ED22-4C24-9D2B-EEE4B187058E", 1, "3E4B9A36-134A-4E18-9BC1-19D32647FCAB", "FFF846FF-77FC-4D43-B305-D2E2B7C9582C", "1000", "BD10F309-47A0-4893-99F5-BCD08ADDF8D2", 20, "DefectiveProduct", 1000, 20000, "3/7/2012", "8/9/2019"),
      new OnlineReturn(2, "5D3934E3-ED22-4C24-9D2B-EEE4B187058E", 2, "3E490A36-134A-4E18-9BC1-19D32647FCAB", "FFF946FF-77FC-4D43-B305-D2E2B7C9582C", "1000", "BD10F308-47A0-4893-99F5-BCD08ADDF8D2", 30, "DefectiveProduct", 1000, 20000, "3/7/2011", "8/9/2019"),
      new OnlineReturn(3, "5D3034E3-ED22-4C24-9D2B-EEE4B187058E", 3, "3E4B7A36-134A-4E18-9BC1-19D32647FCAB", "FFF346FF-77FC-4D43-B305-D2E2B7C9582C", "1000", "BD10F307-47A0-4893-99F5-BCD08ADDF8D2", 40, "WrongProductshipped", 1000, 20000, "3/8/2012", "8/9/2019"),
      new OnlineReturn(4, "6D3034E3-ED22-4C24-9D2B-EEE4B187058E", 4, "3E3B3A36-134A-4E18-9BC1-19D32647FCAB", "FFF546FF-77FC-4D43-B305-D2E2B7C9582D", "2000", "BD10F304-47A0-4893-99F5-BCD08ADDF8E2", 50, "WrongProductOrdered", 1000, 30000, "3/7/2012", "8/9/2019"),

    ];
    let products = [
      new Product(1, "403476EE-0A3B-482E-BD5B-B94A32355959", "Wallet", "Personal Accessories", "brown", "standard", "leather", 800, "10/3/2019", "10/4/2019"),
      new Product(2, "C638855C-FE7A-4D94-A1BB-167157D3F4EA", "Body Wash", "Personal Accessories", "lavender", "L", "NA", 500, "9/6/2019", "5/7/2019"),
      new Product(3, "6D48849C-8FA8-4049-A111-B431C76C6548", "Jacket", "Personal Accessories", "navy blue", "XL", "Denim", 2500, "1/5/2017", "15/11/2018"),
      new Product(4, "5348748F-61D6-494B-BF72-E18B27511EFA", "Tent", "Camping Equipment", "olive green", "L", "polystyrene", 8500, "2/7/2019", "12/1/2019"),
      new Product(5, "5D5034E3-ED22-4C24-9D2B-EEE4B187058E", "Frisbee", "Camping Equipment", "blue", "L", "plastic", 850, "3/7/2012", "8/9/2019"),
      new Product(6, "ED6DCF6D-1A93-4F94-B91C-18546B04DB34", "Sleeping Bag", "Camping Equipment", "green", "L", "tafetta", 5000, "8/1/2002", "8/9/2003"),
      new Product(7, "59D7BD5D-9B05-435F-80DF-74647301B835", "Golf Club", "Golf Equipment", "silver", "standard", "steel", 5000, "12/10/2009", "8/9/2017"),
      new Product(8, "E59BCC33-A90D-43B5-B365-D51CEA3B2A82", "Golf Ball", "Golf Equipment", "white", "standard", "rubber and resin", 1000, "21/9/2010", "8/9/2018"),
      new Product(9, "BB490BE7-6F82-4C90-B89D-E9682D4A10A2", "Push Cart", "Golf Equipment", "black", "standard", "nylon", 4500, "21/9/2010", "8/9/2018"),
      new Product(10, "D5993EE6-1A68-4421-B590-08101550CE23", "Carbon Pair", "Mountaineering Equipment", "grey and blue", "standard", "pyrolitic carbon", 7500, "21/9/2010", "8/9/2018"),
      new Product(11, "1C7D013C-EAE3-45A6-A1B7-B01CAF309AD9", "Rope", "Mountaineering Equipment", "pastel green", "50 m", "nylon", 2000, "21/9/2010", "8/9/2018"),
      new Product(12, "1737F7E9-5828-427D-8A64-519F3BD29020", "Knife", "Mountaineering Equipment", "blue", "standard", "stainless steel", 1500, "21/9/2010", "8/9/2018"),
      new Product(13, "ECA65A9D-0CD4-49FB-BB02-4C670CED9066", "Face-mask", "Outdoor Protection", "black", "standard", "polypropylene", 15000, "21/9/2010", "8/9/2018"),
      new Product(14, "A4164940-E4F2-446A-82FA-E6C01A175B24", "Sunglasses", "Outdoor Protection", "black", "standard", "plastic", 4000, "21/9/2010", "8/9/2018"),
      new Product(15, "1082FE80-37A0-4C23-BFBA-9765B2E6A9B5", "Backpack Cover", "Outdoor Protection", "grey", "L", "polyester", 500, "21/9/2010", "8/9/2018"),
      new Product(16, "EB8C13BC-57BD-46EB-85CD-A0B48877CE12", "Cap", "Personal Accessories", "white", "standard", "cotton", 800, "21/9/2010", "8/9/2018")
    ];
    //orders table
    let orders = [
      new Order(1, 1, "401476EE-0A3B-482E-BD5B-B94A32355959", "1/1/2019", "401476EE-0A3B-482E-BD5B-B94A32355859", 10, 1000, "1/1/2019", "1/1/2019"),
      new Order(2, 2, "401476EE-0A3B-482E-BD5B-B94A32355955", "5/4/2018", "401476EE-0A3B-482E-BD5B-B94A32358959", 5, 400, "5/4/2018", "5/4/2018")

    ];

    //orderdetails table
    let orderdetails = [
      
    ];
    let offlineorders = [];

    let offlineorderdetails = [
    ];


    return { admins, addresses, salesPersons,orders,orderdetails, offlineorders, offlineorderdetails, retailers,onlineReturns,products };
  }
}


