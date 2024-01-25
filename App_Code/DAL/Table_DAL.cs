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
public class Table_DAL
{
	public Table_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual int InsertUpdateTable(Table_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@TableID",BL.TableID)
                                    , new SqlParameter("@TableName",BL.TableName)                                   
                                   , new SqlParameter("@Date",BL.Date)   
                                   , new SqlParameter("@User",BL.User)                                    
                                   ,new SqlParameter("@Sort", BL.Sort)
                                   ,new SqlParameter("@Active", BL.Active)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateTable", param));
    }
    
    public virtual bool CheckTableExist(string TableName)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@TableName",TableName)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckTableExist]", Gparam));
    }

    public virtual DataTable GetTableListForDinein(object TableID,int UserID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@TableID",TableID),
                                      new SqlParameter("@UserID",UserID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetTableListForDinein", Gparam).Tables[0];
    }
    public virtual DataTable GetTableList(object TableID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@TableID",TableID)
                                     
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetTableList", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchTableList(object Table)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Table",Table)

                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSearchTableList", Gparam).Tables[0];
    }
    public virtual DataTable GetCategoryItems(object ItemCategoryID)
    {
        SqlParameter[] Gparam = { new SqlParameter("@CategoryID", ItemCategoryID) };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_getitemcategory", Gparam).Tables[0];
    }

    public bool CheckandDeleteTable(int TableID)
    {
        SqlParameter[] Gparam =
        {
            new SqlParameter("@TableID", TableID)
        };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteTable", Gparam));

    }

}