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
public class ItemCategory_DAL
{
	public ItemCategory_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual int InsertUpdateItemsCategory(ItemCategory_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@CategoryID",BL.ItemCategoryID)
                                    , new SqlParameter("@CategoryName",BL.ItemCategory)                                   
                                   , new SqlParameter("@Date",BL.Date)   
                                   , new SqlParameter("@User",BL.User)  
                                   ,new SqlParameter("@PicName", BL.PicName)
                                   ,new SqlParameter("@PicGuid", BL.PicGuid)
                                   ,new SqlParameter("@PicPath", BL.PicPath)
                                   ,new SqlParameter("@Sort", BL.Sort)
                                   ,new SqlParameter("@Active", BL.Active)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateItemCategory", param));
    }
    
    public virtual bool CheckItemCategoryExist(string CategoryName)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CategoryName",CategoryName)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckItemCategoryExist", Gparam));
    }

    public virtual DataTable GetItemCategoryList(object CategoryItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CategoryID",CategoryItemID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemCategoryList", Gparam).Tables[0];
    }
    public virtual DataTable GetItemCategoryListForReport(object Category)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Category",Category)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemCategoryListForReport", Gparam).Tables[0];
    }
    public virtual DataTable GetSaleItemCategoryList(object Category)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Category",Category)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSaleItemCategoryList", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchItemCategoryList(object Category)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Category",Category)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSearchItemCategoryList", Gparam).Tables[0];
    }

    public virtual DataTable GetCategoryItems(object ItemCategoryID)
    {
        SqlParameter[] Gparam = { new SqlParameter("@CategoryID", ItemCategoryID) };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_getitemcategory", Gparam).Tables[0];
    }

    public virtual bool CheckExistAndDelete(int CategoryId)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CategoryID",CategoryId)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteItemCategory", Gparam));
    }

    public virtual DataTable CategoryNameForCash(object CategoryID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CategoryID",CategoryID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CategoryNameForCash", Gparam).Tables[0];
    }

}