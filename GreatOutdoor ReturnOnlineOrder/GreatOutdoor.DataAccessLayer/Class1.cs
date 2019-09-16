using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreatOutdoor.DataAccessLayer
{
    public class ReturnOnlineOrder
    {
        public static List<ReturnOnlineOrder> returnonlineorderList = new List<ReturnOnlineOrder>();

        public bool AddReturnOnlineOrderDAL(ReturnOnlineOrder newReturnOnlineOrder)
            //adding return order
        {
            bool guestAdded = false;
            try
            {
                returnonlineorderList.Add(newReturnOnlineOrder);
                guestAdded = true;
            }
            catch (SystemException ex)
            {
                throw new Exception(ex.Message);
            }
            return guestAdded;

        }

        public List<ReturnOnlineOrder> GetAllGuestsDAL()
        {
            return returnonlineorderList;
        }

        public ReturnOnlineOrder SearchReturnOnlineOrderDAL(int searchReturnID)
            //returnonlineorder
        {
            ReturnOnlineOrder searchGuest = null;
            try
            {
                foreach (ReturnOnlineOrder item in returnonlineorderList)
                {
                   // if (item.ReturnID == searchReturnID)
                    {
                        searchGuest = item;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new Exception(ex.Message);
            }
            return searchGuest;
        }

        public List<ReturnOnlineOrder> GetGuestsByNameDAL(string guestName)
        {
            List<ReturnOnlineOrder> searchGuest = new List<ReturnOnlineOrder>();
            try
            {
                foreach (ReturnOnlineOrder item in returnonlineorderList)
                {
                   // if (item.PurposeOfReturn == guestName)
                    {
                        searchGuest.Add(item);
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new Exception(ex.Message);
            }
            return searchGuest;
        }

        public bool UpdateReturnOnlineOrderDAL(ReturnOnlineOrder updateGuest)
        {
            bool guestUpdated = false;
            try
            {
                for (int i = 0; i < returnonlineorderList.Count; i++)
                {
                    //if (returnonlineorderList[i].ReturnID == updateGuest.ReturnID)
                    //{
                    //    updateGuest.PurposeOfReturn = returnonlineorderList[i].PurposeOfReturn;
                    //    updateGuest.ReturnMobileNumber = returnonlineorderList[i].ReturnMobileNumber;
                    //    guestUpdated = true;
                    //}
                }
            }
            catch (SystemException ex)
            {
                throw new Exception(ex.Message);
            }
            return guestUpdated;

        }

        public bool DeleteReturnOnlineOrderDAL(int deleteReturnID)
        {
            bool guestDeleted = false;
            try
            {
                ReturnOnlineOrder deleteGuest = null;
                foreach (ReturnOnlineOrder item in returnonlineorderList)
                {
                    //if (item.ReturnID == deleteReturnID)
                    //{
                    //    deleteGuest = item;
                    //}
                }

                if (deleteGuest != null)
                {
                    returnonlineorderList.Remove(deleteGuest);
                    guestDeleted = true;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return guestDeleted;

        }

    }
}
