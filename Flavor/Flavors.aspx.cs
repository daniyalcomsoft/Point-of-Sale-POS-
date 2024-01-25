using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Flavor_Flavors : System.Web.UI.Page
{
    Flavor_BLL BL = new Flavor_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Flavor/Flavors.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Flavor/Flavors.aspx" && view == true)
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
    protected void btnConfirmation_Click(object sender, EventArgs e)
    {        
        if (BL.CheckandDeleteFlavor(Convert.ToInt32(hdDeleteID.Value)))
        {
            fillGrid();
            btnSearch_Click(null, null);
            JQ.ShowStatusMsg(this.Page, "1", "Flavor Deleted Successfully!");
        }
        else
        {
            JQ.ShowStatusMsg(this.Page, "3", "Flavor is in Used.");
        }
        JQ.CloseModal(this, "ModalConfirmation");        
    }

    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {    
        hdDeleteID.Value = e.CommandArgument.ToString();
        JQ.ShowModal(this, "ModalConfirmation");
    }
    public void fillGrid()
    {
        grdItems.DataSource = BL.GetSearchFlavorList(DBNull.Value);
        grdItems.DataBind();
    }
    protected void grdItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdItems.PageIndex = e.NewPageIndex;
        fillGrid();
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var Flavor = BL.GetFlavorList(e.CommandArgument);
        if (Flavor.Rows.Count > 0)
        {
            hdID.Value = Flavor.Rows[0]["FlavorID"].ToString();
            hdName.Value = Flavor.Rows[0]["FlavorName"].ToString();
            txtFlavor.Text = Flavor.Rows[0]["FlavorName"].ToString();
            txtsort.Text = Flavor.Rows[0]["Sort"].ToString();
            ckhActive.Checked = Convert.ToBoolean(Flavor.Rows[0]["Active"]);            
            JQ.ShowHideControl(this, "btnSave", true);
            JQ.ShowModal(this, "ModalTable");
        }
    }
    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        var Flavor = BL.GetFlavorList(e.CommandArgument);
        if (Flavor.Rows.Count > 0)
        {
            hdID.Value = Flavor.Rows[0]["FlavorID"].ToString();
            hdName.Value = Flavor.Rows[0]["FlavorName"].ToString();
            txtFlavor.Text = Flavor.Rows[0]["FlavorName"].ToString();
            txtsort.Text = Flavor.Rows[0]["Sort"].ToString();
            ckhActive.Checked = Convert.ToBoolean(Flavor.Rows[0]["Active"]);
            JQ.ShowHideControl(this, "btnSave", false);
            JQ.ShowModal(this, "ModalTable");
            JQ.disabledControl(this, "ModalTable");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            BL.FlavorID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
            BL.FlavorName = txtFlavor.Text;
            BL.Sort = string.IsNullOrEmpty(txtsort.Text) ? 0 : Convert.ToInt32(txtsort.Text);      
            BL.User = PSMSSession.UserID;
            BL.Active = ckhActive.Checked;          
            BL.Date = DateTime.Now;
            BL.IsCheck = false;         
            if (hdName.Value != txtFlavor.Text)
            {
                if (BL.CheckFlavorExist(txtFlavor.Text))
                {
                    JQ.ToastMsg(this.Page, "2", "Flavor Already Exist.", "bottom-right");
                }
                else
                {
                    BL.InsertUpdateFlavor(BL);
                    hdID.Value = "";
                    fillGrid();
                    JQ.CloseModal(this, "ModalTable");
                    JQ.ShowStatusMsg(this.Page, "1", "Flavor Saved Successfully.");
                }
            }
            else
            {
                BL.InsertUpdateFlavor(BL);
                hdID.Value = "";
                fillGrid();
                JQ.CloseModal(this, "ModalTable");
                JQ.ShowStatusMsg(this.Page, "1", "Flavor Update Successfully.");
            }         
        }
        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Your request has not been processed due to a temporary error.");
        }
    }    
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        TextBox txtFlavorName = (TextBox)grdItems.HeaderRow.FindControl("txtFlavorName");
        if (string.IsNullOrEmpty(txtFlavorName.Text) )
            fillGrid();
        else
        {
            grdItems.DataSource = BL.GetSearchFlavorList(string.IsNullOrEmpty(txtFlavorName.Text) ? (object)DBNull.Value : txtFlavorName.Text);
            grdItems.DataBind();

            setValues(txtFlavorName.Text);
        }
    }
    public void setValues(string sn)
    {
        TextBox txtFlavorName = (TextBox)grdItems.HeaderRow.FindControl("txtFlavorName");
        txtFlavorName.Text = sn;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        hdID.Value = "";
        grdItems.DataSource = (DataTable)ViewState["FlavorList"];
        grdItems.DataBind();
        fillGrid();
    }
}