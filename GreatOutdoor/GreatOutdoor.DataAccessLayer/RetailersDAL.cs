using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;

namespace GreatOutdoor.DataAccessLayer
{
    public class RetailersDAL
    {
        public static int No = 0;
        public static List<Retailers> retailerList = new List<Retailers>();

        public bool AddRetailerDAL(Retailers newRetailer)
        {
            bool RetailerAdded = false;
            try
            {
                newRetailer.RetailerID = No;
                No++;
                retailerList.Add(newRetailer);
                Console.WriteLine($"Your Retailer ID: {No}");
                RetailerAdded = true;
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return RetailerAdded;

        }

        public List<Retailers> GetAllRetailersDAL()
        {
            return retailerList;
        }

        public Retailers GetRetailerByIDDAL(int GetRetailerID)
        {
            Retailers searchRetailer = null;
            try
            {
                foreach (Retailers item in retailerList)
                {
                    if (item.RetailerID == GetRetailerID)
                    {
                        searchRetailer = item;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return searchRetailer;
        }

        public List<Retailers> GetRetailersByNameDAL(string RetailerName)
        {
            List<Retailers> searchRetailer = new List<Retailers>();
            try
            {
                foreach (Retailers item in retailerList)
                {
                    if (item.RetailerName == RetailerName)
                    {
                        searchRetailer.Add(item);
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return searchRetailer;
        }

        public bool UpdateRetailerDetailDAL(Retailers updateRetailer)
        {
            bool RetailerUpdated = false;
            try
            {
                for (int i = 0; i < retailerList.Count; i++)
                {
                    if (retailerList[i].RetailerID == updateRetailer.RetailerID)
                    {
                        updateRetailer.RetailerName = retailerList[i].RetailerName;
                        updateRetailer.RetailerMobile = retailerList[i].RetailerMobile;
                        updateRetailer.RetailerEmail = retailerList[i].RetailerEmail;
                        RetailerUpdated = true;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return RetailerUpdated;

        }

        public bool DeleteRetailerDAL(int deleteRetailerID)
        {
            bool RetailerDeleted = false;
            try
            {
                Retailers deleteRetailer = null;
                foreach (Retailers item in retailerList)
                {
                    if (item.RetailerID == deleteRetailerID)
                    {
                        deleteRetailer = item;
                    }
                }

                if (deleteRetailer != null)
                {
                    retailerList.Remove(deleteRetailer);
                    RetailerDeleted = true;
                }
            }
            catch (DbException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return RetailerDeleted;

        }

    }
}
