using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ItemCategory_BLL
/// </summary>
public class SalesItemFlavor_BLL : SalesItemFlavor_DAL
{
	public SalesItemFlavor_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int SalesID { get; set; }
    public int ItemID { get; set; }
    public int FlavorID { get; set; }
    public decimal Quantity { get; set; }
    public int UserID { get; set; }
}