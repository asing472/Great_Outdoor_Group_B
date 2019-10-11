import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './Components/login/login.component';
import { AboutComponent } from './Components/about/about.component';

// Create By Prafull Sharma on 08/10/2019
const routes: Routes = [
  { path: "", redirectTo: "about", pathMatch: "full" },
  { path: "login", component: LoginComponent },
  { path: "about", component: AboutComponent },
  { path: "retailer", loadChildren: () => import("./RetailerModule/retailer.module").then(m => m.RetailerModule) },
  { path: "**", redirectTo: '/about', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { useHash: true })],
  exports: [RouterModule]
})
export class AppRoutingModule { }


