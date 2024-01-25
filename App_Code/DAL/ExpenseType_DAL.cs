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
public class ExpenseType_DAL
{
	public ExpenseType_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public virtual int InsertUpdateExpensetype(ExpenseType_BLL BL)
    {

        SqlParameter[] param = {new SqlParameter("@ExpenseTypeID",BL.ExpenseTypeID)
                                    
                                    ,new SqlParameter("@ExpenseType",BL.ExpenseType)
                                     
                                      ,new SqlParameter("@userid",BL.CreatedBy)

                                      ,new SqlParameter("@date",BL.CreatedDate)
                                      
                               };

        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_InsertUpdateExpenseType", param));
    }

    public virtual bool DeleteExpensetype(int ExpenseTypeID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ExpenseTypeID",ExpenseTypeID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_DeleteExpenseType", Gparam));
    }
    public virtual DataTable GettblExpensetypeByExpensetype(string Expensetype)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ExpenseType",Expensetype)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetEexpensetypebyid", Gparam).Tables[0];
    }

    public virtual DataTable GetExpensetypeList(object ExpensetypeID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ExpenseTypeID",ExpensetypeID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetexpensetypeList", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchexpensetypeList(object ExpenseType)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ExpenseType",ExpenseType)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetSearchexpensetypeList", Gparam).Tables[0];
    }
    public virtual DataTable GetexpensetypeCatgoryList(object ExpenseTypeID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ExpenseTypeID",ExpenseTypeID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetexpensetypeCatgoryList", Gparam).Tables[0];
    }
    public virtual bool CheckExpenseTypeExist(string ExpenseType)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ExpenseType",ExpenseType)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckExpenseTypeExist]", Gparam));
    }
    public virtual bool CheckandDeleteExpenseType(int ExpenseTypeID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ExpenseTypeID",ExpenseTypeID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteExpenseType", Gparam));
    }
}