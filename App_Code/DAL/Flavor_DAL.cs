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
public class Flavor_DAL
{
	public Flavor_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual int InsertUpdateFlavor(Flavor_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@FlavorID",BL.FlavorID)
                                    , new SqlParameter("@FlavorName",BL.FlavorName)                                   
                                   , new SqlParameter("@Date",BL.Date)   
                                   , new SqlParameter("@User",BL.User)                                    
                                   ,new SqlParameter("@Sort", BL.Sort)
                                   ,new SqlParameter("@Active", BL.Active)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateFlavor", param));
    }
    
    public virtual bool CheckFlavorExist(string FlavorName)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@FlavorName",FlavorName)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckFlavorExist", Gparam));
    }

    public virtual DataTable GetFlavorList(object FlavorID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@FlavorID",FlavorID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetFlavorList", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchFlavorList(object Flavor)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Flavor",Flavor)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSearchFlavorList", Gparam).Tables[0];
    }

    //public virtual DataTable GetCategoryItems(object ItemCategoryID)
    //{
    //    SqlParameter[] Gparam = { new SqlParameter("@CategoryID", ItemCategoryID) };
    //    return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_getitemcategory", Gparam).Tables[0];
    //}

    public bool CheckandDeleteFlavor(int FlavorID)
    {
        SqlParameter[] Gparam =
        {
            new SqlParameter("@FlavorID", FlavorID)
        };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteFlavor", Gparam));

    }

}