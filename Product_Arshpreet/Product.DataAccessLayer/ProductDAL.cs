using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;
using GreatOutdoors.Entities;
using GreatOutdoors.Exceptions;

namespace GreatOutdoors.DataAccessLayer
{
    public class ProductDAL
    {
        public static List<Product> productList = new List<Product>();
        public List<Product> GetAllProductsDAL()
        {
            return productList;
        }
        public Product GetProductByProductIDDAL(int p_id)
        {
            Product getProduct = null;
            try
            {
                foreach(Product item in productList)
                {
                    if (item.ProductID == p_id)
                        getProduct = item;
                }
            }
            catch(SystemException ex)
            {
                throw new GreatOutdoorsException(ex.Message);
            }
            return getProduct;
        }

        public bool UpdateProductDescriptionDAL(int p_id, string desc)
        {
            bool isupdated = false;
            try
            {
                for (int i = 0; i < productList.Count; i++)
                {
                    if (productList[i].ProductID == p_id)
                    {
                        productList[i].ProductDescription = desc;
                        isupdated = true;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorsException(ex.Message);
            }
            return isupdated;
        }
        

    }
}



