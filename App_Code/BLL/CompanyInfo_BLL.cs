using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ItemCategory_BLL
/// </summary>
public class CompanyInfo_BLL:CompanyInfo_DAL
{
    public CompanyInfo_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}




    public int CompanyID { get; set; }
    public string Company { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }
}