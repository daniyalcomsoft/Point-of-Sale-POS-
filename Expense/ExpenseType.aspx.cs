using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Expense_ExpenseType : System.Web.UI.Page
{
    ExpenseType_BLL BL = new ExpenseType_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Expense/ExpenseType.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Expense/ExpenseType.aspx" && view == true)
                {
                    fillGrid();  
                }
                else
                {
                    Response.Redirect("Default.aspx", false);
                }
            }
        }
    }
    public void fillGrid()
    {
        grd.DataSource = BL.GetSearchexpensetypeList(DBNull.Value);
        grd.DataBind();
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.PageIndex = e.NewPageIndex;
        btnSearch_Click(null, null);
    }
    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        var tblExpenseType = BL.GetExpensetypeList(e.CommandArgument);
        if (tblExpenseType.Rows.Count > 0)
        {
            txtExpenseType.Text = tblExpenseType.Rows[0]["ExpenseType"].ToString();            
            JQ.ShowHideControl(this, "btnSave", false);
            JQ.ShowModal(this, "ModalExpenseType");
            JQ.disabledControl(this, "ModalExpenseType");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            BL.ExpenseTypeID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
            BL.ExpenseType = txtExpenseType.Text;
            BL.CreatedDate = DateTime.Now;
            BL.CreatedBy = PSMSSession.UserID;
           
            if (hdName.Value != txtExpenseType.Text)
            {
                //if (BL.CheckExpenseTypeExist(txtExpenseType.Text))
                //{
                //    JQ.ToastMsg(this.Page, "2", "ExpenseType Already Exist.", "bottom-right");
                //}
                //else
                //{
                    BL.InsertUpdateExpensetype(BL);
                    hdID.Value = "";
                    fillGrid();
                    JQ.CloseModal(this, "ModalExpenseType");
                    JQ.ShowStatusMsg(this.Page, "1", "User Saved Successfully.");
               // }
            }
            else
            {
                BL.InsertUpdateExpensetype(BL);
                hdID.Value = "";
                fillGrid();
                JQ.CloseModal(this, "ModalExpenseType");
                JQ.ShowStatusMsg(this.Page, "1", "User Saved Successfully.");
            }
        }

        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Your request has not been processed due to a temporary error.");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        TextBox txtExpenseType = (TextBox)grd.HeaderRow.FindControl("txtExpenseType");
        if (string.IsNullOrEmpty(txtExpenseType.Text))
            fillGrid();
        else
        {
            grd.DataSource = BL.GetSearchexpensetypeList(string.IsNullOrEmpty(txtExpenseType.Text) ? (object)DBNull.Value : txtExpenseType.Text);
            grd.DataBind();

            setValues(txtExpenseType.Text);
        }
    }
    public void setValues(string sn)
    {
        TextBox txtExpenseType = (TextBox)grd.HeaderRow.FindControl("txtExpenseType");
        txtExpenseType.Text = sn;
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var Exp = BL.GetExpensetypeList(e.CommandArgument);
        if (Exp.Rows.Count > 0)
        {
            hdID.Value = Exp.Rows[0]["ExpenseTypeID"].ToString();
            txtExpenseType.Text = Exp.Rows[0]["ExpenseType"].ToString();
            hdName.Value = Exp.Rows[0]["ExpenseType"].ToString();
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
        //BL.DeleteExpensetype(Convert.ToInt32(hdDeleteID.Value));
        //JQ.ShowStatusMsg(this.Page, "1", "ExpenseType Deleted Successfully!");
        //fillGrid();
        //hdDeleteID.Value = "";
        //JQ.CloseModal(this, "ModalConfirmation");

        if (BL.CheckandDeleteExpenseType(Convert.ToInt32(hdDeleteID.Value)))
        {
            hdDeleteID.Value = "";
            fillGrid();
            btnSearch_Click(null, null);
            JQ.ShowStatusMsg(this.Page, "1", "ExpenseType Deleted Successfully!");
        }
        else
        {
            JQ.ShowStatusMsg(this.Page, "3", "ExpenseType is use.");
        }
        JQ.CloseModal(this, "ModalConfirmation");
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        grd.DataSource = (DataTable)ViewState["ExpenseTypeList"];
        grd.DataBind();
        fillGrid();
    }
}