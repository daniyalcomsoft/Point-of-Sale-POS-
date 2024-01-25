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
public class BusinessInfo_DAL
{
    public BusinessInfo_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    
    public virtual int InsertUpdateCompany(BusinessInfo_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@CompanyID",BL.CompanyID)
                                    , new SqlParameter("@CompanyName",BL.CompanyName)                                   
                                    ,new SqlParameter("@PhoneNo",BL.PhoneNo)
                                    ,new SqlParameter("@EmailAddress", BL.EmailAddress)
                                    ,new SqlParameter("@Address", BL.Address)                                                                                                                                                 
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.User)
                                        ,new SqlParameter("@PicName", BL.PicName)
                                        ,new SqlParameter("@PicGuid", BL.PicGuid)
                                        ,new SqlParameter("@PicPath", BL.PicPath)
                                          ,new SqlParameter("@VirtualKeyboard", BL.VirtualKeyboard)
                                          ,new SqlParameter("@PrintForKitchen", BL.PrintForKitchen)
                                              ,new SqlParameter("@IsTax", BL.IsTax)
                                                  ,new SqlParameter("@TaxName", BL.TaxName)
                                            ,new SqlParameter("@TaxPercentage", BL.TaxPercentage)
                                            ,new SqlParameter("@EnableTakeAwayOnSale", BL.EnableTakeAwayOnSale)
                                            ,new SqlParameter("@EnableDeliveryOnSale", BL.EnableDeliveryOnSale)
                                            ,new SqlParameter("@EnableDineInnOnSale", BL.EnableDineInnOnSale)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateCompany", param));
    }
    public virtual DataTable GetCompanyList()
    {
        SqlParameter[] Gparam = {
                                    
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetCompanyList", Gparam).Tables[0];
    }

    //public virtual bool GetTaxPercent()
    //{
    //    SqlParameter[] Gparam = {


    //                           };
    //    return Convert.ToBoolean(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetTaxPercent", Gparam));
    //}

    public virtual DataTable GetTaxPercent()
    {
        SqlParameter[] Gparam = {

                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetTaxPercent", Gparam).Tables[0];
    }


}