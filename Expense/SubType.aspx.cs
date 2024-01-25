using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Expense_SubType : System.Web.UI.Page
{
    SubType_BLL BL = new SubType_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Expense/SubType.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Expense/SubType.aspx" && view == true)
                {
                    fillGrid();
                    PM.Bind_DropDown(cmbExpenseType, new ExpenseType_BLL().GetExpensetypeList(null), "ExpenseType", "ExpenseTypeID");
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
        grd.DataSource = BL.GetSearchSubtypeList((object)DBNull.Value, (object)DBNull.Value);
        grd.DataBind();
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.PageIndex = e.NewPageIndex;
        btnSearch_Click(null, null);
    }
    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        var tblsubType = BL.GetSubtypeList(e.CommandArgument);
        if (tblsubType.Rows.Count > 0)
        {
            cmbExpenseType.Text = tblsubType.Rows[0]["ExpenseTypeID"].ToString();
            txtSubType.Text = tblsubType.Rows[0]["SubType"].ToString();            
            JQ.ShowHideControl(this, "btnSave", false);
            JQ.ShowModal(this, "ModalExpenseType");
            JQ.disabledControl(this, "ModalExpenseType");
        }
    }
     protected void btnSave_Click(object sender, EventArgs e)
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        BL.SubTypeID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
        BL.ExpenseTypeID = Convert.ToInt32(cmbExpenseType.SelectedValue);
        BL.SubType = txtSubType.Text;
        BL.CreatedDate = DateTime.Now;
        BL.CreatedBy = PSMSSession.UserID;
        BL.InsertUpdateSubType(BL);
        hdID.Value = "";
        fillGrid();
        JQ.CloseModal(this, "ModalExpenseType");
        JQ.ShowStatusMsg(this.Page, "1", "Sub Type Saved Successfully.");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        TextBox txtExpenseType = (TextBox)grd.HeaderRow.FindControl("txtExpenseType");
        TextBox txtSubType = (TextBox)grd.HeaderRow.FindControl("txtSubType");
        if (string.IsNullOrEmpty(txtExpenseType.Text) && string.IsNullOrEmpty(txtSubType.Text) )
            fillGrid();
        else
        {
            grd.DataSource = BL.GetSearchSubtypeList(string.IsNullOrEmpty(txtExpenseType.Text) ? (object)DBNull.Value : txtExpenseType.Text,
                string.IsNullOrEmpty(txtSubType.Text) ? (object)DBNull.Value : txtSubType.Text);
            grd.DataBind();

            setValues(txtExpenseType.Text, txtSubType.Text);
        }
    }
    public void setValues(string sn, string sd)
    {
        TextBox txtExpenseType = (TextBox)grd.HeaderRow.FindControl("txtExpenseType");
        TextBox txtSubType = (TextBox)grd.HeaderRow.FindControl("txtSubType");
        txtExpenseType.Text = sn;
        txtSubType.Text = sd;
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var tblCompany = BL.GetSubtypeList(e.CommandArgument);
        if (tblCompany.Rows.Count > 0)
        {
            hdID.Value = tblCompany.Rows[0]["SubTypeID"].ToString();
            cmbExpenseType.SelectedValue = tblCompany.Rows[0]["ExpenseTypeID"].ToString();
            txtSubType.Text = tblCompany.Rows[0]["SubType"].ToString();            
            JQ.ShowHideControl(this, "btnSave", true);
            JQ.ShowModal(this, "ModalExpenseType");
        }
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        hdDeleteID.Value = e.CommandArgument.ToString();
        JQ.ShowModal(this, "ModalConfirmation");        
    }
    protected void btnConfirmation_Click(object sender, EventArgs e)
    {
        //BL.DeleteSubType(Convert.ToInt32(hdDeleteID.Value));
        //JQ.ShowStatusMsg(this.Page, "1", "SubType Deleted Successfully!");
        //fillGrid();
        //hdDeleteID.Value = "";
        //JQ.CloseModal(this, "ModalConfirmation");


        if (BL.CheckandDeleteSubType(Convert.ToInt32(hdDeleteID.Value)))
        {
            hdDeleteID.Value = "";
            fillGrid();
            btnSearch_Click(null, null);
            JQ.ShowStatusMsg(this.Page, "1", "SubType Deleted Successfully!");
            JQ.CloseModal(this, "ModalConfirmation");
        }
        else
        {
            hdDeleteID.Value = "";
            JQ.ShowStatusMsg(this.Page, "3", "SubType is use.");
            JQ.CloseModal(this, "ModalConfirmation");
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        grd.DataSource = (DataTable)ViewState["SubTypeList"];
        grd.DataBind();
        fillGrid();
    }
}