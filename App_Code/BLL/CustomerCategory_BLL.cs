using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CustomerCategory_BLL
/// </summary>
public class CustomerCategory_BLL:CustomerCategory_DAL
{
	public CustomerCategory_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public int CustomerCategoryID { get; set; }
    public string CustomerCategory { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }

}