using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreatOutdoors.Entities
{
    public class Product
    {
        private string _productCategory;

        public string ProductCategory { get => _productCategory; set => _productCategory = value; }

        private int _productID;

        public int ProductID { get => _productID; set => _productID = value; }

        private string _productDescription;

        public string ProductDescription { get => _productDescription; set => _productDescription = value; }

        private int _addToCartQuantity;

        public int AddToCartQuantity { get => _addToCartQuantity; set => _addToCartQuantity = value; }

        private int _removeFromCartQuantity;

        public int RemoveFromCartQuantity { get => _removeFromCartQuantity; set => _removeFromCartQuantity = value; }

        private double _productPrice;

        public double ProductPrice { get => _productPrice; set => _productPrice = value; }
       
        private int _productOrderedQuantity;

        public int ProductOrderedQuantity { get => _productOrderedQuantity; set => _productOrderedQuantity = value; }

        public Product()
        {
            ProductCategory = "";
            ProductID = 0000;
            ProductDescription = "";
            AddToCartQuantity = 0;
            RemoveFromCartQuantity = 0;
            ProductPrice = 0.0;
            ProductOrderedQuantity = 0;
        }
               
    }
}
