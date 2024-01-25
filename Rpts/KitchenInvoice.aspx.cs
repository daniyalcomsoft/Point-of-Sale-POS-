using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Rpts_KitchenInvoice : System.Web.UI.Page
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Sales/Sales.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Sales/Sales.aspx" && view == true)
                {
                   
                      
                    ConfigureReports();
                    
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
             
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            DataTable dt = new DataTable("ReportDataSet");       
            dt = (DataTable)Session["kitdt"];
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~//Rpts//rdlcReports//InvoiceForKitchen.rdlc");
            ReportDataSource datasource = new ReportDataSource("Table", dt);
            ReportViewer1.LocalReport.EnableExternalImages = true;
            ReportParameter[] param = new ReportParameter[5];
            string pic = PSMSSession.PicPath;
            string CompanyPhone = PSMSSession.CompanyPhone;
            string CompanyEmail = PSMSSession.CompanyEmail;
            string CompanyAddress = PSMSSession.CompanyAddress;
            string CompanyName = PSMSSession.CompanyName;
            param[0] = new ReportParameter("Picture", Server.MapPath("~/" + pic));
            param[1] = new ReportParameter("Phone", CompanyPhone);
            param[2] = new ReportParameter("Email", CompanyEmail);
            param[3] = new ReportParameter("Address", CompanyAddress);
            param[4] = new ReportParameter("CompanyName", CompanyName);
            ReportViewer1.LocalReport.SetParameters(param);


            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource);
            ReportViewer1.LocalReport.Refresh();
            ReportViewer1.DataBind();
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            byte[] bytes = ReportViewer1.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
            WebClient client = new WebClient();
            if (bytes != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", bytes.Length.ToString());
                Response.BinaryWrite(bytes);
               
            }

        }
        catch (Exception ex)
        {

        }
      
    }
}