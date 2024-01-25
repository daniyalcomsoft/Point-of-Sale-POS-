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
public class Sales_DAL
{
    public Sales_DAL()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public virtual int InsertUpdateSales(Sales_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@SalesId", BL.SalesID)
                ,new SqlParameter("@ItemID", BL.ItemID)
                ,new SqlParameter("@SalesRate", BL.SalesRate)
                ,new SqlParameter("@Quantity", BL.Quantity)
                ,new SqlParameter("@Total", BL.Total)
                ,new SqlParameter("@Disount", BL.Discount)
                ,new SqlParameter("@User", BL.User)
                ,new SqlParameter("@Date", BL.Date)


                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateSales", param));
    }

    public virtual int InsertUpdateSalestemp(Sales_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@SalesTempID", BL.SalesTempID)
                 ,new SqlParameter("@UserID", BL.User)
                ,new SqlParameter("@ItemID", BL.ItemID)
                ,new SqlParameter("@Quantity", BL.Quantity)
                ,new SqlParameter("@FlavorID", BL.FlavorID)
        };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateSalestemp", param));
    }

    public virtual DataTable InsertUpdateTable_Delivery_Sales(Sales_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@SaleID", BL.SalesID)
                ,new SqlParameter("@ItemID", BL.ItemID)
                ,new SqlParameter("@Quantity", BL.Quantity)
                     ,new SqlParameter("@Discount", BL.Discount)
                 ,new SqlParameter("@UserID", BL.User)
                 ,new SqlParameter("@SaleNo", BL.SaleNo)
                       ,new SqlParameter("@CashReceived", BL.CashReceived)
                ,new SqlParameter("@TableID", BL.TableID)
                   ,new SqlParameter("@WaiterID", BL.WaiterID)
                         ,new SqlParameter("@IsPrint", BL.IsPrint)
                         ,new SqlParameter("@FlavorID", BL.FlavorID)
                          ,new SqlParameter("@ShiftID", BL.ShiftID)
                         ,new SqlParameter("@CustomerID", BL.CustomerID)
                          ,new SqlParameter("@TaxPercentage", BL.TaxPercentage)
                  ,new SqlParameter("@TaxName", BL.TaxName)
        };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_InsertUpdateTable_Delivery_Sales]", param).Tables[0];
    }

    public virtual int InsertFinalSales(Sales_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@UserID", BL.User)
                 ,new SqlParameter("@Discount", BL.Discount)
                 ,new SqlParameter("@CashReceived", BL.CashReceived)
                 ,new SqlParameter("@DeliveryCharges", BL.DeliveryCharges)
                 ,new SqlParameter("@RiderID", BL.RiderID)
                  ,new SqlParameter("@IsPaid", BL.IsPaid)
                  ,new SqlParameter("@PaidBy", BL.PaidBy)
                  ,new SqlParameter("@PaidDate", BL.PaidDate)
                  ,new SqlParameter("@ShiftID", BL.ShiftID)
                  //,new SqlParameter("@CounterID", BL.CounterID)
                  ,new SqlParameter("@CustomerID", BL.CustomerID)
                  ,new SqlParameter("@TaxPercentage", BL.TaxPercentage)
                  ,new SqlParameter("@TaxName", BL.TaxName)
                  ,new SqlParameter("@FlavorID", BL.FlavorID)
                  ,new SqlParameter("@Address", BL.Address)


        };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertFinalSales", param));
    }

    public virtual int UpdateDiscountReceived(Sales_BLL BL)
    {
        SqlParameter[] param = {
                    new SqlParameter("@TableID", BL.TableID)
                   ,new SqlParameter("@Discount", BL.Discount)
                   ,new SqlParameter("@ReceivedAmount", BL.ReceivedAmount)

        };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_UpdateDiscountReceived", param));
    }
    public virtual int UpdateDiscountReceivedDelivery(Sales_BLL BL)
    {
        SqlParameter[] param = {
                    new SqlParameter("@SaleNo", BL.SaleNo)
                   ,new SqlParameter("@Discount", BL.Discount)
                   ,new SqlParameter("@ReceivedAmount", BL.ReceivedAmount)

        };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_UpdateDiscountReceivedDelivery", param));
    }

    public virtual int UpdateWaiter(Sales_BLL BL)
    {
        SqlParameter[] param = {
                    new SqlParameter("@TableID", BL.TableID)
                    ,new SqlParameter("@WaiterID", BL.WaiterID)
        };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_UpdateWaiter", param));
    }
    public virtual int UpdateRider(Sales_BLL BL)
    {
        SqlParameter[] param = {
                    new SqlParameter("@SaleNo", BL.SaleNo)
                    ,new SqlParameter("@RiderID", BL.RiderID)
        };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_UpdateRider", param));
    }
    public int FinalPayment(Sales_BLL BL)
    {
        SqlParameter[] param =
        {
            new SqlParameter("@TableID", BL.TableID),
            new SqlParameter("@PaidBy", BL.PaidBy),
            new SqlParameter("@PaidDate", BL.PaidDate)
        };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_FinalPayment", param));
    }

    public int FinalPaymentDelivery(Sales_BLL BL)
    {
        SqlParameter[] param =
        {
           new SqlParameter("@SaleNo", BL.SaleNo)
        };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_FinalPaymentDelivery", param));
    }



    public virtual bool CheckItemExist(string Name)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Name",Name)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckItemExist]", Gparam));
    }
    public virtual bool CheckExistAndDeleteSalesTemp(int SalesTempID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SalesTempID",SalesTempID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteSalesTemp", Gparam));
    }


    public virtual bool CheckandDeleteTableDeliverySales(int SalesID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SalesID",SalesID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckandDeleteTableSales]", Gparam));
    }


    public virtual bool CheckandDeleteSales(int SaleNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SaleNo",SaleNo)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CheckandDeleteSales", Gparam));
    }


    public virtual bool DeleteSaleBySalesID(int SalesID, int UserID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SalesID",SalesID),
                                    new SqlParameter("@UserID", UserID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DeleteSaleBySalesID", Gparam));
    }

    public virtual bool SalesTempDelete(int UserID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UserID",UserID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_SalesTempDelete", Gparam));
    }

    public virtual DataTable GetTempSalesList(int UserID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UserID",UserID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetTempSalesList]", Gparam).Tables[0];
    }

    public virtual DataTable GetTableSales(int UserID, int TableID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UserID",UserID)
                                    ,new SqlParameter("@TableID", TableID)

                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetTableSales", Gparam).Tables[0];
    }
    public virtual DataTable GetTableSalesForKitchen(int UserID, int TableID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UserID",UserID)
                                    ,new SqlParameter("@TableID", TableID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetKitchenInvoice", Gparam).Tables[0];
    }
    public virtual DataTable GetTableSalesForKitchen(int SaleNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SaleNo",SaleNo)

                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetKitchenInvoiceTakeAway", Gparam).Tables[0];
    }
    public virtual DataTable GetDeliverySales(int UserID, int SaleNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UserID",UserID)
                                    ,new SqlParameter("@SaleNo", SaleNo)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetDeliverySales", Gparam).Tables[0];
    }

    public virtual DataTable GetSaleAgainstSN(int SaleNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SaleNo",SaleNo)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetSaleAgainstSN]", Gparam).Tables[0];
    }

    public virtual DataTable GetSalesListBySearch(object SaleNo, object SaleDate, object OrderType)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SaleNo",SaleNo),
                                     new SqlParameter("@SaleDate",SaleDate),
                                      new SqlParameter("@OrderType",OrderType)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSalesListBySearch", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchSalesListBySearch(object SaleNo, object SaleDate, object OrderType)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SaleNo",SaleNo),
                                     new SqlParameter("@SaleDate",SaleDate),
                                      new SqlParameter("@OrderType",OrderType)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSearchSalesListBySearch", Gparam).Tables[0];
    }


    public virtual DataTable GetSalesBySalesNo(int SaleNo)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SaleNo",SaleNo)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSalesBySalesNo", Gparam).Tables[0];
    }

    public virtual DataTable GetSalesListBySaleID(int SalesID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@SalesID",SalesID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSalesListBySaleID", Gparam).Tables[0];
    }

    public virtual DataTable GetTempSalesListEdit(int UserID, int SalesTempID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UserID",UserID),
                                    new SqlParameter("@SalesTempID",SalesTempID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetTempSalesListEdit]", Gparam).Tables[0];
    }

    public virtual DataTable GetSalesList(int UserID, int SalesID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UserID",UserID),
                                    new SqlParameter("@SalesID",SalesID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_GetTableSalesList]", Gparam).Tables[0];
    }

    public virtual DataTable GetItembyCategory(object CategoryId)
    {

        SqlParameter[] Gparam = {
                                    new SqlParameter("@CategoryID",CategoryId)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemsByCategory", Gparam).Tables[0];

    }
    public virtual int CheckTableSalesAlready(int TableID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@TableID",TableID)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CheckTableSalesInsert]", Gparam));
    }

    public virtual int UpdateIsPrint(int SalesID)
    {
        SqlParameter[] param = {
                    new SqlParameter("@SalesID", SalesID)

        };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_UpdateIsPrint", param));
    }

    public virtual int UpdateSalesReturn(Sales_BLL BL)
    {
        SqlParameter[] param = {
                    new SqlParameter("@SalesID", BL.SalesID),
                    new SqlParameter("@Quantity", BL.Quantity),
                    new SqlParameter("@UserID", BL.User)

        };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_UpdateSalesReturn", param));
    }


    public virtual DataTable GetItemName(int ItemID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@ItemID",ItemID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemName", Gparam).Tables[0];
    }
    public virtual bool TempSalesFlavorDelete(int UserID, int SalesTempID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UserID",UserID)
                                    ,  new SqlParameter("@SalesTempID",SalesTempID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_TempSalesFlavorDelete", Gparam));
    }
    public virtual bool SalesFlavorDelete(int SalesID, int UserID)
    {
        SqlParameter[] Gparam = {
                                      new SqlParameter("@SalesID",SalesID)
                                     , new SqlParameter("@UserID", UserID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_SalesFlavorDelete", Gparam));
    }
    public virtual bool UpdateInvoiceStatus(int SaleNo, int PaidBy, DateTime PaidDate)
    {
        SqlParameter[] Gparam = {
                                      new SqlParameter("@SaleNo",SaleNo)
                                      ,new SqlParameter("@PaidBy", PaidBy)
                                      ,new SqlParameter("@PaidDate", PaidDate)

                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_UpdateInvoiceStatus", Gparam));
    }


    public virtual DataTable GetDeliveryDetails(int RiderID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@RiderID",RiderID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetDeliveryDetails", Gparam).Tables[0];
    }
    public virtual int FinalPaymentDeliveryAmount(Sales_BLL BL_Sales)
    {
        SqlParameter[] param = {
                                      new SqlParameter("@SaleNo", BL_Sales.SaleNo)
                                      ,new SqlParameter("@PaidBy", BL_Sales.PaidBy)
                                      ,new SqlParameter("@PaidDate", BL_Sales.PaidDate)

                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_FinalPaymentDeliveryAmount", param));
    }



    public virtual int UpdateCustomer(Sales_BLL BL)
    {
        SqlParameter[] param = {
                    new SqlParameter("@TableID", BL.TableID)
                    ,new SqlParameter("@CustomerID", BL.CustomerID)
        };
        return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_UpdateCustomer", param));
    }
    public virtual bool DeleteDinning(int TableID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@TableID",TableID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DeleteDinning", Gparam));
    }

    //public virtual DataTable GetTaxPercent()
    //{
    //    SqlParameter[] Gparam = {

    //                           };
    //    return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetTaxPercent", Gparam).Tables[0];
    //}
}
