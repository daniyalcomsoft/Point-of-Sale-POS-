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
public class SalesItemFlavor_DAL
{
	public SalesItemFlavor_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual int InsertSalesItemFlavor(SalesItemFlavor_BLL SIF)
    {
        SqlParameter[] param = {
                                      new SqlParameter("@SalesID", SIF.SalesID)
                                    , new SqlParameter("@ItemID", SIF.ItemID)
                                    , new SqlParameter("@FlavorID", SIF.FlavorID) 
                                    , new SqlParameter("@Quantity", SIF.Quantity)
                                    , new SqlParameter("@UserID", SIF.UserID)
                                                                                                         
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "Sp_InsertSalesItemFlavor", param));
    }

    //public virtual bool SalesFlavorDelete(int SalesID, int UserID)
    //{
    //    SqlParameter[] Gparam = {
    //                                  new SqlParameter("@SalesID",SalesID)
    //                                 , new SqlParameter("@UserID", UserID)
    //                           };
    //    return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_SalesFlavorDelete", Gparam));
    //}





    //public virtual DataTable GetFlavorAndItem(int ItemID)
    //{
    //    SqlParameter[] Gparam = { new SqlParameter("@ItemID", ItemID)

    //    };
    //    return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetFlavorAndItem", Gparam).Tables[0];
    //}

    //public virtual bool DeleteFlavorOnItem(int ItemID)
    //{
    //    SqlParameter[] Gparam = {
    //                                new SqlParameter("@ItemID",ItemID)
    //                           };
    //    return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DeleteFlavorOnItem", Gparam));
    //}

    //public virtual DataTable GetFlavorsForSale(int ItemID)
    //{
    //    SqlParameter[] Gparam = { new SqlParameter("@ItemID", ItemID)

    //    };
    //    return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetFlavorsForSale", Gparam).Tables[0];
    //}

    //public virtual DataTable GetItemOrDeal (int ItemID)
    //{
    //    SqlParameter[] Gparam = { new SqlParameter("@ItemID", ItemID) };
    //    return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemORDeal", Gparam).Tables[0];
    //}

}