using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SQLHelper;

/// <summary>
/// Summary description for Branch_DAL
/// </summary>
public class Branch_DAL
{
	public Branch_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public virtual DataTable GetBranchList(object BranchID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@BranchID",BranchID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetBranchList", Gparam).Tables[0];
    }

    

  

}