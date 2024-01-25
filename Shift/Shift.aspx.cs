using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shift_Shift : System.Web.UI.Page
{
    Shift_BLL BL = new Shift_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Shift/Shift.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Shift/Shift.aspx" && view == true)
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
        grd.DataSource = ViewState["ShiftList"] = BL.GetShiftList(DBNull.Value);
        grd.DataBind();

    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.PageIndex = e.NewPageIndex;
        btnSearch_Click(null, null);
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var Shift = BL.GetShiftList(e.CommandArgument);
        if (Shift.Rows.Count > 0)
        {

            hdID.Value = Shift.Rows[0]["ShiftID"].ToString();
            txtName.Text = Shift.Rows[0]["Name"].ToString();
            txtftime.Text = Shift.Rows[0]["ShiftTimeFrom"].ToString();
            txtttime.Text = Shift.Rows[0]["ShiftTimeTo"].ToString();
            ckhActive.Checked = Convert.ToBoolean(Shift.Rows[0]["Active"]);
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
        var Shift = BL.GetShiftList(e.CommandArgument);
        if (Shift.Rows.Count > 0)
        {
            hdID.Value = Shift.Rows[0]["ShiftID"].ToString();
            txtName.Text = Shift.Rows[0]["Name"].ToString();
            txtftime.Text = Shift.Rows[0]["ShiftTimeFrom"].ToString();
            txtttime.Text = Shift.Rows[0]["ShiftTimeTo"].ToString();
            ckhActive.Checked = Convert.ToBoolean(Shift.Rows[0]["Active"]);
            JQ.ShowHideControl(this, "btnSave", false);
            JQ.ShowModal(this, "ModalVendor");
            JQ.disabledControl(this, "ModalVendor");
        }


    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        BL.ShiftID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
        BL.Name = txtName.Text;
        BL.ShiftTimeFrom = txtftime.Text;
        BL.ShiftTimeTo = txtttime.Text;
        BL.Active = Convert.ToBoolean(ckhActive.Checked);
        BL.User = PSMSSession.UserID;
        BL.Date = DateTime.Now;
        BL.InsertUpdateShift(BL);
        hdID.Value = "";
        fillGrid();
        JQ.CloseModal(this, "ModalVendor");
        JQ.ShowStatusMsg(this.Page, "1", "Shift Saved Successfully.");

    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)ViewState["ShiftList"];
        string text = txtSearch.Text;
        DataRow[] dr = dt.Select("Name like '%" + text + "%' ");
        DataTable dtnew = new DataTable();
        if (dr.Count() > 0)
        {

            dtnew = dr.CopyToDataTable();
            grd.DataSource = dtnew;
            grd.DataBind();
        }
        else
        {
            grd.DataSource = dtnew;
            grd.DataBind();
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        grd.DataSource = (DataTable)ViewState["ShiftList"];
        grd.DataBind();
    }

    protected void btnConfirmation_Click(object sender, EventArgs e)
    {

        BL.CheckandDeleteShift(Convert.ToInt32(hdDeleteID.Value));
        JQ.ShowStatusMsg(this.Page, "1", "Shift Deleted Successfully!");
        fillGrid();

        hdDeleteID.Value = "";
        JQ.CloseModal(this, "ModalConfirmation");

    }
    protected void cmbCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtName.Focus();
    }
}