using SQLHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Expense
/// </summary>
public class Expense_DAL
{
    public Expense_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual int InsertUpdateExpense(Expense_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@ExpenseID",BL.ExpenseID)
                                    
                                    ,new SqlParameter("@ExpenseTypeID",BL.ExpenseTypeID)

                                    ,new SqlParameter("@SubTypeID",BL.SubTypeID)

                                      ,new SqlParameter("@Discription",BL.Discription)

                                      ,new SqlParameter("@Amount",BL.Amount)

                                      ,new SqlParameter("@ExpenseDate",BL.ExpenseDate)

                                       ,new SqlParameter("@userid",BL.CreatedBy)

                                      ,new SqlParameter("@date",BL.CreatedDate)
                                      
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_InsertUpdateExpense", param));
    }



    public virtual bool DeleteCompany(int ExpenseID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ExpenseID",ExpenseID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_DeleteExpense", Gparam));
    }
    public virtual DataTable GettblExpenseByDiscription(string Discription)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Discription",Discription)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_Getexpensebyid", Gparam).Tables[0];
    }

    public virtual DataTable GetExpenseList(object ExpenseID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ExpenseID",ExpenseID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetExpenseList", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchExpenseList(object ExpenseType, object SubType, object ExpenseDate)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ExpenseType",ExpenseType),
                                    new SqlParameter("@SubType",SubType),
                                    new SqlParameter("@ExpenseDate",ExpenseDate)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetSearchExpenseList", Gparam).Tables[0];
    }

    public virtual DataTable GetExpenseListReport(string Datefrom,string Dateto, int? ExpenseTypeID, int? SubTypeID)
    {

        DateTime? FD = null;

        DateTime? TD = null;
        if (Datefrom != string.Empty)
        {
            FD = Convert.ToDateTime(Datefrom);
        }
        if (Dateto != string.Empty)
        {
            TD = Convert.ToDateTime(Dateto);
        }

        SqlParameter[] Gparam = {
                                   new SqlParameter("@Datefrom",FD)
                                   ,new SqlParameter("@Dateto",TD)
                                   ,new SqlParameter("@ExpenseTypeID",ExpenseTypeID==0?null:ExpenseTypeID)
                                   ,new SqlParameter("@SubTypeID",SubTypeID==0?null:SubTypeID) 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetExpenseListReport", Gparam).Tables[0];
    }
}