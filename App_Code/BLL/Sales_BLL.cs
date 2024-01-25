using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Vendor_BLL
/// </summary>
public class Sales_BLL : Sales_DAL
{
    public Sales_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int SalesID { get; set; }
    public int ItemID { get; set; }
    public decimal SalesRate { get; set; }
    public int Quantity { get; set; }
    public decimal Total { get; set; }
    public decimal Discount { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }
    public int SalesTempID { get; set; }    
    public decimal PurchaseRate { get; set; }
    public int SaleNo { get; set; }
    public decimal CashReceived { get; set; }   
    public int? TableID { get; set; }
    public decimal ReceivedAmount { get; set; }
    public bool IsPaid { get; set; }
    public int CounterID { get; set; }
    public int? WaiterID { get; set; }
    public int? RiderID { get; set; }
    public bool IsPrint { get; set; }
    public string Name { get; set; }
    public int FlavorID { get; set; }
    public decimal DeliveryCharges { get; set; }
    public int PaidBy { get; set; }
    public DateTime ? PaidDate { get; set; }
    public int ShiftID { get; set; }
    public int CustomerID { get; set; }
    public decimal? TaxPercentage { get; set; }
    public string TaxName { get; set; }
    public string Address { get; set; }
}