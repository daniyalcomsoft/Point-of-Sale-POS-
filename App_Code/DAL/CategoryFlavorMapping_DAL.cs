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
public class CategoryFlavorMapping_DAL
{
	public CategoryFlavorMapping_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual int InsertFlavorAgainstCategory(CategoryFlavorMapping_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@CategoryID",BL.CategoryID)
                                    , new SqlParameter("@FlavorID",BL.FlavorID)                                                                      
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertFlavorAgainstCategory", param));
    }

    public virtual DataTable GetFlavorAndCategory(int CategoryID)
    {
        SqlParameter[] Gparam = { new SqlParameter("@CategoryID", CategoryID)
                                
        };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetFlavorAndCategory", Gparam).Tables[0];
    }

    public virtual bool DeleteFlavorOnCategory(int CategoryID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CategoryID",CategoryID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DeleteFlavorOnCategory", Gparam));
    }

    public virtual DataTable GetFlavorsForSale(int ItemID)
    {
        SqlParameter[] Gparam = { new SqlParameter("@ItemID", ItemID)
        };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetFlavorsForSale", Gparam).Tables[0];
    }
    public virtual DataTable GetFlavorsForSaleEdit(int ItemID, int SalesTempID,int UserID)
    {
        SqlParameter[] Gparam = { new SqlParameter("@ItemID", ItemID)
                 , new SqlParameter("@SalesTempID",SalesTempID)
                 , new SqlParameter("@UserID",UserID)
        };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetFlavorsForSaleEdit", Gparam).Tables[0];
    }
    public virtual DataTable GetFlavorsForSaleEditDining(int ItemID, int SalesID)
    {
        SqlParameter[] Gparam = { new SqlParameter("@ItemID", ItemID)
                 , new SqlParameter("@SalesID",SalesID)
        };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetFlavorsForSaleEditDining", Gparam).Tables[0];
    }

}