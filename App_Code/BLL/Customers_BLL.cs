﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer_BLL
/// </summary>
public class Customers_BLL : Customers_DAL
{
    public Customers_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int CustomerID { get; set; } 
    public string Name { get; set; }
    //public string BusinessName { get; set; }
    //public string Landline { get; set; }
    //public string Fax { get; set; }
    public string PhoneNo { get; set; }
    //public string City { get; set; }
    //public string Email { get; set; }
    public string Address { get; set; }  
    public int User { get; set; }
    public DateTime Date { get; set; }
    public bool Active { get; set; }
    //public int CategoryID { get; set; }
    //public bool IsAgent { get; set; }
  
}