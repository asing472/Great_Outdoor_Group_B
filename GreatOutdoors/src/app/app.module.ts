import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import { RetailerModule } from './RetailerModule/retailer.module';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { environment } from '../environments/environment.prod';
import { HttpClientInMemoryWebApiModule } from 'angular-in-memory-web-api';
import { AboutComponent } from './Components/about/about.component';
import { LoginComponent } from './Components/login/login.component';
import { MainlogoComponent } from './Components/mainlogo/mainlogo.component';
import { AdminModule } from './AdminModule/admin.module'; 
import { SignupComponent } from './Components/signup/signup.component';
import { SalesPersonModule } from './SalesPersonModule/salesPerson.module';
import { GreatOutdoorDataService } from './InMemoryWebAPIServices/GreatOutdoor-data.service';

@NgModule({
  declarations: [
    AppComponent,
    AboutComponent,
    LoginComponent,
    SignupComponent,
    MainlogoComponent,
   

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    environment.production ? HttpClientInMemoryWebApiModule.forRoot(GreatOutdoorDataService, { delay: 1000 }) : [],
    AdminModule,
    RetailerModule,
    SalesPersonModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

