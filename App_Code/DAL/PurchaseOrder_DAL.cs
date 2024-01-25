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
public class PurchaseOrder_DAL
{
	public PurchaseOrder_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual int InsertUpdatePO(PurchaseOrder_BLL BL)
    {
        SqlParameter[] param = { new SqlParameter("@PONo",BL.PONo)
                                    , new SqlParameter("@PODate",BL.PODate)
                                    ,new SqlParameter("@Priority",BL.Priority)
                                     ,new SqlParameter("@VendorID",BL.VendorID)
                                      ,new SqlParameter("@Description",BL.Description)     
                                       ,new SqlParameter("@BranchID",BL.BranchID)     
                                        ,new SqlParameter("@ItemID",BL.ItemID)     
                                         ,new SqlParameter("@Qty",BL.Qty)     
                                          ,new SqlParameter("@Price",BL.Price)     
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdatePO", param));
    }
    public virtual DataTable GetPOList(object POID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@POID",POID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetPOList", Gparam).Tables[0];
    }
    public virtual DataTable GetPOListbySearch(object PONo, object dtFrom, object dtTo, object Vendor, object Priority, object Description)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@PONo",PONo),
                                    new SqlParameter("@dtFrom",dtFrom),
                                    new SqlParameter("@dtTo",dtTo),
                                    new SqlParameter("@Vendor",Vendor),
                                    new SqlParameter("@Priority",Priority),
                                    new SqlParameter("@Description",Description)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetPOListbySearch", Gparam).Tables[0];
    }
    public virtual DataTable GetCompletePOList()
    {
       
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetCompletePOList").Tables[0];
    }
    public virtual DataTable CheckIsComplete(int PurchaseOrderDetailID)
    {
         SqlParameter[] Gparam = {
                                    new SqlParameter("@PurchaseOrderDetailID",PurchaseOrderDetailID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckIsComplete",Gparam).Tables[0];
    }
    public virtual DataTable GetReceivedPOList()
    {

        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetReceivedPOList").Tables[0];
    }
    public virtual DataTable GetStockInInquiryList()
    {

        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetStockInInquiryList]").Tables[0];
    }
    public virtual DataTable GetPOListByDate(DateTime Date, int PONo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Date",Date), new SqlParameter("@PONo",PONo)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetPOListByDate", Gparam).Tables[0];
    }
    public virtual int GetPONo()
    {
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetPONo"));
    }



    public virtual string DeletePurchaseOrder(int PurchaseOrderDetailID, int PurchaseOrderID,int UserID)
    {
        SqlParameter[] param = {new SqlParameter("@PurchaseOrderDetailID",PurchaseOrderDetailID)  ,new SqlParameter("@PurchaseOrderID",PurchaseOrderID),new SqlParameter("@User",UserID)
                                 
                               };
        return Convert.ToString(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DeletePurchaseOrder", param));
    }
    public virtual DataTable GetPOReceiveItemList(object POID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@POID",POID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetPOReceiveItemList", Gparam).Tables[0];
    }
    public virtual DataTable GetPOCompletedItemList(object POID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@POID",POID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetPOCompletedItemList", Gparam).Tables[0];
    }
    public virtual string UpdatePOStatus(int POID, int User)
    {
        SqlParameter[] param = {new SqlParameter("@POID",POID)  ,new SqlParameter("@User",User)
                               };
        return Convert.ToString(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_UpdatePOStatus", param));
    }


    public virtual DataTable GetReceivedPOListbySearch(object PONo, object ChallanNo, object dtFrom, object dtTo, object Branch, object Vendor, object Item, object stock, object Price)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@PONo",PONo),
                                     new SqlParameter("@ChallanNo",ChallanNo),
                                    new SqlParameter("@dtFrom",dtFrom),
                                    new SqlParameter("@dtTo",dtTo),
                                     new SqlParameter("@Branch",Branch),
                                    new SqlParameter("@Vendor",Vendor),
                                    new SqlParameter("@Item",Item),
                                    new SqlParameter("@stock",stock),
                                        new SqlParameter("@Price",Price)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetReceivedPOListbySearch", Gparam).Tables[0];
    }

    public virtual DataTable GetStockInInquiryListbySearch(object PONo, object ChallanNo, object dtFrom, object dtTo, object Branch, object Vendor, object Item, object stock, object Price)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@PONo",PONo),
                                     new SqlParameter("@ChallanNo",ChallanNo),
                                    new SqlParameter("@dtFrom",dtFrom),
                                    new SqlParameter("@dtTo",dtTo),
                                     new SqlParameter("@Branch",Branch),
                                    new SqlParameter("@Vendor",Vendor),
                                    new SqlParameter("@Item",Item),
                                    new SqlParameter("@stock",stock),
                                        new SqlParameter("@Price",Price)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetStockInInquiryListbySearch", Gparam).Tables[0];
    }

    public virtual DataTable GetCompletePOListbySearch(object PONo, object dtFrom, object dtTo, object Vendor, object Priority, object Description,object dtcomFrom,object dtcomTo,object completeBy)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@PONo",PONo),
                                    new SqlParameter("@dtFrom",dtFrom),
                                    new SqlParameter("@dtTo",dtTo),
                                    new SqlParameter("@Vendor",Vendor),
                                    new SqlParameter("@Priority",Priority),
                                    new SqlParameter("@Description",Description),
                                     new SqlParameter("@dtcomFrom",dtcomFrom),
                                    new SqlParameter("@dtcomTo",dtcomTo),
                                    new SqlParameter("@completeBy",completeBy)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetCompletePOListbySearch", Gparam).Tables[0];
    }
    public virtual string CheckPOStockExist(int POID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@POID",POID)
                               };
        return Convert.ToString(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckPOStockExist", Gparam));
    }
}