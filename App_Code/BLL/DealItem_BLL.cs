using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Vendor_BLL
/// </summary>
public class DealItem_BLL : DealItem_DAL
{
    public DealItem_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int DealID { get; set; }
    public int ItemID { get; set; }   
    public int Quantity { get; set; }  
    public int User { get; set; }
    public DateTime Date { get; set; }
    public decimal SaleRate { get; set; }
    public string Name { get; set; }
    public decimal Amount { get; set; }
    

}