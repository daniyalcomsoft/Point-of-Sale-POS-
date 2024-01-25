using SQLHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CompanyInfo_DAL
/// </summary>
public class CompanyInfo_DAL
{
    public CompanyInfo_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual int InsertUpdateCompanyInfo(CompanyInfo_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@CompanyID",BL.CompanyID)
                                    , new SqlParameter("@Company",BL.Company)                                   
                                   , new SqlParameter("@Date",BL.Date)   
                                   , new SqlParameter("@User",BL.User)  
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_InsertUpdateCompanyInfo]", param));
    }



    public virtual bool CheckCompanyInfoExist(string Company)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Company",Company)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckCompanyInfoExist]", Gparam));
    }

    public virtual DataTable GetCompanyInfoList(object CompanyID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CompanyID",CompanyID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetCompanyInfoList]", Gparam).Tables[0];
    }
    public virtual bool CheckExistAndDelete(int CompanyID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CompanyID",CompanyID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckandDeleteCompanyInfo]", Gparam));
    }

}