using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Riders_Riders : System.Web.UI.Page
{
    Riders_BLL BL = new Riders_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Riders/Riders.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Riders/Riders.aspx" && view == true)
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
        grd.DataSource = BL.GetSearchRidersList((object)DBNull.Value, (object)DBNull.Value);
        grd.DataBind();
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.PageIndex = e.NewPageIndex;
        fillGrid();
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var Rider = BL.GetRidersList(e.CommandArgument);
        if (Rider.Rows.Count > 0)
        {

            hdID.Value = Rider.Rows[0]["RiderID"].ToString();
            hdCell.Value = Rider.Rows[0]["PhoneNo"].ToString();
            txtName.Text = Rider.Rows[0]["Name"].ToString();           
            txtCell.Text = Rider.Rows[0]["PhoneNo"].ToString();
            txtCNIC.Text = Rider.Rows[0]["CNIC"].ToString();           
            txtAddress.Text = Rider.Rows[0]["Address"].ToString();
            ckhActive.Checked = Convert.ToBoolean(Rider.Rows[0]["Active"]);            
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
        var Rider = BL.GetRidersList(e.CommandArgument);
        if (Rider.Rows.Count > 0)
        {
            hdID.Value = Rider.Rows[0]["RiderID"].ToString();
            txtName.Text = Rider.Rows[0]["Name"].ToString();           
            txtCell.Text = Rider.Rows[0]["PhoneNo"].ToString();
            txtCNIC.Text = Rider.Rows[0]["CNIC"].ToString();
            txtAddress.Text = Rider.Rows[0]["Address"].ToString();
            ckhActive.Checked = Convert.ToBoolean(Rider.Rows[0]["Active"]);        
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
            BL.RiderID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
            BL.Name = txtName.Text;                       
            BL.PhoneNo = txtCell.Text;
            BL.CNIC = txtCNIC.Text;           
            BL.Address = txtAddress.Text;
            BL.Active = ckhActive.Checked;
            BL.User = PSMSSession.UserID;
            BL.Date = DateTime.Now;           
            if (hdCell.Value != txtCell.Text)
            {               
                if (BL.CheckRiderExist(txtCell.Text))
                {
                    JQ.ToastMsg(this.Page, "2", "Rider Already Exist.", "bottom-right");
                }
                else
                {
                    BL.InsertUpdateRiders(BL);
                    hdID.Value = "";
                    fillGrid();
                    JQ.CloseModal(this, "ModalVendor");
                    JQ.ShowStatusMsg(this.Page, "1", "Rider Saved Successfully.");
                }
            }
            else
            {
                BL.InsertUpdateRiders(BL);
                hdID.Value = "";
                fillGrid();
                JQ.CloseModal(this, "ModalVendor");
                JQ.ShowStatusMsg(this.Page, "1", "Rider Updated Successfully.");
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
            grd.DataSource = BL.GetSearchRidersList(string.IsNullOrEmpty(txtName.Text) ? (object)DBNull.Value : txtName.Text,
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
        grd.DataSource = (DataTable)ViewState["RiderList"];
        grd.DataBind();
        fillGrid();
    }
    protected void btnConfirmation_Click(object sender, EventArgs e)
    {
        if (BL.CheckandDeleteRiders(Convert.ToInt32(hdDeleteID.Value)))
        {
            fillGrid();            
            btnSearch_Click(null, null);
            JQ.ShowStatusMsg(this.Page, "1", "Rider Deleted Successfully!");
        }
        else
        {
            JQ.ShowStatusMsg(this.Page, "3", "Rider is in use.");
        }
        JQ.CloseModal(this, "ModalConfirmation");
    }
}