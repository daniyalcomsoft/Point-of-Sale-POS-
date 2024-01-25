using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sales_SalesReturn : System.Web.UI.Page
{
    Sales_BLL BL = new Sales_BLL();
    Reports_BLL BLRep = new Reports_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Sales/SalesReturn.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Sales/SalesReturn.aspx" && view == true)
                {
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
       if(!string.IsNullOrEmpty(txtSearch.Text))
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            DataTable dt = new DataTable();
            grd.DataSource = dt= BL.GetSalesBySalesNo(Convert.ToInt32(txtSearch.Text));
            grd.DataBind();
            if(dt.Rows.Count > 0)
            { 
            decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("TotalAmount"));
            grd.FooterRow.Cells[3].Text = "Total";
            grd.FooterRow.Cells[3].HorizontalAlign = HorizontalAlign.Right;
            grd.FooterRow.Cells[4].Text = total.ToString("N2");
            grd.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            grd.FooterRow.Cells[4].Font.Size = 14;
            grd.FooterRow.Cells[3].Font.Size = 14;
            }
        }       
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect("SalesReturn.aspx");
    }
    public void ClearRight()
    {
        txtSearch.Text = "";      
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        hdSaleID.Value = e.CommandArgument.ToString();
        JQ.ShowModal(this, "ModalConfirmation");
    }
    protected void btnConfirmation_Click(object sender, EventArgs e)
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        BL.DeleteSaleBySalesID(Convert.ToInt32(hdSaleID.Value), PSMSSession.UserID);
        JQ.ShowStatusMsg(this.Page, "1", "Item Deleted Successfully!");
        btnSearch_Click(null, null);
        hdSaleID.Value = "";
        JQ.CloseModal(this, "ModalConfirmation");
    }
      protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt16(txtQuantity.Text) > 0)
            {
                if (Convert.ToInt32(txtQuantity.Text) < Convert.ToInt32(hfQuantity.Value))
                    {            
                        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
                        BL.SalesID = hdSaleID.Value == "" ? 0 : Convert.ToInt32(hdSaleID.Value);
                        BL.Quantity = Convert.ToInt32(txtQuantity.Text);
                        BL.User = PSMSSession.UserID;           
                        BL.UpdateSalesReturn(BL);
                        btnSearch_Click(null, null);
                        JQ.CloseModal(this, "ModalVendor");
                        JQ.ShowStatusMsg(this.Page, "1", "Quantity Updated Successfully.");
                    }
                    else
                    {
                        JQ.ToastMsg(this.Page, "2", "Return quantity must be less than order quantity.", "bottom-right");
                    }
            }
            else
            {
                JQ.ToastMsg(this.Page, "2", "Return quantity must be greater than 0.", "bottom-right");
            }
    }
        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Your request has not been processed due to a temporary error.");
        }
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var Sale = BL.GetSalesListBySaleID(Convert.ToInt32(e.CommandArgument));
        if (Sale.Rows.Count > 0)
        {
            hdSaleID.Value = Sale.Rows[0]["SalesID"].ToString();
            hfQuantity.Value = Sale.Rows[0]["Quantity"].ToString();
            txtQuantity.Text = Sale.Rows[0]["Quantity"].ToString();
            JQ.ShowHideControl(this, "btnSave", true);
            JQ.ShowModal(this, "ModalVendor");
        }
    }
}