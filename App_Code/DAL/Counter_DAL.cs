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
public class Counter_DAL
{
	public Counter_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public virtual int InsertUpdateCounter(Counter_BLL BL)
    {

        SqlParameter[] param = {new SqlParameter("@CounterID",BL.CounterID)
                                    
                                    ,new SqlParameter("@CounterName",BL.CounterName)

                                    ,new SqlParameter("@Description",BL.Description)

                                      ,new SqlParameter("@Date",BL.Date)

                                      ,new SqlParameter("@User",BL.User)
                                      
                               };

        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateCounter", param));
    }

    public virtual bool DeleteCounter(int CounterID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CounterID",CounterID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_DeleteCounter", Gparam));
    }

    public virtual DataTable GetCounterList(object CounterID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CounterID",CounterID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetCounterList", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchCounterList(object Counter)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Counter",Counter)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetSearchCounterList", Gparam).Tables[0];
    }
    public virtual DataTable CounterNameForCash(object CounterID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CounterID",CounterID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CounterNameForCash", Gparam).Tables[0];
    }
}