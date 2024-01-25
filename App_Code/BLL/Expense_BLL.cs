using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for tblExpense
/// </summary>
public class Expense_BLL : Expense_DAL
{
	public Expense_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public int ExpenseID { get; set; }
    public int ExpenseTypeID { get; set; }
    public int SubTypeID { get; set; }
    public string Discription { get; set; }
    public decimal Amount { get; set; }
    public DateTime ExpenseDate { get; set; }
    public int CreatedBy { get; set; }
    public DateTime CreatedDate { get; set; }




}