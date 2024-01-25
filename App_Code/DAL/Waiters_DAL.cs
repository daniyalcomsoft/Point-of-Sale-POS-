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
public class Waiters_DAL
{
    public Waiters_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public virtual bool CheckWaiterExist(string PhoneNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@PhoneNo",PhoneNo)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckWaiterExist", Gparam));
    }

    public virtual int InsertUpdateWaiters(Waiters_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@WaiterID",BL.WaiterID)
                                    ,new SqlParameter("@Name",BL.Name)
                                       ,new SqlParameter("@PhoneNo",BL.PhoneNo)
                                       ,new SqlParameter("@CNIC", BL.CNIC)
                                      ,new SqlParameter("@Address",BL.Address)
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)
                                       ,new SqlParameter("@Active", BL.Active )
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateWaiters", param));
    }
    
    public virtual DataTable GetWaiterList(object WaiterID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@WaiterID",WaiterID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetWaiterList", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchWaiterList(object Waiter, object Phone)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Waiter",Waiter),
                                    new SqlParameter("@Phone",Phone)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSearchWaiterList", Gparam).Tables[0];
    }
    public virtual bool CheckandDeleteWaiters(int WaiterID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@WaiterID",WaiterID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteWaiters", Gparam));
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
    public virtual DataTable WaiterNameForCash(object WaiterID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@WaiterID",WaiterID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_WaiterNameForCash", Gparam).Tables[0];
    }
}