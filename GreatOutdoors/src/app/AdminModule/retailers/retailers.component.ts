import { Component, OnInit } from '@angular/core';
import { Retailer } from '../../Models/retailer';
import { RetailersService } from '../../Services/retailers.service';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import * as $ from "jquery";
import { GreatOutdoorComponentBase } from '../../GreatOutdoor-component';

@Component({
  selector: 'app-retailers',
  templateUrl: './retailers.component.html',
  styleUrls: ['./retailers.component.scss']
})
export class RetailersComponent extends GreatOutdoorComponentBase implements OnInit {
  retailers: Retailer[] = [];
  showRetailersSpinner: boolean = false;
  viewRetailerCheckBoxes: any;

  sortBy: string = "retailerName";
  sortDirection: string = "ASC";

  
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

  
  onViewSelectAllClick() {
    for (let propertyName of Object.keys(this.viewRetailerCheckBoxes)) {
      this.viewRetailerCheckBoxes[propertyName] = true;
    }
  }

  onViewDeselectAllClick() {
    for (let propertyName of Object.keys(this.viewRetailerCheckBoxes)) {
      this.viewRetailerCheckBoxes[propertyName] = false;
    }
  }

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
