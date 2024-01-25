using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    Dashboard_BLL BL = new Dashboard_BLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["PSMSSession"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        SetKPI();
    }
    public void SetKPI()
    {
        DataTable dt = BL.GetKPIInfo();
        if (dt.Rows.Count > 0)
        {
            TodaySalesAmount.InnerHtml = "Rs."+Convert.ToDecimal(dt.Rows[0]["TodaySalesAmount"]).ToString("0.00");
            TodayItemSales.InnerHtml = dt.Rows[0]["TodayItemSales"].ToString();
            DiscountToday.InnerHtml = "Rs." + Convert.ToDecimal(dt.Rows[0]["DiscountToday"]).ToString("0.00");
            TotalSaleAmountToday.InnerHtml = "Rs." + Convert.ToDecimal(dt.Rows[0]["TotalSaleAmountToday"]).ToString("0.00");
            YesterdaySalesAmount.InnerHtml = "Rs." + Convert.ToDecimal(dt.Rows[0]["YesterdaySalesAmount"]).ToString("0.00");
            YesterdayItemSales.InnerHtml = dt.Rows[0]["YesterdayItemSales"].ToString();
            DiscountYesterday.InnerHtml = "Rs." + Convert.ToDecimal(dt.Rows[0]["DiscountYesterday"]).ToString("0.00");
            TotalSaleAmountYesterday.InnerHtml = "Rs." + Convert.ToDecimal(dt.Rows[0]["TotalSaleAmountYesterday"]).ToString("0.00");
        }
    }
}