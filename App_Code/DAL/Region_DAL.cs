using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SQLHelper;

/// <summary>
/// Summary description for Region_DAL
/// </summary>
public class Region_DAL
{
    public Region_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public virtual int InsertUpdateRegion(Region_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@RegionID",BL.RegionID)
                                    , new SqlParameter("@RegionName",BL.RegionName)                                   
                                     ,new SqlParameter("@Description",BL.Description)                                                                                                        
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateRegion", param));
    }



    public virtual bool CheckExistAndDelete(int RegionID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@RegionID",RegionID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteRegion", Gparam));
    }

    public virtual DataTable GetRegionList(object RegionID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@RegionID",RegionID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetRegionList", Gparam).Tables[0];
    }
    
}