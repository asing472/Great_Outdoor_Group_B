//author: C Akhil Chowdary
//component for order history
import { Component, OnInit } from '@angular/core';
import { GreatOutdoorComponentBase } from '../../GreatOutdoor-component';
import { OrderDetail } from '../../Models/order-detail';
import { OrdersService } from '../../Services/orders.service';
import { OrderDetailsService } from '../../Services/order-details.service';
import { Order } from 'src/app/Models/order';


@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',// respective template for this component
  styleUrls: ['./orders.component.scss'// respective style sheet for this component
  ]
})

export class OrdersComponent extends GreatOutdoorComponentBase implements OnInit
{
  showOrdersSpinner: boolean = false;
  orderdetails: Order[];


  //constructor to inject components
  constructor(private orderdetailsService: OrderDetailsService, private orderservice: OrdersService) {
    super();
  }

  //display orders
  ngOnInit() {
    this.showOrdersSpinner = true;
    this.orderservice.GetAllOrders().subscribe((response) =>
    {
      this.orderdetails = response;
      this.showOrdersSpinner = false;
    }, (error) =>
      {
        console.log(error);
     })
  }
}
