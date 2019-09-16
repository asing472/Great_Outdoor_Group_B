using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GreatOutdoors.Entities;
using GreatOutdoors.Exceptions;
using GreatOutdoors.DataAccessLayer;

namespace GreatOutdoors.BusinessLayer
{
    public class ProductBL
    {
        private static bool ValidateProductBL(Product product)
        {
            StringBuilder sb = new StringBuilder();
            bool validProduct = true;
            string s = Convert.ToString(product.ProductID);

            if (s.Length!=4)
            {
                validProduct = false;
                sb.Append(Environment.NewLine + "Invalid ");
            }
            if(product.ProductDescription== string.Empty)
            {
                validProduct = false;
                sb.Append(Environment.NewLine + "Description Required");
            }
            if(product.ProductOrderedQuantity<=0)
            {
                validProduct = false;
                sb.Append(Environment.NewLine + "Product ordered can't be negative");
            }
            if(product.AddToCartQuantity<0)
            {
                validProduct = false;
                sb.Append(Environment.NewLine + "Quantity in cart can't be negative");
            }
            if (product.RemoveFromCartQuantity < 0)
            {
                validProduct = false;
                sb.Append(Environment.NewLine + "Quantity removed from cart can't be negative");
            }
            if(product.ProductPrice<=0.0)
            {
                validProduct = false;
                sb.Append(Environment.NewLine + "Product price can't be negative");
            }
            if(product.ProductCategory!= "Camping Equipment" || product.ProductCategory != "Golf Equipment" || product.ProductCategory != "Mountaineering Equipment" || product.ProductCategory != "Outdoor Protection" || product.ProductCategory != "Personal Accessories" )
            {
                validProduct = false;
                sb.Append(Environment.NewLine + "Invalid product category");
            }
            if(validProduct==false)
            {
                throw new GreatOutdoorsException(sb.ToString()); 
            }

            return validProduct;
            
        }
        public static List<Product> GetAllProductsBL()
        {
            List<Product> productList = null;
            try
            {
                ProductDAL productDAL = new ProductDAL();
                productList = productDAL.GetAllProductsDAL();
            }
            catch (GreatOutdoorsException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return productList;
        }


    }
}
