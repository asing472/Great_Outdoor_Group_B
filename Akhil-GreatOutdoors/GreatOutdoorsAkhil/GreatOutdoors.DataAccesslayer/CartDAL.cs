using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreatOutdoors.DataAccesslayer
{
    public class CartDAL
    {
        public double CartValue;      
        public List<Product> cart = new List<Product>(); //list of product objects

        public void AddToCart(Product product, int quantity)
        {
            product.Quantity += quantity;
           cart.Add(product);


            CartValue += (product.Price * quantity);
        }

        public void RemoveFromCart(Product product, int quantity)
        {
            if (quantity <= product.Quantity)
            {
                product.Quantity -= quantity;
                cart.Remove(product);
                CartValue -= (product.Price * quantity);
            }
            else
                throw new GreatOutdoorsQuantityExceededException();
        }
    }
}
