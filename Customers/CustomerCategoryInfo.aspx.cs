using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customers_CustomerCategory : System.Web.UI.Page
{
    CustomerCategory_BLL BL = new CustomerCategory_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Customers/CustomerCategoryInfo.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Customers/CustomerCategoryInfo.aspx" && view == true)
                {
                    fillGrid();

                }
                else
                {
                    Response.Redirect("~/Default.aspx", false);
                }
            }

        }
    }

    public void fillGrid()
    {
        grdItems.DataSource = ViewState["CustomerCategoryList"] = BL.GetCustomerCategoryList(DBNull.Value);
        grdItems.DataBind();




    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {


        hdDeleteID.Value = e.CommandArgument.ToString();
        JQ.ShowModal(this, "ModalConfirmation");

    }
    protected void btnConfirmation_Click(object sender, EventArgs e)
    {

        int CategoryID = Convert.ToInt32(hdDeleteID.Value);
        if (BL.CheckExistAndDelete(CategoryID))
        {
            fillGrid();
            JQ.ShowStatusMsg(this.Page, "1", "Customer Category Deleted Successfully.");
        }
        else
        {
            JQ.ShowStatusMsg(this.Page, "3", "Category is in Use.");
        }
        JQ.CloseModal(this, "ModalConfirmation");
    }
    protected void grdItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdItems.PageIndex = e.NewPageIndex;
        fillGrid();
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var Item = BL.GetCustomerCategoryList(e.CommandArgument);
        if (Item.Rows.Count > 0)
        {

            hdID.Value = Item.Rows[0]["CustomerCategoryID"].ToString();
            hdName.Value = Item.Rows[0]["CategoryName"].ToString();
            txtName.Text = Item.Rows[0]["CategoryName"].ToString();

            JQ.ShowHideControl(this, "btnSave", true);
            JQ.ShowModal(this, "ModalCustomerCategory");
        }

    }

    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        var Item = BL.GetCustomerCategoryList(e.CommandArgument);
        if (Item.Rows.Count > 0)
        {

            txtName.Text = Item.Rows[0]["CategoryName"].ToString();

            JQ.ShowHideControl(this, "btnSave", false);
            JQ.ShowModal(this, "ModalCustomerCategory");
            JQ.disabledControl(this, "ModalCustomerCategory");
        }


    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];

            BL.CustomerCategoryID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);

            BL.CustomerCategory = txtName.Text;

            BL.User = PSMSSession.UserID;
            BL.Date = DateTime.Now;



            if (hdName.Value != txtName.Text)
            {
                if (BL.CheckCustomerategoryExist(txtName.Text))
                {
                    JQ.ToastMsg(this.Page, "2", "Customer  Cateogry Already Exist.", "bottom-right");
                }
                else
                {
                    BL.InsertUpdateCustomerCategory(BL);
                    hdID.Value = "";

                    fillGrid();
                    JQ.CloseModal(this, "ModalCustomerCategory");
                    JQ.ShowStatusMsg(this.Page, "1", "Customer  Category Saved Successfully.");
                }

            }
            else
            {



                BL.InsertUpdateCustomerCategory(BL);
                hdID.Value = "";
                hdName.Value = "";
                fillGrid();
                JQ.CloseModal(this, "ModalCustomerCategory");
                JQ.ShowStatusMsg(this.Page, "1", "Customer  Category Saved Successfully.");
            }

        }
        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Your request has not been processed due to a temporary error.");
        }



    }





    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)ViewState["CustomerCategoryList"];
        string text = txtSearch.Text;
        DataRow[] dr = dt.Select(" CategoryName like '%" + text + "%' ");
        DataTable dtnew = new DataTable();
        if (dr.Count() > 0)
        {

            dtnew = dr.CopyToDataTable();
            grdItems.DataSource = dtnew;
            grdItems.DataBind();
        }
        else
        {
            grdItems.DataSource = dtnew;
            grdItems.DataBind();
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        grdItems.DataSource = (DataTable)ViewState["CustomerCategoryList"];
        grdItems.DataBind();
    }
}