using SQLHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CustomerCategory_DAL
/// </summary>
public class CustomerCategory_DAL
{
	public CustomerCategory_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public virtual int InsertUpdateCustomerCategory(CustomerCategory_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@CategoryID",BL.CustomerCategoryID)
                                    , new SqlParameter("@CategoryName",BL.CustomerCategory)                                   
                                   , new SqlParameter("@Date",BL.Date)   
                                   , new SqlParameter("@User",BL.User)  
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateCustomerCategory", param));
    }



    public virtual bool CheckCustomerategoryExist(string CategoryName)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CategoryName",CategoryName)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckCustomerCategoryExist", Gparam));
    }

    public virtual DataTable GetCustomerCategoryList(object CategoryItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CategoryID",CategoryItemID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetCustomerCategoryList", Gparam).Tables[0];
    }
    public virtual bool CheckExistAndDelete(int CategoryID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CategoryID",CategoryID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteCustomerCategory", Gparam));
    }
}