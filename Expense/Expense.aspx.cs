using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Expense_Expense : System.Web.UI.Page
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Expense/Expense.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Expense/Expense.aspx" && view == true)
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
        grd.DataSource  = BL.GetSearchExpenseList((object)DBNull.Value, (object)DBNull.Value, (object)DBNull.Value);
        grd.DataBind();
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.PageIndex = e.NewPageIndex;
        btnSearch_Click(null, null);
    }
    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        var tblExpense = BL.GetExpenseList(e.CommandArgument);
        if (tblExpense.Rows.Count > 0)
        {
            hdID.Value = tblExpense.Rows[0]["ExpenseID"].ToString();
            cmbExpenseType.SelectedValue = tblExpense.Rows[0]["ExpenseTypeID"].ToString();
            cmbExpenseType_SelectedIndexChanged(null, null);
            cmbSubType.SelectedValue = tblExpense.Rows[0]["SubTypeID"].ToString();
            txtDiscription.Text = tblExpense.Rows[0]["Discription"].ToString();
            txtAmount.Text = tblExpense.Rows[0]["Amount"].ToString();
            txtExpenseDate.Text = Convert.ToDateTime(tblExpense.Rows[0]["ExpenseDate"]).ToString("MM/dd/yyyy");
            JQ.ShowHideControl(this, "btnSave", false);
            JQ.ShowModal(this, "ModalExpense");
            JQ.disabledControl(this, "ModalExpense");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        BL.ExpenseID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
        BL.ExpenseTypeID = Convert.ToInt32(cmbExpenseType.SelectedValue);
        BL.SubTypeID = Convert.ToInt32(cmbSubType.SelectedValue);
        BL.Discription = txtDiscription.Text;
        BL.Amount = Convert.ToDecimal(txtAmount.Text);
        BL.ExpenseDate = Convert.ToDateTime(txtExpenseDate.Text);
        BL.CreatedDate = DateTime.Now;
        BL.CreatedBy = PSMSSession.UserID;
        BL.InsertUpdateExpense(BL);       
        hdID.Value = "";
        fillGrid();
        JQ.CloseModal(this, "ModalExpense");
        JQ.ShowStatusMsg(this.Page, "1", "Expense Saved Successfully.");               
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        TextBox txtExpenseType = (TextBox)grd.HeaderRow.FindControl("txtExpenseType");
        TextBox txtSubType = (TextBox)grd.HeaderRow.FindControl("txtSubType");
        TextBox txtExpenseDate = (TextBox)grd.HeaderRow.FindControl("txtExpenseDate");
        if (string.IsNullOrEmpty(txtExpenseType.Text) && string.IsNullOrEmpty(txtSubType.Text) && string.IsNullOrEmpty(txtExpenseDate.Text))
            fillGrid();
        else
        {
            grd.DataSource = BL.GetSearchExpenseList(string.IsNullOrEmpty(txtExpenseType.Text) ? (object)DBNull.Value : txtExpenseType.Text,
                string.IsNullOrEmpty(txtSubType.Text) ? (object)DBNull.Value : txtSubType.Text,
                string.IsNullOrEmpty(txtExpenseDate.Text) ? (object)DBNull.Value : txtExpenseDate.Text);
            grd.DataBind();

            setValues(txtExpenseType.Text, txtSubType.Text, txtExpenseDate.Text);
        }
    }
    public void setValues(string sn, string sd, string ot)
    {
        TextBox txtExpenseType = (TextBox)grd.HeaderRow.FindControl("txtExpenseType");
        TextBox txtSubType = (TextBox)grd.HeaderRow.FindControl("txtSubType");
        TextBox txtExpenseDate = (TextBox)grd.HeaderRow.FindControl("txtExpenseDate");
        txtExpenseType.Text = sn;
        txtSubType.Text = sd;
        txtExpenseDate.Text = ot;
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var tblExpense = BL.GetExpenseList(e.CommandArgument);
        if (tblExpense.Rows.Count > 0)
        {
            hdID.Value = tblExpense.Rows[0]["ExpenseID"].ToString();
            cmbExpenseType.SelectedValue = tblExpense.Rows[0]["ExpenseTypeID"].ToString();
            cmbExpenseType_SelectedIndexChanged(null, null);
            cmbSubType.SelectedValue = tblExpense.Rows[0]["SubTypeID"].ToString();
            txtDiscription.Text = tblExpense.Rows[0]["Discription"].ToString();
            txtAmount.Text = tblExpense.Rows[0]["Amount"].ToString();
            txtExpenseDate.Text = Convert.ToDateTime(tblExpense.Rows[0]["ExpenseDate"]).ToString("MM/dd/yyyy");            
            JQ.ShowHideControl(this, "btnSave", true);
            JQ.ShowModal(this, "ModalExpense");
        }
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        hdDeleteID.Value = e.CommandArgument.ToString();
        JQ.ShowModal(this, "ModalConfirmation");
    }
    protected void btnConfirmation_Click(object sender, EventArgs e)
    {
        BL.DeleteCompany(Convert.ToInt32(hdDeleteID.Value));
        JQ.ShowStatusMsg(this.Page, "1", "Expense Deleted Successfully!");
        fillGrid();

        hdDeleteID.Value = "";
        JQ.CloseModal(this, "ModalConfirmation");
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        grd.DataSource = (DataTable)ViewState["Expense"];
        grd.DataBind();
        fillGrid();
    }
    protected void cmbExpenseType_SelectedIndexChanged(object sender, EventArgs e)
    {
        PM.Bind_DropDown(cmbSubType, new SubType_BLL().GetSubTypeCatgoryList(cmbExpenseType.SelectedValue), "SubType", "SubTypeID");
    }
}