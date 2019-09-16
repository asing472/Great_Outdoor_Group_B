using System;
using System.Collections.Generic;
using System.Text;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;
namespace GreatOutdoor.DataAccessLayer
{
    public class OfflineOrderDAL

    {
        public static List<OfflineOrder> OfflineOrderList = new List<OfflineOrder>();

        public bool AddOfflineOrderDAL(OfflineOrder newOfflineOrder)
        {
            bool OfflineOrderAdded = false;
            try
            {
                OfflineOrderList.Add(newOfflineOrder);
                OfflineOrderAdded = true;
            }
            catch (SystemException ex)
            {
                throw new OfflineOrderException(ex.Message);
            }
            return OfflineOrderAdded;

        }

        public List<OfflineOrder> GetAllOfflineOrdersDAL()
        {
            return OfflineOrderList;
        }

        public OfflineOrder SearchOfflineOrderDAL(int searchOfflineOrderID)
        {
            OfflineOrder searchOfflineOrder = null;
            try
            {
                foreach (OfflineOrder item in OfflineOrderList)
                {
                    if (item.OfflineOrderID == searchOfflineOrderID)
                    {
                        searchOfflineOrder = item;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new OfflineOrderException(ex.Message);
            }
            return searchOfflineOrder;
        }

        public List<OfflineOrder> GetOfflineOrderByRetailerIDDAL(int RetailerID)
        {
            List<OfflineOrder> searchOfflineOrder = new List<OfflineOrder>();
            try
            {
                foreach (OfflineOrder item in OfflineOrderList)
                {
                    if (item.RetailerID == RetailerID)
                    {
                        searchOfflineOrder.Add(item);
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new OfflineOrderException(ex.Message);
            }
            return searchOfflineOrder;
        }

        public List<OfflineOrder> GetOfflineOrderByOfflineOrderIDDAL(int offlineorderID)
        {
            List<OfflineOrder> searchOfflineOrder = new List<OfflineOrder>();
            try
            {
                foreach (OfflineOrder item in OfflineOrderList)
                {
                    if (item.OfflineOrderID == offlineorderID)
                    {
                        searchOfflineOrder.Add(item);
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new OfflineOrderException(ex.Message);
            }
            return searchOfflineOrder;
        }

        public List<OfflineOrder> GetOfflineOrderBySalespersonIDDAL(int salespersonID)
        {
            List<OfflineOrder> searchOfflineOrder = new List<OfflineOrder>();
            try
            {
                foreach (OfflineOrder item in OfflineOrderList)
                {
                    if (item.SalespersonID == salespersonID)
                    {
                        searchOfflineOrder.Add(item);
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new OfflineOrderException(ex.Message);
            }
            return searchOfflineOrder;
        }

            public bool UpdateOfflineorderDAL(OfflineOrder updateOfflineOrder)
        {
            bool OfflineOrderUpdated = false;
            try
            {
                for (int i = 0; i < OfflineOrderList.Count; i++)
                {
                    if (OfflineOrderList[i].OfflineOrderID == updateOfflineOrder.OfflineOrderID)
                    {
                        OfflineOrderList[i] = updateOfflineOrder;

                        OfflineOrderUpdated = true;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new OfflineOrderException(ex.Message);
            }
            return OfflineOrderUpdated;

        }


    }
}
