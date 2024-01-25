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
public class SalesItemFlavorTemp_DAL
{
	public SalesItemFlavorTemp_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual int InsertSalesItemFlavorTemp(SalesItemFlavorTemp_BLL SIFT)
    {
        SqlParameter[] param = {
                                      new SqlParameter("@SalesTempID", SIFT.SalesTempID)
                                    , new SqlParameter("@ItemID", SIFT.ItemID)
                                    , new SqlParameter("@FlavorID", SIFT.FlavorID) 
                                    , new SqlParameter("@Quantity", SIFT.Quantity)
                                    , new SqlParameter("@UserID", SIFT.UserID)
                                                                                                         
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "Sp_InsertSalesItemFlavorTemp", param));
    }

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