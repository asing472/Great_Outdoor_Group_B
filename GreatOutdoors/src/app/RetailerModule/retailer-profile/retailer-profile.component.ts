import { Component, OnInit } from '@angular/core';
import { Retailer } from '../../Models/retailer';
import { RetailersService } from '../../Services/retailers.service';
import { FormGroup, FormControl, Validators, FormBuilder } from '@angular/forms';
import * as $ from "jquery";
import { GreatOutdoorComponentBase } from '../../greatoutdoor-component';
import { UserAccountService } from 'src/app/Services/user-account.service';
import { User } from 'src/app/Models/user';
import { Router } from '@angular/router';
import { RetailerRoutingModule } from '../retailer-routing.module';


// Create By Prafull Sharma on 08/10/2019
// TS for Retailer Profile Page 
@Component({
  selector: 'app-reatailer',
  templateUrl: './retailer-profile.component.html',
  styleUrls: ['./retailer-profile.component.scss']
})
export class RetailersProfileComponent extends GreatOutdoorComponentBase implements OnInit {
  retailers: Retailer[] = [];
  retailer: Retailer;


  // Update Retailer Form Creation
  updateRetailerForm: FormGroup;
  updateRetailerDisabled: boolean = false;
  updateRetailerFormErrorMessages: any;
  // Change Retailer Form Creation
  changePasswordForm: FormGroup;
  changePasswordDisabled: boolean = false;
  changePasswordFormErrorMessages: any;

  // Delete Retailer Form Creation
  deleteRetailerForm: FormGroup;
  deleteRetailerDisabled: boolean = false;
  deleted: boolean = false;

  // Constructor Initialization
  constructor(private retailersService: RetailersService, private userAccountService: UserAccountService, private router: Router) {
    super();

    // From Component for Update Retailer Form
    this.updateRetailerForm = new FormGroup({
      id: new FormControl(null),
      retailerID: new FormControl(null),
      retailerName: new FormControl(null, [Validators.required, Validators.minLength(2), Validators.maxLength(40)]),
      retailerMobile: new FormControl(null, [Validators.required, Validators.pattern(/^[6789]\d{9}$/)]),
      email: new FormControl(null, [Validators.required, Validators.email]),
      password: new FormControl(null),
      creationDateTime: new FormControl(null)
    });

    //Error messsage of Update Retailer
    this.updateRetailerFormErrorMessages = {
      retailerName: { required: "Your Name can't be blank", minlength: "your Name should contain at least 2 characters", maxlength: "Your Name can't be longer than 40 characters" },
      retailerMobile: { required: "Mobile number can't be blank", pattern: "10 digit Mobile number is required" },
      email: { required: "Email can't be blank", pattern: "Email is invalid" }
    };

    //Form Control Declaration of Change Password
    this.changePasswordForm = new FormGroup({
      currentPassword: new FormControl(null, [Validators.required]),
      newPassword: new FormControl(null, [Validators.required, Validators.pattern(/((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,15})/)]),
      confirmNewPassword: new FormControl(null, [Validators.required])
    });

    // Error Message of Change Password
    this.changePasswordFormErrorMessages = {
      currentPassword: { required: "Current Password cannot be Blank", },
      newPassword: { required: "Password can't be blank", pattern: "Password should contain should be between 6 to 15 characters long, with at least one uppercase letter, one lowercase letter and one digit" },
      confirmNewPassword: { required: "Confirm Password should match with New Password" }
    };

    //Form Control Declration of Delete Password
    this.deleteRetailerForm = new FormGroup({
      id: new FormControl(null),
      retailerID: new FormControl(null),
      retailerName: new FormControl(null)
    });
  }

  // Page Initial Function
  ngOnInit() {
    this.retailersService.GetRetailerByRetailerID(this.userAccountService.currentUserID).subscribe((response) => {
      if (response != null && response.length > 0) {
        this.retailers = response;
      }
    }, (error) => {
      console.log(error);
    })
  }

  // Function after Chilcking on Update Profile
  onUpdateRetailerClick() {
    this.updateRetailerForm.reset();
    this.updateRetailerForm["submitted"] = false;
    this.updateRetailerForm.patchValue({
      id: this.retailers[0].id,
      retailerID: this.retailers[0].retailerID,
      retailerName: this.retailers[0].retailerName,
      retailerMobile: this.retailers[0].retailerMobile,
      email: this.retailers[0].email,
      password: this.retailers[0].password,
      creationDateTime: this.retailers[0].creationDateTime
    });
  }

