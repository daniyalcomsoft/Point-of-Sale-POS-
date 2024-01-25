using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer_BLL
/// </summary>
public class Shift_BLL : Shift_DAL
{
    public Shift_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int ShiftID { get; set; } 
    public string Name { get; set; }
    public string ShiftTimeFrom { get; set; }
    public string ShiftTimeTo { get; set; }     
    public int User { get; set; }
    public DateTime Date { get; set; }
    public bool Active { get; set; }
  
}