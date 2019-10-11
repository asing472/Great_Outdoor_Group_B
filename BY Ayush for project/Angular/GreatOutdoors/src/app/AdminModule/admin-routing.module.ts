import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { SalesPersonsComponent } from './salesPersons/salesPersons.component';
import { OnlineReturnsComponent } from './onlineReturns/onlineReturns.component';

const routes: Routes = [
  { path: "home", component: AdminHomeComponent },
  { path: "salesPersons", component: SalesPersonsComponent },
  { path: "onlineReturns", component: OnlineReturnsComponent },
  { path: "**", redirectTo: '/home', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }


