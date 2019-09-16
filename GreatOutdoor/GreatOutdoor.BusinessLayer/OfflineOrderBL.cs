using System;
using System.Collections.Generic;
using System.Text;
using GreatOutdoor.Entities;
using GreatOutdoor.DataAccessLayer;
using GreatOutdoor.Exceptions;
using System.Text.RegularExpressions;

namespace GreatOutdoor.BusinessLayer
{
    class OfflineOrderBL
    {
        private static bool ValidateOfflineOrderBL(OfflineOrder offlineOrder)
        {
            StringBuilder sb = new StringBuilder();
            bool validOfflineOrder = true;
            Regex regex1 = new Regex("^[a-zA-z. ]*$");
            bool b = regex1.IsMatch(OfflineOrder.);
            if (b == false)
            {
                validOfflineOrder = false;
                sb.Append(Environment.NewLine + "Guest Name in Invalid Format");

            }
            Regex regex2 = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            bool c = regex2.IsMatch(OfflineOrder.OfflineOrderEmail);
            if (c == false)
            {
                validOfflineOrder = false;
                sb.Append(Environment.NewLine + "Please Check Email");
            }
            Regex regex3 = new Regex(@"^((\+)?(\d{2}[-]))?(\d{10}){1}?$");
            bool d = regex3.IsMatch(OfflineOrder.OfflineOrderMobile);
            if (d == false)
            {
                validOfflineOrder = false;
                sb.Append(Environment.NewLine + "Invalid Mobile No.");

            }

            if (validOfflineOrder == false)
                throw new GreatOutdoorException(sb.ToString());
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


        public static OfflineOrder GetOfflineOrderByIDBL(int searchOfflineOrderID)
        {
            OfflineOrder searchOfflineOrder = null;
            try
            {
                OfflineOrderDAL guestDAL = new OfflineOrderDAL();
                searchOfflineOrder = OfflineOrderDAL.GetAllOfflineOrdersDAL(searchOfflineOrderID);
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
                    OfflineOrderDAL OfflineOrderDAL = new OfflineOrderDAL();
                    OfflineOrderUpdated = OfflineOrderDAL.UpdateOfflineOrderDetailDAL(updateOfflineOrder);
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

        public static bool DeleteOfflineOrderBL(int deleteOfflineOrderID)
        {
            bool OfflineOrderDeleted = false;
            try
            {
                if (deleteOfflineOrderID > 0)
                {
                    OfflineOrderDAL OfflineOrderDAL = new OfflineOrderDAL();
                    OfflineOrderDeleted = OfflineOrderDAL.DeleteOfflineOrderDAL(deleteOfflineOrderID);
                }
                else
                {
                    throw new GreatOutdoorException("Invalid Guest ID");
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

            return OfflineOrderDeleted;
        }

    }
}
}
