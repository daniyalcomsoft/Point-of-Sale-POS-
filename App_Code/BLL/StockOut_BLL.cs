using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StockIn_BLL
/// </summary>
public class StockOut_BLL : StockOut_DAL
{
	public StockOut_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public int StockOutID { get; set; }
    public int StockOutTempID { get; set; }
    public long StockOutNo { get; set; }
    public DateTime StockOutDate { get; set; }     
    public int CustomerID { get; set; }
    public int ItemID { get; set; }
    public decimal Rate { get; set; }
    public decimal Stock { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; } 
    public decimal PayAmount { get; set; }
    public decimal Transportation { get; set; }
    public int? ReferenceBy { get; set; }
    public bool IsPaid { get; set; }
    public decimal PurchasePrice { get; set; }
   

}