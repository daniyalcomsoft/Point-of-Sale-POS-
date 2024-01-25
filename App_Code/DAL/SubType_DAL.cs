using SQLHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for tblExpenseType_DAL
/// </summary>
public class SubType_DAL
{
	public SubType_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public virtual int InsertUpdateSubType(SubType_BLL BL)
    {

        SqlParameter[] param = {new SqlParameter("@SubTypeID",BL.SubTypeID)

                                    ,new SqlParameter("@ExpenseTypeID",BL.ExpenseTypeID)

                                    ,new SqlParameter("@SubType",BL.SubType)
                                     
                                      ,new SqlParameter("@userid",BL.CreatedBy)

                                      ,new SqlParameter("@date",BL.CreatedDate)
                                      
                               };

        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_InsertUpdateSubType", param));
    }

    public virtual bool DeleteSubType(int SubTypeID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SubTypeID",SubTypeID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_DeleteSubType", Gparam));
    }
    public virtual DataTable GetSubTypeIDtypebyid(string SubTypeID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SubTypeID",SubTypeID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetSubTypeIDtypebyid", Gparam).Tables[0];
    }

    public virtual DataTable GetSubtypeList(object SubTypeID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SubTypeID",SubTypeID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetSubtypeList", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchSubtypeList(object ExpenseType, object SubType)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ExpenseType",ExpenseType),
                                    new SqlParameter("@SubType",SubType)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetSearchSubtypeList", Gparam).Tables[0];
    }
    public virtual DataTable GetSubTypeCatgoryList(object ExpTypeID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ExpTypeID",ExpTypeID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetSubTypeCatgoryList", Gparam).Tables[0];
    }
    public virtual bool CheckandDeleteSubType(int SubTypeID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SubTypeID",SubTypeID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteSubType", Gparam));
    }
}