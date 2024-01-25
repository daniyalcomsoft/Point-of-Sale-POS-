using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using SQLHelper;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Dashboard_DAL
/// </summary>
public class Dashboard_DAL
{
    public Dashboard_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual DataTable GetKPIInfo()
    {
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetKPIInfo").Tables[0];
    }

}