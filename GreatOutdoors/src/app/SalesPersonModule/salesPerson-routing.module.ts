import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SalesPersonHomeComponent } from './salesPerson-home/salesPerson-home.component';
import { SalesPersonComponent } from './salesPerson/salesPerson.component';

import { NewOrderComponent } from './new-order/new-order.component';

//Created By Ayush Agrawal on 08 / 10 / 2019
const routes: Routes = [
  { path: "home", component: SalesPersonHomeComponent },
  { path: "salesPersonProfile", component: SalesPersonComponent },
 
  { path: "neworder", component: NewOrderComponent },
  { path: "**", redirectTo: '/home', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SalesPersonRoutingModule { }


