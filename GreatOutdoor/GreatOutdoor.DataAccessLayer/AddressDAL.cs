using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;
using Newtonsoft.Json;
using System.IO;

namespace GreatOutdoor.DataAccessLayer
{   // Abstract Class
    public abstract class IAddressDAL
    {
        public abstract bool AddAddressDAL(Address newAddress);
        public abstract List<Address> GetAllAddressDAL();
        public abstract Address SearchAddressDAL(int searchAddressID);
        public abstract List<Address> GetAddressByRetailerId(int RetailerId);
        public abstract void Serialize();
        public abstract void Deserialize();
    }
    // Data Access Layer
    public class AddressDAL: IAddressDAL
    {
        private string filePath = @"Address.dat";
        public static List<Address> AddressList = new List<Address>();

        // For Adding Adress
        // parameter is Address
        public override bool AddAddressDAL(Address newAddress)
        {
            Deserialize();
            bool addressAdded = false;
            try
            {
                
                newAddress.AddressID = (AddressList.Count + 1);
                AddressList.Add(newAddress);
                Serialize();
                addressAdded = true;
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return addressAdded;

        }

        // Search All Address
        public override List<Address> GetAllAddressDAL()
        {
            Deserialize();
            return AddressList;
        }

        //Search Address by AddressID
        //Paramer is int AddressID
        public override Address SearchAddressDAL(int searchAddressID)
        {
            Deserialize();
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

        //Search Address by Retail ID
        public override List<Address> GetAddressByRetailerId(int RetailerID)
        {
            Deserialize();
            List<Address> searchAddress = new List<Address>();

            try
            {
                foreach (var item in AddressList)
                {

                }
                {
                    if (item.RetailerID == RetailerID)
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

        // Update Address 
        public bool UpdateAddress(Address updateAddress)
        {
            Deserialize();
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
        // Delete Address
        public bool DeleteAddressDAL(int deleteAddressID)
        {
            Deserialize();
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

        // Serialaize
        public override void Serialize()
        {
            JsonSerializer serializer = new JsonSerializer();
            using (FileStream fs = new FileStream(filePath, FileMode.Create, FileAccess.Write))
            using (StreamWriter sw = new StreamWriter(fs))
            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                serializer.Serialize(writer, AddressList);
                sw.Close();
                fs.Close();
            }
        }
        // Deserialzing Data of Field in File
        public override void Deserialize()
        {
            AddressList = JsonConvert.DeserializeObject<List<Address>>(File.ReadAllText(filePath));
        }
    }

    
}

