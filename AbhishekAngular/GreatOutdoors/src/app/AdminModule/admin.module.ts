import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { AdminRoutingModule } from './admin-routing.module';
import { NewOrderComponent } from './new-order/new-order.component';

@NgModule({
  declarations: [
    AdminHomeComponent,
    NewOrderComponent
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
    NewOrderComponent
  ]
})
export class AdminModule { }

