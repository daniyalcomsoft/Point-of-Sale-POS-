using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ItemCategory_BLL
/// </summary>
public class ItemCategory_BLL:ItemCategory_DAL
{
	public ItemCategory_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}




    public int ItemCategoryID { get; set; }
    public string ItemCategory { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }
    public string PicName { get; set; }
    public string PicGuid { get; set; }
    public string PicPath { get; set; }
    public int Sort { get; set; }
    public bool Active { get; set; }
}