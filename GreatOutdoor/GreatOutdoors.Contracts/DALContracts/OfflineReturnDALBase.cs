using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.IO;
using GreatOutdoor.Entities;



namespace GreatOutdoor.Contracts.DALContracts
{
    public abstract class OfflineReturnDALBase
    {
        
        //Collection of OfflineReturns
        protected static List<OfflineReturn> OfflineReturnList = new List<OfflineReturn>();
        private static string fileName = "OfflineReturns.json";
        /// <summary>
        /// Writes collection to the file in JSON format.
        /// </summary>
        public static void Serialize()
        {
            string serializedJson = JsonConvert.SerializeObject(OfflineReturnList);
            using (StreamWriter streamWriter = new StreamWriter(fileName))
            {
                streamWriter.Write(serializedJson);
                streamWriter.Close();
            }
        }

        /// <summary>
        /// Reads collection from the file in JSON format.
        /// </summary>
        public static void Deserialize()
        {
            string fileContent = string.Empty;
            if (!File.Exists(fileName))
                File.Create(fileName).Close();

            using (StreamReader streamReader = new StreamReader(fileName))
            {
                fileContent = streamReader.ReadToEnd();
                streamReader.Close();
                var OfflineReturnListFromFile = JsonConvert.DeserializeObject<List<OfflineReturn>>(fileContent);
                if (OfflineReturnListFromFile != null)
                {
                    OfflineReturnList = OfflineReturnListFromFile;
                }
            }
        }
        /// <summary>
        /// Static Constructor.
        /// </summary>
        static OfflineReturnDALBase()
        {
            Deserialize();
        }
    }
}

