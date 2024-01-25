using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ItemCategory_BLL
/// </summary>
public class CategoryFlavorMapping_BLL : CategoryFlavorMapping_DAL
{
	public CategoryFlavorMapping_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    
    public int CategoryID { get; set; }
    public int FlavorID { get; set; }
  
}