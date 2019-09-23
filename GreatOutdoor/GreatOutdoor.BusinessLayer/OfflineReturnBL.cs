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
        private static bool ValidateOfflineReturn(OfflineReturn OfflineReturnobj)
        {
            StringBuilder sb = new StringBuilder();
            bool validOfflineReturn = true;
            

            if (OfflineReturnobj.ReturnValue <= 0)
            {
                validOfflineReturn = false;
                sb.Append(Environment.NewLine + "Invalid OfflineReturn Value");
            }
            


            if (validOfflineReturn == false)
                throw new OfflineReturnException(sb.ToString());
            return validOfflineReturn;
        }

        public static bool AddOfflineReturnBL(OfflineReturn newOfflineReturn)
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

        public static List<OfflineReturn> GetAllOfflineReturnsBL()
        {
            List<OfflineReturn> OfflineReturnList = null;
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

       
        public static bool UpdateOfflineReturnBL(OfflineReturn updateOfflineReturn)
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

        public static bool DeleteOfflineReturnBL(Guid deleteOfflineReturnID)
        {
            bool OfflineReturnDeleted = false;
            try
            {
                if (true)//Add condition
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
