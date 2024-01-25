using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class Waiters_Waiters : System.Web.UI.Page
{
    Waiters_BLL BL = new Waiters_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Waiters/Waiters.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Waiters/Waiters.aspx" && view == true)
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
        grd.DataSource  = BL.GetSearchWaiterList((object)DBNull.Value, (object)DBNull.Value);
        grd.DataBind();
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.PageIndex = e.NewPageIndex;
        btnSearch_Click(null, null);
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var Waiter = BL.GetWaiterList(e.CommandArgument);
        if (Waiter.Rows.Count > 0)
        {

            hdID.Value = Waiter.Rows[0]["WaiterID"].ToString();
            hdCell.Value = Waiter.Rows[0]["PhoneNo"].ToString();
            txtName.Text = Waiter.Rows[0]["Name"].ToString();
            txtCell.Text = Waiter.Rows[0]["PhoneNo"].ToString();
            txtCNIC.Text = Waiter.Rows[0]["CNIC"].ToString();
            txtAddress.Text = Waiter.Rows[0]["Address"].ToString();
            ckhActive.Checked = Convert.ToBoolean(Waiter.Rows[0]["Active"]);
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
        var Waiter = BL.GetWaiterList(e.CommandArgument);
        if (Waiter.Rows.Count > 0)
        {
            hdID.Value = Waiter.Rows[0]["WaiterID"].ToString();
            txtName.Text = Waiter.Rows[0]["Name"].ToString();            
            txtCell.Text = Waiter.Rows[0]["PhoneNo"].ToString();
            txtCNIC.Text = Waiter.Rows[0]["CNIC"].ToString();
            txtAddress.Text = Waiter.Rows[0]["Address"].ToString();
            ckhActive.Checked = Convert.ToBoolean(Waiter.Rows[0]["Active"]);           
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
            BL.WaiterID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
            BL.Name = txtName.Text;
            BL.PhoneNo = txtCell.Text;
            BL.CNIC = txtCNIC.Text;
            BL.Address = txtAddress.Text;
            BL.User = PSMSSession.UserID;
            BL.Active = Convert.ToBoolean(ckhActive.Checked);
            BL.Date = DateTime.Now;
            if (hdCell.Value != txtCell.Text)
            {
                if (BL.CheckWaiterExist(txtCell.Text))
                {
                    JQ.ToastMsg(this.Page, "2", "Waiter Already Exist.", "bottom-right");
                }
                else
                {
                    BL.InsertUpdateWaiters(BL);
                    hdID.Value = "";
                    fillGrid();
                    btnSearch_Click(null, null);
                    JQ.CloseModal(this, "ModalVendor");
                    JQ.ShowStatusMsg(this.Page, "1", "Waiter Saved Successfully.");
                }
            }
            else
            {
                BL.InsertUpdateWaiters(BL);
                hdID.Value = "";
                fillGrid();
                btnSearch_Click(null, null);
                JQ.CloseModal(this, "ModalVendor");
                JQ.ShowStatusMsg(this.Page, "1", "Waiter Saved Successfully.");
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
        TextBox txtPhone = (TextBox)grd.HeaderRow.FindControl("txtPhone");
        if (string.IsNullOrEmpty(txtName.Text) && string.IsNullOrEmpty(txtPhone.Text))
            fillGrid();
        else
        {
            grd.DataSource = BL.GetSearchWaiterList(string.IsNullOrEmpty(txtName.Text) ? (object)DBNull.Value : txtName.Text,
                string.IsNullOrEmpty(txtPhone.Text) ? (object)DBNull.Value : txtPhone.Text);
            grd.DataBind();

            setValues(txtName.Text, txtPhone.Text);
        }
    }
    public void setValues(string sn, string sd)
    {
        TextBox txtName = (TextBox)grd.HeaderRow.FindControl("txtName");
        TextBox txtPhone = (TextBox)grd.HeaderRow.FindControl("txtPhone");
        txtName.Text = sn;
        txtPhone.Text = sd;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        grd.DataSource = (DataTable)ViewState["WaiterList"];
        grd.DataBind();
        fillGrid();
    }
    protected void btnConfirmation_Click(object sender, EventArgs e)
    {
        if (BL.CheckandDeleteWaiters(Convert.ToInt32(hdDeleteID.Value)))
        {
            fillGrid();
            btnSearch_Click(null, null);           
            JQ.ShowStatusMsg(this.Page, "1", "Waiter Deleted Successfully!");
        }
        else
        {
            JQ.ShowStatusMsg(this.Page, "3", "Waiter is in Used.");
        }
        JQ.CloseModal(this, "ModalConfirmation");
    }
}