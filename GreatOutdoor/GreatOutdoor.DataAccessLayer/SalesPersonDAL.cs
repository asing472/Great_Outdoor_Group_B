﻿using System;
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
    public abstract class SalesPersonDALAbstract
    {
        public abstract bool AddSalesPersonDAL(SalesPerson newSalesPerson);
        public abstract List<SalesPerson> GetAllSalesPersonDAL();
        public abstract SalesPerson GetSalesPersonByIDDAL(int GetSalesPersonID);
        public abstract List<SalesPerson> GetSalesPersonByNameDAL(string SalesPersonName);
        public abstract bool UpdateSalesPersonDetailDAL(SalesPerson updateSalesPerson);
        public abstract bool DeleteSalesPersonDAL(int deleteSalesPersonID);
        public abstract void Serialize();
        public abstract void Deserialize();
    }

    [Serializable]
    public class SalesPersonDAL : SalesPersonDALAbstract
    {
        public static List<SalesPerson> SalesPersonList = new List<SalesPerson>();
        public List<SalesPerson> SalesPersonListToSerialize = new List<SalesPerson>();
        private string filePath = "SalesPerson.dat";

        public override bool AddSalesPersonDAL(SalesPerson newSalesPerson)
        {
            bool SalesPersonAdded = false;
            try
            {
                newSalesPerson.SalesPersonID = SalesPersonList.Count + 1;
                SalesPersonList.Add(newSalesPerson);
                string outputJson = Newtonsoft.Json.JsonConvert.SerializeObject(SalesPersonList, Newtonsoft.Json.Formatting.Indented);
                string path = AppDomain.CurrentDomain.BaseDirectory;
                string Path = "path" + "\retiler.json";
                File.WriteAllText(Path, outputJson);

                SalesPersonAdded = true;
            }
            catch (Exception ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return SalesPersonAdded;
        }

        public override List<SalesPerson> GetAllSalesPersonDAL()
        {
            return SalesPersonList;
        }

        public override SalesPerson GetSalesPersonByIDDAL(int GetSalesPersonID)
        {
            SalesPerson searchSalesPerson = null;
            try
            {
                if (File.Exists("Path"))
                {
                    StreamReader r = new StreamReader("Path");
                    string json = r.ReadToEnd();
                    List<SalesPerson> SalesPersonLists = new List<SalesPerson>();
                    SalesPersonLists = JsonConvert.DeserializeObject<List<SalesPerson>>(json);

                }
                foreach (SalesPerson item in SalesPersonList)
                {
                    if (item.SalesPersonID == GetSalesPersonID)
                    {
                        searchSalesPerson = item;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Json Read F");
                throw new GreatOutdoorException(ex.Message);
            }
            return searchSalesPerson;
        }

        public override List<SalesPerson> GetSalesPersonByNameDAL(string SalesPersonName)
        {
            List<SalesPerson> searchSalesPerson = new List<SalesPerson>();
            try
            {
                foreach (SalesPerson item in SalesPersonList)
                {
                    if (item.SalesPersonName == SalesPersonName)
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

        public override bool UpdateSalesPersonDetailDAL(SalesPerson updateSalesPerson)
        {
            bool SalesPersonUpdated = false;
            try
            {
                for (int i = 0; i < SalesPersonList.Count; i++)
                {
                    if (SalesPersonList[i].SalesPersonID == updateSalesPerson.SalesPersonID)
                    {
                        updateSalesPerson.SalesPersonName = SalesPersonList[i].SalesPersonName;
                        updateSalesPerson.SalesPersonMobile = SalesPersonList[i].SalesPersonMobile;
                        updateSalesPerson.SalesPersonEmail = SalesPersonList[i].SalesPersonEmail;
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

        public override bool DeleteSalesPersonDAL(int deleteSalesPersonID)
        {
            bool SalesPersonDeleted = false;
            try
            {
                SalesPerson deleteSalesPerson = null;
                foreach (SalesPerson item in SalesPersonList)
                {
                    if (item.SalesPersonID == deleteSalesPersonID)
                    {
                        deleteSalesPerson = item;
                    }
                }

                if (deleteSalesPerson != null)
                {
                    SalesPersonList.Remove(deleteSalesPerson);
                    SalesPersonDeleted = true;
                }
            }
            catch (DbException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return SalesPersonDeleted;
        }

        public override void Serialize()
        {
            this.SalesPersonListToSerialize = SalesPersonList;
            FileStream fs1 = new FileStream(filePath, FileMode.Create, FileAccess.Write);
            BinaryFormatter binaryFormatter = new BinaryFormatter();
            binaryFormatter.Serialize(fs1, this);
            fs1.Close();
        }

        public override void Deserialize()
        {
            FileStream fs2 = new FileStream(filePath, FileMode.Open, FileAccess.Read);
            BinaryFormatter binaryFormatter = new BinaryFormatter();
            SalesPersonDAL SalesPersonDAL = (SalesPersonDAL)binaryFormatter.Deserialize(fs2);
        }
    }
}
