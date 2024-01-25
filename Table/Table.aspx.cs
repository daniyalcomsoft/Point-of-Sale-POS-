using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Table_Table : System.Web.UI.Page
{
    Table_BLL BL = new Table_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Table/Table.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Table/Table.aspx" && view == true)
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
        
        if (BL.CheckandDeleteTable(Convert.ToInt32(hdDeleteID.Value)))
        {
            fillGrid();
            btnSearch_Click(null, null);
            JQ.ShowStatusMsg(this.Page, "1", "Table Deleted Successfully!");
        }
        else
        {
            JQ.ShowStatusMsg(this.Page, "3", "Table is in Used.");
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
        grdItems.DataSource = BL.GetSearchTableList(DBNull.Value);
        grdItems.DataBind();
    }
    protected void grdItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdItems.PageIndex = e.NewPageIndex;
        fillGrid();
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var Table = BL.GetTableList(e.CommandArgument);
        if (Table.Rows.Count > 0)
        {
            hdID.Value = Table.Rows[0]["TableID"].ToString();
            hdName.Value = Table.Rows[0]["TableName"].ToString();
            txtTable.Text = Table.Rows[0]["TableName"].ToString();
            txtsort.Text = Table.Rows[0]["Sort"].ToString();
            ckhActive.Checked = Convert.ToBoolean(Table.Rows[0]["Active"]);            
            JQ.ShowHideControl(this, "btnSave", true);
            JQ.ShowModal(this, "ModalTable");
        }
    }
    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        var Table = BL.GetTableList(e.CommandArgument);
        if (Table.Rows.Count > 0)
        {
            hdID.Value = Table.Rows[0]["TableID"].ToString();
            hdName.Value = Table.Rows[0]["TableName"].ToString();
            txtTable.Text = Table.Rows[0]["TableName"].ToString();
            txtsort.Text = Table.Rows[0]["Sort"].ToString();
            ckhActive.Checked = Convert.ToBoolean(Table.Rows[0]["Active"]);
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
            BL.TableID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
            BL.TableName = txtTable.Text;
            BL.Sort = string.IsNullOrEmpty(txtsort.Text) ? 0 : Convert.ToInt32(txtsort.Text);      
            BL.User = PSMSSession.UserID;
            BL.Active = ckhActive.Checked;          
            BL.Date = DateTime.Now;
            if (hdName.Value != txtTable.Text)
            {
                if (BL.CheckTableExist(txtTable.Text))
                {
                    JQ.ToastMsg(this.Page, "2", "Table Already Exist.", "bottom-right");
                }
                else
                {
                    BL.InsertUpdateTable(BL);
                    hdID.Value = "";
                    fillGrid();
                    JQ.CloseModal(this, "ModalTable");
                    JQ.ShowStatusMsg(this.Page, "1", "Table Saved Successfully.");
                }
            }
            else
            {
                BL.InsertUpdateTable(BL);
                hdID.Value = "";
                fillGrid();
                JQ.CloseModal(this, "ModalTable");
                JQ.ShowStatusMsg(this.Page, "1", "Table Saved Successfully.");
            }         
        }
        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Your request has not been processed due to a temporary error.");
        }
    }    
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        TextBox txtTable = (TextBox)grdItems.HeaderRow.FindControl("txtTable");
        if (string.IsNullOrEmpty(txtTable.Text))
            fillGrid();
        else
        {
            grdItems.DataSource = BL.GetSearchTableList(string.IsNullOrEmpty(txtTable.Text) ? (object)DBNull.Value : txtTable.Text);
            grdItems.DataBind();

            setValues(txtTable.Text);
        }
    }
    public void setValues(string sn)
    {
        TextBox txtTable = (TextBox)grdItems.HeaderRow.FindControl("txtTable");
        txtTable.Text = sn;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        hdID.Value = "";
        grdItems.DataSource = (DataTable)ViewState["TableList"];
        grdItems.DataBind();
        fillGrid();
    }
}