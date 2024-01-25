using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SQLHelper;

/// <summary>
/// Summary description for City_DAL
/// </summary>
public class City_DAL
{
    public City_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    
    public virtual int InsertUpdateCity(City_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@CityID",BL.CityID)
                                    , new SqlParameter("@CityName",BL.CityName)                                   
                                     ,new SqlParameter("@Description",BL.Description)                                                                                                        
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateCity", param));
    }



    public virtual bool CheckExistAndDelete(int CityID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CityID",CityID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteCity", Gparam));
    }

    public virtual DataTable GetCityList(object CityID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CityID",CityID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetCityList", Gparam).Tables[0];
    }
    
}