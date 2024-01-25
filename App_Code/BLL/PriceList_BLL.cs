using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PriceList_BLL
/// </summary>
public class PriceList_BLL : PriceList_DAL
{
    public PriceList_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int PriceID { get; set; }
    public int ItemID { get; set; }
    public decimal PurchasePrice { get; set; }
    public decimal SalePrice { get; set; }
    public DateTime PriceDate { get; set; }   
    public int User { get; set; }
    public DateTime Date { get; set; }
 
  
}