//deveoped by Ayush Agrawal
//sales person component
import { Component, OnInit } from '@angular/core';
import { SalesPerson } from '../../Models/salesPerson';
import { SalesPersonsService } from '../../Services/salesPersons.service';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import * as $ from "jquery";
import { GreatOutdoorComponentBase } from '../../GreatOutdoor-component';

@Component({
  selector: 'app-salesPersons',
  templateUrl: './salesPersons.component.html',// respective template for this component
  styleUrls: ['./salesPersons.component.scss'] // respective style sheet for this component
})
export class SalesPersonsComponent extends GreatOutdoorComponentBase implements OnInit {
  salesPersons: SalesPerson[] = [];
  showSalesPersonsSpinner: boolean = false;
  viewSalesPersonCheckBoxes: any;

  sortBy: string = "salesPersonName";
  sortDirection: string = "ASC";

  newSalesPersonForm: FormGroup;
  newSalesPersonDisabled: boolean = false;
  newSalesPersonFormErrorMessages: any;

  editSalesPersonForm: FormGroup;
  editSalesPersonDisabled: boolean = false;
  editSalesPersonFormErrorMessages: any;

  deleteSalesPersonForm: FormGroup;
  deleteSalesPersonDisabled: boolean = false;

   //constructor to inject components
  constructor(private salesPersonsService: SalesPersonsService) {
    super();
    this.newSalesPersonForm = new FormGroup({
      salesPersonName: new FormControl(null, [Validators.required, Validators.minLength(2), Validators.maxLength(40)]),
      salesPersonMobile: new FormControl(null, [Validators.required, Validators.pattern(/^[6789]\d{9}$/)]),
      email: new FormControl(null, [Validators.required, Validators.email]),
      password: new FormControl(null, [Validators.required, Validators.pattern(/((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,15})/)])
    });

    this.newSalesPersonFormErrorMessages = {
      salesPersonName: { required: "SalesPerson Name can't be blank", minlength: "SalesPerson Name should contain at least 2 characters", maxlength: "SalesPerson Name can't be longer than 40 characters" },
      salesPersonMobile: { required: "Mobile number can't be blank", pattern: "10 digit Mobile number is required" },
      email: { required: "Email can't be blank", pattern: "Email is invalid" },
      password: { required: "Password can't be blank", pattern: "Password should contain should be between 6 to 15 characters long, with at least one uppercase letter, one lowercase letter and one digit" }
    };


    //function after edit sales click
    this.editSalesPersonForm = new FormGroup({
      id: new FormControl(null),
      salesPersonID: new FormControl(null),
      salesPersonName: new FormControl(null, [Validators.required, Validators.minLength(2), Validators.maxLength(40)]),
      salesPersonMobile: new FormControl(null, [Validators.required, Validators.pattern(/^[6789]\d{9}$/)]),
      email: new FormControl(null, [Validators.required, Validators.email]),
      password: new FormControl(null),
      creationDateTime: new FormControl(null)
    });

    this.editSalesPersonFormErrorMessages = {
      salesPersonName: { required: "SalesPerson Name can't be blank", minlength: "SalesPerson Name should contain at least 2 characters", maxlength: "SalesPerson Name can't be longer than 40 characters" },
      salesPersonMobile: { required: "Mobile number can't be blank", pattern: "10 digit Mobile number is required" },
      email: { required: "Email can't be blank", pattern: "Email is invalid" }
    };

    this.viewSalesPersonCheckBoxes = {
      salesPersonName: true,
      mobile: true,
      email: true,
      createdOn: true,
      lastModifiedOn: true
    };

    this.deleteSalesPersonForm = new FormGroup({
      id: new FormControl(null),
      salesPersonID: new FormControl(null),
      salesPersonName: new FormControl(null)
    });
  }

  ngOnInit() {
    this.showSalesPersonsSpinner = true;
    this.salesPersonsService.GetAllSalesPersons().subscribe((response) => {
      this.salesPersons = response;
      this.showSalesPersonsSpinner = false;
    }, (error) => {
        console.log(error);
      })
  }

  //function after create sales persom click
  onCreateSalesPersonClick() {
    this.newSalesPersonForm.reset();
    this.newSalesPersonForm["submitted"] = false;
  }

  //function after add sales person click
  onAddSalesPersonClick(event) {
    this.newSalesPersonForm["submitted"] = true;
    if (this.newSalesPersonForm.valid) {
      this.newSalesPersonDisabled = true;
      var salesPerson: SalesPerson = this.newSalesPersonForm.value;

      this.salesPersonsService.AddSalesPerson(salesPerson).subscribe((addResponse) => {
        this.newSalesPersonForm.reset();
        $("#btnAddSalesPersonCancel").trigger("click");
        this.newSalesPersonDisabled = false;
        this.showSalesPersonsSpinner = true;

        this.salesPersonsService.GetAllSalesPersons().subscribe((getResponse) => {
          this.showSalesPersonsSpinner = false;
          this.salesPersons = getResponse;
        }, (error) => {
            console.log(error);
          });
      },
        (error) => {
          console.log(error);
          this.newSalesPersonDisabled = false;
        });
    }
    else {
      super.getFormGroupErrors(this.newSalesPersonForm);
    }
  }



