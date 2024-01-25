using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SQLHelper;

/// <summary>
/// Summary description for PriceList_DAL
/// </summary>
public class PriceList_DAL
{
    public PriceList_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    
    public virtual int InsertUpdatePrice(PriceList_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@PriceID",BL.PriceID)
                                    , new SqlParameter("@ItemID",BL.ItemID)
                                    , new SqlParameter("@Price",BL.PurchasePrice)
                                      , new SqlParameter("@SalePrice",BL.SalePrice)
                                    ,new SqlParameter("@PriceDate",BL.PriceDate)                                                                                                              
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdatePriceList", param));
    }



    public virtual int PriceDelete(int PriceID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@PriceID",PriceID)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DeletePrice", Gparam));
    }

    public virtual DataTable GetPriceList(object PriceID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@PriceID",PriceID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetPriceList", Gparam).Tables[0];
    }
    
}