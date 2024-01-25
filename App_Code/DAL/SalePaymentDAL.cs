using SQLHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SalePaymentDAL
/// </summary>
public class SalePaymentDAL
{
	public SalePaymentDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual DataTable GetSalePayment(object InvoiceNo, object CustomerID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@InvoiceNo",InvoiceNo),
                                    
                                    new SqlParameter("@CustomerID",CustomerID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSalePaymentList", Gparam).Tables[0];
    }

    public virtual bool DeleteSalePayment(int InvoiceNo,int CustomerID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@InvoiceNo",InvoiceNo),
                                     new SqlParameter("@CustomerID",CustomerID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DeleteSalePayment", Gparam));
    }

    public virtual int InsertUpdateSalePayment(SalePayment_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@InvoiceNo",BL.InvoiceNo)                                  
                                    ,new SqlParameter("@CustomerID",BL.CustomerId)
                                     ,new SqlParameter("@InvoiceAmount",BL.InvoiceAmount)
                                      ,new SqlParameter("@InvoiceDate",BL.InvoiceDate) 
                                      ,new SqlParameter("@PayAmount",BL.PayAmount)
                                      ,new SqlParameter("@TransportationCharges",BL.TransportationCharges)
                                       ,new SqlParameter("@User",BL.User)
                                       ,new SqlParameter("@Date",BL.Date) 
                                       ,new SqlParameter("@IsPaid",BL.IsPaid) 
                             
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateSalePayment", param));
    }
    public virtual int GetInvoiceNumber()
    {
        

        return Convert.ToInt16(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_getInvoiceNo"));
    }
}