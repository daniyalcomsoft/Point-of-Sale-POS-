using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Rpts_HighestItemProfitReport : System.Web.UI.Page
{
    Reports_BLL BL = new Reports_BLL();

    protected void Page_Load(object sender, EventArgs e)
    { 
  


        if (Session["PSMSSession"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            RolePermission_BLL PP = new RolePermission_BLL();
            DataTable dtRole = new DataTable();
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            dtRole = PP.GetPagePermissionpPagesByRole(PSMSSession.RoleID);
            string pageName = null;
            bool view = false;
            foreach (DataRow dr in dtRole.Rows)
            {
                int row = dtRole.Rows.IndexOf(dr);
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Rpts/HighestItemProfitReport.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Rpts/HighestItemProfitReport.aspx" && view == true)
                {
                    FromDate.Text = DateTime.Now.ToShortDateString();
                    ToDate.Text = DateTime.Now.ToShortDateString();
                }
                else
                {
                    Response.Redirect("~/Default.aspx", false);
                }
            }


        }

        selectinit();
    }
    public void selectinit()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), Guid.NewGuid().ToString(), "selectpic();", true);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ConfigureReports();
    }
    private void ConfigureReports()
    {
        try
        {

            DataTable dt = new DataTable("ReportDataSet");
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];

            dt = BL.HighestItemProfitReport(FromDate.Text, ToDate.Text, hdCategoryID.Value == "" ? null : hdCategoryID.Value, hdItemID.Value == "" ? null : hdItemID.Value, Convert.ToInt16(rdQuantity.Checked));
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.EnableExternalImages = true;
            ReportParameter[] param = new ReportParameter[10];
            string pic = PSMSSession.PicPath;
            string CompanyPhone = PSMSSession.CompanyPhone;
            string CompanyEmail = PSMSSession.CompanyEmail;
            string CompanyAddress = PSMSSession.CompanyAddress;
            String CompanyName = PSMSSession.CompanyName;
            param[0] = new ReportParameter("FromDate", FromDate.Text);
            param[1] = new ReportParameter("ToDate", ToDate.Text);
            param[2] = new ReportParameter("Category", txtCategory.Text);
            param[3] = new ReportParameter("Item", txtItem.Text);        
            param[4] = new ReportParameter("Quantity", rdQuantity.Checked ? "Highest Sale Wise" : "Highest Profit Wise");
            param[5] = new ReportParameter("Phone", CompanyPhone);
            param[6] = new ReportParameter("Email", CompanyEmail);
            param[7] = new ReportParameter("Address", CompanyAddress);
            param[8] = new ReportParameter("Name", CompanyName);
            param[9] = new ReportParameter("Picture", Server.MapPath("~/" + pic));
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~//Rpts//rdlcReports//ItemWiseProfitReport.rdlc");
            ReportDataSource datasource = new ReportDataSource("DataSet1", dt);
            ReportViewer1.LocalReport.SetParameters(param);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource);
            ReportViewer1.LocalReport.Refresh();
            ReportViewer1.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchItemCategory(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["PSMS"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select * from [dbo].[ItemCategory] where CategoryName like  '%' +@SearchText+ '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> ItemCategory = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        string Category = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(sdr["CategoryName"].ToString(), sdr["CategoryID"].ToString());
                        ItemCategory.Add(Category);
                    }
                }
                conn.Close();
                return ItemCategory;
            }
        }
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchItem(string prefixText, int count, string contextKey)
    {
        if (!string.IsNullOrEmpty(contextKey))

            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["PSMS"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from [dbo].[Items] where CategoryID = " + contextKey + " and Name like '%' +@SearchText+ '%'";
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    cmd.Connection = conn;
                    conn.Open();
                    List<string> customersadd = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            string item = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(sdr["Name"].ToString(), sdr["ItemID"].ToString());
                            customersadd.Add(item);
                        }
                    }
                    conn.Close();
                    return customersadd;
                }
            }

        else
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["PSMS"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from [dbo].[Items] where Name like '%' +@SearchText+ '%'";
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    cmd.Connection = conn;
                    conn.Open();
                    List<string> customersadd = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            string item = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(sdr["Name"].ToString(), sdr["ItemID"].ToString());
                            customersadd.Add(item);
                        }
                    }
                    conn.Close();
                    return customersadd;
                }
            }

    }
    protected void txtCategory_TextChanged(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtCategory.Text))
        {
            hdCategoryID.Value = "";
        }
        if (hdCategoryID.Value != null)
        {
            var tt = new Items_BLL().GetItemlistByCategory(Convert.ToInt16(hdCategoryID.Value == "" ? null : hdCategoryID.Value));
            if (tt.Rows.Count > 0)
            {
                txtItem.Text = tt.Rows[0]["Name"].ToString();
                hdItemID.Value = tt.Rows[0]["ItemID"].ToString();
                txtItem.Text = "";
                hdItemID.Value = "";
            }
        }
    }
}