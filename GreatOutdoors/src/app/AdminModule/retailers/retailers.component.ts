//developed by prafull sharma
//retailer component
import { Component, OnInit } from '@angular/core';
import { Retailer } from '../../Models/retailer';
import { RetailersService } from '../../Services/retailers.service';
import { GreatOutdoorComponentBase } from '../../GreatOutdoor-component';

@Component({
  selector: 'app-retailers',
  templateUrl: './retailers.component.html',// respective template for this component
  styleUrls: ['./retailers.component.scss'] // respective style sheet for this component
})
export class RetailersComponent extends GreatOutdoorComponentBase implements OnInit {
  retailers: Retailer[] = [];
  showRetailersSpinner: boolean = false;
  viewRetailerCheckBoxes: any;

  sortBy: string = "retailerName";
  sortDirection: string = "ASC";

   //constructor to inject components
  constructor(private retailersService: RetailersService) {
    super();
   

    this.viewRetailerCheckBoxes = {
      retailerName: true,
      mobile: true,
      email: true,
      createdOn: true,
      lastModifiedOn: true
    };

    
  }

  ngOnInit() {
    this.showRetailersSpinner = true;
    this.retailersService.GetAllRetailers().subscribe((response) => {
      this.retailers = response;
      this.showRetailersSpinner = false;
    }, (error) => {
        console.log(error);
      })
  }

  //function on clicking select all
  onViewSelectAllClick() {
    for (let propertyName of Object.keys(this.viewRetailerCheckBoxes)) {
      this.viewRetailerCheckBoxes[propertyName] = true;
    }
  }

  //function on clicking deselect all
  onViewDeselectAllClick() {
    for (let propertyName of Object.keys(this.viewRetailerCheckBoxes)) {
      this.viewRetailerCheckBoxes[propertyName] = false;
    }
  }

  // function on clicking sort button
  onBtnSortClick() {
    console.log(this.sortBy);
    this.retailers.sort((a, b) => {
      let comparison = 0;
      let value1 = ((typeof a[this.sortBy]) == 'string') ? a[this.sortBy].toUpperCase() : a[this.sortBy];
      let value2 = ((typeof b[this.sortBy]) == 'string') ? b[this.sortBy].toUpperCase() : b[this.sortBy];

      if (value1 < value2) {
        comparison = -1;
      }
      else if (value1 > value2) {
        comparison = 1;
      }
      if (this.sortDirection == "DESC")
        comparison = comparison * -1;

      console.log(value1, value2, comparison);
      return comparison;
    });

  }
}
