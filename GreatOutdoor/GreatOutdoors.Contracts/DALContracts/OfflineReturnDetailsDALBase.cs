using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using GreatOutdoor.Entities;

namespace GreatOutdoor.Contracts.DALContracts
{
    public class OfflineReturnDetailsDetailsDALBase
    {
        //Collection of OfflineReturnDetails
        public static List<OfflineReturnDetails> OfflineReturnDetailsList = new List<OfflineReturnDetails>();
        private static string fileName = "OfflineReturnDetailss.json";
        /// <summary>
        /// Writes collection to the file in JSON format.
        /// </summary>
        public static void Serialize()
        {
            string serializedJson = JsonConvert.SerializeObject(OfflineReturnDetailsList);
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
                var OfflineReturnDetailsListFromFile = JsonConvert.DeserializeObject<List<OfflineReturnDetails>>(fileContent);
                if (OfflineReturnDetailsListFromFile != null)
                {
                    OfflineReturnDetailsList = OfflineReturnDetailsListFromFile;
                }
            }
        }
        /// <summary>
        /// Static Constructor.
        /// </summary>
        static OfflineReturnDetailsDALBase()
        {
            Deserialize();
        }
    }
}
