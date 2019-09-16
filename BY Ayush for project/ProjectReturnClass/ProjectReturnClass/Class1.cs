using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace ProjectReturnClass
{
  
    class ReturnOnlineOrder

    {
        //fields
        private static int _returnId=1;
        private string _PurposeofReturn;
        private string _noOfReturn;
        private DateTime _dateOfReturn;
       

        public static int ReturnId { get => _returnId; set => _returnId = value; }

        public string PurposeOfReturn
        {
            set
            {
                Console.WriteLine("Choose purpose of return");
                Console.WriteLine("1: Unsatisfactory Product ");
                Console.WriteLine("2: Defective product");
                Console.WriteLine("3: Incomplete Product ");
                Console.WriteLine("4: Wrong Product Ordered ");
                Console.WriteLine("5: wrong Product shipped");
                _PurposeofReturn = Console.ReadLine();

                Regex regex = new Regex("^[1-5]+$");
                bool b = regex.IsMatch(value);
                if (b == true)
                {
                    int a = int.Parse(value);
                    if(a==1)
                    {
                        _PurposeofReturn = "Unsatisfactory Product";
                    }
                    else if(a==2)
                    {
                        _PurposeofReturn = "Defective product";
                    }
                    else if(a == 3)
                    {
                        _PurposeofReturn = "Incomplete Product";
                    }
                    else if (a == 4)
                    {
                        _PurposeofReturn = "Wrong Product Ordered";
                    }
                    else if (a == 5)
                    {
                        _PurposeofReturn = "wrong Product shipped";
                    }

                }
                else
                {
                    throw new Exception("Invalid purpose of return");
                }

            }

            get
            {
                return _PurposeofReturn;
            }

        }


        public string NoOfReturn
        {
            set
            {
                Console.WriteLine("Enter number of return product ");
                _noOfReturn = Console.ReadLine();
                _noOfReturn = value;
            }
            get
            {
                return _noOfReturn;
            }

        }

        public DateTime DateOfReturn { get => DateOfReturn; set => DateOfReturn = value; }

        //constructor
        public ReturnOnlineOrder()
        {

        }



        public ReturnOnlineOrder (int NoOfReturn, string PurposeOfReturn)
        {
            this.NoOfReturn = _noOfReturn;
            this.PurposeOfReturn = _PurposeofReturn;
           
        }

        
        //method
        public int ReturnValue(int orderId, int ProductId, int NoOfQuantity)
        {
            Order order = new Order();
            Product
            Console.WriteLine("Enter the OrderId");

        }

        public int ConfirmReturnOrder(string ReturnConfirmation)
        {
            if(ReturnConfirmation=="Yes")
            {
                _returnId++;
                DateOfReturn = DateTime.Now;
            }
            return _returnId;
        }
       
       


    }
}
