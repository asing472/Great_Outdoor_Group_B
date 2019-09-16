using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;
using GreatOutdoor.Entities;

namespace GreatOutdoor.DataAccessLayer
{
    public class SalesPersonDAL
    {
        public static List<SalesPerson> salesPersonList = new List<SalesPerson>();

        public bool AddSalesPersonDAL(SalesPerson  newsalesPerson)
        {
            bool SalesPersonAdded = false;
            try
            {
                salesPersonList.Add(newsalesPerson);
                SalesPersonAdded = true;
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return SalesPersonAdded;

        }

        public List<SalesPerson> GetAllSalesPersonDAL()
        {
            return salesPersonList;
        }

        public SalesPerson SearchSalesPersonDAL(int searchSalesPersonID)
        {
            SalesPerson searchSalesPerson = null;
            try
            {
                foreach (SalesPerson item in salesPersonList)
                {
                    if (item.SalesPersonID == searchSalesPersonID)
                    {
                        searchSalesPerson = item;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return searchSalesPerson;
        }

        public List<SalesPerson> GetSalesPersonByNameDAL(string SalesPersonName)
        {
            List<SalesPerson> searchSalesPerson = new List<SalesPerson>();
            try
            {
                foreach (SalesPerson item in salesPersonList)
                {
                    if (item.SalesPersonName == searchSalesPersonName)
                    {
                        searchSalesPerson.Add(item);
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return searchSalesPerson;
        }

        public bool UpdateSalesPersonDAL(SalesPerson updateSalesPerson)
        {
            bool SalesPersonUpdated = false;
            try
            {
                for (int i = 0; i < salesPersonList.Count; i++)
                {
                    if (salesPersonList[i].SalesPersonID == updateSalesPerson.SalesPersonID)
                    {
                        updateSalesPerson.SalesPersonName = salesPersonList[i].SalesPersonName;
                        updateSalesPerson.SalesPersonMobileNumber = salesPersonList[i].SalesPersonMobileNumber;
                        updateSalesPerson.SalesPersonEmail = salesPersonList[i].SalesPersonEmail;
                        SalesPersonUpdated = true;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return SalesPersonUpdated;

        }

        public bool DeleteSalesPersonDAL(int deleteSalesPersonID)
        {
            bool SalesPersonDeleted = false;
            try
            {
                SalesPerson deleteSalesPerson = null;
                foreach (SalesPerson item in salesPersonList)
                {
                    if (item.SalesPersonID == deleteSalesPersonID)
                    {
                        deleteSalesPerson = item;
                    }
                }

                if (deleteSalesPerson != null)
                {
                    salesPersonList.Remove(deleteSalesPerson);
                    SalesPersonDeleted = true;
                }
            }
            catch (DbException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return SalesPersonDeleted;

        }

    }
}
