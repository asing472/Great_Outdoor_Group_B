import { Component, OnInit } from '@angular/core';
import { OnlineReturn } from '../../Models/onlineReturn';
import { OnlineReturnsService } from '../../Services/onlineReturns.service';
import { FormGroup, FormControl, Validators, FormArray } from '@angular/forms';
import * as $ from "jquery";
import { GreatOutdoorComponentBase } from '../../GreatOutdoor-component';

// Create By Ayush Agrawal on 08/10/2019
// Online Return type Script file
@Component({
  selector: 'app-onlineReturns',
  templateUrl: './onlineReturns.component.html',
  styleUrls: ['./onlineReturns.component.scss']
})
export class OnlineReturnsComponent extends GreatOutdoorComponentBase implements OnInit {
  onlineReturns: OnlineReturn[] = [];
  showOnlineReturnsSpinner: boolean = false;
  viewOnlineReturnCheckBoxes: any;

  sortBy: string = "Purpose";


  sortDirection: string = "ASC";

  newOnlineReturnForm: FormGroup;
  newOnlineReturnDisabled: boolean = false;
  newOnlineReturnFormErrorMessages: any;

  // edit Online Return Form Creation
  editOnlineReturnForm: FormGroup;
  editOnlineReturnDisabled: boolean = false;
  editOnlineReturnFormErrorMessages: any;

   // delete Online Return Form Creation
  deleteOnlineReturnForm: FormGroup;
  deleteOnlineReturnDisabled: boolean = false;


   // Constructor Initialization
  constructor(private onlineReturnsService: OnlineReturnsService) {
    super();
    this.newOnlineReturnForm = new FormGroup
      ({
      orderNumber: new FormControl(null, [Validators.required, Validators.minLength(1), Validators.maxLength(40)]),
      purpose: new FormControl(null),
      quantityOfReturn: new FormControl(null, [Validators.required, Validators.pattern(/^[0-9]*$/)]),
      
    });

    this.newOnlineReturnFormErrorMessages = {
      orderNumber: { required: "Order Number can't be blank", minlength: "Order Number should be same as digits generated during ordering", maxlength: "Ordernumber can't be longer than 40 characters" },
      purpose: { required: "purpose can't be blank" },
      quantityOfReturn: { required: "Quantity Of Return can't be blank", pattern: "Quantity Of Return must be less or equal to item ordered" },
     
    };


    // Create By Ayush Agrawal on 08/10/2019
    //  edit Online Return type Script form
    this.editOnlineReturnForm = new FormGroup({
      id: new FormControl(null),
      onlineReturnID: new FormControl(null),
      orderNumber: new FormControl(null, [Validators.required, Validators.minLength(1), Validators.maxLength(40)]),
      quantityOfReturn: new FormControl(null, [Validators.required, Validators.pattern(/^[0-9]*$/)]),
      purpose: new FormControl(null, [Validators.required]),
      productNumber: new FormControl(null),
      OrderID: new FormControl(null),
      productID: new FormControl(null),
      retailerID: new FormControl(null),
      productPrice: new FormControl(null),
      totalAmount: new FormControl(null),
      lastModifiedDateTime: new FormControl(null),
      creationDateTime: new FormControl(null)
    });

    this.editOnlineReturnFormErrorMessages = {
      orderNumber: { required: "Order Number can't be blank", minlength: "Order Number should be same as digits generated during ordering", maxlength: "Ordernumber can't be longer than 40 characters" },
      purpose: { required: "purpose can't be blank" },
      quantityOfReturn: { required: "Quantity Of Return can't be blank", pattern: "Quantity Of Return must be less or equal to item ordered" },

    };

    this.viewOnlineReturnCheckBoxes = {
      orderNumber: true,
      purpose: true,
      quantityOfReturn: true,
      createdOn: true,
      lastModifiedOn: true
    };

    this.deleteOnlineReturnForm = new FormGroup({
      id: new FormControl(null),
      onlineReturnID: new FormControl(null),
      orderNumber: new FormControl(null)
    });
  }
  // Page Initial Function
  ngOnInit() {
    this.showOnlineReturnsSpinner = true;
    this.onlineReturnsService.GetAllOnlineReturns().subscribe((response) => {
      console.log(response);
      this.onlineReturns = response;
      this.showOnlineReturnsSpinner = false;
    }, (error) => {
        console.log(error);
      })
  }
  // Page Create Online Return Function
  onCreateOnlineReturnClick() {
    this.newOnlineReturnForm.reset();
    this.newOnlineReturnForm["submitted"] = false;
  }

