import { Component, OnInit } from '@angular/core';
import { Address } from '../../Models/address';
import { AddressesService } from '../../Services/addresses.sevice';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import * as $ from "jquery";
import { GreatOutdoorComponentBase } from '../../greatoutdoor-component';
import { UserAccountService } from 'src/app/Services/user-account.service';
import { User } from 'src/app/Models/user';

// Create By Prafull Sharma on 08/10/2019
@Component({
  selector: 'app-address',
  templateUrl: './retailer-address.component.html',
  styleUrls: ['./retailer-address.component.scss']
})
export class AddressComponent extends GreatOutdoorComponentBase implements OnInit {
  addresses: Address[] = [];
  showAddressesSpinner: boolean = false;
  viewAddressCheckBoxes: any;

  sortDirection: string = "ASC";

  newAddressForm: FormGroup;
  newAddressDisabled: boolean = false;
  newAddressFormErrorMessages: any;

  editAddressForm: FormGroup;
  editAddressDisabled: boolean = false;
  editAddressFormErrorMessages: any;

  deleteAddressForm: FormGroup;
  deleteAddressDisabled: boolean = false;
  
  constructor(private addressesService: AddressesService, private userAccountService: UserAccountService) {
    super();
    this.newAddressForm = new FormGroup({
      addressLine1: new FormControl(null, [Validators.required, Validators.minLength(2), Validators.maxLength(40)]),
      addressLine2: new FormControl(null, [Validators.required]),
      landmark: new FormControl(null),
      city: new FormControl(null, [Validators.required]),
      state: new FormControl(null, [Validators.required]),
      pinCode: new FormControl(null, [Validators.required])
    });

    this.newAddressFormErrorMessages = {
      addressLine1: { required: "Addresss Line 1 can't be blank", minlength: "Address Line 1 should contain at least 2 characters", maxlength: " use Line 2 for more than 40 characters" },
      addressLine2: { required: "Address Line 2 can't be blank"},
      city: { required: "City Name can't be blank" },
      state: { required: "State Name can't be blank" },
      pinCode: {required: "PIN Code Can't be blank"}

    };



    this.editAddressForm = new FormGroup({
      id: new FormControl(null),
      addressID: new FormControl(null),
      addressLine1: new FormControl(null, [Validators.required, Validators.minLength(2), Validators.maxLength(40)]),
      addressLine2: new FormControl(null, [Validators.required]),
      landmark: new FormControl(null),
      city: new FormControl(null, [Validators.required]),
      state: new FormControl(null, [Validators.required]),
      pinCode: new FormControl(null, [Validators.required]),
      retailerID: new FormControl(null),
      creationDateTime: new FormControl(null)
    });

    this.editAddressFormErrorMessages = {
      addressLine1: { required: "Addresss Line 1 can't be blank", minlength: "Address Line 1 should contain at least 2 characters", maxlength: " use Line 2 for more than 40 characters" },
      addressLine2: { required: "Address Line 2 can't be blank" },
      city: { required: "City Name can't be blank" },
      state: { required: "State Name can't be blank" },
      pinCode: { required: "PIN Code Can't be blank" }
    };

   

    this.deleteAddressForm = new FormGroup({
      id: new FormControl(null),
      addressID: new FormControl(null),
      addressLine1: new FormControl(null)
    });
  }

  ngOnInit() {
    this.showAddressesSpinner = true;
    this.addressesService.GetAddressByRetailerID(this.userAccountService.currentUserID).subscribe((response) => {
      this.addresses = response;
      this.showAddressesSpinner = false;
    }, (error) => {
        console.log(error);
      })
  }

  onCreateAddressClick() {
    this.newAddressForm.reset();
    this.newAddressForm["submitted"] = false;
  }

