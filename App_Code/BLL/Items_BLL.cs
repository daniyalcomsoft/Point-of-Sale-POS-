using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Vendor_BLL
/// </summary>
public class Items_BLL : Items_DAL
{
    public Items_BLL()  
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int ItemID { get; set; }
    public string Name { get; set; }   
    public bool Active { get; set; }
    public decimal PurchaseRate { get; set; }
    public decimal SaleRate { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }
    public int CounterID { get; set; }
    public int? CategoryID { get; set; }
    public int CompanyID { get; set; }  
    public string PicName { get; set; }
    public string PicGuid { get; set; }
    public string PicPath { get; set; }
    public int Sort { get; set; }

    public string Type { get; set; }

}