using System;
using System.Collections.Generic;
using System.Text;
using GreatOutdoor.Entities;
using GreatOutdoor.DataAccessLayer;
using GreatOutdoor.Exceptions;
using System.Text.RegularExpressions;

namespace GreatOutdoor.BusinessLayer
{
   public class OfflineOrderBL
    {
        private static bool ValidateOfflineOrderBL(OfflineOrder offlineOrder)
        {
            StringBuilder sb = new StringBuilder();
            bool validOfflineOrder = true;
            Regex regex1 = new Regex("^[a-zA-z. ]*$");
            ;
            if (offlineOrder.OfflineOrderID <= 0)
            {
                validOfflineOrder = false;
                sb.Append(Environment.NewLine + "Invalid Order ID");

            }
            if (offlineOrder.RetailerID <= 0)
            {
                validOfflineOrder = false;
                sb.Append(Environment.NewLine + "Invalid Retailer ID");

            }
            if (offlineOrder.ProductID <= 0)
            {
                validOfflineOrder = false;
                sb.Append(Environment.NewLine + "Invalid Prdouct ID");

            }
            if (offlineOrder.PriceAtOrder <= 0)
            {
                validOfflineOrder = false;
                sb.Append(Environment.NewLine + "Price can't be negative");

            }
            if (validOfflineOrder == false)
                throw new OfflineOrderException(sb.ToString());
            return validOfflineOrder;
        }

        public static bool AddOfflineOrderBL(OfflineOrder newOfflineOrder)
        {
            bool OfflineOrderAdded = false;
            try
            {
                if (ValidateOfflineOrderBL(newOfflineOrder))
                {
                    OfflineOrderDAL OfflineOrderDAL = new OfflineOrderDAL();
                    OfflineOrderAdded = OfflineOrderDAL.AddOfflineOrderDAL(newOfflineOrder);
                }
            }
            catch (GreatOutdoorException)
            {
                throw;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return OfflineOrderAdded;
        }


        public static OfflineOrder GetOfflineorderByOrderIDBL(int searchOfflineOrderID)
        {
            OfflineOrder searchOfflineOrder = null;
            try
            {
                List<OfflineOrderDAL> offlineorderidDAL = new List<OfflineOrderDAL>();

            }
            catch (GreatOutdoorException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return searchOfflineOrder;

        }

        public static bool UpdateOfflineOrderBL(OfflineOrder updateOfflineOrder)
        {
            bool OfflineOrderUpdated = false;
            try
            {
                if (ValidateOfflineOrderBL(updateOfflineOrder))
                {
                    OfflineOrderDAL offlineorderDAL = new OfflineOrderDAL();
                    OfflineOrderUpdated = offlineorderDAL.UpdateOfflineorderDAL(updateOfflineOrder);
                }
            }
            catch (GreatOutdoorException)
            {
                throw;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return OfflineOrderUpdated;
        }

        
    }
}

    


