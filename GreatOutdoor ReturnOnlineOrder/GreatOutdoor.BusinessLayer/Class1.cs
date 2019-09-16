using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreatOutdoor.BusinessLayer
{
   
    public class ReturnOnlineOrderBL
    {
        private static bool ValidateGuest(ReturnOnlineOrder returnonlineorder)
        {
            StringBuilder sb = new StringBuilder();
            bool validGuest = true;
            if (returnonlineorder.ReturnID <= 0)
            {
                validReturnOnlineOrder = false;
                sb.Append(Environment.NewLine + "Invalid ReturnOnlineOrder ID");

            }
            if (returnonlineorder.ReturnOnlineOrderName == string.Empty)
            {
                validReturnOnlineOrder = false;
                sb.Append(Environment.NewLine + "ReturnOnlineOrder Name Required");

            }
            if (returnonlineorder.GuestContactNumber.Length < 10)
            {
                validReturnOnlineOrder = false;
                sb.Append(Environment.NewLine + "Required 10 Digit Contact Number");
            }
            if (validGuest == false)
                throw new GreatOutdoorException(sb.ToString());
            return validGuest;
        }

        public static bool AddGuestBL(ReturnOnlineOrder newGuest)
        {
            bool guestAdded = false;
            try
            {
                if (ValidateGuest(newGuest))
                {
                    ReturnOnlineOrderDAL ReturnOnlineOrderDAL = new ReturnOnlineOrderDAL();
                    guestAdded = ReturnOnlineOrderDAL.AddGuestDAL(newGuest);
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

            return guestAdded;
        }

        public static List<ReturnOnlineOrder> GetAllGuestsBL()
        {
            List<ReturnOnlineOrder> guestList = null;
            try
            {
            //    ReturnOnlineOrderDAL ReturnOnlineOrderDAL = new ReturnOnlineOrderDAL();
            //    guestList = ReturnOnlineOrderDAL.GetAllReturnOnlineOrderDAL();
            //}
            catch (Exception ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return guestList;
        }

        public static ReturnOnlineOrder SearchGuestBL(int searchGuestID)
        {
            ReturnOnlineOrder searchGuest = null;
            try
            {
                ReturnOnlineOrderDAL ReturnOnlineOrderDAL = new ReturnOnlineOrderDAL();
                searchGuest = ReturnOnlineOrderDAL.SearchGuestDAL(searchGuestID);
            }
            catch (GreatOutdoorException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return searchGuest;

        }

        public static bool UpdateGuestBL(ReturnOnlineOrder updateGuest)
        {
            bool guestUpdated = false;
            try
            {
                if (ValidateGuest(updateGuest))
                {
                    ReturnOnlineOrderDAL ReturnOnlineOrderDAL = new ReturnOnlineOrderDAL();
                    guestUpdated = ReturnOnlineOrderDAL.UpdateGuestDAL(updateGuest);
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

            return guestUpdated;
        }

        public static bool DeleteGuestBL(int deleteGuestID)
        {
            bool returnonlineorderDeleted = false;
            try
            {
                if (deleteGuestID > 0)
                {
                    ReturnOnlineOrderDAL ReturnOnlineOrderDAL = new ReturnOnlineOrderDAL();
                    returnonlineorderDeleted = ReturnOnlineOrderDAL.DeleteReturnOnlineOrderDAL(deleteGID);
                }
                else
                {
                    throw new GreatOutdoorException("Invalid ReturnOnlineOrder ID");
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

            return returnonlineorderDeleted;
        }
       
    }
}
