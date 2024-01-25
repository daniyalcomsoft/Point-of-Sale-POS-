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
public class Riders_DAL
{
    public Riders_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public virtual bool CheckRiderExist(string PhoneNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@PhoneNo",PhoneNo)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckRiderExist", Gparam));
    }

    public virtual int InsertUpdateRiders(Riders_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@RiderID",BL.RiderID)                                  
                                    ,new SqlParameter("@Name",BL.Name)                                     
                                       ,new SqlParameter("@PhoneNo",BL.PhoneNo)
                                       ,new SqlParameter("@CNIC", BL.CNIC)
                                      ,new SqlParameter("@Address",BL.Address)                                      
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)  
                                       ,new SqlParameter("@Active", BL.Active)                                    
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateRiders", param));
    }
    

    public virtual DataTable GetRidersList(object RiderID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@RiderID",RiderID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetRidersList", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchRidersList(object Rider, object Phone)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Rider",Rider),
                                    new SqlParameter("@Phone",Phone)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSearchRidersList", Gparam).Tables[0];
    }

    public virtual DataTable GetDeliveryList()
    {
      
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetDeliveryList").Tables[0];
    }
    public virtual bool CheckandDeleteRiders(int RiderID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@RiderID",RiderID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteRiders", Gparam));
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
    public virtual DataTable RiderNameForCash(object RiderID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@RiderID",RiderID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_RiderNameForCash", Gparam).Tables[0];
    }
}