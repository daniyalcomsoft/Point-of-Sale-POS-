using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ItemCategory_BLL
/// </summary>
public class ItemsFlavorMapping_BLL : ItemsFlavorMapping_DAL
{
	public ItemsFlavorMapping_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    
    public int ItemID { get; set; }
    public int FlavorID { get; set; }
    public bool ShowOnlyItemsFlavor { get; set; }
  
}