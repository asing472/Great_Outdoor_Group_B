using System;
using System.Collections.Generic;
using System.Text;
using GreatOutdoor.Entities;
using GreatOutdoor.Exceptions;
using GreatOutdoor.DataAccessLayer;
using System.Text.RegularExpressions;

namespace GreatOutdoor.BusinessLayer
{
   public class AdminBL
    {

        private static bool ValidateAdmin(Admin admin)
        {
            StringBuilder sb = new StringBuilder();
            bool validAdmin = true;
            if (admin.AdminID <= 0)
            {
                validAdmin = false;
                sb.Append(Environment.NewLine + "Invalid Admin ID");

            }
            if (admin.AdminName == string.Empty)
            {
                validAdmin = false;
                sb.Append(Environment.NewLine + "Admin Name Required");

            }
            if (admin.AdminContactNumber.ToString().Length < 10)
            {
                validAdmin = false;
                sb.Append(Environment.NewLine + "Required 10 Digit Contact Number");
            }
            if (validAdmin == false)
                throw new GreatOutdoorException(sb.ToString());
            return validAdmin;
        }
        public static Admin SearchAdminBL(int searchAdminID)
        {
            Admin searchAdmin = null;
            try
            {
                AdminDAL adminDAL = new AdminDAL();
                searchAdmin = adminDAL.SearchAdminDAL(searchAdminID);
            }
            catch (GreatOutdoorException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return searchAdmin;

        }

        public static bool UpdateAdminBL(Admin updateAdmin)
        {
            bool AdminUpdated = false;
            try
            {
                if (ValidateAdmin(updateAdmin))
                {
                    AdminDAL adminDAL = new AdminDAL();
                    AdminUpdated = adminDAL.UpdateAdminDAL(updateAdmin);
                }
            }
            catch (GreatOutdoorException)
            {
                throw;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return AdminUpdated;
        }
    }
}
