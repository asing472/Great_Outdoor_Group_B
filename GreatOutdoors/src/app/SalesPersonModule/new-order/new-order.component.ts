//author: Abhishek Kushwah
//offline order component 
import { Component, OnInit } from '@angular/core';
import { OfflineOrder } from '../../Models/OfflineOrder';
import { OfflineOrdersService } from '../../Services/offline-order.services';
import { OfflineOrderDetail } from '../../Models/OfflineOrderDetail';
import { OfflineOrderDetailsService } from '../../Services/offline-order-detail.services';
import { FormGroup, FormControl, Validators, FormArray } from '@angular/forms';
import * as $ from "jquery";
import { Retailer } from '../../Models/Retailer';
import { RetailersService } from '../../Services/retailers.service';
import { GreatOutdoorComponentBase } from '../../GreatOutdoor-component';
import { Product } from 'src/app/Models/product';
import { ProductsService } from '../../Services/product.services'

@Component({
  selector: 'app-new-order',
  templateUrl: './new-order.component.html', // respective template for this component
  styleUrls: ['./new-order.component.scss'] // respective style sheet for this componet
})
export class NewOrderComponent extends GreatOutdoorComponentBase implements OnInit {
  offlineorder: OfflineOrder;

  i: number;
  retailers: Retailer[] = [];
  products: Product[] = [];
  EnterdetailsEnable: boolean = true;
  SelectproductEnable: boolean = false;
  ConfirmDetailsenable: boolean = false;
  newOrderForm: FormGroup;

  offlineOrderDetails: OfflineOrderDetail[] = [];
  offlineOrders: OfflineOrder[] = []
  

 //constructor to initialize forms
  constructor(private retailerService: RetailersService, private productsService: ProductsService, private offlineordersService: OfflineOrdersService, private offlineorderDetailsService: OfflineOrderDetailsService) {
    super();
    this.newOrderForm = new FormGroup({
      offlineorderDate: new FormControl(new Date().toLocaleDateString()),
      retailerID: new FormControl(null),
      salespersonID: new FormControl(null),
      totalQuantity: new FormControl(0),
      totalAmount: new FormControl(0),
      offlineorderDetails:
        new FormArray([
          new FormGroup({
            offlineorderID: new FormControl(null),
            productID: new FormControl("", [Validators.required]),
            quantity: new FormControl(1, [Validators.required, Validators.pattern(/^[0-9]*$/)]),
            unitPrice: new FormControl(null),
            totalAmount: new FormControl(null)
          })
        ])
    });
  }

  //click event for details 
  onEnterDetailsClick() {
    this.EnterdetailsEnable = true;
    this.SelectproductEnable = false;
   this.ConfirmDetailsenable = false;
  }

  //click event for product dropdown
  onSelectProductClick() {
    this.EnterdetailsEnable = false;
    this.SelectproductEnable = true;
    this.ConfirmDetailsenable = false;
  }

  //for change in quanity
  onQuantityChange(index: number) {
    var currentFormGroup: FormGroup = (this.newOrderForm.get('offlineorderDetails') as FormArray).at(index) as FormGroup;
    var quantity = Number(currentFormGroup.get('quantity').value);
    var unitPrice = Number(currentFormGroup.get('unitPrice').value);

    currentFormGroup.patchValue({
      totalAmount: quantity * unitPrice
    });
  }

  ngOnInit() {
    this.retailerService.GetAllRetailers().subscribe((response) => {
      console.log(response);
      this.retailers = response;
    }, (error) => {
      console.log(error);
    });
    this.productsService.GetAllProducts().subscribe((response) => {

      this.products = response;
    }, (error) => {
      console.log(error);
    });
    this.offlineorderDetailsService.GetAllOfflineOrderDetails().subscribe((response) => {
      console.log(response)
      this.offlineOrderDetails = response;


    }, (error) => {
      console.log(error);
    });

  }
  //on clicking add products
  onBtnAddProductClick(index: number) {
  
    (this.newOrderForm.get('offlineorderDetails') as FormArray).push(new FormGroup({
      offlineorderID: new FormControl(null),
      productID: new FormControl("", [Validators.required]),
      quantity: new FormControl(1, [Validators.required, Validators.pattern(/^[0-9]*$/)]),
      unitPrice: new FormControl(null),
      totalAmount: new FormControl(null)
    }));
  }

