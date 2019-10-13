import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-admin-home',
  templateUrl: './admin-home.component.html',
  styleUrls: ['./admin-home.component.scss']
})
export class AdminHomeComponent implements OnInit
{
  constructor()
  {
  }

  ngOnInit() {
    
    this.retailersService.GetAllRetailers().subscribe((response) => {
      this.retailers = response;
      }, (error) => {
        console.log(error);
      })
       this.salesPersonsService.GetAllSalesPersons().subscribe((response) => {
      this.salesPersons = response;
     
    }, (error) => {
        console.log(error);
      })
  }
}


