

using System;

using System.Threading.Tasks;

using Capgemini.GreatOutdoor.BusinessLayer;

using Capgemini.GreatOutdoor.Entities;

using Capgemini.GreatOutdoor.Helpers;



using Microsoft.VisualStudio.TestTools.UnitTesting;



namespace Capgemini.Inventory.UnitTests

{

    [TestClass]

    public class AddProductBLTest

    {

        /// <summary>

        /// Add Product to the Collection if it is valid.

        /// </summary>

        [TestMethod]

        public async Task AddValidProduct()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "S", ProductMaterial = "nylon", ProductPrice = 15000.5 };

            bool isAdded = false;

            string errorMessage = null;



            //Act

            try

            {

                isAdded = await productBL.AddProductBL(product);

            }

            catch (Exception ex)

            {

                isAdded = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsTrue(isAdded, errorMessage);

            }

        }



        /// <summary>

        /// Product Name can't be null

        /// </summary>

        [TestMethod]

        public async Task ProductNameCanNotBeNull()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = null, productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "S", ProductMaterial = "nylon", ProductPrice = 15000.5 };

            bool isAdded = false;

            string errorMessage = null;



            //Act

            try

            {

                isAdded = await productBL.AddProductBL(product);

            }

            catch (Exception ex)

            {

                isAdded = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isAdded, errorMessage);

            }

        }



        /// <summary>

        /// Product Price can't be zero

        /// </summary>

        [TestMethod]

        public async Task ProductPriceCanNotBezero()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "S", ProductMaterial = "nylon", ProductPrice = 0 };

            bool isAdded = false;

            string errorMessage = null;



            //Act

            try

            {

                isAdded = await productBL.AddProductBL(product);

            }

            catch (Exception ex)

            {

                isAdded = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isAdded, errorMessage);

            }

        }



        /// <summary>

        /// Product Price can't be negative

        /// </summary>

        [TestMethod]

        public async Task ProductPriceCannotBeNegative()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "S", ProductMaterial = "nylon", ProductPrice = -100 };

            bool isAdded = false;

            string errorMessage = null;



            //Act

            try

            {

                isAdded = await productBL.AddProductBL(product);

            }

            catch (Exception ex)

            {

                isAdded = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isAdded, errorMessage);

            }

        }

        /// <summary>

        /// Product color cannot be null

        /// </summary>

        [TestMethod]

        public async Task ProductColorCannotBeNull()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = null, ProductSize = "S", ProductMaterial = "nylon", ProductPrice = 1000 };

            bool isAdded = false;

            string errorMessage = null;



            //Act

            try

            {

                isAdded = await productBL.AddProductBL(product);

            }

            catch (Exception ex)

            {

                isAdded = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isAdded, errorMessage);

            }

        }

        /// <summary>

        /// Product size cannot be null

        /// </summary>

        [TestMethod]

        public async Task ProductSizeCannotBeNull()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = null, ProductMaterial = "nylon", ProductPrice = 1000 };

            bool isAdded = false;

            string errorMessage = null;



            //Act

            try

            {

                isAdded = await productBL.AddProductBL(product);

            }

            catch (Exception ex)

            {

                isAdded = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isAdded, errorMessage);

            }

        }

        /// <summary>

        /// Product material cannot be null

        /// </summary>

        [TestMethod]

        public async Task ProductMaterialCannotBeNull()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "S", ProductMaterial = null, ProductPrice = 1000 };

            bool isAdded = false;

            string errorMessage = null;



            //Act

            try

            {

                isAdded = await productBL.AddProductBL(product);

            }

            catch (Exception ex)

            {

                isAdded = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isAdded, errorMessage);

            }

        }





    }

}
