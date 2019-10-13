import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { SalesPersonsComponent } from './salesPersons/salesPersons.component';
import { YourprofileComponent } from './yourprofile/yourprofile.component';
import { ProductsComponent } from './products/products.component';
import { RetailersComponent } from './retailers/retailers.component';

const routes: Routes = [
  { path: "home", component: AdminHomeComponent },
  { path: "salesPersons", component: SalesPersonsComponent },
  { path: "retailers", component: RetailersComponent },
  { path: "yourprofile", component: YourprofileComponent },
  { path: "products", component: ProductsComponent },
  { path: "**", redirectTo: '/home', pathMatch: 'full' },  
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }


