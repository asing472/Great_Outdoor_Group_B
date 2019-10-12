import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { SalesPersonHomeComponent } from './salesPerson-home/salesPerson-home.component';
import { SalesPersonRoutingModule } from './salesPerson-routing.module';
import { SalesPersonComponent } from './salesPerson/salesPerson.component';

import { NewOrderComponent } from './new-order/new-order.component';
//import { OnlineReturn } from '../Models/OnlineReturn';

//Created By Ayush Agrawal on 08 / 10 / 2019

@NgModule({
  declarations: [
    SalesPersonHomeComponent,
    SalesPersonComponent,
    
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
  
    SalesPersonComponent,
    NewOrderComponent
  ]
})
export class SalesPersonModule { }

