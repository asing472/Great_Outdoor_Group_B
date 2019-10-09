using System;

using Microsoft.VisualStudio.TestTools.UnitTesting;

using System.Threading.Tasks;

using System.Collections.Generic;

using Capgemini.GreatOutdoor.BusinessLayer;

using Capgemini.GreatOutdoor.Entities;

using Capgemini.GreatOutdoor.Helpers;

namespace GreatOutdoor.UnitTests
{
    [TestClass]
    public class GetProductBLTest
    {
        /// <summary>

        /// Get all the validated products

        /// </summary>

        [TestMethod]

        public async Task GetAllValidProducts()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "green", ProductSize = "XL", ProductMaterial = "rayon", ProductPrice = 15000.5 };

            await productBL.AddProductBL(product);

            List<Product> tempList = new List<Product>();            

            bool isRetrieved = false;

            string errorMessage = null;


            //Act

            try

            {

                tempList = await productBL.GetAllProductsBL();
                if (tempList.Count>0)
                {
                    isRetrieved = true;
                }
                

            }

            catch (Exception ex)

            {

                isRetrieved = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsTrue(isRetrieved, errorMessage);

            }

        }

        /// <summary>

        ///Product list cannot be empty

        /// </summary>

        [TestMethod]

        public async Task ProductListCannotBeEmpty()

        {

            //Arrange

            ProductBL productBL = new ProductBL();             

            List<Product> tempList = new List<Product>();

            bool isRetrieved = false;

            string errorMessage = null;


            //Act

            try

            {

                tempList = await productBL.GetAllProductsBL();
                if (tempList.Count > 0)
                {
                    isRetrieved = true;
                }


            }

            catch (Exception ex)

            {

                isRetrieved = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isRetrieved, errorMessage);

            }

        }


        /// <summary>

        /// Get a valid product by product ID

        /// </summary>

        [TestMethod]

        public async Task GetValidProductByProductID()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "S", ProductMaterial = "nylon", ProductPrice = 15000.5 };

            await productBL.AddProductBL(product);

            Product product1 = new Product();            

            bool isRetrieved = false;

            string errorMessage = null;

            //Act

            try

            {

                product1 = await productBL.GetProductByProductIDBL(product.ProductID);
                if (product.ProductID==product1.ProductID)
                {
                    isRetrieved = true;
                }

            }

            catch (Exception ex)

            {

                isRetrieved = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsTrue(isRetrieved, errorMessage);

            }

        }

        /// <summary>

        /// Product ID cannot be invalid

        /// </summary>

        [TestMethod]

        public async Task ProductIDCannotBeInvalid()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory =Category.CampingEqupipment, ProductColor = "red", ProductSize = "S", ProductMaterial = "nylon", ProductPrice = 15000.5 };

            await productBL.AddProductBL(product);

            Product product1 = new Product();

            bool isRetrieved = false;

            string errorMessage = null;

            //Act

            try

            {

                product1 = await productBL.GetProductByProductIDBL(default(Guid));
                if (product.ProductID == product1.ProductID)
                {
                    isRetrieved = true;
                }


            }

            catch (Exception ex)

            {

                isRetrieved = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isRetrieved, errorMessage);

            }

        }

        /// <summary>

        /// Get all valid product by product name

        /// </summary>

        [TestMethod]

        public async Task GetValidProductsByProductName()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product1 = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "S", ProductMaterial = "nylon", ProductPrice = 15000.5 };

            Product product2 = new Product() { ProductName = "rope", productCategory = Category.OutdoorEquipment, ProductColor = "green", ProductSize = "M", ProductMaterial = "rayon", ProductPrice = 800 };

            Product product3 = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "blue", ProductSize = "XL", ProductMaterial = "nylon", ProductPrice = 9500.5 };

            List<Product> tempList = new List<Product>();

            await productBL.AddProductBL(product1);

            await productBL.AddProductBL(product2);

            await productBL.AddProductBL(product3);

            bool isRetrieved = false;

            string errorMessage = null;

            //Act

            try

            {

                tempList = await productBL.GetProductsByProductNameBL("tent");
                if(tempList.Count==2)
                {
                    isRetrieved = true;
                }

            }

            catch (Exception ex)

            {

                isRetrieved = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsTrue(isRetrieved, errorMessage);

            }

        }

        /// <summary>

        /// Product name cannot be invalid

        /// </summary>

        [TestMethod]

        public async Task ProductNameCannotBeInvalid()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product1 = new Product() { ProductName = "tent", productCategory = 0, ProductColor = "red", ProductSize = "S", ProductMaterial = "nylon", ProductPrice = 15000.5 };

            Product product2 = new Product() { ProductName = "rope", productCategory = 0, ProductColor = "green", ProductSize = "M", ProductMaterial = "rayon", ProductPrice = 800 };

            Product product3 = new Product() { ProductName = "tent", productCategory = 0, ProductColor = "blue", ProductSize = "XL", ProductMaterial = "nylon", ProductPrice = 9500.5 };

            List<Product> tempList = new List<Product>();

            await productBL.AddProductBL(product1);

            await productBL.AddProductBL(product2);

            await productBL.AddProductBL(product3);

            bool isRetrieved = false;

            string errorMessage = null;

            //Act

            try

            {

                tempList = await productBL.GetProductsByProductNameBL("abc");
                if (tempList.Count == 2)
                {
                    isRetrieved = true;
                }

            }

            catch (Exception ex)

            {

                isRetrieved = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isRetrieved, errorMessage);

            }

        }

        /// <summary>

        /// Get all valid product by product name

        /// </summary>

        [TestMethod]

        public async Task GetValidProductsByProductCategory()

        {

            //Arrange

            ProductBL productBL = new ProductBL();            

            Product product1 = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "S", ProductMaterial = "nylon", ProductPrice = 15000.5 };

            Product product2 = new Product() { ProductName = "rope", productCategory = Category.OutdoorEquipment, ProductColor = "green", ProductSize = "M", ProductMaterial = "rayon", ProductPrice = 800 };

            Product product3 = new Product() { ProductName = "rope", productCategory = Category.OutdoorEquipment, ProductColor = "green", ProductSize = "M", ProductMaterial = "rayon", ProductPrice = 800 };

            Product product4 = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "blue", ProductSize = "XL", ProductMaterial = "nylon", ProductPrice = 9500.5 };

            await productBL.AddProductBL(product1);

            await productBL.AddProductBL(product2); 

            await productBL.AddProductBL(product3);

            await productBL.AddProductBL(product4);

            List<Product> tempList = new List<Product>();

            bool isRetrieved = false;

            string errorMessage = null;

            //Act

            try

            {

                tempList = await productBL.GetProductsByProductCategoryBL(Category.OutdoorEquipment);
                if(tempList.Count==2)
                {
                    isRetrieved = true;
                }

            }

            catch (Exception ex)

            {

                isRetrieved = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert
                await Task.Delay(2000);
                Assert.IsTrue(isRetrieved, errorMessage);

            }

        }



    }
}
