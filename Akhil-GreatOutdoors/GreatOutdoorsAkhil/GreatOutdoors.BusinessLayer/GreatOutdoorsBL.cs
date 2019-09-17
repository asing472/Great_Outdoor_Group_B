using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GreatOutdoors.DataAccesslayer;

namespace GreatOutdoors.BusinessLayer
{
    public class Cancel
    {
        public Bag bag = new Bag();
        OrderDetails orderDetails = new OrderDetails();
        public bool CheckCancellationAvailability(string deliveryStatus)
        {
            if (deliveryStatus == "Order Delivered")
            {
                // Console.WriteLine("Cannot cancel the order as per company's policy");
                return false;
            }
            else
            {
                return true;
            }
        }
        public bool CheckOrderAvailability(int orderId)
        {
            if (OrderDetails.orders.Count <= (orderId))
                return true;
            else
                return false;
        }

        public bool CheckProductAvailabilityInOrder(int orderId, int productId)
        {
            bool prcheck=false;
            bag = OrderDetails.orders[orderId];
            foreach (int p in bag.cart)
            {
                if (productId == p)
                {
                    prcheck = true;
                    break;
                }
                
            }
                return prcheck;            
        }
        public bool QuantityCheck(int quantity)
        {
            Product product = new Product();
            product = GetProductDetailsByproductId(p);
            Console.WriteLine("Enter the number of products to be cancelled");
            int b = int.Parse(Console.ReadLine());
            if (quantity <= product.ProductOrderedQuantity)
            {
                return true;
            }
            else
                return false;
        }
                
                /*int orderId = int.Parse(Console.ReadLine());
                if (OrderDetails.orders.Count <= (orderId))
                {
                    if (OrderDetails.orderInformation[orderId].AddDays(15) <= DateTime.Now)
                    {
                        Console.WriteLine("Enter the Product Id ");
                        int a = int.Parse(Console.ReadLine());
                        bag = OrderDetails.orders[orderId];
                        foreach (int p in bag.cart)
                        {
                            if (a == p)
                            {
                                Product product = new Product();
                                product = GetProductDetailsByproductId(p);
                                Console.WriteLine("Enter the number of products to be cancelled");
                                int b = int.Parse(Console.ReadLine());
                                if (b <= product.ProductOrderedQuantity)
                                {
                                    double amount = b * product.Price;
                                }
                                else Console.WriteLine("enter valid quantity to be cancelled");
                            }
                            else
                                Console.WriteLine("Enter valid Product Id");
                        }
                    }
                    else
                        Console.WriteLine("We cannot cancel the order as cancellation due is over");
                }
                else
                    Console.WriteLine("Invalid order id");
            }
        }*/


    }
}
