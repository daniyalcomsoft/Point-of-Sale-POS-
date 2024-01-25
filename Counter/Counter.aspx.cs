using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Counter_Counter : System.Web.UI.Page
{
    Counter_BLL BL = new Counter_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Counter/Counter.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Counter/Counter.aspx" && view == true)
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
        grd.DataSource = BL.GetSearchCounterList(DBNull.Value);
        grd.DataBind();
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.PageIndex = e.NewPageIndex;
        btnSearch_Click(null, null);
    }
    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        var tblLocations = BL.GetCounterList(e.CommandArgument);
        if (tblLocations.Rows.Count > 0)
        {
            txtCounterName.Text = tblLocations.Rows[0]["CounterName"].ToString();   
            txtDescription.Text = tblLocations.Rows[0]["Description"].ToString();         
            JQ.ShowHideControl(this, "btnSave", false);
            JQ.ShowModal(this, "ModalExpenseType");
            JQ.disabledControl(this, "ModalExpenseType");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        BL.CounterID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
        BL.CounterName = txtCounterName.Text;
        BL.Description = txtDescription.Text;
        BL.Date = DateTime.Now;
        BL.User = PSMSSession.UserID;
        BL.InsertUpdateCounter(BL);
        hdID.Value = "";
        fillGrid();
        JQ.CloseModal(this, "ModalExpenseType");
        JQ.ShowStatusMsg(this.Page, "1", "Counter Saved Successfully.");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        TextBox txtCounterName = (TextBox)grd.HeaderRow.FindControl("txtCounterName");
        if (string.IsNullOrEmpty(txtCounterName.Text))
            fillGrid();
        else
        {
            grd.DataSource = BL.GetSearchCounterList(string.IsNullOrEmpty(txtCounterName.Text) ? (object)DBNull.Value : txtCounterName.Text);
            grd.DataBind();

            setValues(txtCounterName.Text);
        }
    }
    public void setValues(string sn)
    {
        TextBox txtCounterName = (TextBox)grd.HeaderRow.FindControl("txtCounterName");
        txtCounterName.Text = sn;
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var tblCompany = BL.GetCounterList(e.CommandArgument);
        if (tblCompany.Rows.Count > 0)
        {
            hdID.Value = tblCompany.Rows[0]["CounterID"].ToString();
            txtCounterName.Text = tblCompany.Rows[0]["CounterName"].ToString();
            txtDescription.Text = tblCompany.Rows[0]["Description"].ToString();
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
        BL.DeleteCounter(Convert.ToInt32(hdDeleteID.Value));
        JQ.ShowStatusMsg(this.Page, "1", "Counter Deleted Successfully!");
        fillGrid();
        hdDeleteID.Value = "";
        JQ.CloseModal(this, "ModalConfirmation");
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        grd.DataSource = (DataTable)ViewState["GetLocationsList"];
        grd.DataBind();
        fillGrid();
    }
}