using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for tblExpenseType
/// </summary>
public class Counter_BLL : Counter_DAL
{
	public Counter_BLL()

	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int CounterID { get; set; }
    public string CounterName { get; set; }
    public string Description { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }
    public bool Active { get; set; }





}