using System;
using static System.Console;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using Newtonsoft.Json;
using System.Text.RegularExpressions;
using Newtonsoft.Json.Linq;

namespace GreatOutdoor.DataAccessLayer
{
    //Abstract Class of Data Acess Layer of Retailer
    public abstract class RetailersDALAbstract
    {
        public abstract bool AddRetailerDAL(Retailer newRetailer);
        public abstract List<Retailer> GetAllRetailersDAL();
        public abstract Retailer GetRetailerByIDDAL(int GetRetailerID);
        public abstract List<Retailer> GetRetailersByNameDAL(string RetailerName);
        public abstract bool UpdateRetailerDetailDAL(Retailer updateRetailer);
        public abstract bool DeleteRetailerDAL(int deleteRetailerID);
        public abstract void Serialize();
        public abstract void Deserialize();
    }

    [Serializable]//Making class serializable
    public class RetailersDAL : RetailersDALAbstract
    {
        public static List<Retailer> retailerList = new List<Retailer>();
        public List<Retailer> retailerListToSerialize = new List<Retailer>();


        private string filePath = @"Retailer.dat";


        public override bool AddRetailerDAL(Retailer newRetailer)
        {
            Deserialize();
            bool RetailerAdded = false;
            try
            {   // Saving File as JSON file
                newRetailer.RetailerID = retailerList.Count + 1;
                retailerList.Add(newRetailer);
                Serialize();
                RetailerAdded = true;

            }
            catch (Exception ex)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(Environment.NewLine + "Json Writing Falied");
                throw new GreatOutdoorException(sb.ToString());
            }
            return RetailerAdded;
        }

        //Having a List of All retailer
        public override List<Retailer> GetAllRetailersDAL()
        {
            Deserialize();
            return retailerList;
        }

        //Searching Reatiler By ReatilerID
        public override Retailer GetRetailerByIDDAL(int GetRetailerID)
        {
            Deserialize();
            Retailer searchRetailer = null;
            try
            {
                foreach (Retailer item in retailerList)
                {
                    Console.WriteLine(item.RetailerEmail);
                    if (item.RetailerID == GetRetailerID)
                    {
                        searchRetailer = item;
                    }
                }
            }
            catch (Exception ex)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(Environment.NewLine + "Json Reading Falied");
                throw new GreatOutdoorException(sb.ToString());
            }
            return searchRetailer;
        }

        // Searching Retailers By Name
        public override List<Retailer> GetRetailersByNameDAL(string RetailerName)
        {
            Deserialize();
            List<Retailer> searchRetailer = new List<Retailer>();
            try
            {
                foreach (Retailer item in retailerList)
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

        // Updating Reatilers
        public override bool UpdateRetailerDetailDAL(Retailer updateRetailer)
        {
            Deserialize();
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
        // Deleting Retailer
        public override bool DeleteRetailerDAL(int deleteRetailerID)
        {
            Deserialize();
            bool RetailerDeleted = false;
            try
            {
                Retailer deleteRetailer = null;
                foreach (Retailer item in retailerList)
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

        // Searializing Data of list in File
        public override void Serialize()
        {
            JsonSerializer serializer = new JsonSerializer();
            using (FileStream fs = new FileStream(filePath, FileMode.Create, FileAccess.Write))
            using (StreamWriter sw = new StreamWriter(fs))
            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                serializer.Serialize(writer, retailerList);
                sw.Close();
                fs.Close();
            }
        }
        // Deserialzing Data of Field in File
        public override void Deserialize()
        {
            retailerList = JsonConvert.DeserializeObject<List<Retailer>>(File.ReadAllText(filePath));
        }
    }
}
