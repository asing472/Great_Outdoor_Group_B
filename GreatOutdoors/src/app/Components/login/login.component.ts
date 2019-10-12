import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserAccountService } from '../../Services/user-account.service';
import { User } from '../../Models/user';
import { GreatOutdoorDataService } from 'src/app/InMemoryWebAPIServices/GreatOutdoor-data.service';
import { Admin } from 'src/app/Models/admin';
import { SalesPerson } from 'src/app/Models/salesPerson';
import { Retailer } from 'src/app/Models/retailer';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit
{
  loginForm: FormGroup;
  invalid: boolean = true;

  constructor(private userAccountService: UserAccountService, private router: Router)
  {
    this.loginForm = new FormGroup(
      {
        email: new FormControl(null),
        password: new FormControl(null),
        Usertype: new FormControl(null)
      });
  }

  ngOnInit()
  {
  }
  
  onLoginClick()
  {
    //var selectedindex=this.loginForm.elements["UserCategory"].selectedIndex
    //let sel = null;
    var sel = (<HTMLInputElement>document.getElementById('Usertype')).value;

   // var user= sel.options[sel.selectedIndex].text;
    //console.log(sel);
    
    
      this.userAccountService.authenticate(this.loginForm.value.email, this.loginForm.value.password,sel).subscribe((response) => {
        //debugger;
        console.log(this.loginForm.value.email);
        console.log(this.loginForm.value.password);
        console.log(response);

        if (response != null && response.length > 0) {
          if (sel == "Admin") {
          this.userAccountService.currentUser = new User(this.loginForm.value.email, response[0].adminName);
          this.userAccountService.currentUserType = sel;
          this.userAccountService.isLoggedIn = true;
          this.userAccountService.currentUserID = response[0].adminID;
          
            this.router.navigate(["/admin", "home"]);
          }
          else if (sel == "SalesPerson")
          {
            this.userAccountService.currentUser = new User(this.loginForm.value.email, response[0].salesPersonName);
            this.userAccountService.currentUserType = sel;
            this.userAccountService.currentUserID = response[0].salesPersonID;

            this.userAccountService.isLoggedIn = true;
            this.router.navigate(["/salesPerson","home"]);
          }
          else {
            this.userAccountService.currentUser = new User(this.loginForm.value.email, response[0].retailerName);
            this.userAccountService.currentUserType = sel;
            this.userAccountService.currentUserID = response[0].retailerID;

            this.userAccountService.isLoggedIn = true;
            this.router.navigate(["/retailer","home"]);
          }
          
        } else { alert("Invalid Email or Password");}

      }, (error) => {
        console.log(error);
      });
    
    }
  }
  





