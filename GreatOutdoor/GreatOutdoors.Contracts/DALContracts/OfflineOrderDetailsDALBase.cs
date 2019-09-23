using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using GreatOutdoor.Entities;


namespace GreatOutdoor.Contracts.DALContracts
{
    class OfflineOrderDetailsDetailsDALBase
    {
        //Collection of OfflineOrderDetailss
        protected static List<OfflineOrderDetails> OfflineOrderDetailsList = new List<OfflineOrderDetails>();
        private static string fileName = "OfflineOrderDetails.json";
        /// <summary>
        /// Writes collection to the file in JSON format.
        /// </summary>
        public static void Serialize()
        {
            string serializedJson = JsonConvert.SerializeObject(OfflineOrderDetailsList);
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
                var OfflineOrderDetailsListFromFile = JsonConvert.DeserializeObject<List<OfflineOrderDetails>>(fileContent);
                if (OfflineOrderDetailsListFromFile != null)
                {
                    OfflineOrderDetailsList = OfflineOrderDetailsListFromFile;
                }
            }
        }
        /// <summary>
        /// Static Constructor.
        /// </summary>
        static OfflineOrderDetailsDALBase()
        {
            Deserialize();
        }
    }
}
