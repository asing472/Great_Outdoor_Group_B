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
   public class RetailersBL
    {
        //Validate the retailer before adding and updating
        private bool ValidateRetailerBL(Retailer retailers)
        {
            //Create string builder
            StringBuilder sb = new StringBuilder();
            bool validRetailer = true;

            //Rule: Retaler Name should have alphabets only
            Regex regex1 = new Regex("^[a-zA-z. ]*$");
            bool b = regex1.IsMatch(retailers.RetailerName); 
            if (b == false)
            {
                validRetailer = false;
                sb.Append(Environment.NewLine + "Guest Name in Invalid Format");
            }


            //Rule: 
            Regex regex2 = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            bool c = regex2.IsMatch(retailers.RetailerEmail);
            if (c==false)
            {
                validRetailer = false;
                sb.Append(Environment.NewLine + "Please Check Email");
            }


            Regex regex3 = new Regex(@"^((\+)?(\d{2}[-]))?(\d{10}){1}?$");
            bool d = regex3.IsMatch(retailers.RetailerMobile);
            if (d == false)
            {
                validRetailer = false;
                sb.Append(Environment.NewLine + "Invalid Mobile No.");
            }

            if (validRetailer == false)
                throw new GreatOutdoorException(sb.ToString());
            return validRetailer;
        }


        public bool AddRetailerBL( Retailer newRetailer)
        {
            bool retailerAdded = false;
            try
            {
                if (ValidateRetailerBL(newRetailer))
                {
                    RetailersDALAbstract retailerDAL = new RetailersDAL();
                    retailerAdded = retailerDAL.AddRetailerDAL(newRetailer);
                }
            }
            catch (Exception ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }

            return retailerAdded;
        }

        
        public Retailer  GetRetailerByIDBL(int searchretailerID)
        {
            Retailer searchRetailer = null;
            try
            {
                RetailersDAL guestDAL = new RetailersDAL();
                searchRetailer = guestDAL.GetRetailerByIDDAL(searchretailerID);
            }
            catch (GreatOutdoorException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return searchRetailer;

        }

        public bool UpdateRetailerBL(Retailer updateRetailer)
        {
            bool retailerUpdated = false;
            try
            {
                if (ValidateRetailerBL(updateRetailer))
                {
                    RetailersDAL retailerDAL = new RetailersDAL();
                    retailerUpdated = retailerDAL.UpdateRetailerDetailDAL(updateRetailer);
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

            return retailerUpdated;
        }

        public bool DeleteRetailerBL(int deleteRetailerID)
        {
            bool retailerDeleted = false;
            try
            {
                if (deleteRetailerID > 0)
                {
                    RetailersDAL retailerDAL = new RetailersDAL();
                    retailerDeleted = retailerDAL.DeleteRetailerDAL(deleteRetailerID);
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
            return retailerDeleted;
        }

        public void Serialize()
        {
            try
            {
                RetailersDAL retailersDAL = new RetailersDAL();
                retailersDAL.Serialize();
            }
            catch (Exception ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
        }

        public void Deserialize()
        {
            try
            {
                RetailersDAL retailersDAL = new RetailersDAL();
                retailersDAL.Deserialize();
            }
            catch (Exception ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
        }
    }
}

