import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { environment } from '../environments/environment.prod';
import { HttpClientInMemoryWebApiModule } from 'angular-in-memory-web-api';
import { AboutComponent } from './Components/about/about.component';
import { LoginComponent } from './Components/login/login.component';
import { RetailerModule } from './RetailerModule/retailer.module';
import { GreatOutdoorDataService } from './InMemoryWebAPIServices/greatoutdoor-data.sevice';

// Create By Prafull Sharma on 08/10/2019
@NgModule({
  declarations: [
    AppComponent,
    AboutComponent,
    LoginComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    environment.production ? HttpClientInMemoryWebApiModule.forRoot(GreatOutdoorDataService, { delay: 1000 }) : [],
    RetailerModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

