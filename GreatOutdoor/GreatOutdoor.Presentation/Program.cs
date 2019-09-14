using System;
using GreatOutdoor;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;
using GreatOutdoor.DataAccessLayer;
namespace GreatOutdoor.Presentation

{
    class Program
    {
        static int number = 1;
        static void Main(string[] args)
        {
            int choice;
            Console.WriteLine("Enter Your Choice");
            choice = Convert.ToInt32(Console.ReadLine());
            switch (choice)
            {
                case 1: Retailer();break;

            }

                
        }

        public static void Retailer()
        {
            PrintMenu();
            Console.WriteLine("Enter Your Choice");
            int c = Convert.ToInt32(Console.ReadLine());
            switch(c)
            {
                case 1:
                    AddRetailer();
                    break;
                case 2:
                    SearchRetailerByID();
                    break;
                case 3:
                    UpdateRetailer();
                    break;
                case 4:
                    DeleteRetailer();
                    break;
                case 5:
                    return;
                default:
                    Console.WriteLine("Invalid Choice");
                    break;
            }
            


        }

        private static void DeleteRetailer()
        {
            try
            {
                int deleteRetailerID;
                Console.WriteLine("Enter RetailerID to Delete:");
                deleteRetailerID = Convert.ToInt32(Console.ReadLine());
                RetailersDAL guestDAL = new RetailersDAL();
               bool  guestDeleted = guestDAL.DeleteRetailerDAL(deleteRetailerID);
  
                


            }
            catch (GreatOutdoorException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void UpdateRetailer()
        {
            try
            {
                int updateRetailerID;
                Console.WriteLine("Enter RetailerID to Update Details:");
                updateRetailerID = Convert.ToInt32(Console.ReadLine());
                RetailersDAL retailerDAL = new RetailersDAL();
                Retailers updatedGuest = retailerDAL.SearchRetailerDAL(updateRetailerID);
                if (updatedGuest != null)
                {
                    Console.WriteLine("Update Retailer Name :");
                    updatedGuest.RetailerName = Console.ReadLine();
                    Console.WriteLine("Update PhoneNumber :");
                    updatedGuest.RetailerMobile = Console.ReadLine();
                    bool guestUpdated = retailerDAL.UpdateRetailerDAL(updatedGuest);
                    if (guestUpdated)
                        Console.WriteLine("Retailer Details Updated");
                    else
                        Console.WriteLine("Retailer Details not Updated ");
                }
                else
                {
                    Console.WriteLine("No Retailer Details Available");
                }


            }
            catch (GreatOutdoorException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void SearchRetailerByID()
        {
            try
            {
                int searchRetailerID;
                Console.WriteLine("Enter RetailerID to Search:");
                searchRetailerID = Convert.ToInt32(Console.ReadLine());
                RetailersDAL retailersDAL = new RetailersDAL();
                Retailers searchRetailers = retailersDAL.SearchRetailerDAL(searchRetailerID);
                if (searchRetailers != null)
                {
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("RetailerID\t\tName\t\tPhoneNumber");
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("{0}\t\t{1}\t\t{2}", searchRetailers.RetailerID, searchRetailers.RetailerName, searchRetailers.RetailerMobile);
                    Console.WriteLine("******************************************************************************");
                }
                else
                {
                    Console.WriteLine("No Retailer Details Available");
                }

            }
            catch (GreatOutdoorException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void AddRetailer()
        {
            try
            {
                Retailers newRetailer = new Retailers();
                newRetailer.RetailerID = number;number++;
                Console.WriteLine("Enter Retailer Name :");
                newRetailer.RetailerName = Console.ReadLine();
                Console.WriteLine("Enter PhoneNumber :");
                newRetailer.RetailerMobile = Console.ReadLine();
                Console.WriteLine("Enter Retailers Email");
                newRetailer.RetailerEmail= Console.ReadLine();
                Console.WriteLine("Your RetailerId:" + newRetailer.RetailerID);

            }
            catch (GreatOutdoorException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void PrintMenu()
        {
            Console.WriteLine("\n***********Retailer PhoneBook Menu***********");
            Console.WriteLine("1. Add Retailer");
            Console.WriteLine("2. Search Retailer by ID");
            Console.WriteLine("3. Update Retailer");
            Console.WriteLine("4. Delete Retailer");
            Console.WriteLine("5. Exit");
            Console.WriteLine("******************************************\n");

        }
    }
}
