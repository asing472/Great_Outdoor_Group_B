using System;
using System.Collections.Generic;
using System.Text;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;

namespace GreatOutdoor.DataAccessLayer
{
    public class OfflineReturnDAL
    {
        public static List<OfflineReturn> OfflineReturnList = new List<OfflineReturn>();

        public bool AddOfflineReturnDAL(OfflineReturn newOfflineReturn)
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

        public List<OfflineReturn> GetAllOfflineReturnsDAL()
        {
            OfflineReturn OfflineReturnList;
        }

        public OfflineReturn SearchOfflineReturnDAL(int searchOfflineReturnID)
        {
            OfflineReturn searchOfflineReturn = null;
            try
            {
                foreach (OfflineReturn item in OfflineReturnList)
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


        public bool UpdateOfflineReturnDAL(OfflineReturn updateOfflineReturn)
        {
            bool OfflineReturnUpdated = false;
            try
            {
                for (int i = 0; i < OfflineReturnList.Count; i++)
                {
                    if (OfflineReturnList[i].OfflineReturnID == updateOfflineReturn.OfflineReturnID)
                    {
                        updateOfflineReturn.OrderID = OfflineReturnList[i].OrderID;
                        updateOfflineReturn.ProductID = OfflineReturnList[i].ProductID;
                        updateOfflineReturn.ReasonIncomplete = OfflineReturnList[i].ReasonIncomplete;
                        updateOfflineReturn.ReasonWrong = OfflineReturnList[i].ReasonWrong;
                        updateOfflineReturn.OfflineReturnValue = OfflineReturnList[i].OfflineReturnValue;
                        updateOfflineReturn.OfflineReturnQuantity = OfflineReturnList[i].OfflineReturnQuantity;
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
                OfflineReturn deleteOfflineReturn = null;
                foreach (OfflineReturn item in OfflineReturnList)
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
            catch (DbException ex)
            {
                throw new OfflineReturnException(ex.Message);
            }
            return OfflineReturnDeleted;

        }


    }

}
