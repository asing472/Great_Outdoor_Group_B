using System;
using System.Collections.Generic;
using System.Text;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;

namespace GreatOutdoor.DataAccessLayer
{
    public class OfflineReturnDAL
    {
        public static List<OfflineReturns> OfflineReturnList = new List<OfflineReturns>();

        public bool AddOfflineReturnDAL(OfflineReturns newOfflineReturn)
        {
            bool OfflineReturnAdded = false;
            try
            {
                OfflineReturnList.Add(newOfflineReturn);
                OfflineReturnAdded = true;
            }
            catch (SystemException ex)
            {
                throw new OfflineReturnException(ex.Message);
            }
            return OfflineReturnAdded;

        }

        public List<OfflineReturns> GetAllOfflineReturnsDAL()
        {
            return OfflineReturnList;
        }

        public OfflineReturns SearchOfflineReturnDAL(int searchOfflineReturnID)
        {
            OfflineReturns searchOfflineReturn = null;
            try
            {
                foreach (OfflineReturns item in OfflineReturnList)
                {
                    if (item.OfflineReturnID == searchOfflineReturnID)
                    {
                        searchOfflineReturn = item;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new OfflineReturnException(ex.Message);
            }
            return searchOfflineReturn;
        }


        public bool UpdateOfflineReturnDAL(OfflineReturns updateOfflineReturn)
        {
            bool OfflineReturnUpdated = false;
            try
            {
                for (int i = 0; i < OfflineReturnList.Count; i++)
                {
                    if (OfflineReturnList[i].OfflineReturnID == updateOfflineReturn.OfflineReturnID)
                    {
                        updateOfflineReturn.OfflineOrderID = OfflineReturnList[i].OfflineOrderID;
                        updateOfflineReturn.ProductID = OfflineReturnList[i].ProductID;
                        updateOfflineReturn.ReasonForReturn = OfflineReturnList[i].ReasonForReturn;
                        updateOfflineReturn.OfflineReturnID = OfflineReturnList[i].OfflineReturnID;
                        updateOfflineReturn.ReturnValue = OfflineReturnList[i].ReturnValue;
                        updateOfflineReturn.ReturnQuantity = OfflineReturnList[i].ReturnQuantity;
                        OfflineReturnUpdated = true;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new OfflineReturnException(ex.Message);
            }
            return OfflineReturnUpdated;

        }

        public bool DeleteOfflineReturnDAL(int deleteOfflineReturnID)
        {
            bool OfflineReturnDeleted = false;
            try
            {
                OfflineReturns deleteOfflineReturn = null;
                foreach (OfflineReturns item in OfflineReturnList)
                {
                    if (item.OfflineReturnID == deleteOfflineReturnID)
                    {
                        deleteOfflineReturn = item;
                    }
                }

                if (deleteOfflineReturn != null)
                {
                    OfflineReturnList.Remove(deleteOfflineReturn);
                    OfflineReturnDeleted = true;
                }
            }
            catch (Exception ex)
            {
                throw new OfflineReturnException(ex.Message);
            }
            return OfflineReturnDeleted;

        }


    }

}
