import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { SalesPersonHomeComponent } from './salesPerson-home/salesPerson-home.component';
import { SalesPersonRoutingModule } from './salesPerson-routing.module';
import { SalesPersonsComponent } from './salesPersons/salesPersons.component';
import { OnlineReturnsComponent } from './onlineReturns/onlineReturns.component';
import { NewOrderComponent } from './new-order/new-order.component';
//import { OnlineReturn } from '../Models/OnlineReturn';


@NgModule({
  declarations: [
    SalesPersonHomeComponent,
    SalesPersonsComponent,
    OnlineReturnsComponent,
    NewOrderComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    SalesPersonRoutingModule

  ],
  exports: [
    SalesPersonRoutingModule,
    SalesPersonHomeComponent,
    OnlineReturnsComponent,
    SalesPersonsComponent,
    NewOrderComponent
  ]
})
export class SalesPersonModule { }

