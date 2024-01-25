using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ItemCategory_BLL
/// </summary>
public class SalesItemFlavorTemp_BLL : SalesItemFlavorTemp_DAL
{
	public SalesItemFlavorTemp_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int SalesTempID { get; set; }
    public int ItemID { get; set; }
    public int FlavorID { get; set; }
    public decimal Quantity { get; set; }
    public int UserID { get; set; }
}