  onAddAddressClick(event) {
    this.newAddressForm["submitted"] = true;
    if (this.newAddressForm.valid) {
      this.newAddressDisabled = true;
      var address: Address = this.newAddressForm.value;

      this.addressesService.AddAddress(address).subscribe((addResponse) => {
        this.newAddressForm.reset();
        $("#btnAddAddressCancel").trigger("click");
        this.newAddressDisabled = false;
        this.showAddressesSpinner = true;
        this.addressesService.GetAddressByRetailerID(this.userAccountService.currentUserID).subscribe((getResponse) => {
          this.showAddressesSpinner = false;
          this.addresses = getResponse;
        }, (error) => {
            console.log(error);
          });
      },
        (error) => {
          console.log(error);
          this.newAddressDisabled = false;
        });
    }
    else {
      super.getFormGroupErrors(this.newAddressForm);
    }
  }



  getFormControlCssClass(formControl: FormControl, formGroup: FormGroup): any {
    return {
      'is-invalid': formControl.invalid && (formControl.dirty || formControl.touched || formGroup["submitted"]),
      'is-valid': formControl.valid && (formControl.dirty || formControl.touched || formGroup["submitted"])
    };
  }

  getFormControlErrorMessage(formControlName: string, validationProperty: string): string {
    return this.newAddressFormErrorMessages[formControlName][validationProperty];
  }

  getCanShowFormControlErrorMessage(formControlName: string, validationProperty: string, formGroup: FormGroup): boolean {
    return formGroup.get(formControlName).invalid && (formGroup.get(formControlName).dirty || formGroup.get(formControlName).touched || formGroup['submitted']) && formGroup.get(formControlName).errors[validationProperty];
  }



  onEditAddressClick(index) {
    this.editAddressForm.reset();
    this.editAddressForm["submitted"] = false;
    this.editAddressForm.patchValue({
      id: this.addresses[index].id,
      addressID: this.addresses[index].addressID,
      addressLine1: this.addresses[index].addressLine1,
      addreessLine2: this.addresses[index].addressLine2,
      landmark: this.addresses[index].landmark,
      city: this.addresses[index].city,
      state: this.addresses[index].state,
      retailerID: this.addresses[index].retailerID,
      creationDateTime: this.addresses[index].creationDateTime
    });
  }

  onUpdateAddressClick(event) {
    this.editAddressForm["submitted"] = true;
    if (this.editAddressForm.valid) {
      this.editAddressDisabled = true;
      var address: Address = this.editAddressForm.value;
      this.addressesService.UpdateAddress(address).subscribe((updateResponse) => {
        this.editAddressForm.reset();
        $("#btnUpdateAddressCancel").trigger("click");
        this.editAddressDisabled = false;
        this.showAddressesSpinner = true;
        this.addressesService.GetAddressByRetailerID(this.userAccountService.currentUserID).subscribe((getResponse) => {
          this.showAddressesSpinner = false;
          this.addresses = getResponse;
        }, (error) => {
            console.log(error);
          });
      },
        (error) => {
          console.log(error);
          this.editAddressDisabled = false;
        });
    }
    else {
      super.getFormGroupErrors(this.editAddressForm);
    }
  }



  onDeleteAddressClick(index) {
    this.deleteAddressForm.reset();
    this.deleteAddressForm["submitted"] = false;
    this.deleteAddressForm.patchValue({
      id: this.addresses[index].id,
      addressID: this.addresses[index].addressID,
      addressLine1: this.addresses[index].addressLine1
    });
  }

  onDeleteAddressConfirmClick(event) {
    this.deleteAddressForm["submitted"] = true;
    if (this.deleteAddressForm.valid) {
      this.deleteAddressDisabled = true;
      var address: Address = this.deleteAddressForm.value;

      this.addressesService.DeleteAddress(address.addressID, address.id).subscribe((deleteResponse) => {
        this.deleteAddressForm.reset();
        $("#btnDeleteAddressCancel").trigger("click");
        this.deleteAddressDisabled = false;
        this.showAddressesSpinner = true;
        this.addressesService.GetAddressByRetailerID(this.userAccountService.currentUserID).subscribe((getResponse) => {
          this.showAddressesSpinner = false;
          this.addresses = getResponse;
        }, (error) => {
            console.log(error);
          });
      },
        (error) => {
          console.log(error);
          this.deleteAddressDisabled = false;
        });
    }
    else {
      super.getFormGroupErrors(this.deleteAddressForm);
    }
  }



  
 
}



