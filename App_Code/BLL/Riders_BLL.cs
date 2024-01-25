using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer_BLL
/// </summary>
public class Riders_BLL : Riders_DAL
{
    public Riders_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int RiderID { get; set; }
    public string Name { get; set; }
    public string PhoneNo { get; set; }
    public string CNIC { get; set; }
    public string Address { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }
    public bool Active { get; set; }

}