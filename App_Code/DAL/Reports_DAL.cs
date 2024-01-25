using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using SQLHelper;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Reports_DAL
/// </summary>
public class Reports_DAL
{
    public Reports_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

  
    public virtual DataTable CurrentPriceListReport()
    {

        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CurrentPriceListReport").Tables[0];
    }
    public virtual DataTable GetPOReport(int POID)
    {
        SqlParameter[] param = {new SqlParameter("@PurchaseOrderID",POID)                                  
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetPOReport", param).Tables[0];
    }

    public virtual DataTable GetItemWisePurchaseReport(int ItemID, string From, string To)
    {
        SqlParameter[] param = {new SqlParameter("@ItemID",ItemID),
                                   new SqlParameter("@From",From),
                                   new SqlParameter("@To",To)   
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemWisePurchaseReport", param).Tables[0];
    }
    public virtual DataTable GetVendorWisePurchaseReport(int VendorID, string From, string To)
    {
        SqlParameter[] param = {new SqlParameter("@VendorID",VendorID),
                                   new SqlParameter("@From",From),
                                   new SqlParameter("@To",To)   
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetVendorWisePurchaseReport", param).Tables[0];
    }
    public virtual int InsertInvoiceDeatils(string InvoiceNo, int VendorID, string FromDate, string ToDate)
    {
        SqlParameter[] param = {new SqlParameter("@InvoiceNo",InvoiceNo)
                                    , new SqlParameter("@VendorID",VendorID)                                   
                                     ,new SqlParameter("@FromDate",FromDate)                                                                                                        
                                      ,new SqlParameter("@ToDate",ToDate)
                                       
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertInvoiceDeatils", param));
    }
    public virtual DataTable GetInvoiceInfo(string InvoiceNo, int VendorID)
    {
        SqlParameter[] param = {new SqlParameter("@InvoiceNo",InvoiceNo),
                                   new SqlParameter("@VendorID",VendorID)
                                     
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetInvoiceInfo", param).Tables[0];
    }
    public virtual DataTable GetVendorConsumptionReport(int VendorID, string From, string To)
    {
        SqlParameter[] param = {new SqlParameter("@vendorid",VendorID),
                                   new SqlParameter("@FDate",From),
                                   new SqlParameter("@TDate",To)   
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_VendorConsumptionReport", param).Tables[0];
    }
    public virtual DataTable GetVendorItemConsumptionReport(int VendorID, int Itemid, string From, string To)
    {
        SqlParameter[] param = {new SqlParameter("@vendorid",VendorID),
                                   new SqlParameter("@Itemid",Itemid),
                                   new SqlParameter("@FDate",From),
                                   new SqlParameter("@TDate",To)   
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_VendorItemConsumptionReport", param).Tables[0];
    }
    public virtual DataTable BranchWiseConsumptionReport(int BranchID, string From, string To)
    {
        SqlParameter[] param = {new SqlParameter("@BranchID",BranchID),
                                   new SqlParameter("@From",From),
                                   new SqlParameter("@To",To)   
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_BranchWiseConsumptionReport", param).Tables[0];
    }
    public virtual DataTable GetItemDetailReport(int? CategoryID)
    {
        CategoryID = CategoryID == 0 ? null : CategoryID;
        SqlParameter[] param = {new SqlParameter("@CategoryID",CategoryID),

                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetItemDetailReport", param).Tables[0];
    }
    public virtual DataTable GetRItemDetailReport(object Category)
    {
        SqlParameter[] param = {new SqlParameter("@Category",Category),

                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetRItemDetailReport", param).Tables[0];
    }

    public virtual DataTable GetDealItem(int? DealID)
    {
        DealID = DealID == 0 ? null : DealID;
        SqlParameter[] param = {new SqlParameter("@DealID",DealID)

                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetDealItem", param).Tables[0];
    }
    public virtual DataTable GetInvoiceReport(long StockOutNo)
    {

        SqlParameter[] param = {new SqlParameter("@StockOutNo",StockOutNo),
                                   
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetInvoiceReport", param).Tables[0];
    }

    public virtual DataTable GetSalesInvoice(int SaleNo) 
    {
        SqlParameter[] param = {
                                    new SqlParameter("@SaleNo",SaleNo)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetInvoiceReport", param).Tables[0];
    }

    public virtual DataTable GetKitchenInvoice(int SalesID)
    {
        SqlParameter[] param =
        {
            new SqlParameter("@SalesID", SalesID)
        };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetKitchenInvoice", param).Tables[0];
    }


    //public virtual DataTable GetTableInvoiceReport(int TableID)
    //{
    //    SqlParameter[] param = {
    //                                new SqlParameter("@TableID",TableID)
    //                           };
    //    return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetTableInvoiceReport", param).Tables[0];
    //}

    public virtual DataTable PurchaseRegisterReport(string FromDate, string ToDate,int? CategoryID,int? ItemID,int? VendorID)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if(FromDate!=string.Empty){
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                     new SqlParameter("@CategoryID",CategoryID==0?null:CategoryID),
                                       new SqlParameter("@ItemID",ItemID==0?null:ItemID),
                                         new SqlParameter("@VendorID",VendorID==0?null:VendorID),
                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_PurchaseReport", param).Tables[0];
    }
    public virtual DataTable SaleRegisterReport(string FromDate, string ToDate,object CategoryID, object ItemID)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@CategoryID",CategoryID),
                                   new SqlParameter("@ItemID",ItemID),
                                   

                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_SaleReport", param).Tables[0];
    }
    public virtual DataTable StockRegister(string FromDate, string ToDate, int? ItemID)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@ItemID",ItemID==0?null:ItemID)                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_StockRegister", param).Tables[0];
    }
    public virtual DataTable ProfitCustomerWiseReport(string FromDate, string ToDate, int? CategoryID, int? ItemID, int? CustomerID, int? CustomerCategoryID)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@CategoryID",CategoryID==0?null:CategoryID),
                                   new SqlParameter("@ItemID",ItemID==0?null:ItemID),
                                   new SqlParameter("@CustomerID",CustomerID==0?null:CustomerID),
                                   new SqlParameter("@CustomerCategoryID",CustomerCategoryID==0?null:CustomerCategoryID)

                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_ProfitCustomerWiseReport", param).Tables[0];
    }
    public virtual DataTable ProfitDateWiseReport(string FromDate, string ToDate, object CategoryID, object ItemID)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@CategoryID",CategoryID),
                                   new SqlParameter("@ItemID",ItemID)

                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_ProfitDateWiseReport", param).Tables[0];
    }

    public virtual DataTable HighestCustomerProfitReport(string FromDate, string ToDate, int? CategoryID, int? ItemID, int? CustomerID, int? CustomerCategoryID,bool Sale)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@CategoryID",CategoryID==0?null:CategoryID),
                                   new SqlParameter("@ItemID",ItemID==0?null:ItemID),
                                   new SqlParameter("@CustomerID",CustomerID==0?null:CustomerID),
                                   new SqlParameter("@CustomerCategoryID",CustomerCategoryID==0?null:CustomerCategoryID),
                                     new SqlParameter("@Sale",Sale)

                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_HighestCustomerProfitReport]", param).Tables[0];
    }
    public virtual DataTable CurrentStockReport()
    {

        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_CurrentStockReport").Tables[0];
    }

    public virtual DataTable HighestItemProfitReport(string FromDate, string ToDate, object CategoryID, object ItemID, int Quantity)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@CategoryID",CategoryID),
                                   new SqlParameter("@ItemID",ItemID),
                                     new SqlParameter("@Quantity",Quantity)

                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_HighestItemProfitReport]", param).Tables[0];
    }
    public virtual DataTable HighestCustomerSaleReport(string FromDate, string ToDate, int? CategoryID, int? ItemID, int? CustomerID, int? CustomerCategoryID, bool Qty)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@CategoryID",CategoryID==0?null:CategoryID),
                                   new SqlParameter("@ItemID",ItemID==0?null:ItemID),
                                   new SqlParameter("@CustomerID",CustomerID==0?null:CustomerID),
                                   new SqlParameter("@CustomerCategoryID",CustomerCategoryID==0?null:CustomerCategoryID),
                                     new SqlParameter("@Qty",Qty)

                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_HighestCustomerSaleReport]", param).Tables[0];
    }
    public virtual DataTable HighestItemSaleReport(string FromDate, string ToDate, object CategoryID, object ItemID, int Quantity)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@CategoryID",CategoryID),
                                   new SqlParameter("@ItemID",ItemID),
                                     new SqlParameter("@Quantity",Quantity)

                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_HighestItemSaleReport]", param).Tables[0];
    }
    public virtual DataTable CustomerCreditReport(string FromDate, string ToDate, int? CustomerID)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@CustomerID",CustomerID==0?null:CustomerID)                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CustomerCreditReport]", param).Tables[0];
    }
    public virtual DataTable CustomerCreditDetailReport(string FromDate, string ToDate, int? CustomerID)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@CustomerID",CustomerID==0?null:CustomerID)                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_CustomerCreditDetailReport]", param).Tables[0];
    }
    public virtual DataTable StockDetailsReport(string FromDate, string ToDate, int? ItemID)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@ItemID",ItemID==0?null:ItemID)                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_StockDetailsReport]", param).Tables[0];
    }

    public virtual DataTable OrderBookerSaleReport(string FromDate, string ToDate, int? CategoryID, int? ItemID, int? CustomerID, int? CustomerCategoryID, int? OrderBookerID)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@CategoryID",CategoryID==0?null:CategoryID),
                                   new SqlParameter("@ItemID",ItemID==0?null:ItemID),
                                   new SqlParameter("@CustomerID",CustomerID==0?null:CustomerID),
                                   new SqlParameter("@CustomerCategoryID",CustomerCategoryID==0?null:CustomerCategoryID),
                                     new SqlParameter("@OrderBookerID",OrderBookerID==0?null:OrderBookerID)

                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "[SP_OrderBookerSaleReport]", param).Tables[0];
    }

    public virtual DataTable ProfitMonthWiseReport(string FromDate, string ToDate, int? CategoryID, int? ItemID, int? CustomerID, int? CustomerCategoryID)
    {
        DateTime? FD = null;

        DateTime? TD = null;
        if (FromDate != string.Empty)
        {
            FD = Convert.ToDateTime(FromDate);
        }
        if (ToDate != string.Empty)
        {
            TD = Convert.ToDateTime(ToDate);
        }
        SqlParameter[] param = {
                                     new SqlParameter("@FromDate",FD),
                                   new SqlParameter("@TODate",TD),
                                   new SqlParameter("@CategoryID",CategoryID==0?null:CategoryID),
                                   new SqlParameter("@ItemID",ItemID==0?null:ItemID),
                                   new SqlParameter("@CustomerID",CustomerID==0?null:CustomerID),
                                   new SqlParameter("@CustomerCategoryID",CustomerCategoryID==0?null:CustomerCategoryID)

                                 
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_ProfitMonthWiseReport", param).Tables[0];
    }
    public virtual DataTable GetAvgPriceDetailReport(int? CategoryID)
    {
        CategoryID = CategoryID == 0 ? null : CategoryID;
        SqlParameter[] param = {new SqlParameter("@CategoryID",CategoryID),
                                   
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetAVGPriceDetailReport", param).Tables[0];
    }

    public virtual DataTable GetSalesReturnDetail(string FromDate, string ToDate)
    {
        SqlParameter[] Gparam = {
                                   new SqlParameter("@Datefrom",FromDate)
                                      ,new SqlParameter("@Dateto",ToDate)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSalesReturnDetail", Gparam).Tables[0];
    }
}