//author: C Akhil Chowdary
//component for order initialization
import { Component, OnInit } from '@angular/core';
import { OrdersService } from '../../Services/orders.service';
import { FormGroup, FormControl, Validators, FormArray } from '@angular/forms';
import { GreatOutdoorComponentBase } from '../../GreatOutdoor-component';
import { Order } from '../../Models/order';
import { OrderDetail } from '../../Models/order-detail';
import { OrderDetailsService } from '../../Services/order-details.service';
import { Product } from '../../Models/product';
import { ProductsService } from '../../Services/product.services';
import { Retailer } from '../../Models/retailer';
import { RetailersService } from 'src/app/Services/retailers.service';

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html', // respective template for this component
  styleUrls: ['./order.component.scss'] // respective style sheet for this componet
})
export class OrderComponent extends GreatOutdoorComponentBase implements OnInit {
  retailers: Retailer[] = [];
  products: Product[] = [];
  order: Order[]=[]; //order object
  newOrderForm: FormGroup;
  i: number;//iterator
  showOrderSpinner: boolean = false;
  newOrderFormErrorMessages: any;
  orderdetails: OrderDetail[] = [];//orderdetail object
  ConfirmDetailsenable: boolean = false;

  //constructor to initialize forms
  constructor(private retailersService: RetailersService,private productsService: ProductsService,  private ordersService: OrdersService, private orderDetailsService: OrderDetailsService) {
    super();

    this.newOrderForm = new FormGroup({
      orderDate: new FormControl(new Date().toLocaleDateString()),
      retailerID: new FormControl(null),
      totalQuantity: new FormControl(0),
      totalAmount: new FormControl(0),
   orderDetails:
        new FormArray([
          new FormGroup({
          orderID: new FormControl(null),
          productName: new FormControl(null),
          productID: new FormControl(null),
          unitPrice: new FormControl(null),
          quantity: new FormControl(1, [Validators.required, Validators.pattern(/^[0-9]*$/)]),
          totalAmount: new FormControl(null),
        })
      ])
    });
  }

  //click event for product dropdown
  onProductDropDownChange(index: number) {
    var currentFormGroup: FormGroup = (this.newOrderForm.get('orderDetails') as FormArray).at(index) as FormGroup
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


  //function on change in number of quantity
  onQuantityChange(index: number) {
    var currentFormGroup: FormGroup = (this.newOrderForm.get('orderDetails') as FormArray).at(index) as FormGroup;
    var quantity = Number(currentFormGroup.get('quantity').value);
    var unitPrice = Number(currentFormGroup.get('unitPrice').value);

    currentFormGroup.patchValue({
      quantity: quantity,
      totalAmount: quantity * unitPrice
    });
  }

  //function on clicking "-" button
  onQuantityDecrementClick(index: number) {
    var currentFormGroup: FormGroup = (this.newOrderForm.get('orderDetails') as FormArray).at(index) as FormGroup;

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
    var currentFormGroup: FormGroup = (this.newOrderForm.get('orderDetails') as FormArray).at(index) as FormGroup;
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
    (this.newOrderForm.get('orderDetails') as FormArray).push(new FormGroup({
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
      (this.newOrderForm.get('orderDetails') as FormArray).removeAt(index);
    }
  }
  //= this.newOrderForm.value


  //function on clicking "Confirm Order" button
  onAddOrderClick(event) {
    
      
    this.newOrderForm["submitted"] = true;
    console.log(this.newOrderForm.valid);
    if (true) {//this.newOrderForm.valid

      var order1: Order = new Order(null, null, null, null, null, null, null, null, null);
      var orderdetail: OrderDetail = new OrderDetail(null, null, null, null, null, null, null, null, null,null,null);
      var array: FormArray = this.newOrderForm.get('orderDetails') as FormArray;
      order1.id = 3;
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

        this.ordersService.AddOrder(order1).subscribe((addResponse) => {

          for (let i = 0; i < array.value.length; i++) {
            orderdetail.orderID = order1.orderID;
            orderdetail.productname = array.value[i].productName;
            orderdetail.quantity = array.value[i].quantity;
            orderdetail.totalAmount = array.value[i].totalAmount;
            orderdetail.unitPrice = array.value[i].unitPrice;
            orderdetail.id = i + 1;

            this.orderDetailsService.AddOrderDetail(orderdetail).subscribe((addResponse) => {

              console.log(addResponse);
              this.orderDetailsService.GetOrderDetails().subscribe((getResponse) => {

                this.orderdetails = getResponse;
              },
                (error) => {
                  console.log(error);
                });
              this.newOrderForm.reset();
              

              this.ordersService.GetAllOrders().subscribe((getResponse) => {

                this.order = getResponse;
                
                
                console.log(this.orderdetails);
                this.ConfirmDetailsenable = true;
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
  ngOnInit() {
    this.productsService.GetAllProducts().subscribe((response) => {
      this.products = response;
    }, (error) => {
        console.log(error);
      });
    this.orderDetailsService.GetOrderDetails().subscribe((response) => {
      console.log(response)
      this.orderdetails = response;


    }, (error) => {
      console.log(error);
    });

  }


}