  //click event for product dropdown
  onProductDropdownChange(index: number) {
    var currentFormGroup: FormGroup = (this.newOrderForm.get('offlineorderDetails') as FormArray).at(index) as FormGroup;
    var currentProductID = currentFormGroup.get('productID').value;
    this.productsService.GetProductByProductID(currentProductID).subscribe((response: any) => {
      if (response.length > 0) {
        currentFormGroup.patchValue({
          unitPrice: response[0].productPrice,
          totalAmount: response[0].productPrice
        });
      }
    },
      (error) => {
        console.log(error);
      });
  }

  //click event for product removal
  onProductDeleteClick(index: number) {
    if (confirm("Are you sure to delete?")) {
      (this.newOrderForm.get('offlineorderDetails') as FormArray).removeAt(index);
    }
  }


  //click event for next button 
  onNextButtonClick(event) {
    this.EnterdetailsEnable = false;
    this.SelectproductEnable = true;
    this.ConfirmDetailsenable = false;

  }


  //click event forconfirming details
  onConfirmDetailsClick() {
    this.EnterdetailsEnable = false;
    this.SelectproductEnable = false;
    this.ConfirmDetailsenable = true;
  }

  //event for saving
  onSaveClick(event) {
    
    this.newOrderForm["submitted"] = true;
    console.log(this.newOrderForm.valid);
    if (true) {//this.newOrderForm.valid

      var order1: OfflineOrder = new OfflineOrder(null, null, null, null, null, null, null, null, null);
      var orderdetail: OfflineOrderDetail = new OfflineOrderDetail(null, null, null, null, null, null, null, null, null);
      var array: FormArray = this.newOrderForm.get('offlineorderDetails') as FormArray;
      order1.id = 1;
      console.log(array);
      order1.totalQuantity = 0;
      for (let i = 0; i < array.value.length; i++) {
        order1.totalQuantity += array.value[i].quantity; //array.at(i).get('totalQuantity').value;
      }
      console.log(order1.totalQuantity);
      for (let i = 0; i < array.length; i++) {
        order1.totalAmount += array.value[i].totalAmount;//array.at(i).get('totalAmount').value;
      }
      console.log(order1.totalAmount);
      if (confirm("Do you want to place order")) {

        this.offlineordersService.AddOrder(order1).subscribe((addResponse) => {

          for (let i = 0; i < array.value.length; i++) {
            orderdetail.offlineorderID = order1.offlineorderID;
            orderdetail.productID = array.value[i].productID;
            orderdetail.quantity = array.value[i].quantity;
            orderdetail.totalAmount = array.value[i].totalAmount;
            orderdetail.unitPrice = array.value[i].unitPrice;
            orderdetail.id = i + 1;

            this.offlineorderDetailsService.AddOfflineOrderDetail(orderdetail).subscribe((addResponse) => {

              console.log(addResponse);
              this.offlineorderDetailsService.GetAllOfflineOrderDetails().subscribe((getResponse) => {

                this.offlineOrderDetails = getResponse;
              },
                (error) => {
                  console.log(error);
                });
              this.newOrderForm.reset();
              
              this.offlineordersService.GetAllOrders().subscribe((getResponse) => {

                this.offlineOrders = getResponse;
                this.EnterdetailsEnable = false;
                this.SelectproductEnable = false;
                this.ConfirmDetailsenable = true;
                console.log(this.offlineOrderDetails);
              }, (error) => {
                console.log(error);
              });
            },
              (error) => {
                console.log(error);

              });
          }
        },
          (error) => {
            console.log(error);

          });
        
      }
    }
  }

}
