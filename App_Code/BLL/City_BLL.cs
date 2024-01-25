using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for City_BLL
/// </summary>
public class City_BLL : City_DAL 
{
    public City_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int CityID { get; set; }   
    public string CityName { get; set; }   
    public string Description { get; set; }   
    public int User { get; set; }
    public DateTime Date { get; set; }
 
  
}