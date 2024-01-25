using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer_BLL
/// </summary>
public class Waiters_BLL : Waiters_DAL
{
    public Waiters_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int WaiterID { get; set; }
    public string Name { get; set; }
    public string PhoneNo { get; set; }
    public string CNIC { get; set; }
    public string Address { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }
    public bool Active { get; set; }
    
  
}