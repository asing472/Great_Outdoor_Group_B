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
        private string filePath = "retailers.dat";

        public override bool AddRetailerDAL(Retailer newRetailer)
        {
            bool RetailerAdded = false;
            try
            {   // Saving File as JSON file
                newRetailer.RetailerID = retailerList.Count+1;
                retailerList.Add(newRetailer);
                string outputJson = Newtonsoft.Json.JsonConvert.SerializeObject(retailerList, Newtonsoft.Json.Formatting.Indented);
                string path = AppDomain.CurrentDomain.BaseDirectory;
                string Path = "path" + "\retiler.json";
                File.WriteAllText(Path, outputJson);
                
                RetailerAdded = true;
            }
            catch (Exception ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return RetailerAdded;
        }

        //Having a List of All retailer
        public override List<Retailer> GetAllRetailersDAL()
        {
            return retailerList;
        }

        //Searching Reatiler By ReatilerID
        public override Retailer GetRetailerByIDDAL(int GetRetailerID)
        {
            Retailer searchRetailer = null;
            try
            {
                if (File.Exists("Path"))
                { //Reading the JSON File
                    StreamReader r = new StreamReader("Path");
                        string json = r.ReadToEnd();
                    List<Retailer> retailerLists = new List<Retailer>();
                        retailerLists = JsonConvert.DeserializeObject<List<Retailer>>(json);
                    
                }
                foreach (Retailer item in retailerList)
                {
                    if (item.RetailerID == GetRetailerID)
                    {
                        searchRetailer = item;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Json Read F");
                throw new GreatOutdoorException(ex.Message);
            }
            return searchRetailer;
        }

        // Searching Retailers By Name
        public override List<Retailer> GetRetailersByNameDAL(string RetailerName)
        {
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
            this.retailerListToSerialize = retailerList;
            FileStream fs1 = new FileStream(filePath, FileMode.Create, FileAccess.Write);
            BinaryFormatter binaryFormatter = new BinaryFormatter();
            binaryFormatter.Serialize(fs1, this);
            fs1.Close();
        }
        // Deserialzing Data of Field in File
        public override void Deserialize()
        {
            FileStream fs2 = new FileStream(filePath, FileMode.Open, FileAccess.Read);
            BinaryFormatter binaryFormatter = new BinaryFormatter();
            RetailersDAL retailersDAL = (RetailersDAL)binaryFormatter.Deserialize(fs2);
        }
    }
}
