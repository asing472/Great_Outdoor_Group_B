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
    public class DeleteProductBLTest
    {
        /// <summary>

        /// Delete Product from the Collection if it is valid.

        /// </summary>

        [TestMethod]

        public async Task DeleteValidProduct()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "S", ProductMaterial = "nylon", ProductPrice = 15000.5 };

            await productBL.AddProductBL(product);

            bool isDeleted = false;

            string errorMessage = null;



            //Act

            try

            {

                isDeleted = await productBL.DeleteProductBL(product.ProductID);

            }

            catch (Exception ex)

            {

                isDeleted = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsTrue(isDeleted, errorMessage);

            }

        }

        /// <summary>

        /// Cannot delete if ID not valid

        /// </summary>

        [TestMethod]

        public async Task CannotDeleteIfIDNotValid()

        {

            //Arrange

            ProductBL productBL = new ProductBL();

            Product product = new Product() { ProductName = "tent", productCategory = Category.CampingEqupipment, ProductColor = "red", ProductSize = "S", ProductMaterial = "nylon", ProductPrice = 15000.5 };

            await productBL.AddProductBL(product);

            bool isDeleted = false;

            string errorMessage = null;



            //Act

            try

            {

                isDeleted = await productBL.DeleteProductBL(default(Guid));

            }

            catch (Exception ex)

            {

                isDeleted = false;

                errorMessage = ex.Message;

            }

            finally

            {

                //Assert

                Assert.IsFalse(isDeleted, errorMessage);

            }

        }
    }
}
