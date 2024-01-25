using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SQLHelper;

/// <summary>
/// Summary description for Vendor_DAL
/// </summary>
public class Vendor_DAL
{
    public Vendor_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual bool CheckVendorExist(string Vendor)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Vendor",Vendor)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckVendorExist]", Gparam));
    }
    public virtual int InsertUpdateVendor(Vendor_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@VendorID",BL.VendorID)                                   
                                    ,new SqlParameter("@Company",BL.Company)
                                     ,new SqlParameter("@ContactPerson",BL.ContactPerson)
                                      ,new SqlParameter("@Landline",BL.Landline) 
                                      ,new SqlParameter("@Fax",BL.Fax)
                                       ,new SqlParameter("@Cell",BL.Cell)
                                       ,new SqlParameter("@Email",BL.Email) 
                                       ,new SqlParameter("@City",BL.City) 
                                      ,new SqlParameter("@Address",BL.Address)                                      
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateVendor", param));
    }



  
    public virtual DataTable GetVendorList(object VendorID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@VendorID",VendorID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetVendorList", Gparam).Tables[0];
    }
    public virtual bool CheckandDeleteVendors(int VendorID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@VendorID",VendorID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteVendors", Gparam));
    }

}