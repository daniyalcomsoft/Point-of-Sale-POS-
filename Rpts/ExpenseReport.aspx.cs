using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Rpts_ExpenseReport : System.Web.UI.Page
{
    Expense_BLL BL = new Expense_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Rpts/ExpenseReport.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Rpts/ExpenseReport.aspx" && view == true)
                {
                    PM.Bind_DropDownALL(cmbCategory, new ExpenseType_BLL().GetexpensetypeCatgoryList(null), "ExpenseType", "ExpenseTypeID");
                    cmbCategory_TextChanged(null, null);
                    Datefrom.Text = DateTime.Now.ToShortDateString();
                    Dateto.Text = DateTime.Now.ToShortDateString();
                    //ConfigureReports();                   
                }
                else
                {
                    Response.Redirect("Default.aspx", false);
                }
            }
        }
        selectinit();
    }
    public void selectinit()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), Guid.NewGuid().ToString(), "selectpic();", true);
    }
    private void ConfigureReports()
    {
        try
        { 
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            DataTable dt = new DataTable("ReportDataSet");
            ReportViewer1.LocalReport.EnableExternalImages = true;
            dt = BL.GetExpenseListReport(Datefrom.Text, Dateto.Text, Convert.ToInt32(cmbCategory.SelectedValue), Convert.ToInt32(cmbsubtype.SelectedValue));
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportParameter[] param = new ReportParameter[8];
            string pic = PSMSSession.PicPath;
            string CompanyName = PSMSSession.CompanyName;
            string Address = PSMSSession.CompanyAddress;
            string Phone = PSMSSession.CompanyPhone;
            param[0] = new ReportParameter("Picture", Server.MapPath("~/" + pic));
            param[1] = new ReportParameter("FromDate", Datefrom.Text);
            param[2] = new ReportParameter("ToDate", Dateto.Text);
            param[3] = new ReportParameter("Category", cmbCategory.SelectedItem.Text);
            param[4] = new ReportParameter("SubType", cmbsubtype.SelectedItem.Text);
            param[5] = new ReportParameter("CompanyName", CompanyName);
            param[6] = new ReportParameter("Address", Address);
            param[7] = new ReportParameter("PhoneNo", Phone);
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~//Rpts//rdlcReports//rptExpenseReport.rdlc");
            ReportDataSource datasource = new ReportDataSource("Table", dt);                      
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
    protected void cmbCategory_TextChanged(object sender, EventArgs e)
    {
        PM.Bind_DropDownALL(cmbsubtype, new SubType_BLL().GetSubTypeCatgoryList(null == "0" ? null : cmbCategory.SelectedValue), "SubType", "SubTypeID");
    }
}