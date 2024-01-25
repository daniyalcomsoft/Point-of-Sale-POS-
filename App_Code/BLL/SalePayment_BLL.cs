using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SalePayment_BLL
/// </summary>
public class SalePayment_BLL :SalePaymentDAL
{
	public SalePayment_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int InvoiceNo { get; set; }
    public int CustomerId { get; set; }
    public DateTime InvoiceDate { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }
    public Double PayAmount { get; set; }
    public Double InvoiceAmount { get; set; }
    public Double TransportationCharges { get; set; }
    public bool IsPaid { get; set; } 
}