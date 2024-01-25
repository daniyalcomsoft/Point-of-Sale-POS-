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
public class StockOut_DAL
{
    public StockOut_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
    }
    public virtual bool CheckSaleExist(string ItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ItemID",ItemID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckSaleExist]", Gparam));
    }

    public virtual int InsertUpdateStockOutTemp(StockOut_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@StockOutTempID",BL.StockOutTempID)  
                                   ,new SqlParameter("@StockOutNo",BL.StockOutNo)                                                                                              
                                      ,new SqlParameter("@StockOutDate",BL.StockOutDate)  
                                      //,new SqlParameter("@CustomerID",BL.CustomerID)
                                       ,new SqlParameter("@ItemID",BL.ItemID)
                                        ,new SqlParameter("@Rate",BL.Rate)
                                         ,new SqlParameter("@Stock",BL.Stock)
                                          ,new SqlParameter("@Date",BL.Date)
                                           ,new SqlParameter("@User",BL.User)
                                           ,new SqlParameter("@PurchasePrice",BL.PurchasePrice)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_InsertUpdateStockOutTemp]", param));
    }

    public virtual DataTable GetStockOutList(object StockOutID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@StockOutID",StockOutID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetStockOutList", Gparam).Tables[0];
    }
    public virtual DataTable GetStockOutTempListByDate(long STONo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@STONo",STONo)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetStockOutTempListByDate]", Gparam).Tables[0];
    }

    public virtual DataTable GetItemInfoStockOut(int ItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ItemID",ItemID),
                                     //new SqlParameter("@CustomerID",CustomerID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemInfoStockOut", Gparam).Tables[0];
    }
    public virtual DataTable STOGetStockInInfo(int ItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ItemID",ItemID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_STOGetStockInInfo", Gparam).Tables[0];
    }

    public virtual int DeleteStockOutTemp(long StockOutID)
    {
        SqlParameter[] param = {new SqlParameter("@StockOutID",StockOutID)};
   
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DeleteStockOutTemp", param));
    }
    public virtual DataTable GetStockOutListbySearch(object STONo, object dtFrom, object dtTo, object Cus, object AmountFrom, object AmountTo, object Status)
    {
        SqlParameter[] Gparam = {
                                    
                                     new SqlParameter("@STONo",STONo),
                                    new SqlParameter("@dtFrom",dtFrom),
                                    new SqlParameter("@dtTo",dtTo),                                
                                      new SqlParameter("@Customer",Cus),
                                    new SqlParameter("@AmountFrom",AmountFrom),
                                        new SqlParameter("@AmountTo",AmountTo),
                                          new SqlParameter("@Status",Status)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetStockOutListbySearch", Gparam).Tables[0];
    }
    public virtual long getStockOutNo()
    {
        return Convert.ToInt64(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_getStockOutNo"));
    }

    public virtual DataTable GetStockOutListStono(string STONo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@STONo",STONo)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetStockOutStoNo", Gparam).Tables[0];
    }

    public virtual DataTable GetStockOutTempByID(long StockOutTempID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@StockOutTempID",StockOutTempID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetStockOutTempByID]", Gparam).Tables[0];
    }
    public virtual decimal getCustomerBalance(int CustomerID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CustomerID",CustomerID)
                               };
        return Convert.ToDecimal(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_getCustomerBalance", Gparam));
    }
    public virtual decimal getCustomerBalanceEdit(int CustomerID, int InvoiceNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CustomerID",CustomerID), new SqlParameter("@InvoiceNo",InvoiceNo)
                               };
        return Convert.ToDecimal(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_getCustomerBalanceEdit", Gparam));
    }
    public virtual int InsertStockOut(StockOut_BLL BL)
    {
        SqlParameter[] param = {  new SqlParameter("@StockOutNo",BL.StockOutNo)  
                                   ,new SqlParameter("@PayAmount",BL.PayAmount)
                                    //,new SqlParameter("@Transportation",BL.Transportation)
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)
                                        //,new SqlParameter("@ReferenceBy",BL.ReferenceBy == 0 ? null : BL.ReferenceBy)
                                        //,new SqlParameter("@IsPaid",BL.IsPaid)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertStockOut", param));
    }
    public virtual bool CheckandDeleteSale(int STONo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@STONo",STONo)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteSale", Gparam));
    }

    public virtual int UpdateInvoiceStatus(long STONo)
    {
        SqlParameter[] param = {new SqlParameter("@STONo",STONo)  
                                  
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_UpdateInvoiceStatus]", param));
    }
    public virtual DataTable GetStockOutInfoEdit(long STONo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@STONo",STONo)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetStockOutInfoEdit", Gparam).Tables[0];
    }

    public virtual int UpdateSTOReturnQty(long StockOutID,decimal ReturnQty)
    {
        SqlParameter[] param = {new SqlParameter("@StockOutID",StockOutID)  ,new SqlParameter("@ReturnQty",ReturnQty)
                                  
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_UpdateSTOReturnQty]", param));
    }
    public virtual int UpdateSTOReturnPayment(long InvoiceNo, decimal ReturnAmount)
    {
        SqlParameter[] param = {new SqlParameter("@InvoiceNo",InvoiceNo)  ,new SqlParameter("@ReturnAmount",ReturnAmount)
                                  
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_UpdateSTOReturnPayment]", param));
    }
    public virtual int getCustomerRef(int CustomerID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@CustomerID",CustomerID)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_getCustomerRef", Gparam));
    }
}