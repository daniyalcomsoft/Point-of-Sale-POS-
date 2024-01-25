using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Vendor_BLL
/// </summary>
public class Vendor_BLL : Vendor_DAL
{
    public Vendor_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int VendorID { get; set; }  
    public string Company { get; set; }
    public string ContactPerson { get; set; }
    public string Landline { get; set; }
    public string Fax { get; set; }
    public string Cell { get; set; }
    public string City { get; set; }
    public string Email { get; set; }
    public string Address { get; set; }  
    public int User { get; set; }
    public DateTime Date { get; set; }
 
  
}