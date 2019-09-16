using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;

namespace GreatOutdoor.DataAccessLayer
{
    public class AddressDAL
    {
        public static List<Address> AddressList = new List<Address>();

        public bool AddAddressDAL(Address newAddress)
        {
            bool addressAdded = false;
            try
            {
                AddressList.Add(newAddress);
                addressAdded = true;
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return addressAdded;

        }

        public List<Address> GetAllAddressDAL()
        {
            return AddressList;
        }

        public Address GetMyData()
        {
            return new Address() { City = "Mumbai" };
        }

        public Address SearchAddressDAL(int searchAddressID)
        {
            Address searchAddress = null;
            try
            {
                foreach (Address item in AddressList)
                {
                    if (item.AddressID == searchAddressID)
                    {
                        searchAddress = item;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return searchAddress;
        }

        public List<Address> GetAddressByRetailerId(int RetailerId)
        {
            List<Address> searchAddress = new List<Address>();

            try
            {
                foreach (Address item in AddressList)
                {
                    if (item.RetailerId == RetailerId)
                    {
                        searchAddress.Add(item);
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return searchAddress;
        }

        public bool UpdateAddress(Address updateAddress)
        {
            bool AddressUpdated = false;
            try
            {
                for (int i = 0; i < AddressList.Count; i++)
                {
                    if (AddressList[i].AddressID == updateAddress.AddressID)
                    {
                        updateAddress.Address_line1 = AddressList[i].Address_line1;
                        updateAddress.Address_line2 = AddressList[i].Address_line2;
                        updateAddress.Landmark = AddressList[i].Landmark;
                        updateAddress.City = AddressList[i].City;
                        updateAddress.State = AddressList[i].State;

                        AddressUpdated = true;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return AddressUpdated;

        }

        public bool DeleteAddressDAL(int deleteAddressID)
        {
            bool AddressDeleted = false;
            try
            {
                Address deleteAddress = null;
                foreach (Address item in AddressList)
                {
                    if (item.AddressID == deleteAddressID)
                    {
                        deleteAddress = item;
                    }
                }

                if (deleteAddress != null)
                {
                    AddressList.Remove(deleteAddress);
                    AddressDeleted = true;
                }
            }
            catch (Exception ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return AddressDeleted;

        }

    }

}
