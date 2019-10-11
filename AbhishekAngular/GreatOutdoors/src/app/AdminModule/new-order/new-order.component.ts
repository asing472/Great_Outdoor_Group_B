import { Component, OnInit } from '@angular/core';
import { OfflineOrder } from '../../Models/OfflineOrder';
import { OfflineOrdersService } from '../../Services/offline-order.services';
import { OfflineOrderDetail } from '../../Models/OfflineOrderDetail';
import { OfflineOrderDetailsService } from '../../Services/offline-order-detail.services';
import { FormGroup, FormControl, Validators, FormArray } from '@angular/forms';
import * as $ from "jquery";
import { Retailer } from '../../Models/Retailer';
import { RetailersService } from '../../Services/retailer.services';
import { GreatOutdoorsComponentBase } from '../../GreatOutdoors-components';
import { Product } from 'src/app/Models/product';
import { ProductsService } from '../../Services/product.services'



@Component({
  selector: 'app-new-order',
  templateUrl: './new-order.component.html',
  styleUrls: ['./new-order.component.scss']
})
export class NewOrderComponent extends GreatOutdoorsComponentBase implements OnInit {
  offlineorder: OfflineOrder;

  i: number;
  retailers: Retailer[] = [];
  products: Product[] = [];
  EnterdetailsEnable: boolean = true;
  SelectproductEnable: boolean = false;
  ConfirmDetailsenable: boolean = false;
  newOrderForm: FormGroup;
  newOrderDetailForm: FormGroup;
  offlineOrderDetails: OfflineOrderDetail[] = [];





  constructor(private retailerService: RetailersService, private productsService: ProductsService, private offlineordersService: OfflineOrdersService, private offlineorderDetailsService: OfflineOrderDetailsService) {
    super();
    this.newOrderForm = new FormGroup({
      offlineorderDate: new FormControl(new Date().toLocaleDateString()),
      retailerID: new FormControl(null),
      salespersonID: new FormControl(null),
      totalQuantity: new FormControl(0),
      totalAmount: new FormControl(0)
    })
    this.newOrderDetailForm = new FormGroup({
      offlineorderDetails: new FormArray([
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
  onEnterDetailsClick() {
    this.EnterdetailsEnable = true;
    this.SelectproductEnable = false;
    this.ConfirmDetailsenable = false;

  }
  onSelectProductClick() {
    this.EnterdetailsEnable = false;
    this.SelectproductEnable = true;
    this.ConfirmDetailsenable = false;

  }
  
  //onButtonModelClick(index:number) {
  //  var currentFormGroup: FormGroup = (this.newOrderDetailForm.get('offlineorderDetails') as FormArray).at(index) as FormGroup;
  //  var id = String(currentFormGroup.get('productID').value)
  //  var product: Product = this.productsService.GetProductByProductID(id);

  //}
  onQuantityChange(index: number) {
    var currentFormGroup: FormGroup = (this.newOrderDetailForm.get('offlineorderDetails') as FormArray).at(index) as FormGroup;
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

  }
  onBtnAddProductClick(index: number) {


    (this.newOrderDetailForm.get('offlineorderDetails') as FormArray).push(new FormGroup({
      offlineorderID: new FormControl(null),
      productID: new FormControl("", [Validators.required]),
      quantity: new FormControl(1, [Validators.required, Validators.pattern(/^[0-9]*$/)]),
      unitPrice: new FormControl(null),
      totalAmount: new FormControl(null)
    }));
  }

  onProductDropdownChange(index: number) {
    var currentFormGroup: FormGroup = (this.newOrderDetailForm.get('offlineorderDetails') as FormArray).at(index) as FormGroup;
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
  onProductDeleteClick(index: number) {
    if (confirm("Are you sure to delete?")) {
      (this.newOrderDetailForm.get('offlineorderDetails') as FormArray).removeAt(index);
    }
  }



  onNextButtonClick(event) {

    this.EnterdetailsEnable = false;
    this.SelectproductEnable = true;
    this.ConfirmDetailsenable = false;


  }

  onSaveClick(event) {
    this.newOrderForm["submitted"] = true;
    if (this.newOrderForm.valid) {

      var order: OfflineOrder = this.newOrderForm.value;
      this.offlineordersService.AddOrder(order);
      console.log(order);

      var currentFormArray: FormArray = (this.newOrderDetailForm.get('offlineorderDetails') as FormArray);
      
      for (this.i = 0; this.i < 2; this.i++) {
        var currentFormGroup: FormGroup = (currentFormArray[this.i] as FormGroup);
        this.newOrderDetailForm["submitted"] = true;
        if (this.newOrderDetailForm.valid) {

          var orderdetail: OfflineOrderDetail = this.newOrderDetailForm.value;
          orderdetail.offlineorderID = order.offlineorderID;
          this.offlineorderDetailsService.AddOfflineOrderDetail(orderdetail);
          console.log(orderdetail);
        }


      }



    }
    










  }
  onConfirmDetailsClick() {
    this.EnterdetailsEnable = false;
    this.SelectproductEnable = false;
    this.ConfirmDetailsenable = true;


    this.offlineorderDetailsService.GetAllOfflineOrderDetails().subscribe((response) => {
      console.log(response)
      this.offlineOrderDetails = response;


    }, (error) => {
      console.log(error);
    });


  }
}
