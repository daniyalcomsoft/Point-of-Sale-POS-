using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Session
/// </summary>
public class Sessions
{
	public Sessions()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable PermissionTable = new DataTable();
    public DataTable MenuTable = new DataTable();
    public int RoleID { get; set; }
    public int UserID { get; set; }  
    public string UserName { get; set; }
    public string UserFullName { get; set; }
    public string RoleName { get; set; }
    public bool Can_Insert { get; set; }
    public bool Can_Update { get; set; }
    public bool Can_Delete { get; set; }
    public bool Can_View { get; set; }
    public string Permission { get; set; }
    public string PageRefrence { get; set; }
    public string PicName { get; set; }
    public string PicGuid { get; set; }
    public string PicPath { get; set; }
    public string CompanyPhone { get; set; }
    public string CompanyEmail { get; set; }
    public string CompanyAddress { get; set; }
    public string CompanyName { get; set; }
    public bool VirtualKeyboard { get; set; }
    public bool PrintForKitchen { get; set; }
    public bool EnableDeliveryOnSale { get; set; }
    public bool EnableTakeAwayOnSale { get; set; }
    public bool EnableDineInnOnSale { get; set; }
    public bool IsTax { get; set; }    
    public string TaxName { get; set; }
    public decimal? TaxPercent { get; set; }
}