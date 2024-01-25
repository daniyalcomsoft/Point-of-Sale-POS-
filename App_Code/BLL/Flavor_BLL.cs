using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ItemCategory_BLL
/// </summary>
public class Flavor_BLL:Flavor_DAL
{
	public Flavor_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}




    public int FlavorID { get; set; }
    //public int TableSalesTempID { get; set; }
    public string FlavorName { get; set; }
    public int Sort { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }
    public bool Active { get; set; }
    public bool IsCheck { get; set; }
}