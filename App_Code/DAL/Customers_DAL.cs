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
public class Customers_DAL
{
    public Customers_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public virtual bool CheckCustomerExist(string PhoneNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@PhoneNo",PhoneNo)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckCustomerExist]", Gparam));
    }

    public virtual int InsertUpdateCustomer(Customers_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@CustomerID",BL.CustomerID)                                  
                                    ,new SqlParameter("@Name",BL.Name)                                     
                                       ,new SqlParameter("@PhoneNo",BL.PhoneNo)                                      
                                      ,new SqlParameter("@Address",BL.Address)                                      
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)       
                                       ,new SqlParameter("@Active", BL.Active)                                
                               };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateCustomer", param));
    }
    
    public virtual DataTable GetCustomerList(object CustomerID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CustomerID",CustomerID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetCustomerList]", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchCustomerList(object Customer, object Phone, object Address)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Customer",Customer),
                                     new SqlParameter("@Phone",Phone),
                                     new SqlParameter("@Address",Address)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSearchCustomerList", Gparam).Tables[0];
    }

    public virtual DataTable CusNameForCash(object CustomerID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CustomerID",CustomerID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CusNameForCash]", Gparam).Tables[0];
    }
    public virtual bool CheckandDeleteCustomer(int CustomerID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CustomerID",CustomerID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckandDeleteCustomer]", Gparam));
    }
    public virtual DataTable GetCustomerListByCategory(object CustomerCategoryID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CustomerCategoryID",CustomerCategoryID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetCustomerListByCategory]", Gparam).Tables[0];
    }
    public virtual DataTable GetCustomerListForDrp()
    {

        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetCustomerListFroDrop]").Tables[0];
    }
    public virtual DataTable GetCustomerListAgent()
    {
        
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetCustomerListAgent]").Tables[0];
    }


    public virtual DataTable GetCustomerName(object CustomerID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CustomerID",CustomerID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetCustomerName]", Gparam).Tables[0];
    }
    public virtual DataTable CusNameAddressForCash(object CustomerID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CustomerID",CustomerID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CusNameAddressForCash", Gparam).Tables[0];
    }
}