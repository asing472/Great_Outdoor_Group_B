import { Component, OnInit } from '@angular/core';
import { Admin } from '../../Models/admin';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AdminsService } from '../../Services/admins.service';
import * as $ from "jquery";
import { User } from 'src/app/Models/user';
import { UserAccountService } from 'src/app/Services/user-account.service';
import { GreatOutdoorComponentBase } from '../../greatoutdoor-component';
import { Router } from '@angular/router';

@Component({
  selector: 'app-yourprofile',
  templateUrl: './yourprofile.component.html',
  styleUrls: ['./yourprofile.component.scss']
})
export class YourprofileComponent extends GreatOutdoorComponentBase implements OnInit {
  admins: Admin[] = [];
  admin: Admin;
  invalid: null;

  updateProfileForm: FormGroup;
  updateAdminDisabled: boolean = false;
  updateProfileFormErrorMessages: any;

  changePasswordForm: FormGroup;
  changePasswordDisabled: boolean = false;
  changePasswordFormErrorMessages: any;
  constructor(private adminsService: AdminsService, private userAccountService: UserAccountService, private router: Router) {
    super();
   
    this.updateProfileForm = new FormGroup({
      id: new FormControl(null),
      adminID: new FormControl(null),
      adminName: new FormControl(null, [Validators.required, Validators.minLength(2), Validators.maxLength(40)]),
     email: new FormControl(null, [Validators.required, Validators.email]),
      password: new FormControl(null),
      creationDateTime: new FormControl(null)
    });

    this.updateProfileFormErrorMessages = {
      adminName: { required: "Your Name can't be blank", minlength: "your Name should contain at least 2 characters", maxlength: "Your Name can't be longer than 40 characters" },
      adminMobile: { required: "Mobile number can't be blank", pattern: "10 digit Mobile number is required" },
      email: { required: "Email can't be blank", pattern: "Email is invalid" }
    };

    this.changePasswordForm = new FormGroup({
      currentPassword: new FormControl(null, [Validators.required]),
      newPassword: new FormControl(null, [Validators.required, Validators.pattern(/((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,15})/)]),
      confirmNewPassword: new FormControl(null, [Validators.required])
    });

    this.changePasswordFormErrorMessages = {
      currentPassword: { required: "Current Password cannot be Blank", },
      newPassword: { required: "Password can't be blank", pattern: "Password should contain should be between 6 to 15 characters long, with at least one uppercase letter, one lowercase letter and one digit" },
      confirmNewPassword: { required: "Confirm Password should match with New Password" }
    };
   
  }

  ngOnInit() {
    this.adminsService.GetAdminByAdminID(this.userAccountService.currentUserID).subscribe((response) => {
      if (response != null && response.length > 0) {
        this.admins = response;
      }
    }, (error) => {
      console.log(error);
    })
  }
  // Function after Chilcking on Update Profile
  onUpdateAdminClick() {
    this.updateProfileForm.reset();
    this.updateProfileForm["submitted"] = false;
    this.updateProfileForm.patchValue({
      id: this.admins[0].id,
      adminID: this.admins[0].adminID,
      adminName: this.admins[0].adminName,
      email: this.admins[0].email,
      password: this.admins[0].password,
      creationDateTime: this.admins[0].creationDateTime
    });
  }

  //Function after Click on Save 
  onUpdateProfileConfirmClick(event) {
    this.updateProfileForm["submitted"] = true;
    if (this.updateProfileForm.valid) {
      this.updateAdminDisabled = true;
      var admin: Admin = this.updateProfileForm.value;

      this.adminsService.UpdateProfile(admin).subscribe((updateResponse) => {
        this.updateProfileForm.reset();
        $("#btnUpdateAdminCancel").trigger("click");
        this.updateAdminDisabled = false;
        this.adminsService.GetAdminByAdminID(this.userAccountService.currentUserID).subscribe((getResponse) => {
          this.admins = getResponse;
        }, (error) => {
          console.log(error);
        });
      },
        (error) => {
          console.log(error);
          this.updateAdminDisabled = false;
        });
    }
    else {
      super.getFormGroupErrors(this.updateProfileForm);
    }
  }
  onChangePasswordClick() {
    this.changePasswordForm.reset();
    this.changePasswordForm["submitted"] = false;
  }

  onChangePasswordConfirmClick($event) {
    this.changePasswordForm["submitted"] = true;
    if (this.changePasswordForm.valid) {
      var previouspassword: string = this.admins[0].password;
      this.changePasswordDisabled = true;
      var newpassword: string = this.changePasswordForm.value.newPassword;
      var confirmpassword: string = this.changePasswordForm.value.confirmNewPassword;
      var admin: Admin = this.admins[0];
      if (this.changePasswordForm.value.currentPassword == previouspassword) {
        if (newpassword == confirmpassword) {
          this.adminsService.ChangeAdminPassword(admin).subscribe((updateResponse) => {
            this.changePasswordForm.reset();
            $("#btnChangePasswordCancel").trigger("click");
            this.changePasswordDisabled = false;

            this.adminsService.GetAdminByAdminID(this.userAccountService.currentUserID).subscribe((getResponse) => {
              this.admins = getResponse;
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
        alert('Current Password is incorrect');
        $("#btnChangePasswordCancel").trigger("click");
        this.changePasswordDisabled = false;

      }
    }
    else {
      super.getFormGroupErrors(this.changePasswordForm);
    }
  }


  getFormControlCssClass(formControl: FormControl, formGroup: FormGroup): any {
    return {
      'is-invalid': formControl.invalid && (formControl.dirty || formControl.touched || formGroup["submitted"]),
      'is-valid': formControl.valid && (formControl.dirty || formControl.touched || formGroup["submitted"])
    };
  }

  getFormControlErrorMessage(formControlName: string, validationProperty: string): string {
    return this.updateProfileFormErrorMessages[formControlName][validationProperty];
  }

  getCanShowFormControlErrorMessage(formControlName: string, validationProperty: string, formGroup: FormGroup): boolean {
    return formGroup.get(formControlName).invalid && (formGroup.get(formControlName).dirty || formGroup.get(formControlName).touched || formGroup['submitted']) && formGroup.get(formControlName).errors[validationProperty];
  }
  

  getPasswordFormControlErrorMessage(formControlName: string, validationProperty: string): string {
    return this.changePasswordFormErrorMessages[formControlName][validationProperty];
  }

  
}
