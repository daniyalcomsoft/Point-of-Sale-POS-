using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Vendor_BLL
/// </summary>
public class BusinessInfo_BLL : BusinessInfo_DAL
{
    public BusinessInfo_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int CompanyID { get; set; }  
    public string CompanyName { get; set; }
    public string PhoneNo { get; set; }
    public string EmailAddress { get; set; }
    public string Address { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }
    public string PicName { get; set; }
    public string PicGuid { get; set; }
    public string PicPath { get; set; }
    public bool VirtualKeyboard { get; set; }
    public bool PrintForKitchen { get; set; }
    public bool IsTax { get; set; }
    public string TaxName { get; set; }
    public decimal? TaxPercentage { get; set; }
    public bool EnableTakeAwayOnSale { get; set; }
    public bool EnableDeliveryOnSale { get; set; }
    public bool EnableDineInnOnSale { get; set; }
   


}