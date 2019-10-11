//author: C Akhil Chowdary
//component for order initialization
import { Component, OnInit } from '@angular/core';
import { OrdersService } from '../../Services/orders.service';
import { FormGroup, FormControl, Validators, FormArray } from '@angular/forms';
import { OrdersDataService } from '../../InMemoryWebAPIServices/orders-data.service';
import { Order } from '../../Models/order';
import { OrderDetail } from '../../Models/order-detail';
import { OrderDetailsService } from '../../Services/order-details.service';

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html', // respective template for this component
  styleUrls: ['./order.component.scss'] // respective style sheet for this componet
})
export class OrderComponent extends OrdersDataService implements OnInit {
  //retailers: Retailer[] = [];
  //products: Product[] = [];
  //order: Order; //order object
  newOrderDetailForm: FormGroup;
  i: number;//iterator
  showOrderSpinner: boolean = false;
  newOrderForm: FormGroup;
  newOrderFormErrorMessages: any;
  orderdetailsfinal: OrderDetail;//orderdetail object

  //constructor to initialize forms
  constructor(/*private retailersService: RetailersService,private productsService: ProductsService,*/  private ordersService: OrdersService, private orderDetailsService: OrderDetailsService) {
    super();

    this.newOrderForm = new FormGroup({
      orderDate: new FormControl(new Date().toLocaleDateString()),
      retailerID: new FormControl(null),
      totalQuantity: new FormControl(0),
      totalAmount: new FormControl(0)
    })
    this.newOrderDetailForm = new FormGroup({ orderDetails: new FormArray([
        new FormGroup({
          orderID: new FormControl(null),
         // productCategory: new FormControl(null, [Validators.required]),
          productName: new FormControl(null, [Validators.required]),
          productID: new FormControl("", [Validators.required]),
          unitPrice: new FormControl(null),
          quantity: new FormControl(1, [Validators.required, Validators.pattern(/^[0-9]*$/)]),
          totalAmount: new FormControl(null),
          //addressID: new FormControl(null, [Validators.required])
        })
      ])
    });
  }

  //click event for product dropdown
  onProductDropDownChange(index: number) {
    var currentFormGroup: FormGroup = (this.newOrderDetailForm.get('orderDetails') as FormArray).at(index) as FormGroup
    var currentProductName = currentFormGroup.get('productID').value;
    if (currentProductName == "tent") {
      currentFormGroup.patchValue({
        totalAmount: 100,
        unitPrice: 100
      });
    }

    else if (currentProductName == "mat") {
      currentFormGroup.patchValue({
        totalAmount: 80,
        unitPrice: 80
      });
    }
  }


  //function on change in number of quantity
  onQuantityChange(index: number) {
    var currentFormGroup: FormGroup = (this.newOrderDetailForm.get('orderDetails') as FormArray).at(index) as FormGroup;
    var quantity = Number(currentFormGroup.get('quantity').value);
    var unitPrice = Number(currentFormGroup.get('unitPrice').value);

    currentFormGroup.patchValue({
      quantity: quantity,
      totalAmount: quantity * unitPrice
    });
  }

  //function on clicking "-" button
  onQuantityDecrementClick(index: number) {
    var currentFormGroup: FormGroup = (this.newOrderDetailForm.get('orderDetails') as FormArray).at(index) as FormGroup;

    var quantity = Number(currentFormGroup.get('quantity').value) - 1;
    var unitPrice = Number(currentFormGroup.get('unitPrice').value);
    if (quantity >= 1) {
      currentFormGroup.patchValue({

        quantity: quantity,
        totalAmount: quantity * unitPrice

      });
    }
  }

  //function on clicking "+" button
  onQuantityIncrementClick(index: number) {
    var currentFormGroup: FormGroup = (this.newOrderDetailForm.get('orderDetails') as FormArray).at(index) as FormGroup;
    var quantity = Number(currentFormGroup.get('quantity').value) + 1;
    var unitPrice = Number(currentFormGroup.get('unitPrice').value);


    currentFormGroup.patchValue({
      quantity: quantity,
      totalAmount: quantity * unitPrice,

    });
  }

  //function on clicking "Add New Product" button
  onAddNewProductClick() {
    //var currentFormGroup: FormArray = (this.newOrderForm.get('orderDetails') as FormArray) ;
    //console.log(currentFormGroup.value);
    (this.newOrderDetailForm.get('orderDetails') as FormArray).push(new FormGroup({
      orderID: new FormControl(null),
      //productCategory: new FormControl(null, [Validators.required]),
      productName: new FormControl(null, [Validators.required]),
      productID: new FormControl("", [Validators.required]),
      unitPrice: new FormControl(null),
      quantity: new FormControl(1, [Validators.required, Validators.pattern(/^[0-9]*$/)]),
      totalAmount: new FormControl(null),
     // addressID: new FormControl(null, [Validators.required])
    }));

  }

  //function on clicking "Remove" button
  onRemoveClick(index: number) {
    if (confirm("Are you sure to delete?")) {
      (this.newOrderDetailForm.get('orderDetails') as FormArray).removeAt(index);
    }
  }
  //= this.newOrderForm.value


  //function on clicking "Confirm Order" button
  onAddOrderClick(event) {
    this.newOrderForm["submitted"] = true;
    if (this.newOrderForm.valid) {

      var order: Order = this.newOrderForm.value;
      this.ordersService.AddOrder(order);
      console.log(order);

      var currentFormArray: FormArray = (this.newOrderDetailForm.get('orderDetails') as FormArray);
      console.log(currentFormArray);

      for (this.i = 0; this.i < 2; this.i++) {

        var currentFormGroup: FormGroup = (currentFormArray[this.i] as FormGroup);
        this.newOrderForm["submitted"] = true;
        if (this.newOrderForm.valid) {

          var orderdetail: OrderDetail = this.newOrderDetailForm.value;
          orderdetail.orderID = order.orderID;
          this.orderDetailsService.AddOrderDetail(orderdetail);
          console.log(orderdetail);
        }

      }

    }

  }
  ngOnInit() {
    //this.productsService.GetAllProducts().subscribe((response) => {
    //  this.products = response;
    //}, (error) => {
    //    console.log(error);
    //  });
  }
}
