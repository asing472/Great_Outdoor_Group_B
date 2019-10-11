//author: C Akhil Chowdary
//component for order history
import { Component, OnInit } from '@angular/core';
import { OrdersDataService } from '../../InMemoryWebAPIServices/orders-data.service';
import { OrderDetail } from '../../Models/order-detail';
import { OrdersService } from '../../Services/orders.service';
import { OrderDetailsService } from '../../Services/order-details.service';

@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',// respective template for this component
  styleUrls: ['./orders.component.scss'// respective style sheet for this component
  ]
})

export class OrdersComponent extends OrdersDataService implements OnInit
{
  showOrdersSpinner: boolean = false;
  orderdetails: OrderDetail[] = this.orderdetails;


  //constructor to inject components
  constructor(private orderdetailsService: OrderDetailsService) {
    super();
  }

  //display orders
  ngOnInit() {
    this.showOrdersSpinner = true;
    this.orderdetailsService.GetOrderDetails().subscribe((response) =>
    {
      this.orderdetails = response;
      this.showOrdersSpinner = false;
    }, (error) =>
      {
        console.log(error);
     })
  }
}
