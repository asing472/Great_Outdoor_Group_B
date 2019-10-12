import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { SalesPersonsComponent } from './salesPersons/salesPersons.component';
import { AdminRoutingModule } from './admin-routing.module';
import { YourprofileComponent } from './yourprofile/yourprofile.component';
import { ProductsComponent } from './products/products.component';



@NgModule({
  declarations: [
    AdminHomeComponent,
    SalesPersonsComponent,
    ProductsComponent,
    YourprofileComponent,
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    AdminRoutingModule
  ],
  exports: [
    AdminRoutingModule,
    AdminHomeComponent,
    SalesPersonsComponent,
    ProductsComponent,
    YourprofileComponent,
  ]
})
export class AdminModule { }

