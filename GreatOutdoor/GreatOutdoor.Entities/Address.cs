using System;
using System.Collections.Generic;
using System.Text;

namespace GreatOutdoor.Entities
{
    public class Address
    {
        private int _addressID;
        private string _address_line1;
        private string _address_line2;
        private string _landmark;
        private string _city;
        private string _state;
        private int _pincode;
        private int _retailerId;

        public int AddressID { get => _addressID; set => _addressID = value; }
        public string Address_line1 { get => _address_line1; set => _address_line1 = value; }
        public string Address_line2 { get => _address_line2; set => _address_line2 = value; }
        public string Landmark { get => _landmark; set => _landmark = value; }
        public string City { get => _city; set => _city = value; }
        public string State { get => _state; set => _state = value; }
        public int Pincode { get => _pincode; set => _pincode = value; }
        public int RetailerId { get => _retailerId; set => _retailerId = value; }
    }
}