  getFormControlCssClass(formControl: FormControl, formGroup: FormGroup): any {
    return {
      'is-invalid': formControl.invalid && (formControl.dirty || formControl.touched || formGroup["submitted"]),
      'is-valid': formControl.valid && (formControl.dirty || formControl.touched || formGroup["submitted"])
    };
  }

  getFormControlErrorMessage(formControlName: string, validationProperty: string): string {
    return this.newSalesPersonFormErrorMessages[formControlName][validationProperty];
  }

  getCanShowFormControlErrorMessage(formControlName: string, validationProperty: string, formGroup: FormGroup): boolean {
    return formGroup.get(formControlName).invalid && (formGroup.get(formControlName).dirty || formGroup.get(formControlName).touched || formGroup['submitted']) && formGroup.get(formControlName).errors[validationProperty];
  }


  //function on clicking edit sales person
  onEditSalesPersonClick(index) {
    this.editSalesPersonForm.reset();
    this.editSalesPersonForm["submitted"] = false;
    this.editSalesPersonForm.patchValue({
      id: this.salesPersons[index].id,
      salesPersonID: this.salesPersons[index].salesPersonID,
      salesPersonName: this.salesPersons[index].salesPersonName,
      salesPersonMobile: this.salesPersons[index].salesPersonMobile,
      email: this.salesPersons[index].email,
      password: this.salesPersons[index].password,
      creationDateTime: this.salesPersons[index].creationDateTime
    });
  }

  //function on clicking update sales person
  onUpdateSalesPersonClick(event) {
    this.editSalesPersonForm["submitted"] = true;
    if (this.editSalesPersonForm.valid) {
      this.editSalesPersonDisabled = true;
      var salesPerson: SalesPerson = this.editSalesPersonForm.value;

      this.salesPersonsService.UpdateSalesPerson(salesPerson).subscribe((updateResponse) => {
        this.editSalesPersonForm.reset();
        $("#btnUpdateSalesPersonCancel").trigger("click");
        this.editSalesPersonDisabled = false;
        this.showSalesPersonsSpinner = true;

        this.salesPersonsService.GetAllSalesPersons().subscribe((getResponse) => {
          this.showSalesPersonsSpinner = false;
          this.salesPersons = getResponse;
        }, (error) => {
            console.log(error);
          });
      },
        (error) => {
          console.log(error);
          this.editSalesPersonDisabled = false;
        });
    }
    else {
      super.getFormGroupErrors(this.editSalesPersonForm);
    }
  }


  //function on clicking delete sales person
  onDeleteSalesPersonClick(index) {
    this.deleteSalesPersonForm.reset();
    this.deleteSalesPersonForm["submitted"] = false;
    this.deleteSalesPersonForm.patchValue({
      id: this.salesPersons[index].id,
      salesPersonID: this.salesPersons[index].salesPersonID,
      salesPersonName: this.salesPersons[index].salesPersonName
    });
  }

  //event on clicking delete sales person
  onDeleteSalesPersonConfirmClick(event) {
    this.deleteSalesPersonForm["submitted"] = true;
    if (this.deleteSalesPersonForm.valid) {
      this.deleteSalesPersonDisabled = true;
      var salesPerson: SalesPerson = this.deleteSalesPersonForm.value;

      this.salesPersonsService.DeleteSalesPerson(salesPerson.salesPersonID, salesPerson.id).subscribe((deleteResponse) => {
        this.deleteSalesPersonForm.reset();
        $("#btnDeleteSalesPersonCancel").trigger("click");
        this.deleteSalesPersonDisabled = false;
        this.showSalesPersonsSpinner = true;

        this.salesPersonsService.GetAllSalesPersons().subscribe((getResponse) => {
          this.showSalesPersonsSpinner = false;
          this.salesPersons = getResponse;
        }, (error) => {
            console.log(error);
          });
      },
        (error) => {
          console.log(error);
          this.deleteSalesPersonDisabled = false;
        });
    }
    else {
      super.getFormGroupErrors(this.deleteSalesPersonForm);
    }
  }


  //function on clicking select all
  onViewSelectAllClick() {
    for (let propertyName of Object.keys(this.viewSalesPersonCheckBoxes)) {
      this.viewSalesPersonCheckBoxes[propertyName] = true;
    }
  }
  //function on clicking deselect all
  onViewDeselectAllClick() {
    for (let propertyName of Object.keys(this.viewSalesPersonCheckBoxes)) {
      this.viewSalesPersonCheckBoxes[propertyName] = false;
    }
  }

  //function on clicking sort
  onBtnSortClick() {
    console.log(this.sortBy);
    this.salesPersons.sort((a, b) => {
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
