import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { RetailerHomeComponent } from './retailer-home/retailer-home.component';
//import { SuppliersComponent } from './suppliers/suppliers.component';
import { RetailerRoutingModule } from './retailer-routing.module';
import { RetailersProfileComponent } from './retailer-profile/retailer-profile.component';
import { AddressComponent } from './retailer-address/retailer-address.component';
// Create By Prafull Sharma on 08/10/2019
@NgModule({
  declarations: [
    RetailerHomeComponent,
    RetailersProfileComponent,
    AddressComponent
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
    RetailersProfileComponent,
    AddressComponent
    //SuppliersComponent
  ]
})
export class RetailerModule { }

