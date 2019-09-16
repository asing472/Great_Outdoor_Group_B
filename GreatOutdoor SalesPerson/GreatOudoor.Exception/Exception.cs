using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GreatOudoor.Exceptions
{
    public class GreatOutdoorException : ApplicationException
    {
        public GreatOutdoorException()
            : base()
        {
        }

        public GreatOutdoorException(string message)
            : base(message)
        {
        }
        public GreatOutdoorException(string message, Exception innerException)
            : base(message, innerException)
        {
        }
    }
}
