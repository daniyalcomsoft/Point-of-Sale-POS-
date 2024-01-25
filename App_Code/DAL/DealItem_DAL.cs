using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SQLHelper;

/// <summary>
/// Summary description for Vendor_DAL
/// </summary>
public class DealItem_DAL
{
    public DealItem_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public virtual int InsertUpdateDealItems(DealItem_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@DealID", BL.DealID)
                ,new SqlParameter("@Quantity", BL.Quantity)
                ,new SqlParameter("@ItemID", BL.ItemID)
                ,new SqlParameter("@Date", BL.Date)
                ,new SqlParameter("@User", BL.User)


        };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateDealItems", param));
    }

    //public virtual int DealBasedItems(object DealID)
    //{
    //    SqlParameter[] Gparam = {
    //                                new SqlParameter("@DealID",DealID)
    //                           };
    //    return Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DealBasedItems", Gparam));
    //}

    public virtual DataTable DealBasedItems(object DealID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@DealID", DealID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DealBasedItems", Gparam).Tables[0];
    }

    public int DeleteDealItems(int DealID)
    {
        SqlParameter[] param =
        {
            new SqlParameter("@DealID", DealID)
        };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DeleteDealItems", param));
    }

    public virtual DataTable GetDealsList(object q)
    {
        SqlParameter[] Gparam = {
                                   new SqlParameter("@serchq", q)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetDealsList", Gparam).Tables[0];
    }
    public virtual DataTable GetSearchDealsList(object q)
    {
        SqlParameter[] Gparam = {
                                   new SqlParameter("@serchq", q)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetSearchDealsList", Gparam).Tables[0];
    }


}