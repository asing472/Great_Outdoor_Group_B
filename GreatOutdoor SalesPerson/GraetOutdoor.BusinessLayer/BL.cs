using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.DataAccessLayer


namespace GreatOutdoor.BusinessLayer
{
    public class SalesPersonBL
    {
        private static bool ValidateSalesPersonBL(SalesPerson salesPerson)
        {
            StringBuilder sb = new StringBuilder();
            bool validSalesPerson = true;
            if (SalesPerson.SalesPersonID <= 0)
            {
                validSalesPerson = false;
                sb.Append(Environment.NewLine + "Invalid SalesPerson ID");

            }
            if (SalesPerson.SalesPersonName == string.Empty)
            {
                validSalesPerson = false;
                sb.Append(Environment.NewLine + "SalesPerson Name Required");

            }
            if (SalesPerson.SalesPersonMobileNumber.Length < 10)
            {
                validSalesPerson = false;
                sb.Append(Environment.NewLine + "Required 10 Digit Contact Number");
            }
            if (validSalesPerson == false)
                throw new GreatOutdoorException(sb.ToString());
            return validSalesPerson;
        }

        public static bool AddSalesPersonBL(SalesPerson newSalesPerson)
        {
            bool SalesPersonAdded = false;
            try
            {
                if (ValidateSalesPerson(newSalesPerson))
                {
                    SalesPersonDAL salesPersonDAL = new SalesPersonDAL();
                    salesPersonAdded = SalesPersonDAL.AddSalesPersonDAL(newSalesPerson);
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

            return SalesPersonAdded;
        }

        public static List<SalesPerson> GetAllSalesPersonsBL()
        {
            List<SalesPerson> SalesPersonList = null;
            try
            {
                SalesPersonDAL salesPersonDAL = new SalesPersonDAL();
                salesPersonList = salesPersonDAL.GetAllSalesPersonsDAL();
            }
            catch (GreatOutdoorException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return SalesPersonList;
        }

        public static SalesPerson SearchSalesPersonBL(int searchSalesPersonID)
        {
            SalesPerson searchSalesPerson = null;
            try
            {
                SalesPersonDAL salesPersonDAL = new SalesPersonDAL();
                searchSalesPerson = salesPersonDAL.SearchSalesPersonDAL(searchSalesPersonID);
            }
            catch (GreatOutdoorException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return searchSalesPerson;

        }

        public static bool UpdateSalesPersonBL(SalesPerson updateSalesPerson)
        {
            bool SalesPersonUpdated = false;
            try
            {
                if (ValidateSalesPerson(updateSalesPerson))
                {
                    SalesPersonDAL salesPersonDAL = new SalesPersonDAL();
                    salesPersonUpdated = salesPersonDAL.UpdateSalesPersonDAL(updateSalesPerson);
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

            return SalesPersonUpdated;
        }

        public static bool DeleteSalesPersonBL(int deleteSalesPersonID)
        {
            bool SalesPersonDeleted = false;
            try
            {
                if (deleteSalesPersonID > 0)
                {
                    SalesPersonDAL salesPersonDAL = new SalesPersonDAL();
                    salesPersonDeleted = salesPersonDAL.DeleteSalesPersonDAL(deleteSalesPersonID);
                }
                else
                {
                    throw new GreatOutdoorException("Invalid SalesPerson ID");
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

            return SalesPersonDeleted;
        }

    }
}
