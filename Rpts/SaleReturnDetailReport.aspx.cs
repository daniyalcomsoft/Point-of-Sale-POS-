using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Rpts_SaleReturnDetailReport : System.Web.UI.Page
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Rpts/SaleReturnDetailReport.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Rpts/SaleReturnDetailReport.aspx" && view == true)
                {
                    txtDatefrom.Text = DateTime.Now.ToShortDateString();
                    txtDateto.Text = DateTime.Now.ToShortDateString();
                    //ConfigureReports();
                }
                else
                {
                    Response.Redirect("Default.aspx", false);
                }
            }

        }
    }
    private void ConfigureReports()
    {
        try
        {
            DataTable dt = new DataTable("ReportDataSet");
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            dt = BL.GetSalesReturnDetail(txtDatefrom.Text, txtDateto.Text);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.EnableExternalImages = true;
            ReportParameter[] param = new ReportParameter[5];
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
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~//Rpts//rdlcReports//SaleReturnDetailReport.rdlc");
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ConfigureReports();
    }
}