using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StockIn_BLL
/// </summary>
public class StockIn_BLL:StockIn_DAL
{
	public StockIn_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public long StockInID { get; set; }
    public long StockInTempID { get; set; }
    public int ChallanNo { get; set; }
    public string RefNo { get; set; }
    public DateTime ChallanDate { get; set; }   
    public int BranchID { get; set; }
    public int VendorID { get; set; }
    public int ItemID { get; set; }  
    public decimal Price { get; set; }
    public decimal Stock { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }
    public object PurchaseOrderDetailID { get; set; }
    public object Comments { get; set; }
    public decimal PayAmount { get; set; }

}