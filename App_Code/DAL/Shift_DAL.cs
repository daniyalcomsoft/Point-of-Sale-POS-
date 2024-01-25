using SQLHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ItemCategory_DAL
/// </summary>
public class Shift_DAL
{
	public Shift_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual int InsertUpdateShift(Shift_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@ShiftID",BL.ShiftID)
                                    , new SqlParameter("@Name",BL.Name)
                                     , new SqlParameter("@ShiftTimeFrom",BL.ShiftTimeFrom)
                                      , new SqlParameter("@ShiftTimeTo",BL.ShiftTimeTo)
                                   , new SqlParameter("@Date",BL.Date)   
                                   , new SqlParameter("@User",BL.User)
                                   ,new SqlParameter("@Active", BL.Active)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateShift", param));
    }
    
    public virtual bool CheckTableExist(string TableName)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@TableName",TableName)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckTableExist]", Gparam));
    }
    public virtual DataTable GetShiftList(object ShiftID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ShiftID",ShiftID)
                                     
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetShiftList", Gparam).Tables[0];
    }
    public virtual DataTable ShiftNameForCash(object ShiftID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ShiftID",ShiftID)

                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_ShiftNameForCash", Gparam).Tables[0];
    }
    public bool CheckandDeleteShift(int ShiftID)
    {
        SqlParameter[] Gparam =
        {
            new SqlParameter("@ShiftID", ShiftID)
        };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteShift", Gparam));

    }

}