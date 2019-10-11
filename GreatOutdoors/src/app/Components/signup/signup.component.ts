import { Component, OnInit } from '@angular/core';

import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Retailer } from '../../Models/retailer';
import { GreatOutdoorComponentBase } from '../../GreatOutdoor-component';
import { RetailersService } from '../../Services/retailers.service';
import * as $ from "jquery";
import { Router } from '@angular/router';
import { UserAccountService } from '../../Services/user-account.service';
import { User } from '../../Models/user';
import { GreatOutdoorDataService } from 'src/app/InMemoryWebAPIServices/GreatOutdoor-data.service';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss']
})
export class SignupComponent extends GreatOutdoorComponentBase implements OnInit {
  signupForm: FormGroup;
  newRetailerDisabled: boolean = false;
  signupFormErrorMessages: any;
  constructor(private retailerService: RetailersService) {
    super();
    this.signupForm = new FormGroup({
      Name: new FormControl(null, [Validators.required, Validators.minLength(2), Validators.maxLength(40)]),
      Mobile: new FormControl(null, [Validators.required, Validators.pattern(/^[6789]\d{9}$/)]),
      email: new FormControl(null, [Validators.required, Validators.email]),
      password: new FormControl(null, [Validators.required, Validators.pattern(/((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,15})/)])
    });
    this.signupFormErrorMessages = {
      Name: { required: "SalesPerson Name can't be blank", minlength: "SalesPerson Name should contain at least 2 characters", maxlength: "SalesPerson Name can't be longer than 40 characters" },
      Mobile: { required: "Mobile number can't be blank", pattern: "10 digit Mobile number is required" },
      email: { required: "Email can't be blank", pattern: "Email is invalid" },
      password: { required: "Password can't be blank", pattern: "Password should contain should be between 6 to 15 characters long, with at least one uppercase letter, one lowercase letter and one digit" }
    };
  }
  

    ngOnInit() {

    }

    onSignupClick() {
      this.signupForm.reset();
      this.signupForm["submitted"] = false;
    }
  onCancelRegisterClick(event) {

  }

    onAddRetailerClick(event) {
      this.signupForm["submitted"] = true;
      if (this.signupForm.valid) {
        this.newRetailerDisabled = true;
        var retailer: Retailer = this.signupForm.value;

        this.retailerService.AddRetailer(retailer).subscribe((addResponse) => {
          this.signupForm.reset();
          $("#btnAddRetailerCancel").trigger("click");
          this.newRetailerDisabled = false;
         },
          (error) => {
            console.log(error);
            this.newRetailerDisabled = false;
          });
      }
      else {
        super.getFormGroupErrors(this.signupForm);
      }
    }
  getFormControlCssClass(formControl: FormControl, formGroup: FormGroup): any {
    return {
      'is-invalid': formControl.invalid && (formControl.dirty || formControl.touched || formGroup["submitted"]),
      'is-valid': formControl.valid && (formControl.dirty || formControl.touched || formGroup["submitted"])
    };
  }

  getFormControlErrorMessage(formControlName: string, validationProperty: string): string {
    return this.signupFormErrorMessages[formControlName][validationProperty];
  }

  getCanShowFormControlErrorMessage(formControlName: string, validationProperty: string, formGroup: FormGroup): boolean {
    return formGroup.get(formControlName).invalid && (formGroup.get(formControlName).dirty || formGroup.get(formControlName).touched || formGroup['submitted']) && formGroup.get(formControlName).errors[validationProperty];
  }


    
}


