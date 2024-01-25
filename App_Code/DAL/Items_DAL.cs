using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SQLHelper;

/// <summary>
/// Summary description for Vendor_DAL
/// </summary>
public class Items_DAL
{
    public Items_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    
    public virtual int InsertUpdateItems(Items_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@ItemID",BL.ItemID)                                                               
                                    ,new SqlParameter("@Name",BL.Name)                                                                      
                                       ,new SqlParameter("@Active",BL.Active)                                                                            
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)
                                       ,new SqlParameter("@PurchaseRate",BL.PurchaseRate)
                                       ,new SqlParameter("@SaleRate",BL.SaleRate)
                                       ,new SqlParameter("@CounterID",BL.CounterID)
                                       ,new SqlParameter("@CategoryID",BL.CategoryID)
                                        //,new SqlParameter("@CompanyID",BL.CompanyID)
                                        ,new SqlParameter("@PicName", BL.PicName)
                                        ,new SqlParameter("@PicGuid", BL.PicGuid)
                                        ,new SqlParameter("@PicPath", BL.PicPath)
                                        ,new SqlParameter("@Sort", BL.Sort)
                                        ,new SqlParameter("@Type", BL.Type)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateItems", param));
    }
    

    public virtual bool CheckItemExist(string Name)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Name",Name)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckItemExist]", Gparam));
    }
    public virtual bool CheckExistAndDelete(int ItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ItemID",ItemID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteItem", Gparam));
    }
    public virtual DataTable GetSearchItemList(object Item, object Counter, object Category)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Item",Item),
                                     new SqlParameter("@Counter",Counter),
                                      new SqlParameter("@Category",Category)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSearchItemList", Gparam).Tables[0];
    }
    public virtual DataTable GetItemList(object ItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ItemID",ItemID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemList", Gparam).Tables[0];
    }
    public virtual DataTable GetItemListReport(object Item)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Item",Item)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemListReport", Gparam).Tables[0];
    }
    public virtual DataTable GetSItemList(object ItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ItemID",ItemID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSItemList", Gparam).Tables[0];
    }
    public virtual DataTable GetActiveItemList(object q)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@serchq",q)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetActiveItemList", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchActiveItemList(object q)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@serchq",q)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSearchActiveItemList", Gparam).Tables[0];
    }
    public virtual DataTable GetJustItem()
    {
        SqlParameter[] Gparam = {
                                    
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetJustItem", Gparam).Tables[0];
    }

    public virtual decimal GetSaleRates(object Item)
    {
        SqlParameter[] param = {
                                    new SqlParameter("@Item",Item)
                               };
        return Convert.ToDecimal(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSaleRates", param));
    }


    public virtual DataTable GetItembyCategory(object CategoryId)
    {

        SqlParameter[] Gparam = {
                                    new SqlParameter("@CategoryID",CategoryId)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemsByCategory", Gparam).Tables[0];

    }


    public virtual DataTable GetDealName(object ItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ItemID",ItemID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetDealName", Gparam).Tables[0];
    }

    public virtual DataTable ItemNameForCash(object ItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ItemID",ItemID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_ItemNameForCash", Gparam).Tables[0];
    }
    public virtual DataTable GetItemlistByCategory(object CategoryID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CategoryID",CategoryID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "sp_GetItemlistByCategory", Gparam).Tables[0];
    }
}