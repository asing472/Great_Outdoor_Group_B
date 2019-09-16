using System;
using static System.Console;
using GreatOutdoor;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;
using GreatOutdoor.DataAccessLayer;
using GreatOutdoor.BusinessLayer;
namespace GreatOutdoor.Presentation

{
    class Program
    {
        static void Main()
        {
            try
            {
                int choice;
                do
                {
                    WriteLine("1.Admin \n2.Saleperson \n3.Retailer");
                    WriteLine("Enter the user category number");
                    Console.WriteLine("Enter Your Choice");
                    choice = Convert.ToInt32(Console.ReadLine());
                    switch (choice)
                    {
                        case 1: Retailer(); break;

                    }

                } while (choice != -1);



            }
            catch (Exception )
            {

                Console.WriteLine("Error Occured Sorry"); ;
            }
            finally
            {
                Console.WriteLine("Retry");
                Program.Main();

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
                    GetRetailerByID();
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
               
                Retailer deleteRetailer = RetailersBL.GetRetailerByIDBL(deleteRetailerID);
                if (deleteRetailer != null)
                {
                    bool guestdeleted = RetailersBL.DeleteRetailerBL(deleteRetailerID);
                    if (guestdeleted)
                        Console.WriteLine("Retailer Deleted");
                    else
                        Console.WriteLine("Retailer not Deleted ");
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

        private static void UpdateRetailer()
        {
            try
            {
                int updateRetailerID;
                Console.WriteLine("Enter RetailerID to Update Details:");
                updateRetailerID = Convert.ToInt32(Console.ReadLine());
                RetailersDAL retailerDAL = new RetailersDAL();
                Retailer updatedRetailer = retailerDAL.GetRetailerByIDDAL(updateRetailerID-1);
                if (updatedRetailer != null)
                {
                    Console.WriteLine("New Retailer Name :");
                    updatedRetailer.RetailerName = Console.ReadLine();
                    Console.WriteLine("New PhoneNumber :");
                    updatedRetailer.RetailerMobile = Console.ReadLine();
                    Console.WriteLine("New Retailer Email");
                    updatedRetailer.RetailerEmail = Console.ReadLine();
                    bool guestUpdated = retailerDAL.UpdateRetailerDetailDAL(updatedRetailer);
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

        private static void GetRetailerByID()
        {
            try
            {
                int searchRetailerID;
                Console.WriteLine("Enter RetailerID to Search:");
                searchRetailerID = Convert.ToInt32(Console.ReadLine());
                RetailersDAL retailersDAL = new RetailersDAL();
                Retailer searchRetailers = retailersDAL.GetRetailerByIDDAL(searchRetailerID);
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
                Retailer newRetailer = new Retailer();
                Console.WriteLine("Enter Retailer Name :");
                newRetailer.RetailerName = Console.ReadLine();
                Console.WriteLine("Enter PhoneNumber :");
                newRetailer.RetailerMobile = Console.ReadLine();
                Console.WriteLine("Enter Retailers Email");
                newRetailer.RetailerEmail= Console.ReadLine();
                bool retailerAdded = RetailersBL.AddRetailerBL(newRetailer);
                if (retailerAdded)
                    Console.WriteLine("Retailer Added");
                else
                    Console.WriteLine("Retailer Not Added");

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

        private static void UpdateAdmin()
        {
            try
            {
                int updateAdminID;
                Console.WriteLine("Enter AdminID to Update Details:");
                updateAdminID = Convert.ToInt32(Console.ReadLine());
                Admin updatedAdmin = AdminBL.SearchAdminBL(updateAdminID);
                if (updatedAdmin != null)
                {
                    Console.WriteLine("Update Admin Name :");
                    updatedAdmin.AdminName = Console.ReadLine();
                    Console.WriteLine("Update PhoneNumber :");
                    updatedAdmin.AdminContactNumber = int.Parse(Console.ReadLine());
                    bool AdminUpdated = AdminBL.UpdateAdminBL(updatedAdmin);
                    if (AdminUpdated)
                        Console.WriteLine("Admin Details Updated");
                    else
                        Console.WriteLine("Admin Details not Updated ");
                }
                else
                {
                    Console.WriteLine("No Admin Details Available");
                }


            }
            catch (GreatOutdoorException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
