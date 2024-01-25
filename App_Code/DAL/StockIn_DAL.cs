using SQLHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StockIn_DAL
/// </summary>
public class StockIn_DAL
{
	public StockIn_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public virtual bool CheckPurchaseExist(string ItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ItemID",ItemID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckPurchaseExist]", Gparam));
    }

    public virtual int InsertUpdateStockInTemp(StockIn_BLL BL)
    {
        SqlParameter[] param = {  new SqlParameter("@StockInTempID",BL.StockInTempID)
                                   ,new SqlParameter("@ChallanNo",BL.ChallanNo)
                                    ,new SqlParameter("@RefNo",BL.RefNo)
                                    , new SqlParameter("@ChallanDate",BL.ChallanDate)                                   
                                     ,new SqlParameter("@VendorID",BL.VendorID)
                                      ,new SqlParameter("@ItemID",BL.ItemID)                                      
                                         ,new SqlParameter("@Price",BL.Price)  
                                           ,new SqlParameter("@Stock",BL.Stock)  
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)
                                    
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateStockInTemp", param));
    }
    public virtual int InsertStockIn(StockIn_BLL BL)
    {
        SqlParameter[] param = {  new SqlParameter("@ChallanNo",BL.ChallanNo)  
                                   ,new SqlParameter("@PayAmount",BL.PayAmount)
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)
                                    
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertStockIn", param));
    }
    public virtual DataTable GetStockInList(object StockInID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@StockInID",StockInID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetStockInList", Gparam).Tables[0];
    }
    public virtual DataTable GetStockInListbySearch(object ChallanNo,object RefNo,object dtFrom, object dtTo, object Vendor, object AmountFrom, object AmountTo)
    {
        SqlParameter[] Gparam = {
                                    
                                     new SqlParameter("@ChallanNo",ChallanNo),
                                      new SqlParameter("@RefNo",RefNo),
                                    new SqlParameter("@dtFrom",dtFrom),
                                    new SqlParameter("@dtTo",dtTo),                                    
                                    new SqlParameter("@Vendor",Vendor),
                                    new SqlParameter("@AmountFrom",AmountFrom),
                                    new SqlParameter("@AmountTo",AmountTo)
                                        
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetStockInListbySearch", Gparam).Tables[0];
    }
    public virtual DataTable GetStockInListByDate(DateTime Date,string ChallanNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Date",Date),new SqlParameter("@ChallanNo",ChallanNo)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetStockInListByDate", Gparam).Tables[0];
    }

    public virtual DataTable GetItemInfoStockIn(int ItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ItemID",ItemID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemInfoStockIn", Gparam).Tables[0];
    }
   
    public virtual int DeleteStockInTemp(int StockInTempID)
    {
        SqlParameter[] param = {new SqlParameter("@StockInTempID",StockInTempID)  
                                
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DeleteStockInTemp", param));
    }
    public virtual DataTable ChallanExist(string ChallanNo, int VendorID)
    {
        SqlParameter[] Gparam = {
                                  new SqlParameter("@ChallanNo",ChallanNo),
                                  new SqlParameter("@VendorID",VendorID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_ChallanExist", Gparam).Tables[0];
    }

    public virtual DataTable GetStockInListByDatetemp(string ChallanNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ChallanNo",ChallanNo)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetStockInListByDateTemp", Gparam).Tables[0];
    }
    public virtual long getChallanNo()
    {
        return Convert.ToInt64(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_getChallanNo"));
    }
    public virtual DataTable GetStockInListTempByID(long StockInTempID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@StockInTempID",StockInTempID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetStockInTempByID", Gparam).Tables[0];
    }

    public virtual decimal getVendorBalance(int VendorID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@VendorID",VendorID)
                               };
        return Convert.ToDecimal(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_getVendorBalance", Gparam));
    }
    public virtual decimal getVendorBalanceForEdit(int VendorID,long ChallanNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@VendorID",VendorID),new SqlParameter("@ChallanNo",ChallanNo)
                               };
        return Convert.ToDecimal(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_getVendorBalanceforEdit", Gparam));
    }
    public virtual DataTable GetStockInListchallan(string ChallanNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ChallanNo",ChallanNo)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetStockInListChallan", Gparam).Tables[0];
    }

    public virtual bool CheckandDeletePurchase(int ChallanNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ChallanNo",ChallanNo)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeletePurchase", Gparam));
    }


    public virtual DataTable GetStockInInfoEdit(long ChallanNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ChallanNo",ChallanNo)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetStockInInfoEdit", Gparam).Tables[0];
    }

}