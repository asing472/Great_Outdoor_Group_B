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
    public class UpdateProductBLTest
    {
        /// <summary>

        /// Update Product description of  a valid  product

        /// </summary>

        [TestMethod]

        public async Task UpdateValidProductDescriptionBL()

        {

            //Arrange

            ProductBL productBL = new ProductBL();            

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "green", ProductSize = "XL", ProductMaterial = "rayon", ProductPrice = 15000.5 };

             await productBL.AddProductBL(product);

            Product product1 = new Product() { ProductID=product.ProductID, ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "L", ProductMaterial = "nylon", ProductPrice = 15000.5 };            

            bool isUpdated = false;

            string errorMessage = null;



            //Act

            try

            {

                isUpdated = await productBL.UpdateProductDescriptionBL(product1);


            }

            catch (Exception ex)

            {

                isUpdated = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsTrue(isUpdated, errorMessage);

            }

        }


        /// <summary>

        /// Product color can't be null

        /// </summary>

        [TestMethod]

        public async Task ProductColorCannotBeNullBL()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "green", ProductSize = "XL", ProductMaterial = "rayon", ProductPrice = 15000.5 };

            await productBL.AddProductBL(product);

            Product product1 = new Product() { ProductID = product.ProductID, ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = null, ProductSize = "L", ProductMaterial = "nylon", ProductPrice = 15000.5 };

            bool isUpdated = false;

            string errorMessage = null;



            //Act

            try

            {

                isUpdated = await productBL.UpdateProductDescriptionBL(product1);


            }

            catch (Exception ex)

            {

                isUpdated = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isUpdated, errorMessage);

            }

        }

        /// <summary>

        /// Product Size can't be null

        /// </summary>

        [TestMethod]

        public async Task ProductSizeCannotBeNullBL()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "green", ProductSize = "XL", ProductMaterial = "rayon", ProductPrice = 15000.5 };

            await productBL.AddProductBL(product);

            Product product1 = new Product() { ProductID = product.ProductID, ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = null, ProductMaterial = "nylon", ProductPrice = 15000.5 };

            bool isUpdated = false;

            string errorMessage = null;



            //Act

            try

            {

                isUpdated = await productBL.UpdateProductDescriptionBL(product1);


            }

            catch (Exception ex)

            {

                isUpdated = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isUpdated, errorMessage);

            }

        }

        /// <summary>

        /// Product Size can't be null

        /// </summary>

        [TestMethod]

        public async Task ProductMaterialCannotBeNullBL()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "green", ProductSize = "XL", ProductMaterial = "rayon", ProductPrice = 15000.5 };

            await productBL.AddProductBL(product);

            Product product1 = new Product() { ProductID = product.ProductID, ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "L", ProductMaterial = null, ProductPrice = 15000.5 };

            bool isUpdated = false;

            string errorMessage = null;



            //Act

            try

            {

                isUpdated = await productBL.UpdateProductDescriptionBL(product1);


            }

            catch (Exception ex)

            {

                isUpdated = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isUpdated, errorMessage);

            }

        }


        /// <summary>

        /// Update Product price of  a valid  product

        /// </summary>

        [TestMethod]

        public async Task UpdateValidProductPriceBL()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "green", ProductSize = "XL", ProductMaterial = "rayon", ProductPrice = 15000.5 };

            await productBL.AddProductBL(product);

            Product product1 = new Product() { ProductID = product.ProductID, ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "L", ProductMaterial = "nylon", ProductPrice = 9500.5 };

            bool isUpdated = false;

            string errorMessage = null;



            //Act

            try

            {

                isUpdated = await productBL.UpdateProductPriceBL(product1);


            }

            catch (Exception ex)

            {

                isUpdated = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsTrue(isUpdated, errorMessage);

            }

        }

        /// <summary>

        /// Update Product price to be updated can't be 0

        /// </summary>

        [TestMethod]

        public async Task ProductPriceCannotBeZeroBL()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "green", ProductSize = "XL", ProductMaterial = "rayon", ProductPrice = 15000.5 };

            await productBL.AddProductBL(product);

            Product product1 = new Product() { ProductID = product.ProductID, ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "L", ProductMaterial = "nylon", ProductPrice=0 };

            bool isUpdated = false;

            string errorMessage = null;



            //Act

            try

            {

                isUpdated = await productBL.UpdateProductPriceBL(product1);


            }

            catch (Exception ex)

            {

                isUpdated = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isUpdated, errorMessage);

            }

        }

        /// <summary>

        /// Update Product price to be updated can't be negative

        /// </summary>

        [TestMethod]

        public async Task ProductPriceCannotBeNegativeBL()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "green", ProductSize = "XL", ProductMaterial = "rayon", ProductPrice = 15000.5 };

            await productBL.AddProductBL(product);

            Product product1 = new Product() { ProductID = product.ProductID, ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "L", ProductMaterial = "nylon", ProductPrice = -1000};

            bool isUpdated = false;

            string errorMessage = null;



            //Act

            try

            {

                isUpdated = await productBL.UpdateProductPriceBL(product1);


            }

            catch (Exception ex)

            {

                isUpdated = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isUpdated, errorMessage);

            }

        }

    }
}
