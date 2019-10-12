import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RetailerHomeComponent } from './retailer-home/retailer-home.component';
import { RetailersProfileComponent} from './retailer-profile/retailer-profile.component'
import { AddressComponent } from './retailer-address/retailer-address.component';
import { OnlineReturnsComponent } from './onlineReturns/onlineReturns.component';
import { OrderComponent } from './order/order.component';
import { OrdersComponent } from './orders/orders.component';


// Create By Prafull Sharma on 08/10/2019
const routes: Routes = [
  { path: "home", component: RetailerHomeComponent },
  { path: "profile", component: RetailersProfileComponent },
  { path: "address", component: AddressComponent },
  { path: "onlineReturns", component: OnlineReturnsComponent },
  { path: "order", component: OrderComponent },
  { path: "orders", component: OrdersComponent },
 // { path: "suppliers", component: SuppliersComponent },
  { path: "**", redirectTo: '/home', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RetailerRoutingModule { }


