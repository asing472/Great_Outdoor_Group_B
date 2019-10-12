import { Component, OnInit } from '@angular/core';
import { SalesPerson } from '../../Models/salesPerson';
import { SalesPersonsService } from '../../Services/salesPersons.service';
import { FormGroup, FormControl, Validators, FormBuilder } from '@angular/forms';
import * as $ from "jquery";
import { GreatOutdoorComponentBase } from '../../GreatOutdoor-component';
import { UserAccountService } from 'src/app/Services/user-account.service';
import { User } from 'src/app/Models/user';
import { Router } from '@angular/router';



// Create By Ayush Agrawal on 08/10/2019
// TS for SalesPerson Profile Page 
@Component({
  selector: 'app-salesPerson',
  templateUrl: './salesPerson.component.html',
  styleUrls: ['./salesPerson.component.scss']
})
export class SalesPersonComponent extends GreatOutdoorComponentBase implements OnInit {
  salesPersons: SalesPerson[] = [];
  salesPerson: SalesPerson;


  // Update SalesPerson Form Creation
  updateSalesPersonForm: FormGroup;
  updateSalesPersonDisabled: boolean = false;
  updateSalesPersonFormErrorMessages: any;
  // Change SalesPerson Form Creation
  changePasswordForm: FormGroup;
  changePasswordDisabled: boolean = false;
  changePasswordFormErrorMessages: any;

  // Delete SalesPerson Form Creation
  deleteSalesPersonForm: FormGroup;
  deleteSalesPersonDisabled: boolean = false;
  deleted: boolean = false;