  //Function after Click on Save 
  onUpdateRetailerConfirmClick(event) {
    this.updateRetailerForm["submitted"] = true;
    if (this.updateRetailerForm.valid) {
      this.updateRetailerDisabled = true;
      var retailer: Retailer = this.updateRetailerForm.value;

      this.retailersService.UpdateRetailer(retailer).subscribe((updateResponse) => {
        this.updateRetailerForm.reset();
        $("#btnUpdateRetailerCancel").trigger("click");
        this.updateRetailerDisabled = false;
        this.retailersService.GetRetailerByRetailerID(this.userAccountService.currentUserID).subscribe((getResponse) => {
          this.retailers = getResponse;
        }, (error) => {
          console.log(error);
        });
      },
        (error) => {
          console.log(error);
          this.updateRetailerDisabled = false;
        });
    }
    else {
      super.getFormGroupErrors(this.updateRetailerForm);
    }
  }

  //function for frorm Control
  getFormControlCssClass(formControl: FormControl, formGroup: FormGroup): any {
    return {
      'is-invalid': formControl.invalid && (formControl.dirty || formControl.touched || formGroup["submitted"]),
      'is-valid': formControl.valid && (formControl.dirty || formControl.touched || formGroup["submitted"])
    };
  }

  getFormControlErrorMessage(formControlName: string, validationProperty: string): string {
    return this.updateRetailerFormErrorMessages[formControlName][validationProperty];
  }

  getChangePasswordFormControlErrorMessage(formControlName: string, validationProperty: string): string {
    return this.changePasswordFormErrorMessages[formControlName][validationProperty];
  }
  getCanShowFormControlErrorMessage(formControlName: string, validationProperty: string, formGroup: FormGroup): boolean {
    return formGroup.get(formControlName).invalid && (formGroup.get(formControlName).dirty || formGroup.get(formControlName).touched || formGroup['submitted']) && formGroup.get(formControlName).errors[validationProperty];
  }


  //Mrthod for change Password
  onChangePasswordClick() {
    this.changePasswordForm.reset();
    this.changePasswordForm["submitted"] = false;
  }

  onChangePasswordConfirmClick($event) {
    this.changePasswordForm["submitted"] = true;
    if (this.changePasswordForm.valid) {
      var previouspassword: string = this.retailers[0].password;
      this.changePasswordDisabled = true;
      var newpassword: string = this.changePasswordForm.value.newPassword;
      var confirmpassword: string = this.changePasswordForm.value.confirmNewPassword;
      var retailer: Retailer = this.retailers[0];
      if (this.changePasswordForm.value.currentPassword == previouspassword) {
        if (newpassword == confirmpassword) {
          this.retailersService.ChangeRetailerPassword(retailer).subscribe((updateResponse) => {
            this.changePasswordForm.reset();
            $("#btnChangePasswordCancel").trigger("click");
            this.changePasswordDisabled = false;

            this.retailersService.GetRetailerByRetailerID(this.userAccountService.currentUserID).subscribe((getResponse) => {
              this.retailers = getResponse;
            }, (error) => {
              console.log(error);
            });
          },
            (error) => {
              console.log(error);
              this.changePasswordDisabled = false;
            });

        }
        else {
          alert('New Password does not Match with Confirm new Password');
          $("#btnChangePasswordCancel").trigger("click");
          this.changePasswordDisabled = false;
        }
      }
      else {
        alert('Current Password does not match with the store Password');
        $("#btnChangePasswordCancel").trigger("click");
        this.changePasswordDisabled = false;

      }
    }
    else {
      super.getFormGroupErrors(this.changePasswordForm);
    }
  }
  //Method of Delete Account Button (onDeleteRetailerClick)
  onDeleteRetailerClick() {
    this.deleteRetailerForm.reset();
    this.deleteRetailerForm["submitted"] = false;
    this.deleteRetailerForm.patchValue({
      id: this.retailers[0].id,
      retailerID: this.retailers[0].retailerID,
      retailerName: this.retailers[0].retailerName
    });
  }


  //Method on final Click of Delete of Delete Form(onDeleteRetailerConfirmClick)
  onDeleteRetailerConfirmClick(event) {
    this.deleteRetailerForm["submitted"] = true;
    if (this.deleteRetailerForm.valid) {
      this.deleteRetailerDisabled = true;
      var retailer: Retailer = this.deleteRetailerForm.value;

      this.retailersService.DeleteRetailer(retailer.retailerID, retailer.id).subscribe((deleteResponse) => {
        this.deleteRetailerForm.reset();
        this.deleteRetailerDisabled = false;
        this.deleted = true;
        this.router.navigate(['login']);

      },
        (error) => {
          console.log(error);
          this.deleteRetailerDisabled = false;
        });
    }
    else {
      super.getFormGroupErrors(this.deleteRetailerForm);
    }
  }

}
