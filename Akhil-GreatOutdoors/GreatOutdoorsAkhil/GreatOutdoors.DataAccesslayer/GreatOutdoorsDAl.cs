using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GreatOutdoors.Entities;

namespace GreatOutdoors.DataAccesslayer
{

    public class OrderDetailsDAL
    {

        public static Bag c = new Bag();
        public Address address = new Address();
        public static Order order = new Order();
        public Product product = new Product();
        public static List<Bag> orders = new List<Bag>();//order id with products
        public static List<DateTime> orderInformation = new List<DateTime>();//orderid with time
        //public int ConfirmOrder(string orderConfirmation)
        //{
        //    // generates order id
        //    if (orderConfirmation == "Yes")
        //    {
        //        Order.OrderId++;
        //        order.DateOfOrder = DateTime.Now;
        //    }
        //    return Order.OrderId;
        //}
        static void AddOrders()
        {
            //updates dictionary of order id and list of products
            orders.Add(c);
        }

        public Product GetAllOrders()
        {
            foreach(Bag b in orders)
            {            
                foreach(int j in b.cart)
                {
                    Product p = new Product();
                    p.GetProductDetailsByProductId(j);
                    return p;
                    //Console.WriteLine(j + "\t" + p.ProductOrderedQuantity.ToString());
                }
            }
        }

        //public void OrderInfo()
        //{
        //    //updates list of order id and date of order
        //    orderInformation.Add(order.DateOfOrder);
        //}

        public void GetCurrentOrderDetails()
        {
            foreach (int i in c.cart)
            {
                Product p = new Product();
                p.GetProductDetailsByProductId(i);
                return ;
            }
        }
        public void SetDeliveryAddress(int addressId)
        {
            //Setting Delivery Addreess for each product
            foreach (Product p in c.cart)
            {
                Console.WriteLine("Deliver to existing addresses or new address??");
                string del = Console.ReadLine();
                if (del == "New Address")
                {
                    address.AddAddressDAL();

                }
                else
                {
                    List<Address> AvailableAddresses = address.GetAddressByRetailerId(addressId);

                }
            }
        }

        public string DeliveryStatus(int orderId)
        {
            //checking delivery status
            if (orderId<=orderInformation.Count)
            {
                DateTime d = new DateTime();
                d = orderInformation[orderId];
                if (d.AddDays(2) <= DateTime.Now)
                    return "Order Shipped";
                else if (d.AddDays(2) > DateTime.Now && DateTime.Now <= d.AddDays(6))
                    return "Order is out for delivery";
                else //if (d.AddDays(7) >= DateTime.Now)
                    return "Order Delivered";
            }
            else
                return "Invalid Order Id";
        }



    }
}

    //public string DeliveryStatus(int orderId)
    //{
    //    //checking delivery status
    //    if (orderInformation.ContainsKey(orderId))
    //    {
    //        DateTime d = new DateTime();
    //        d = orderInformation[orderId];
    //        if (d.AddDays(2) <= DateTime.Now)
    //            return ("Order Shipped");
    //        else if (d.AddDays(2) > DateTime.Now && DateTime.Now <= d.AddDays(6))
    //            return ("Order is out for delivery");
    //        else //if (d.AddDays(7) >= DateTime.Now)
    //            return ("Order Delivered");
    //    }
    //    else
    //        Console.WriteLine("Invalid Order Id");
    //}
