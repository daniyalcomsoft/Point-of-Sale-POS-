using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for tblExpenseType
/// </summary>
public class SubType_BLL : SubType_DAL
{
	public SubType_BLL()

	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int SubTypeID { get; set; }
    public int ExpenseTypeID { get; set; }
    public string SubType { get; set; }
    public int CreatedBy { get; set; }
    public DateTime CreatedDate { get; set; }




 
}