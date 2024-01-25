using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Vendor_BLL
/// </summary>
public class Salestemp_BLL : Sales_DAL
{
    public Salestemp_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int SalesTempID { get; set; }
    public int UserID { get; set; }
    public int ItemID { get; set; }
    public int Quantity { get; set; }    
    public decimal Price { get; set; }
}