import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './Components/login/login.component';
import { AboutComponent } from './Components/about/about.component';
import { SignupComponent } from './Components/signup/signup.component'; 
import { AppComponent } from './app.component';
import { MainlogoComponent } from './Components/mainlogo/mainlogo.component'; 


const routes: Routes = [
  { path: "", redirectTo: "main", pathMatch: "full" },
  { path: "main", component: MainlogoComponent },
  { path: "login", component: LoginComponent },
  { path: "about", component: AboutComponent },
  { path: "signup", component: SignupComponent },
  { path: "admin", loadChildren: () => import("./AdminModule/admin.module").then(m => m.AdminModule) },
  { path: "salesPerson", loadChildren: () => import("./SalespersonModule/salesPerson.module").then(m => m.SalesPersonModule) },
  { path: "retailer", loadChildren: () => import("./RetailerModule/retailer.module").then(m => m.RetailerModule) },
  { path: "**", redirectTo: '/main', pathMatch: 'full' },
 
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { useHash: true })],
  exports: [RouterModule]
})
export class AppRoutingModule { }