  // Page Add online Return Function
  onAddOnlineReturnClick(event) {
    this.newOnlineReturnForm["submitted"] = true;
    if (this.newOnlineReturnForm.valid) {
      this.newOnlineReturnDisabled = true;
      var onlineReturn: OnlineReturn = this.newOnlineReturnForm.value;

      this.onlineReturnsService.AddOnlineReturn(onlineReturn).subscribe((addResponse) => {
        this.newOnlineReturnForm.reset();
        $("#btnAddOnlineReturnCancel").trigger("click");
        this.newOnlineReturnDisabled = false;
        this.showOnlineReturnsSpinner = true;

        this.onlineReturnsService.GetAllOnlineReturns().subscribe((getResponse) => {
          this.showOnlineReturnsSpinner = false;
          this.onlineReturns = getResponse;
        }, (error) => {
            console.log(error);
          });
      },
        (error) => {
          console.log(error);
          this.newOnlineReturnDisabled = false;
        });
    }
    else {
      super.getFormGroupErrors(this.newOnlineReturnForm);
    }
  }


  getFormControlCssClass(formControl: FormControl, formGroup: FormGroup): any {
    return {
      'is-invalid': /*formControl.invalid &&*/ (formControl.dirty || formControl.touched || formGroup["submitted"]),
     'is-valid': formControl.valid && (formControl.dirty || formControl.touched || formGroup["submitted"])
    };
  }

  getFormControlErrorMessage(formControlName: string, validationProperty: string): string {
    return this.newOnlineReturnFormErrorMessages[formControlName][validationProperty];
  }

  getCanShowFormControlErrorMessage(formControlName: string, validationProperty: string, formGroup: FormGroup): boolean {
    return formGroup.get(formControlName).invalid && (formGroup.get('xxxx').dirty || formGroup.get(formControlName).touched || formGroup['submitted']) && formGroup.get(formControlName).errors[validationProperty];
  }


  // Page Edit Online Return Function
  onEditOnlineReturnClick(index) {
    this.editOnlineReturnForm.reset();
    this.editOnlineReturnForm["submitted"] = false;
    this.editOnlineReturnForm.patchValue({
      id: this.onlineReturns[index].id,
      orderNumber: this.onlineReturns[index].orderNumber,
      orderID: this.onlineReturns[index].onlineReturnID,
      purpose: this.onlineReturns[index].purpose,
      quantityOfReturn: this.onlineReturns[index].quantityOfReturn,
      creationDateTime: this.onlineReturns[index].creationDateTime
    });
  }
  // Page Update Online Return Function
  onUpdateOnlineReturnClick(event) {
    this.editOnlineReturnForm["submitted"] = true;
    if (this.editOnlineReturnForm.valid) {
      this.editOnlineReturnDisabled = true;
      var onlineReturn: OnlineReturn = this.editOnlineReturnForm.value;
     
      
        this.onlineReturnsService.UpdateOnlineReturn(onlineReturn).subscribe((updateResponse) => {
          this.editOnlineReturnForm.reset();
          $("#btnUpdateOnlineReturnCancel").trigger("click");
          this.editOnlineReturnDisabled = false;
          this.showOnlineReturnsSpinner = true;

          this.onlineReturnsService.GetAllOnlineReturns().subscribe((getResponse) => {
            this.showOnlineReturnsSpinner = false;
            this.onlineReturns = getResponse;
          }, (error) => {
            console.log(error);
          });
        },
          (error) => {
            console.log(error);
            this.editOnlineReturnDisabled = false;
          });
      
      
    }
    else {
      super.getFormGroupErrors(this.editOnlineReturnForm);
    }
  }
  // Page Quantity Change Function
  onQuantityChange(index: number) {
    var currentFormGroup: FormGroup = (this.newOnlineReturnForm.get('onlineReturns') as FormArray).at(index) as FormGroup;
    var quantity = Number(currentFormGroup.get('quantity').value);
    var unitPrice = Number(currentFormGroup.get('unitPrice').value);

    currentFormGroup.patchValue({
      quantity: quantity,
      totalAmount: quantity * unitPrice
    });
  }

