using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StockIn_BLL
/// </summary>
public class PurchaseOrder_BLL:PurchaseOrder_DAL
{
    public PurchaseOrder_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public int PurchaseOrderID { get; set; }
    public string PONo { get; set; }
    public DateTime PODate { get; set; }
    public string Priority { get; set; }
    public int VendorID { get; set; }
    public int ItemID { get; set; }
    public string Description { get; set; }
    public int BranchID { get; set; }  
    public decimal Price { get; set; }
    public int Qty { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }

}