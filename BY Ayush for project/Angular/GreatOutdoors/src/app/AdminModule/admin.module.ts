import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { AdminRoutingModule } from './admin-routing.module';
import { SalesPersonsComponent } from './salesPersons/salesPersons.component';
import { OnlineReturnsComponent } from './onlineReturns/onlineReturns.component';
//import { OnlineReturn } from '../Models/OnlineReturn';


@NgModule({
  declarations: [
    AdminHomeComponent,
    SalesPersonsComponent,
    OnlineReturnsComponent
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
    OnlineReturnsComponent,
    SalesPersonsComponent
  ]
})
export class AdminModule { }

