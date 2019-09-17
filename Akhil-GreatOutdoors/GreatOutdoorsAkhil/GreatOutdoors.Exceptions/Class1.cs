using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreatOutdoors.Exceptions
{
    public class GreatOutdoorsQuantityExceededException : ApplicationException
    {
        public GreatOutdoorsQuantityExceededException()
        {
            Console.WriteLine("Quantity Exceeded");
        }
    }
}
