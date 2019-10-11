import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { OrderComponent } from './neworder/order.component';
import { OrdersComponent } from './orders/orders.component';

const routes: Routes = [
  { path: "home", component: AdminHomeComponent },
  { path: "order", component: OrderComponent },
  { path: "orders", component: OrdersComponent },
  { path: "**", redirectTo: '/home', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }


