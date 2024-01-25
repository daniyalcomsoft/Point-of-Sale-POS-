using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Vendor_BLL
/// </summary>
public class TableSalesTemp_BLL : Sales_DAL
{
    public TableSalesTemp_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int TableSalesTempID { get; set; }
    public int TableID { get; set; }
    public int UserID { get; set; }
    public int ItemID { get; set; }
    public int Quantity { get; set; }    
    public decimal Price { get; set; }
    public int WaiterID { get; set; }
}