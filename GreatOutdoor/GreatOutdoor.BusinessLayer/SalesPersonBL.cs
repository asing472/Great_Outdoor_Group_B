using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;
using GreatOutdoor.DataAccessLayer;
using System.Text.RegularExpressions;

namespace GreatOutdoor.BusinessLayer
{
    public class SalesPersonBL
    {
        //Validate the SalesPerson before adding and updating
        private bool ValidateSalesPersonBL(SalesPerson SalesPersons)
        {
            //Create string builder
            StringBuilder sb = new StringBuilder();
            bool validSalesPerson = true;

            //Rule: SalesPerson Name should have alphabets only
            Regex regex1 = new Regex("^[a-zA-z. ]*$");
            bool b = regex1.IsMatch(SalesPersons.SalesPersonName);
            if (b == false)
            {
                validSalesPerson = false;
                sb.Append(Environment.NewLine + "Guest Name in Invalid Format");
            }


            //Rule: Sarles Person Email Check
            Regex regex2 = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            bool c = regex2.IsMatch(SalesPersons.SalesPersonEmail);
            if (c == false)
            {
                validSalesPerson = false;
                sb.Append(Environment.NewLine + "Please Check Email");
            }

            //Sales Person Mobile Check
            Regex regex3 = new Regex(@"^((\+)?(\d{2}[-]))?(\d{10}){1}?$");
            bool d = regex3.IsMatch(SalesPersons.SalesPersonMobile);
            if (d == false)
            {
                validSalesPerson = false;
                sb.Append(Environment.NewLine + "Invalid Mobile No.");
            }

            if (validSalesPerson == false)
                throw new GreatOutdoorException(sb.ToString());
            return validSalesPerson;
        }

        //Adding Sales Personal
        public bool AddSalesPersonBL(SalesPerson newSalesPerson)
        {
            bool SalesPersonAdded = false;
            try
            {
                if (ValidateSalesPersonBL(newSalesPerson))
                {
                    SalesPersonDALAbstract salesPersonDAL = new SalesPersonDAL();
                    SalesPersonAdded = salesPersonDAL.AddSalesPersonDAL(newSalesPerson);
                }
            }
            catch (Exception ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }

            return SalesPersonAdded;
        }

        //Searching Sales Person By ID
        public SalesPerson GetSalesPersonByIDBL(int searchSalesPersonID)
        {
            SalesPerson searchSalesPerson = null;
            try
            {
                SalesPersonDAL guestDAL = new SalesPersonDAL();
                searchSalesPerson = guestDAL.GetSalesPersonByIDDAL(searchSalesPersonID);
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
        //Updating Sales Person
        public bool UpdateSalesPersonBL(SalesPerson updateSalesPerson)
        {
            bool SalesPersonUpdated = false;
            try
            {
                if (ValidateSalesPersonBL(updateSalesPerson))
                {
                    SalesPersonDAL SalesPersonDAL = new SalesPersonDAL();
                    SalesPersonUpdated = SalesPersonDAL.UpdateSalesPersonDetailDAL(updateSalesPerson);
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
        // Deleting Sales Person
        public bool DeleteSalesPersonBL(int deleteSalesPersonID)
        {
            bool SalesPersonDeleted = false;
            try
            {
                if (deleteSalesPersonID > 0)
                {
                    SalesPersonDAL SalesPersonDAL = new SalesPersonDAL();
                    SalesPersonDeleted = SalesPersonDAL.DeleteSalesPersonDAL(deleteSalesPersonID);
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
            return SalesPersonDeleted;
        }
        // Serailization
        public void Serialize()
        {
            try
            {
                SalesPersonDAL SalesPersonsDAL = new SalesPersonDAL();
                SalesPersonsDAL.Serialize();
            }
            catch (Exception ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
        }
        // Deserialization
        public void Deserialize()
        {
            try
            {
                SalesPersonDAL SalesPersonsDAL = new SalesPersonDAL();
                SalesPersonsDAL.Deserialize();
            }
            catch (Exception ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
        }
    }
}

