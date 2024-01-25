using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Sales_SaleDetails : System.Web.UI.Page
{
    Sales_BLL BL = new Sales_BLL();
    Reports_BLL BLRep = new Reports_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Sales/SaleDetails.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Sales/SaleDetails.aspx" && view == true)
                {
                    FillGrid();
                }
                else
                {
                    Response.Redirect("Default.aspx", false);
                }
            }
        }
    }    
    private void FillGrid()
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        grd.DataSource = BL.GetSearchSalesListBySearch((object)DBNull.Value, (object)DBNull.Value, (object)DBNull.Value);
        grd.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        TextBox txtSaleNo = (TextBox)grd.HeaderRow.FindControl("txtSaleNo");
        TextBox txtSaleDate = (TextBox)grd.HeaderRow.FindControl("txtSaleDate");
        TextBox txtOrderType = (TextBox)grd.HeaderRow.FindControl("txtOrderType");        
        object dtSale = string.IsNullOrEmpty(txtSaleDate.Text) ? (object)DBNull.Value : Convert.ToDateTime(txtSaleDate.Text).ToShortDateString();  
        if (string.IsNullOrEmpty(txtSaleNo.Text) && string.IsNullOrEmpty(txtSaleDate.Text) && string.IsNullOrEmpty(txtOrderType.Text))
            FillGrid();
        else
        {
            grd.DataSource = BL.GetSearchSalesListBySearch(string.IsNullOrEmpty(txtSaleNo.Text) ? (object)DBNull.Value : txtSaleNo.Text,
                dtSale, 
                string.IsNullOrEmpty(txtOrderType.Text) ? (object)DBNull.Value : txtOrderType.Text);
            grd.DataBind();

            setValues(txtSaleNo.Text, txtSaleDate.Text, txtOrderType.Text);
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        setValues(string.Empty, string.Empty,string.Empty);
        btnSearch_Click(null, null);
    }
    public void setValues(string sn,  string sd,string ot)
    {
        TextBox txtSaleNo = (TextBox)grd.HeaderRow.FindControl("txtSaleNo");
        TextBox txtSaleDate = (TextBox)grd.HeaderRow.FindControl("txtSaleDate");
        TextBox txtOrderType = (TextBox)grd.HeaderRow.FindControl("txtOrderType");
        txtSaleNo.Text = sn;
        txtSaleDate.Text = sd;
        txtOrderType.Text = ot;
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        hdSaleNo.Value = e.CommandArgument.ToString();
        JQ.ShowModal(this, "ModalConfirmation");
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.PageIndex = e.NewPageIndex;
        btnSearch_Click(null, null);
    }
    protected void btnConfirmation_Click(object sender, EventArgs e)
    {
        BL.CheckandDeleteSales(Convert.ToInt32(hdSaleNo.Value));
        JQ.ShowStatusMsg(this.Page, "1", "Sale Deleted Successfully!");
        btnSearch_Click(null, null);
        hdSaleNo.Value = "";        
        JQ.CloseModal(this, "ModalConfirmation");
    }
    protected void btnPaid_Command(object sender, CommandEventArgs e)
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        int SaleNo = Convert.ToInt32(e.CommandArgument);        
        BL.UpdateInvoiceStatus(SaleNo, PSMSSession.UserID, DateTime.Now);
        JQ.ShowStatusMsg(this.Page, "1", "Bill Paid Successfully!");
        btnSearch_Click(null, null);
    }
    protected void grd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lb = (Label)e.Row.FindControl("lbstatus");
            if (lb.Text == "UnPaid")
            { e.Row.FindControl("btnPaid").Visible = true; }
            else
            { e.Row.FindControl("btnPaid").Visible = false; }
            if(lb.Text == "UnPaid")
            { e.Row.FindControl("btnDelete").Visible = true; }
            else
            {
                e.Row.FindControl("btnDelete").Visible = false;
            }
        }
    }
    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        grddetail.DataSource = BL.GetSaleAgainstSN(Convert.ToInt32(e.CommandArgument));
        grddetail.DataBind();
        JQ.ShowModal(this, "ModalView");
    }

    protected void btnPrint_Command(object sender, CommandEventArgs e)
    {
        if(System.Configuration.ConfigurationManager.AppSettings["IsPdf"] == "true")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "printinv('" + e.CommandArgument.ToString() + "');", true);
        }
        else
        {
            ConfigureReports(Convert.ToInt32(e.CommandArgument.ToString()));
        }        
    }
    private void ConfigureReports(int SaleNo)
    {
        try
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            DataTable dt = new DataTable("ReportDataSet");
            dt = BLRep.GetSalesInvoice(SaleNo);   
            string pic = PSMSSession.PicPath;
            string CompanyPhone = PSMSSession.CompanyPhone;
            string CompanyEmail = PSMSSession.CompanyEmail;
            string CompanyAddress = PSMSSession.CompanyAddress;
            string CompanyName = PSMSSession.CompanyName;
            Microsoft.Reporting.WinForms.LocalReport report = new Microsoft.Reporting.WinForms.LocalReport();
            report.ReportPath = Server.MapPath("~//Rpts//rdlcReports//SaleInvoice.rdlc");
            Microsoft.Reporting.WinForms.ReportParameter[] param = new Microsoft.Reporting.WinForms.ReportParameter[5];
            param[0] = new Microsoft.Reporting.WinForms.ReportParameter("Picture", Server.MapPath("~/" + pic));
            param[1] = new Microsoft.Reporting.WinForms.ReportParameter("Phone", CompanyPhone);
            param[2] = new Microsoft.Reporting.WinForms.ReportParameter("Email", CompanyEmail);
            param[3] = new Microsoft.Reporting.WinForms.ReportParameter("Address", CompanyAddress);
            param[4] = new Microsoft.Reporting.WinForms.ReportParameter("CompanyName", CompanyName);
            report.EnableExternalImages = true;
            report.SetParameters(param);
            Microsoft.Reporting.WinForms.ReportDataSource ds = new Microsoft.Reporting.WinForms.ReportDataSource();
            ds.Name = "Table";
            ds.Value = dt;
            report.DataSources.Add(ds);
            new PrintRDLCReport().PrintToPrinter(report);
        }
        catch (Exception ex)
        {
        }
    }
}