  // Page Quantity Decrement Click Function
  onQuantityDecrementClick(index: number) {
    var currentFormGroup: FormGroup = (this.newOnlineReturnForm.get('onlineReturns') as FormArray).at(index) as FormGroup;

    var quantity = Number(currentFormGroup.get('quantity').value) - 1;
    var unitPrice = Number(currentFormGroup.get('unitPrice').value);
    if (quantity >= 1) {
      currentFormGroup.patchValue({

        quantity: quantity,
        totalAmount: quantity * unitPrice
     
    });
  }
  }
  // Page Increment Click  Function
  onQuantityIncrementClick(index: number) {
    var currentFormGroup: FormGroup = (this.newOnlineReturnForm.get('onlineReturns') as FormArray).at(index) as FormGroup;
    var quantity = Number(currentFormGroup.get('quantityOfReturn').value)+1;
    var unitPrice = Number(currentFormGroup.get('roductPrice').value);

    currentFormGroup.patchValue({
      quantity: quantity,
      totalAmount: quantity * unitPrice
     
    });
  }
  // Page Delete Function
  onDeleteOnlineReturnClick(index) {
    this.deleteOnlineReturnForm.reset();
    this.deleteOnlineReturnForm["submitted"] = false;
    this.deleteOnlineReturnForm.patchValue({
      id: this.onlineReturns[index].id,
      onlineReturnID: this.onlineReturns[index].onlineReturnID,
      orderNumber: this.onlineReturns[index].orderNumber
    });
  }
  // Page Delete Confirm Function
  onDeleteOnlineReturnConfirmClick(event) {
    this.deleteOnlineReturnForm["submitted"] = true;
    if (this.deleteOnlineReturnForm.valid) {
      this.deleteOnlineReturnDisabled = true;
      var onlineReturn: OnlineReturn = this.deleteOnlineReturnForm.value;

      this.onlineReturnsService.DeleteOnlineReturn(onlineReturn.onlineReturnID, onlineReturn.id).subscribe((deleteResponse) => {
        this.deleteOnlineReturnForm.reset();
        $("#btnDeleteOnlineReturnCancel").trigger("click");
        this.deleteOnlineReturnDisabled = false;
        this.showOnlineReturnsSpinner = true;

        this.onlineReturnsService.GetAllOnlineReturns().subscribe((getResponse) => {
          this.showOnlineReturnsSpinner = false;
          this.onlineReturns = getResponse;
        }, (error) => {
            console.log(error);
          });
      },
        (error) => {
          console.log(error);
          this.deleteOnlineReturnDisabled = false;
        });
    }
    else {
      super.getFormGroupErrors(this.deleteOnlineReturnForm);
    }
  }


  // Page view all click Function
  onViewSelectAllClick() {
    for (let propertyName of Object.keys(this.viewOnlineReturnCheckBoxes)) {
      this.viewOnlineReturnCheckBoxes[propertyName] = true;
    }
  }

  onViewDeselectAllClick() {
    for (let propertyName of Object.keys(this.viewOnlineReturnCheckBoxes)) {
      this.viewOnlineReturnCheckBoxes[propertyName] = false;
    }
  }

  onBtnSortClick() {
    console.log(this.sortBy);
    this.onlineReturns.sort((a, b) => {
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



