﻿using System;
using System.Collections.Generic;
using System.Text;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;
namespace GreatOutdoor.DataAccessLayer
{/// <summary>
 /// Contains data access layer methods for inserting, updating, deleting systemUsers from OfflineOrder collection.
 /// </summary>
    public class OfflineOrderDAL

    {
        public static List<OfflineOrder> OfflineOrderList = new List<OfflineOrder>();

        /// <summary>
        /// Adds new Offline Order to OfflineOrder collection.
        /// </summary>
        /// <param name="newOfflineOrder">Contains the Offline Orders details to be added.</param>
        /// <returns>Determinates whether the new Offline Order is added.</returns>
        public bool AddOfflineOrderDAL(OfflineOrder newOfflineOrder)
        {
            bool OfflineOrderAdded = false;
            try
            {
                newOfflineOrder.OfflineOrderID = Guid.NewGuid();
                newOfflineOrder.DateOfOfflineOrder = DateTime.Now;
                newOfflineOrder.LastUpdateOfflineOrder = DateTime.Now;
                OfflineOrderList.Add(newOfflineOrder);
                OfflineOrderAdded = true;
            }
            catch (SystemException ex)
            {
                throw new OfflineOrderException(ex.Message);
            }
            return OfflineOrderAdded;

        }
        // <summary>
        /// Gets all offline orders from the collection.
        /// </summary>
        /// <returns>Returns list of all offline order.</returns>
        public List<OfflineOrder> GetAllOfflineOrdersDAL()
        {
            return OfflineOrderList;
        }
        /// <summary>
        /// Gets Offline Order based on OfflineOrderID.
        /// </summary>
        /// <param name="searchOfflineOrderID">Represents OfflineOrderID to search.</param>
        /// <returns>Returns SystemUser object.</returns>
        public   OfflineOrder GetOfflineOrderByOfflineOrderIDDAL(Guid searchOfflineOrderID)
        {
            OfflineOrder matchingOfflineOrder = null;
            try
            {
                //Find SystemUser based on searchSystemUserID
                matchingOfflineOrder = OfflineOrderList.Find(
                    (item) => { return item.OfflineOrderID == searchOfflineOrderID; }
                );
            }
            catch (Exception)
            {
                throw;
            }
            return matchingOfflineOrder;
        }
      
        /// <summary>
        /// Get list of Offline orders using retailerId
        /// </summary>
        /// <param name="RetailerID">Using Retailer Id to search offline orders.</param>
        /// <returns>list of offline order</returns>
        public List<OfflineOrder> GetOfflineOrderByRetailerIDDAL(Guid RetailerID)
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

        /// <summary>
        /// Get list of Offline orders using SalesPersonId
        /// </summary>
        /// <param name="salespersonID">Using Sales Person Id to search offline orders.</param>
        /// <returns>list of offline order</returns>
        public List<OfflineOrder> GetOfflineOrderBySalespersonIDDAL(Guid salespersonID)
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
        /// <summary>
        /// Deletes OfflineOrder based on OfflineOrderID.
        /// </summary>
        /// <param name="deleteOfflineOrderID">Represents OfflineOrderID to delete.</param>
        /// <returns>Determinates whether the existing OfflineOrder is deleted.</returns>
        public bool DeleteOfflineOrderDAL(Guid deleteOfflineOrderID)
        {
            bool OfflineOrderDeleted = false;
            try
            {
                //Find SystemUser based on searchSystemUserID
                OfflineOrder matchingOfflineOrder = OfflineOrderList.Find(
                    (item) => { return item.OfflineOrderID == deleteOfflineOrderID; }
                );

                if (matchingOfflineOrder != null)
                {
                    //Delete SystemUser from the collection
                    OfflineOrderList.Remove(matchingOfflineOrder);
                    OfflineOrderDeleted = true;
                }
            }
            catch (Exception)
            {
                throw;
            }
            return OfflineOrderDeleted;
        }


    }
}
