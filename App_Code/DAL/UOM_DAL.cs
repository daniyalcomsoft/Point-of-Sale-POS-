using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using SQLHelper;
using System.Data.SqlClient;

/// <summary>
/// Summary description for UOM_DAL
/// </summary>
public class UOM_DAL
{
    public UOM_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual DataTable GetUOM(object UOMID)
    {
        SqlParameter[] param = {
                                    new SqlParameter("@UOMID",UOMID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetUOM", param).Tables[0];
    }
    public virtual bool CheckUOMExist(string Vendor)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UOM",Vendor)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckUOMExist]", Gparam));
    }
    public virtual int InsertUpdateUOM(int UOMID, string UOM,  DateTime Date, int UserID)
    {
        SqlParameter[] param = {new SqlParameter("@UOMID",UOMID)
                                    ,new SqlParameter("@UOM",UOM)                                    
                                      ,new SqlParameter("@Date",Date)
                                       ,new SqlParameter("@User",UserID)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateUOM", param));
    }

    public virtual bool CheckUOMAndDelete(int UOMID)
    {
        SqlParameter[] param = {new SqlParameter("@UOMID",UOMID)                                  
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckUOMAndDelete", param));
    }

}