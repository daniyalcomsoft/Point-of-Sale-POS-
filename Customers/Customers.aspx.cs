using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customers_Customers : System.Web.UI.Page
{
    Customers_BLL BL = new Customers_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Customers/Customers.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Customers/Customers.aspx" && view == true)
                {
                    fillGrid();                 
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
    public void fillGrid()
    {
        grd.DataSource = BL.GetSearchCustomerList((object)DBNull.Value, (object)DBNull.Value, (object)DBNull.Value);
        grd.DataBind();
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.PageIndex = e.NewPageIndex;
        btnSearch_Click(null, null);
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var customer = BL.GetCustomerList(e.CommandArgument);
        if (customer.Rows.Count > 0)
        {
            hdID.Value = customer.Rows[0]["CustomerID"].ToString();
            hdcell.Value = customer.Rows[0]["PhoneNo"].ToString();
            txtName.Text = customer.Rows[0]["Name"].ToString();
            txtCell.Text = customer.Rows[0]["PhoneNo"].ToString();
            txtAddress.Text = customer.Rows[0]["Address"].ToString();
            ckhActive.Checked = Convert.ToBoolean(customer.Rows[0]["Active"]);
            JQ.ShowHideControl(this, "btnSave", true);
            JQ.ShowModal(this, "ModalVendor");
        }
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        hdDeleteID.Value = e.CommandArgument.ToString();
        JQ.ShowModal(this, "ModalConfirmation");
    }
    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        var customer = BL.GetCustomerList(e.CommandArgument);
        if (customer.Rows.Count > 0)
        {
            hdID.Value = customer.Rows[0]["CustomerID"].ToString();
            txtName.Text = customer.Rows[0]["Name"].ToString();
            txtCell.Text = customer.Rows[0]["PhoneNo"].ToString();
            txtAddress.Text = customer.Rows[0]["Address"].ToString();
            ckhActive.Checked = Convert.ToBoolean(customer.Rows[0]["Active"]);
            JQ.ShowHideControl(this, "btnSave", false);
            JQ.ShowModal(this, "ModalVendor");
            JQ.disabledControl(this, "ModalVendor");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            BL.CustomerID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
            BL.Name = txtName.Text;
            BL.PhoneNo = txtCell.Text;
            BL.Address = txtAddress.Text;
            BL.User = PSMSSession.UserID;
            BL.Date = DateTime.Now;
            BL.Active = Convert.ToBoolean(ckhActive.Checked);
            if (hdcell.Value != txtCell.Text)
            {
                if (BL.CheckCustomerExist(txtCell.Text))
                {
                    JQ.ToastMsg(this.Page, "2", "Customer Already Exist.", "bottom-right");
                }
                else
                {
                    BL.InsertUpdateCustomer(BL);
                    hdID.Value = "";
                    fillGrid();
                    btnSearch_Click(null, null);
                    JQ.CloseModal(this, "ModalVendor");
                    JQ.ShowStatusMsg(this.Page, "1", "Customer Saved Successfully.");
                }
            }
            else
            {
                BL.InsertUpdateCustomer(BL);
                hdID.Value = "";
                fillGrid();
                btnSearch_Click(null, null);                
                JQ.CloseModal(this, "ModalVendor");
                JQ.ShowStatusMsg(this.Page, "1", "Customer Saved Successfully.");
            }
        }
        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Your request has not been processed due to a temporary error.");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        TextBox txtName = (TextBox)grd.HeaderRow.FindControl("txtName");
        TextBox txtPhoneNo = (TextBox)grd.HeaderRow.FindControl("txtPhoneNo");
        TextBox txtAddress = (TextBox)grd.HeaderRow.FindControl("txtAddress");
        if (string.IsNullOrEmpty(txtName.Text) && string.IsNullOrEmpty(txtPhoneNo.Text) && string.IsNullOrEmpty(txtAddress.Text))
            fillGrid();
        else
        {
            grd.DataSource = BL.GetSearchCustomerList(string.IsNullOrEmpty(txtName.Text) ? (object)DBNull.Value : txtName.Text,
                string.IsNullOrEmpty(txtPhoneNo.Text) ? (object)DBNull.Value : txtPhoneNo.Text,
                string.IsNullOrEmpty(txtAddress.Text) ? (object)DBNull.Value : txtAddress.Text);
            grd.DataBind();

            setValues(txtName.Text, txtPhoneNo.Text, txtAddress.Text);
        }
    }
    public void setValues(string sn, string sd, string ot)
    {
        TextBox txtName = (TextBox)grd.HeaderRow.FindControl("txtName");
        TextBox txtPhoneNo = (TextBox)grd.HeaderRow.FindControl("txtPhoneNo");
        TextBox txtAddress = (TextBox)grd.HeaderRow.FindControl("txtAddress");
        txtName.Text = sn;
        txtPhoneNo.Text = sd;
        txtAddress.Text = ot;
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        grd.DataSource = (DataTable)ViewState["CustomerList"];
        grd.DataBind();
        fillGrid();
    }
    protected void btnConfirmation_Click(object sender, EventArgs e)
    {
        BL.CheckandDeleteCustomer(Convert.ToInt32(hdDeleteID.Value));
        JQ.ShowStatusMsg(this.Page, "1", "Customer Deleted Successfully!");
        fillGrid();

        hdDeleteID.Value = "";
        JQ.CloseModal(this, "ModalConfirmation");
    }
}