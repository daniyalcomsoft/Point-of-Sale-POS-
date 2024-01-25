using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User_BLL
/// </summary>
public class User_BLL:User_DAL
{
	public User_BLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int UserID { get; set; }
    public int RoleID { get; set; }
    public string Name { get; set; }
    public string UserName { get; set; }
    public string Password { get; set; }
    public string Phone { get; set; }
    public string Email { get; set; }
    public string Address { get; set; }
    public bool Status { get; set; }
    public int User { get; set; }
    public DateTime Date { get; set; }

    public override System.Data.DataTable GetUserByUserName(string UserName)
    {
        return base.GetUserByUserName(UserName);
    }
    public override bool CheckUserExist()
    {
        return base.CheckUserExist();
    }
}