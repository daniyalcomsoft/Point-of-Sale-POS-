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
public partial class Rpts_ItemListReport : System.Web.UI.Page
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Rpts/ItemListReport.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Rpts/ItemListReport.aspx" && view == true)
                {
                    DataTable dtcmb = new DataTable();
                    dtcmb = new ItemCategory_BLL().GetItemCategoryListForReport(string.IsNullOrEmpty(cmbCategory.Text) ? (object)DBNull.Value : cmbCategory.Text);
                    cmbCategory.Text = "CategoryName";
                    DataRow row = dtcmb.NewRow();
                    row["CategoryName"] = "All Categories";
                    row["CategoryID"] = 0;
                    dtcmb.Rows.InsertAt(row, 0);
                    cmbCategory.DataBind();
                    cmbCategory.Text = null;
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
            dt = BL.GetRItemDetailReport(string.IsNullOrEmpty(cmbCategory.Text) ? (object)DBNull.Value : cmbCategory.Text);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~//Rpts//rdlcReports//ItemListReport.rdlc");
            ReportDataSource datasource = new ReportDataSource("DataSet1", dt);
            ReportParameter[] param = new ReportParameter[5];
            ReportViewer1.LocalReport.EnableExternalImages = true;
            string pic = PSMSSession.PicPath;
            string CompanyPhone = PSMSSession.CompanyPhone;
            string CompanyEmail = PSMSSession.CompanyEmail;
            string CompanyAddress = PSMSSession.CompanyAddress;
            String CompanyName = PSMSSession.CompanyName;
            param[0] = new ReportParameter("Phone", CompanyPhone);
            param[1] = new ReportParameter("Email", CompanyEmail);
            param[2] = new ReportParameter("Address", CompanyAddress);
            param[3] = new ReportParameter("Name", CompanyName);
            param[4] = new ReportParameter("Picture", Server.MapPath("~/" + pic));
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
    public static List<string> SearchCategory(string prefixText, int count)
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
}