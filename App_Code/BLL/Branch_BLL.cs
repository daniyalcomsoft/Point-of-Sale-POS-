using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Branch_BLL
/// </summary>
public class Branch_BLL:Branch_DAL
{
	public Branch_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int BranchID { get; set; }
    public string NiftCode { get; set; }
    public string AccountCode { get; set; }
    public string BranchName { get; set; }
    public string PABX { get; set; }
    public string Fax { get; set; }
    public int CityID { get; set; }
    public int RegionID { get; set; }   
    public string Address { get; set; }
    public bool Depart { get; set; }
    public DateTime Date { get; set; }
    public int User { get; set; }
   

   
}