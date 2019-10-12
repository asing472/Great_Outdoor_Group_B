import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { RetailerHomeComponent } from './retailer-home/retailer-home.component';
//import { SuppliersComponent } from './suppliers/suppliers.component';
import { RetailerRoutingModule } from './retailer-routing.module';
import { RetailersProfileComponent } from './retailer-profile/retailer-profile.component';
import { AddressComponent } from './retailer-address/retailer-address.component';
import { OnlineReturnsComponent } from './onlineReturns/onlineReturns.component';
import { OrderComponent } from './order/order.component';
import { OrdersComponent } from './orders/orders.component';


// Create By Prafull Sharma on 08/10/2019
@NgModule({
  declarations: [
    RetailerHomeComponent,
    RetailersProfileComponent,
    AddressComponent,
    OnlineReturnsComponent,
    OrderComponent,
    OrdersComponent
    //SuppliersComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    RetailerRoutingModule

  ],
  exports: [
    RetailerRoutingModule,
    RetailerHomeComponent,
    OnlineReturnsComponent,
    RetailersProfileComponent,
    AddressComponent,
    OrderComponent
    //SuppliersComponent
  ]
})
export class RetailerModule { }

