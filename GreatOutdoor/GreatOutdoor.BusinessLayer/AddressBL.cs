using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GreatOutdoor.DataAccessLayer;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;
namespace GreatOutdoor.BusinessLayer
{
    public class AddressBL
    {
        // For validating Address
        private  bool ValidateAddress(Address address)
        {
            StringBuilder sb = new StringBuilder();
            bool validAddress = true;
            // For verifying Address ID
            if (address.AddressID <= 0)
            {
                validAddress = false;
                sb.Append(Environment.NewLine + "Invalid Address ID");

            }
            //for Varifying Address Lines
            if (address.Address_line1 == string.Empty)
            {
                validAddress = false;
                sb.Append(Environment.NewLine + "Address li Required");

            }
            if (address.Address_line2 == string.Empty)
            {
                validAddress = false;
                sb.Append(Environment.NewLine + "Address li Required");

            }
            if (address.Landmark == string.Empty)
            {
                validAddress = false;
                sb.Append(Environment.NewLine + "Address li Required");

            }

            if (validAddress == false)
                throw new GreatOutdoorException(sb.ToString());
            return validAddress;
        }
        // For Adding new Address
        public  bool AddAddressBL(Address newAddress)
        {
            bool AddressAdded = false;
            try
            {
                if (ValidateAddress(newAddress))
                {
                    AddressDAL AddressDAL = new AddressDAL();
                    AddressAdded = AddressDAL.AddAddressDAL(newAddress);
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

            return AddressAdded;
        }
        // See All Address
        public  List<Address> GetAllAddresssBL()
        {
            List<Address> AddressList = null;
            try
            {
                AddressDAL AddressDAL = new AddressDAL();
                AddressList = AddressDAL.GetAllAddressDAL();
            }
            catch (GreatOutdoorException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return AddressList;
        }
        // Searching Address By Retailers ID
        public List<Address> GetAddressByAddressIDBL(int RetailerID)
        {
            List<Address> searchAddress = new List<Address>();
            try
            {
                AddressDAL AddressDAL = new AddressDAL();
                searchAddress = AddressDAL.GetAddressByRetailerId(RetailerID);

            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return searchAddress;
        }
        // Search Address By Address ID
        public  Address SearchAddressBL(int searchAddressID)
        {
            Address searchAddress = null;
            try
            {
                AddressDAL AddressDAL = new AddressDAL();
                searchAddress = AddressDAL.SearchAddressDAL(searchAddressID);
            }
            catch (GreatOutdoorException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return searchAddress;

        }
        // Update Address By Address
        public  bool UpdateAddressBL(Address updateAddress)
        {
            bool AddressUpdated = false;
            try
            {
                if (ValidateAddress(updateAddress))
                {
                    AddressDAL AddressDAL = new AddressDAL();
                    AddressUpdated = AddressDAL.UpdateAddress(updateAddress);
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

            return AddressUpdated;
        }
        //Delete Address
        public bool DeleteAddressBL(int deleteAddressID)
        {
            bool AddressDeleted = false;
            try
            {
                if (deleteAddressID > 0)
                {
                    AddressDAL AddressDAL = new AddressDAL();
                    AddressDeleted = AddressDAL.DeleteAddressDAL(deleteAddressID);
                }
                else
                {
                    throw new GreatOutdoorException("Invalid Address ID");
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

            return AddressDeleted;
        }

    }
}
