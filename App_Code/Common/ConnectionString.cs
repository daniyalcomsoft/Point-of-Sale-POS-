using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ConnectionString
/// </summary>
public class ConnectionString
{
	public ConnectionString()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string PSMS
    {
        get
        {
            if (ConfigurationManager.ConnectionStrings["PSMS"] == null)
            {
                return null;
            }
            string myCon = ConfigurationManager.ConnectionStrings["PSMS"].ToString();
            return myCon;
        }
    }
}