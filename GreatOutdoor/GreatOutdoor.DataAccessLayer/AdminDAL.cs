using System;
using static System.Console;
using System.Collections.Generic;
using System.Text;
using System.Data.Common;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;

namespace GreatOutdoor.DataAccessLayer
{
    public class AdminDAL
    {
        public static List<Admin> AdminList = new List<Admin>();

        public Admin SearchAdminDAL(int searchAdminID)
        {
            Admin searchAdmin = null;
            try
            {
                foreach (Admin item in AdminList)
                {
                    if (item.AdminID == searchAdminID)
                    {
                        searchAdmin = item;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return searchAdmin;
        }
        public bool UpdateAdminDAL(Admin updateAdmin)
        {
            bool adminUpdated = false;
            try
            {
                for (int i = 0; i < AdminList.Count; i++)
                {
                    if (AdminList[i].AdminID == updateAdmin.AdminID)
                    {
                        updateAdmin.AdminName = AdminList[i].AdminName;
                        updateAdmin.AdminContactNumber = AdminList[i].AdminContactNumber;
                        adminUpdated = true;
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new GreatOutdoorException(ex.Message);
            }
            return adminUpdated;

        }
    }
}
