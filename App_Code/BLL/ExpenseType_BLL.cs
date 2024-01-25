using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for tblExpenseType
/// </summary>
public class ExpenseType_BLL : ExpenseType_DAL
{
	public ExpenseType_BLL()

	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int ExpenseTypeID { get; set; }
    public string ExpenseType { get; set; }
    public int CreatedBy { get; set; }
    public DateTime CreatedDate { get; set; }




 
}