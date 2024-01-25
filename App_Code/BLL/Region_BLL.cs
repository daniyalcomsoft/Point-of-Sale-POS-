using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Region_BLL
/// </summary>
public class Region_BLL : Region_DAL
{
    public Region_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int RegionID { get; set; }
    public string RegionName { get; set; }   
    public string Description { get; set; }   
    public int User { get; set; }
    public DateTime Date { get; set; }
 
  
}