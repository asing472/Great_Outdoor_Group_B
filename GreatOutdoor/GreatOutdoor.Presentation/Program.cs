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
        public static void Main()
        {
            try
            {
                int choice=1;
                do
                {
                    string username, password, pass;
                    
                    Console.WriteLine("Enter Your Choice");
                    Console.WriteLine("1.Admin \n2.Saleperson \n3.Retailer\n4.Exit");
                    int option = int.Parse(ReadLine());

                    if (option == 1)//if user is admin
                    {
                        Admin ad = new Admin();
                        WriteLine("welcome admin");
                        WriteLine("enter username");
                        username = ReadLine();

                    }
                    else if (option == 2)
                    {
                        SalesPerson sp = new SalesPerson();
                        WriteLine("welcome salesperson");
                        WriteLine("enter username");
                        username = ReadLine();
                    }

                    else if (option == 3)//if user is retailer
                    {
                        Retailers ret = new Retailers();


                        int option1;
                        WriteLine("enter option\n1.existing user\n2.new user");
                        option1 = int.Parse(ReadLine());
                        if (option1 == 1)
                        {
                            WriteLine("welcome retailer");
                            WriteLine("enter username");
                            username = ReadLine();
                        }
                    }
                    else if (option == 4)//if user is retailer
                    { WriteLine("closing the application");
                        choice = 0;
                    }
                    else//if user enters incorrect category
                    {
                        WriteLine("Invalid option \nPlease enter valid category number");
                        Main();
                    }

                } while (choice <1);



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
               
                Retailers deleteRetailer = RetailersBL.GetRetailerByIDBL(deleteRetailerID);
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
                Retailers updatedRetailer = retailerDAL.GetRetailerByIDDAL(updateRetailerID-1);
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
                Retailers searchRetailers = retailersDAL.GetRetailerByIDDAL(searchRetailerID);
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
