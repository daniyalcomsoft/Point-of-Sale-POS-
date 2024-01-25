using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ItemCategory_BLL
/// </summary>
public class Table_BLL:Table_DAL
{
	public Table_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}




    public int TableID { get; set; }
    public int TableSalesTempID { get; set; }
    public string TableName { get; set; }
    public int Sort { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }
    public bool Active { get; set; }
}