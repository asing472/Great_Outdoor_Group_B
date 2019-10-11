import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SalesPersonHomeComponent } from './salesPerson-home/salesPerson-home.component';
import { SalesPersonsComponent } from './salesPersons/salesPersons.component';
import { OnlineReturnsComponent } from './onlineReturns/onlineReturns.component';
import { NewOrderComponent } from './new-order/new-order.component';

const routes: Routes = [
  { path: "home", component: SalesPersonHomeComponent },
  { path: "salesPersons", component: SalesPersonsComponent },
  { path: "onlineReturns", component: OnlineReturnsComponent },
  { path: "neworder", component: NewOrderComponent },
  { path: "**", redirectTo: '/home', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SalesPersonRoutingModule { }


