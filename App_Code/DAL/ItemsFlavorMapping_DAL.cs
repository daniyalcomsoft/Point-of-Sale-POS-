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
public class ItemsFlavorMapping_DAL
{
	public ItemsFlavorMapping_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual int InsertFlavorAgainstItems(ItemsFlavorMapping_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@ItemID",BL.ItemID)
                                    , new SqlParameter("@FlavorID",BL.FlavorID) 
                                    , new SqlParameter("@ShowOnlyItemsFlavor", BL.ShowOnlyItemsFlavor)                                                                     
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertFlavorAgainstItems", param));
    }

    public virtual DataTable GetFlavorAndItem(int ItemID)
    {
        SqlParameter[] Gparam = { new SqlParameter("@ItemID", ItemID)
                                
        };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetFlavorAndItem", Gparam).Tables[0];
    }

    public virtual bool DeleteFlavorOnItem(int ItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ItemID",ItemID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DeleteFlavorOnItem", Gparam));
    }

    public virtual DataTable GetFlavorsForSale(int ItemID)
    {
        SqlParameter[] Gparam = { new SqlParameter("@ItemID", ItemID)

        };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetFlavorsForSale", Gparam).Tables[0];
    }

    public virtual DataTable GetItemOrDeal (int ItemID)
    {
        SqlParameter[] Gparam = { new SqlParameter("@ItemID", ItemID) };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemORDeal", Gparam).Tables[0];
    }
    public virtual DataTable GetTempSalesFlavorListEdit(int UserID, int SalesTempID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UserID",UserID),
                                    new SqlParameter("@SalesTempID",SalesTempID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetTempSalesFlavorListEdit]", Gparam).Tables[0];
    }

}