  // Constructor Initialization
  constructor(private salesPersonsService: SalesPersonsService, private userAccountService: UserAccountService, private router: Router) {
    super();

    // From Component for Update SalesPerson Form
    this.updateSalesPersonForm = new FormGroup({
      id: new FormControl(null),
      salesPersonID: new FormControl(null),
      salesPersonName: new FormControl(null, [Validators.required, Validators.minLength(2), Validators.maxLength(40)]),
      salesPersonMobile: new FormControl(null, [Validators.required, Validators.pattern(/^[6789]\d{9}$/)]),
      email: new FormControl(null, [Validators.required, Validators.email]),
      password: new FormControl(null),
      creationDateTime: new FormControl(null)
    });

    //Error messsage of Update SalesPerson
    this.updateSalesPersonFormErrorMessages = {
      salesPersonName: { required: "Your Name can't be blank", minlength: "your Name should contain at least 2 characters", maxlength: "Your Name can't be longer than 40 characters" },
      salesPersonMobile: { required: "Mobile number can't be blank", pattern: "10 digit Mobile number is required" },
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
    this.deleteSalesPersonForm = new FormGroup({
      id: new FormControl(null),
      salesPersonID: new FormControl(null),
      salesPersonName: new FormControl(null)
    });
  }

  // Page Initial Function
  ngOnInit() {
    this.salesPersonsService.GetSalesPersonBySalesPersonID(this.userAccountService.currentUserID).subscribe((response) => {
      if (response != null && response.length > 0) {
        this.salesPersons = response;
      }
    }, (error) => {
      console.log(error);
    })
  }

  // Function after Chilcking on Update Profile
  onUpdateSalesPersonClick() {
    this.updateSalesPersonForm.reset();
    this.updateSalesPersonForm["submitted"] = false;
    this.updateSalesPersonForm.patchValue({
      id: this.salesPersons[0].id,
      salesPersonID: this.salesPersons[0].salesPersonID,
      salesPersonName: this.salesPersons[0].salesPersonName,
      salesPersonMobile: this.salesPersons[0].salesPersonMobile,
      email: this.salesPersons[0].email,
      password: this.salesPersons[0].password,
      creationDateTime: this.salesPersons[0].creationDateTime
    });
  }

  //Function after Click on Save 
  onUpdateSalesPersonConfirmClick(event) {
    this.updateSalesPersonForm["submitted"] = true;
    if (this.updateSalesPersonForm.valid) {
      this.updateSalesPersonDisabled = true;
      var salesPerson: SalesPerson = this.updateSalesPersonForm.value;

      this.salesPersonsService.UpdateSalesPerson(salesPerson).subscribe((updateResponse) => {
        this.updateSalesPersonForm.reset();
        $("#btnUpdateSalesPersonCancel").trigger("click");
        this.updateSalesPersonDisabled = false;
        this.salesPersonsService.GetSalesPersonBySalesPersonID(this.userAccountService.currentUserID).subscribe((getResponse) => {
          this.salesPersons = getResponse;
        }, (error) => {
          console.log(error);
        });
      },
        (error) => {
          console.log(error);
          this.updateSalesPersonDisabled = false;
        });
    }
    else {
      super.getFormGroupErrors(this.updateSalesPersonForm);
    }
  }

  //function for form Control
  getFormControlCssClass(formControl: FormControl, formGroup: FormGroup): any {
    return {
      'is-invalid': formControl.invalid && (formControl.dirty || formControl.touched || formGroup["submitted"]),
      'is-valid': formControl.valid && (formControl.dirty || formControl.touched || formGroup["submitted"])
    };
  }

  getFormControlErrorMessage(formControlName: string, validationProperty: string): string {
    return this.updateSalesPersonFormErrorMessages[formControlName][validationProperty];
  }

  getChangePasswordFormControlErrorMessage(formControlName: string, validationProperty: string): string {
    return this.changePasswordFormErrorMessages[formControlName][validationProperty];
  }
  getCanShowFormControlErrorMessage(formControlName: string, validationProperty: string, formGroup: FormGroup): boolean {
    return formGroup.get(formControlName).invalid && (formGroup.get(formControlName).dirty || formGroup.get(formControlName).touched || formGroup['submitted']) && formGroup.get(formControlName).errors[validationProperty];
  }


  //Method for change Password
  onChangePasswordClick() {
    this.changePasswordForm.reset();
    this.changePasswordForm["submitted"] = false;
  }

  onChangePasswordConfirmClick($event) {
    this.changePasswordForm["submitted"] = true;
    if (this.changePasswordForm.valid) {
      var previouspassword: string = this.salesPersons[0].password;
      this.changePasswordDisabled = true;
      var newpassword: string = this.changePasswordForm.value.newPassword;
      var confirmpassword: string = this.changePasswordForm.value.confirmNewPassword;
      var salesPerson: SalesPerson = this.salesPersons[0];
      if (this.changePasswordForm.value.currentPassword == previouspassword) {
        if (newpassword == confirmpassword) {
          this.salesPersonsService.ChangeSalesPersonPassword(salesPerson).subscribe((updateResponse) => {
            this.changePasswordForm.reset();
            $("#btnChangePasswordCancel").trigger("click");
            this.changePasswordDisabled = false;

            this.salesPersonsService.GetSalesPersonBySalesPersonID(this.userAccountService.currentUserID).subscribe((getResponse) => {
              this.salesPersons = getResponse;
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
  //Method of Delete Account Button (onDeleteSalesPersonClick)
  onDeleteSalesPersonClick() {
    this.deleteSalesPersonForm.reset();
    this.deleteSalesPersonForm["submitted"] = false;
    this.deleteSalesPersonForm.patchValue({
      id: this.salesPersons[0].id,
      salesPersonID: this.salesPersons[0].salesPersonID,
      salesPersonName: this.salesPersons[0].salesPersonName
    });
  }


  //Method on final Click of Delete of Delete Form(onDeleteSalesPersonConfirmClick)
  onDeleteSalesPersonConfirmClick(event) {
    this.deleteSalesPersonForm["submitted"] = true;
    if (this.deleteSalesPersonForm.valid) {
      this.deleteSalesPersonDisabled = true;
      var salesPerson: SalesPerson = this.deleteSalesPersonForm.value;

      this.salesPersonsService.DeleteSalesPerson(salesPerson.salesPersonID, salesPerson.id).subscribe((deleteResponse) => {
        this.deleteSalesPersonForm.reset();
        this.deleteSalesPersonDisabled = false;
        this.deleted = true;
        this.router.navigate(['login']);

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

}
