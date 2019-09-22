using System;
using System.Collections.Generic;
using System.Text;
using GreatOutdoor.Exceptions;
using GreatOutdoor.Entities;
using GreatOutdoor.DataAccessLayer;
namespace GreatOutdoor.BusinessLayer
{


    public class OfflineReturnBL
    {
        private static bool ValidateOfflineReturn(OfflineReturns OfflineReturnobj)
        {
            StringBuilder sb = new StringBuilder();
            bool validOfflineReturn = true;
            if (OfflineReturnobj.OfflineReturnID <= 0)
            {
                validOfflineReturn = false;
                sb.Append(Environment.NewLine + "Invalid OfflineReturn ID");

            }
            if (OfflineReturnobj.OfflineOrderID <= 0)
            {
                validOfflineReturn = false;
                sb.Append(Environment.NewLine + "Invalid Order ID");

            }
            if (OfflineReturnobj.ProductID <= 0)
            {
                validOfflineReturn = false;
                sb.Append(Environment.NewLine + "Invalid Product ID");

            }
            if (OfflineReturnobj.ReasonForReturn == null)
            {
                validOfflineReturn = false;
                sb.Append(Environment.NewLine + "Invalid IncompleteOrder status");
            }


            if (OfflineReturnobj.ReturnValue <= 0)
            {
                validOfflineReturn = false;
                sb.Append(Environment.NewLine + "Invalid OfflineReturn Value");
            }
            if (OfflineReturnobj.ReturnQuantity <= 0)
            {
                validOfflineReturn = false;
                sb.Append(Environment.NewLine + "Invalid OfflineReturn Quantity");

            }


            if (validOfflineReturn == false)
                throw new OfflineReturnException(sb.ToString());
            return validOfflineReturn;
        }

        public static bool AddOfflineReturnBL(OfflineReturns newOfflineReturn)
        {
            bool OfflineReturnAdded = false;
            try
            {
                if (ValidateOfflineReturn(newOfflineReturn))
                {
                    OfflineReturnDAL OfflineReturnDAL = new OfflineReturnDAL();
                    OfflineReturnAdded = OfflineReturnDAL.AddOfflineReturnDAL(newOfflineReturn);
                }
            }
            catch (OfflineReturnException)
            {
                throw;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return OfflineReturnAdded;
        }

        public static List<OfflineReturns> GetAllOfflineReturnsBL()
        {
            List<OfflineReturns> OfflineReturnList = null;
            try
            {
                OfflineReturnDAL OfflineReturnDAL = new OfflineReturnDAL();
                OfflineReturnList = OfflineReturnDAL.GetAllOfflineReturnsDAL();
            }
            catch (OfflineReturnException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return OfflineReturnList;
        }

        public static OfflineReturns SearchOfflineReturnBL(int searchOfflineReturnID)
        {
            OfflineReturns searchOfflineReturn = null;
            try
            {
                OfflineReturnDAL OfflineReturnDAL = new OfflineReturnDAL();
                searchOfflineReturn = OfflineReturnDAL.SearchOfflineReturnDAL(searchOfflineReturnID);
            }
            catch (OfflineReturnException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return searchOfflineReturn;

        }

        public static bool UpdateOfflineReturnBL(OfflineReturns updateOfflineReturn)
        {
            bool OfflineReturnUpdated = false;
            try
            {
                if (ValidateOfflineReturn(updateOfflineReturn))
                {
                    OfflineReturnDAL OfflineReturnDAL = new OfflineReturnDAL();
                    OfflineReturnUpdated = OfflineReturnDAL.UpdateOfflineReturnDAL(updateOfflineReturn);
                }
            }
            catch (OfflineReturnException)
            {
                throw;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return OfflineReturnUpdated;
        }

        public static bool DeleteOfflineReturnBL(int deleteOfflineReturnID)
        {
            bool OfflineReturnDeleted = false;
            try
            {
                if (deleteOfflineReturnID > 0)
                {
                    OfflineReturnDAL OfflineReturnDAL = new OfflineReturnDAL();
                    OfflineReturnDeleted = OfflineReturnDAL.DeleteOfflineReturnDAL(deleteOfflineReturnID);
                }
                else
                {
                    throw new OfflineReturnException("Invalid OfflineReturn ID");
                }
            }
            catch (OfflineReturnException)
            {
                throw;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return OfflineReturnDeleted;
        }


    }
}
