using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sales_Dinning : System.Web.UI.Page
{   
    Items_BLL BL_Item = new Items_BLL();
    Reports_BLL BL_Report = new Reports_BLL();
    ItemCategory_BLL BL_ItemCategory = new ItemCategory_BLL();
    Sales_BLL BL_Sales = new Sales_BLL();
    DealItem_BLL BL_DealItem = new DealItem_BLL();
    Table_BLL BL_Table = new Table_BLL();
    Reports_BLL BLRep = new Reports_BLL();
    CategoryFlavorMapping_BLL CFMBL = new CategoryFlavorMapping_BLL();
    ItemsFlavorMapping_BLL ifm = new ItemsFlavorMapping_BLL();
    SalesItemFlavor_BLL SIF = new SalesItemFlavor_BLL();  
    Customers_BLL CBL = new Customers_BLL();
    BusinessInfo_BLL BI = new BusinessInfo_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Sales/Sales.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (PSMSSession.EnableDeliveryOnSale == true)
            {
                DeliveryID.Visible = true;
            }
            else
            {
                DeliveryID.Visible = false;
            }

            if (PSMSSession.EnableDineInnOnSale == true)
            {
                DineInnID.Visible = true;
            }
            else
            {
                DineInnID.Visible = false;
            }

            if (PSMSSession.EnableTakeAwayOnSale == true)
            {
                TakeAwayID.Visible = true;
            }
            else
            {
                TakeAwayID.Visible = false;
            }
            if (PSMSSession.IsTax == true)
            {
                txtTax.Visible = true;
                TaxName.Visible = true;
                divtax.Visible = true;
            }
            else
            {
                txtTax.Visible = false;
                TaxName.Visible = false;
                divtax.Visible = false;
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Sales/Sales.aspx" && view == true)
                {

                    var dtt = new Waiters_BLL().WaiterNameForCash(null);
                    if (dtt.Rows.Count > 0)
                    {
                        cmbWaiter.Text = dtt.Rows[0]["Name"].ToString();
                        hfWaiterId.Value = dtt.Rows[0]["WaiterID"].ToString();
                    }

                    fillItemList();
                    fillGrid();
                    hdVkey.Value = PSMSSession.VirtualKeyboard.ToString();
                }
                else
                {
                    Response.Redirect("Default.aspx", false);
                }
            }
        }
        selectinit();
        JQ.setXScrollposition(Page, "div_table", "posi_table");
        JQ.setYScrollposition(this.Page, "div_cat", "posi_cat");
        JQ.setYScrollposition(this.Page, "div_itm", "posi_itm");
        JQ.setYScrollposition(this.Page, "div_itmdet", "posi_itmdet");
        JQ.setActiveItem(this.Page, "hdActivecat", "div_cat");
        JQ.setActiveItem(this.Page, "hdActiveitm", "div_itm");
        JQ.setActiveItem(this.Page, "hdActivetbl", "div_table");
    }
        public DataTable fillTable()
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        DataTable tdt = new Table_BLL().GetTableListForDinein(DBNull.Value, PSMSSession.UserID);

        grdtable.DataSource = tdt;
        grdtable.DataBind();
        return tdt;
    }
    public void fillItemList()
    {
        var tdt = fillTable();
        if (tdt.Rows.Count > 0)
        {
            var getcat = new ItemCategory_BLL().GetSaleItemCategoryList(DBNull.Value);
            if (getcat.Rows.Count > 0)
            {
                grd.DataSource = getcat.Select("Active = 1").CopyToDataTable();
                grd.DataBind();
            }
            btnItems_Click(null, null);

            CommandEventArgs a = new CommandEventArgs("Change", tdt.Rows[0]["TableID"]+ "," + tdt.Rows[0]["TableName"]);
            ShowTable_Command(null, a);
        }
    }
    protected void txtCSearch_TextChanged(object sender, EventArgs e)
    {
        grd.DataSource = new ItemCategory_BLL().GetSaleItemCategoryList(string.IsNullOrEmpty(txtCSearch.Text) ? (object)DBNull.Value : txtCSearch.Text);
        grd.DataBind();
    }

    public void selectinit()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), Guid.NewGuid().ToString(), "selectpic();", true);
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        BL_Sales.CheckandDeleteTableDeliverySales(Convert.ToInt32(e.CommandArgument));
        fillGrid();
        hdSalesID.Value = string.Empty;
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        var Item = BL_Sales.GetSalesList(PSMSSession.UserID, Convert.ToInt32(e.CommandArgument));
        if (Item.Rows.Count > 0)
        {
            hdSalesID.Value = Item.Rows[0]["SalesID"].ToString();
            hddItemID.Value = Item.Rows[0]["ItemID"].ToString();
            hdfItemID.Value = Item.Rows[0]["ItemID"].ToString();
            numpadoutput.Value = txtQty.Text = Item.Rows[0]["Quantity"].ToString();
        }
        var ItmDlTemp = ifm.GetItemOrDeal(Convert.ToInt32(hddItemID.Value));
        List<Items> ItemList = new List<Items>();
        ItemList = (from DataRow dr in ItmDlTemp.Rows
                    select new Items()
                    {
                        ItemID = Convert.ToInt32(dr["ItemID"]),
                        Name = dr["Name"].ToString() + " " + dr["Num"].ToString(),
                        lstFlavor = (from DataRow drf in CFMBL.GetFlavorsForSaleEditDining(Convert.ToInt32(dr["ItemID"]), Convert.ToInt32(e.CommandArgument)).Rows
                                     select new Flavors()
                                     {
                                         FlavorID = Convert.ToInt32(drf["FlavorID"]),
                                         FlavorName = drf["FlavorName"].ToString(),
                                         ItemID = Convert.ToInt32(drf["ItemID"]),
                                         Num = Convert.ToInt32(dr["Num"]),
                                         Check = Convert.ToBoolean(drf["Check"])
                                     }).ToList(),
                    }).ToList();
        var fllist = ItemList.Where(x => x.lstFlavor.Count > 0).Select(x => x).ToList();
        if (fllist.Count() > 0)
        {
            JQ.ShowModal(this, "ModalItemOrDeal");
            lstItems.DataSource = ItemList;
            lstItems.DataBind();
        }
        else
        {
            btnAddCashReceived.Visible = false;
            btnAddDiscount.Visible = false;
            btnSave.Visible = true;
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), Guid.NewGuid().ToString(), "setcmdID('" + e.CommandArgument + "','div_itm');", true);
            JQ.ShowNumModal(this);
        }
    }
    protected void ShowImages_Command(object sender, CommandEventArgs e)
    {
        lstview.DataSource = BL_ItemCategory.GetCategoryItems(e.CommandArgument);
        lstview.DataBind();
        btnDeals.Style.Add("border-top", "");
        btnItems.Style.Add("border-top", "6px solid #212121");
        btnItems.Enabled = false;
        btnDeals.Enabled = true;
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), Guid.NewGuid().ToString(), "setcmdID('" + e.CommandArgument + "','div_cat');", true);
    }
    public void fillGrid()
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        DataTable dt = new DataTable();
        TaxName.Text = (PSMSSession.TaxName + " " + PSMSSession.TaxPercent + " % ");
        grdItems.DataSource = dt = BL_Sales.GetTableSales(PSMSSession.UserID, Convert.ToInt32(hdTableID.Value == string.Empty ? "0" : hdTableID.Value));
        grdItems.DataBind();
        fillTable();
        var customer = new Customers_BLL().CusNameForCash(null);
        var Shift = new Shift_BLL().ShiftNameForCash(null);
        if (dt.Rows.Count > 0)
        {
            txtTotal.Text = Convert.ToDecimal(dt.Compute("Sum(Total)", "")).ToString("0");
            var Tax = BI.GetTaxPercent();
            if (Tax.Rows.Count > 0)
            {
                if (PSMSSession.IsTax == true)
                {
                    hdtxtper.Value = Tax.Rows[0]["TaxPercentage"].ToString();
                    txtTax.Text = ((Convert.ToDecimal(txtTotal.Text) * Convert.ToDecimal(hdtxtper.Value)) / 100).ToString("0");
                }
            }
            if (string.IsNullOrEmpty(txtDiscount.Text))
                txtnetTotal.Text = txtTotal.Text = (Convert.ToDecimal(dt.Compute("Sum(Total)", "")) + (Convert.ToDecimal(txtTax.Text))).ToString("0");
            else
                txtnetTotal.Text = txtTotal.Text = ((Convert.ToDecimal(dt.Compute("Sum(Total)", "")) - Convert.ToDecimal(txtDiscount.Text)) + (Convert.ToDecimal(txtTax.Text))).ToString("0");
            txtDiscount.Text = dt.Rows[0]["Discount"].ToString() == "" ? "0" : Convert.ToDecimal(dt.Rows[0]["Discount"]).ToString("0");
            txtCashReceived.Text = dt.Rows[0]["ReceivedAmount"].ToString() == "" ? "0" : Convert.ToDecimal(dt.Rows[0]["ReceivedAmount"]).ToString("0");
            cmbWaiter.Text = dt.Rows[0]["Name"].ToString() == "" ? "0" : dt.Rows[0]["Name"].ToString();
            if (dt.Rows[0]["CustomerID"].ToString() == "")
            {
                if (customer.Rows.Count > 0)
                {
                    hfCustomerId.Value = customer.Rows[0]["CustomerID"].ToString();
                    txtCustomer.Text = customer.Rows[0]["Name"].ToString();
                }
            }
            else
            {
                hfCustomerId.Value = dt.Rows[0]["CustomerID"].ToString();
                txtCustomer.Text = dt.Rows[0]["CustomerName"].ToString();
            }
            txtTotal.Text = Convert.ToDecimal(dt.Compute("Sum(Total)", "")).ToString("0");

            if (string.IsNullOrEmpty(txtDiscount.Text))
                txtnetTotal.Text = Convert.ToDecimal(dt.Compute("Sum(Total)", "")).ToString("0");
            else
                txtnetTotal.Text = (Convert.ToDecimal(dt.Compute("Sum(Total)", "")) - Convert.ToDecimal(txtDiscount.Text) + Convert.ToDecimal(txtTax.Text)).ToString("0");

            hdSaleNo.Value = dt.Rows[0]["SaleNo"].ToString();
            txtCashReceived_TextChanged(null, null);
            ReceivedAndDiscount();            
            txtCustomer_TextChanged(null, null);
            txtReturnAmount.Text = "0";
        }
        else
        {
            if (customer.Rows.Count > 0)
            {
                hfCustomerId.Value = customer.Rows[0]["CustomerID"].ToString();
                txtCustomer.Text = customer.Rows[0]["Name"].ToString();
            }
            txtTotal.Text = "0";
            txtDiscount.Text = "0";
            txtnetTotal.Text = "0";
            txtCashReceived.Text = "0";
            txtReturnAmount.Text = "0";
            txtTax.Text = "0";
            fillTable();
            hdSaleNo.Value = "";
        }
    }
    protected void ShowItems_Command(object sender, CommandEventArgs e)
    {
        hddItemID.Value = e.CommandArgument.ToString();
        numpadoutput.Value = string.Empty;
        btnAddCashReceived.Visible = false;
        btnAddDiscount.Visible = false;
        btnSave.Visible = true;
        hditmID.Value = e.CommandArgument.ToString();
        hdfItemID.Value = e.CommandArgument.ToString();
        var ItmDl = ifm.GetItemOrDeal(Convert.ToInt32(hditmID.Value));
        List<Items> ItemList = new List<Items>();
        ItemList = (from DataRow dr in ItmDl.Rows
                    select new Items()
                    {
                        ItemID = Convert.ToInt32(dr["ItemID"]),
                        Name = dr["Name"].ToString() + " " + dr["Num"].ToString(),
                        lstFlavor = (from DataRow drf in CFMBL.GetFlavorsForSale(Convert.ToInt32(dr["ItemID"])).Rows
                                     select new Flavors()
                                     {
                                         FlavorID = Convert.ToInt32(drf["FlavorID"]),
                                         FlavorName = drf["FlavorName"].ToString(),
                                         ItemID = Convert.ToInt32(drf["ItemID"]),
                                         Num = Convert.ToInt32(dr["Num"]),
                                         Check = false
                                     }).ToList(),
                    }).ToList();
        var fllist = ItemList.Where(x => x.lstFlavor.Count > 0).Select(x => x).ToList();
        if (fllist.Count() > 0)
        {
            txtQty.Text = "1";
            JQ.ShowModal(this, "ModalItemOrDeal");
            lstItems.DataSource = ItemList;
            lstItems.DataBind();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), Guid.NewGuid().ToString(), "setcmdID('" + e.CommandArgument + "','div_itm');", true);
            JQ.ShowNumModal(this);
        }
    }
    protected void txtDiscount_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtDiscount.Text))
            txtnetTotal.Text = txtCashReceived.Text = ((Convert.ToDecimal(txtTotal.Text) - Convert.ToDecimal(txtDiscount.Text)) + Convert.ToDecimal(txtTax.Text)).ToString("0");
        else
            txtnetTotal.Text = txtCashReceived.Text = txtTotal.Text;
        txtCashReceived_TextChanged(null, null);
    }
    protected void btnInvoicePrint_Click(object sender, EventArgs e)
    {
        if (grdItems.Rows.Count == 0)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Please Select One Item.");
        }
        else
        {
            if (System.Configuration.ConfigurationManager.AppSettings["IsPdf"] == "true")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "printinv('" + hdSaleNo.Value + "');", true);
            }
            else
            {
                ConfigureReports(Convert.ToInt32(hdSaleNo.Value));
            }
        }
    }
    private void ConfigureReports(int SaleNo)
    {
        try
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            DataTable dt = new DataTable("ReportDataSet");
            dt = BLRep.GetSalesInvoice(SaleNo);
            string pic = PSMSSession.PicPath;
            string CompanyPhone = PSMSSession.CompanyPhone;
            string CompanyEmail = PSMSSession.CompanyEmail;
            string CompanyAddress = PSMSSession.CompanyAddress;
            string CompanyName = PSMSSession.CompanyName;
            Microsoft.Reporting.WinForms.LocalReport report = new Microsoft.Reporting.WinForms.LocalReport();
            report.ReportPath = Server.MapPath("~//Rpts//rdlcReports//DiningSaleInvoice.rdlc");
            Microsoft.Reporting.WinForms.ReportParameter[] param = new Microsoft.Reporting.WinForms.ReportParameter[5];
            param[0] = new Microsoft.Reporting.WinForms.ReportParameter("Picture", Server.MapPath("~/" + pic));
            param[1] = new Microsoft.Reporting.WinForms.ReportParameter("Phone", CompanyPhone);
            param[2] = new Microsoft.Reporting.WinForms.ReportParameter("Email", CompanyEmail);
            param[3] = new Microsoft.Reporting.WinForms.ReportParameter("Address", CompanyAddress);
            param[4] = new Microsoft.Reporting.WinForms.ReportParameter("CompanyName", CompanyName);
            report.EnableExternalImages = true;
            report.SetParameters(param);
            Microsoft.Reporting.WinForms.ReportDataSource ds = new Microsoft.Reporting.WinForms.ReportDataSource();
            ds.Name = "Table";
            ds.Value = dt;
            report.DataSources.Add(ds);
            new PrintRDLCReport().PrintToPrinter(report);
        }
        catch (Exception ex)
        {
        }
    }
    protected void txtCashReceived_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtnetTotal.Text) && !string.IsNullOrEmpty(txtCashReceived.Text))
            txtReturnAmount.Text = (Convert.ToDecimal(txtCashReceived.Text) - Convert.ToDecimal(txtnetTotal.Text)).ToString("0");
        else
            txtReturnAmount.Text = "0";
    }

    public void ReceivedAndDiscount()
    {
        BL_Sales.TableID = Convert.ToInt32(hdTableID.Value);
        BL_Sales.Discount = Convert.ToDecimal(txtDiscount.Text);
        BL_Sales.ReceivedAmount = Convert.ToDecimal(txtCashReceived.Text);
        BL_Sales.UpdateDiscountReceived(BL_Sales);
    }
    protected void btnAddDiscount_Click(object sender, EventArgs e)
    {
        decimal disc = string.IsNullOrEmpty(numpadoutput.Value) || Convert.ToDecimal(numpadoutput.Value) < 0 ? 0 : Convert.ToDecimal(numpadoutput.Value);
        if (disc > Convert.ToDecimal(txtnetTotal.Text))
            txtDiscount.Text = "0";
        else
            txtDiscount.Text = disc.ToString("0");
        JQ.CloseNumModal(this);
        txtDiscount_TextChanged(null, null);
        ReceivedAndDiscount();
    }
    protected void btnAddCashReceived_Click(object sender, EventArgs e)
    {
        txtCashReceived.Text = string.IsNullOrEmpty(numpadoutput.Value) || Convert.ToDecimal(numpadoutput.Value) < 0 ? "0" : Convert.ToDecimal(numpadoutput.Value).ToString("0");
        JQ.CloseNumModal(this);
        txtCashReceived_TextChanged(null, null);
        ReceivedAndDiscount();
    }
    protected void btnDiscount_Click(object sender, EventArgs e)
    {
        numpadoutput.Value = txtDiscount.Text == "0" ? "" : txtDiscount.Text;
        btnAddDiscount.Visible = true;
        btnAddCashReceived.Visible = false;
        btnSave.Visible = false;
        JQ.ShowNumModal(this);
    }
    protected void btnCashReceived_Click(object sender, EventArgs e)
    {
        numpadoutput.Value = txtCashReceived.Text == "0" ? "" : txtCashReceived.Text; ;
        btnAddCashReceived.Visible = true;
        btnAddDiscount.Visible = false;
        btnSave.Visible = false;
        JQ.ShowNumModal(this);
    }
    protected void ShowTable_Command(object sender, CommandEventArgs e)
    {
        DataTable dt = new DataTable();
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        string[] tbval = e.CommandArgument.ToString().Split(',');
        if(tbval.Length>1)
        {
        hdTableID.Value = tbval[0];
            lbtablename.InnerHtml = "Dining Table : <span style='font-weight:normal;'> " + tbval[1] + "</span>";
            fillGrid();
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), Guid.NewGuid().ToString(), "setcmdID('" + hdTableID.Value + "','div_table');", true);
        JQ.CloseModal(this, "ModalDiningTable");
        }
    }
    protected void btnPaid_Click(object sender, EventArgs e)
    {
        if (Convert.ToDecimal(txtCashReceived.Text) < Convert.ToDecimal(txtnetTotal.Text))
        {
            JQ.ShowStatusMsg(this.Page, "4", "Cash received amount must be greater than or equal net amount.");
        }
        else
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            BL_Sales.TableID = Convert.ToInt32(hdTableID.Value);
            BL_Sales.PaidBy = PSMSSession.UserID;
            BL_Sales.PaidDate = DateTime.Now;
            BL_Sales.FinalPayment(BL_Sales);
            Response.Redirect("Dining.aspx");
        }
    }
    protected void cmbWaiter_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cmbWaiter.Text != "0")
        {
            BL_Sales.TableID = Convert.ToInt32(hdTableID.Value);
            BL_Sales.WaiterID = Convert.ToInt32(cmbWaiter.Text);
            BL_Sales.UpdateWaiter(BL_Sales);
        }
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        if (!btnItems.Enabled)
        {
            lstview.DataSource = new Items_BLL().GetSearchActiveItemList(string.IsNullOrEmpty(txtSearch.Text) ? (object)DBNull.Value : txtSearch.Text);
            lstview.DataBind();
        }
        if (!btnDeals.Enabled)
        {
            lstview.DataSource = new DealItem_BLL().GetSearchDealsList(string.IsNullOrEmpty(txtSearch.Text) ? (object)DBNull.Value : txtSearch.Text);
            lstview.DataBind();
        }
    }
    protected void btnItems_Click(object sender, EventArgs e)
    {
        lstview.DataSource = new Items_BLL().GetSearchActiveItemList(string.IsNullOrEmpty(txtSearch.Text) ? (object)DBNull.Value : txtSearch.Text);
        lstview.DataBind();
        //btnDeals.Style.Add("border-top", "");
        //btnItems.Style.Add("border-top", "6px solid #212121");
        btnItems.Enabled = false;
        btnDeals.Enabled = true;
    }
    protected void btnDeals_Click(object sender, EventArgs e)
    {
        lstview.DataSource = new DealItem_BLL().GetSearchDealsList(string.IsNullOrEmpty(txtSearch.Text) ? (object)DBNull.Value : txtSearch.Text);
        lstview.DataBind();
        //btnItems.Style.Add("border-top", "");
        //btnDeals.Style.Add("border-top", "6px solid #212121");
        btnItems.Enabled = true;
        btnDeals.Enabled = false;
    }
    private void ConfigureKitReports(DataTable dt)
    {
        try
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            DataTable dt1 = new DataTable("ReportDataSet");
            dt1 = dt;
            string pic = PSMSSession.PicPath;
            string CompanyPhone = PSMSSession.CompanyPhone;
            string CompanyEmail = PSMSSession.CompanyEmail;
            string CompanyAddress = PSMSSession.CompanyAddress;
            string CompanyName = PSMSSession.CompanyName;
            Microsoft.Reporting.WinForms.LocalReport report = new Microsoft.Reporting.WinForms.LocalReport();
            report.ReportPath = Server.MapPath("~//Rpts//rdlcReports//InvoiceForKitchen.rdlc");
            Microsoft.Reporting.WinForms.ReportParameter[] param = new Microsoft.Reporting.WinForms.ReportParameter[5];
            param[0] = new Microsoft.Reporting.WinForms.ReportParameter("Picture", Server.MapPath("~/" + pic));
            param[1] = new Microsoft.Reporting.WinForms.ReportParameter("Phone", CompanyPhone);
            param[2] = new Microsoft.Reporting.WinForms.ReportParameter("Email", CompanyEmail);
            param[3] = new Microsoft.Reporting.WinForms.ReportParameter("Address", CompanyAddress);
            param[4] = new Microsoft.Reporting.WinForms.ReportParameter("CompanyName", CompanyName);
            report.EnableExternalImages = true;
            report.SetParameters(param);
            Microsoft.Reporting.WinForms.ReportDataSource ds = new Microsoft.Reporting.WinForms.ReportDataSource();
            ds.Name = "Table";
            ds.Value = dt1;
            report.DataSources.Add(ds);
            new PrintRDLCReport().PrintToPrinter(report);
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        DataTable dt = new DataTable();
        dt = BL_Sales.GetTableSalesForKitchen(PSMSSession.UserID, Convert.ToInt32(hdTableID.Value == string.Empty ? "0" : hdTableID.Value));
        foreach (GridViewRow checkedRow in grdItems.Rows)
        {
            CheckBox cb = (CheckBox)checkedRow.FindControl("ChkPrint");
            HiddenField hdsal = (HiddenField)checkedRow.FindControl("hdsal");
            if (cb.Checked == false)
            {
                DataRow dr = dt.Select("SalesID = " + hdsal.Value + "").FirstOrDefault();
                dt.Rows.Remove(dr);
                dt.AcceptChanges();
            }
            else
            {
                BL_Sales.UpdateIsPrint(Convert.ToInt32(hdsal.Value));
            }
        }
        if (dt.Rows.Count > 0)
        {
            if (System.Configuration.ConfigurationManager.AppSettings["IsPdf"] == "true")
            {
                Session["kitdt"] = dt;
                ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "printKitinv();", true);
            }
            else
            {
                if (PSMSSession.PrintForKitchen)
                {
                    DataView view = new DataView(dt);
                    DataTable distinctValues = view.ToTable(true, "CounterID");

                    for (int i = 0; i < distinctValues.Rows.Count; i++)
                    {
                        int CounterID = Convert.ToInt32(distinctValues.Rows[i]["CounterID"].ToString());
                        DataTable dtkit = dt.Select("CounterID = " + CounterID + "").CopyToDataTable();
                        ConfigureKitReports(dtkit);
                    }
                }
            }
            fillGrid();
        }
        else
        {
            JQ.ShowStatusMsg(this.Page, "4", "Please select atleast one item for print.");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        var Tax = BI.GetTaxPercent();
        if (Tax.Rows.Count > 0)
        {
            if (PSMSSession.IsTax == true)
            {
                hdtxtper.Value = Tax.Rows[0]["TaxPercentage"].ToString();
                txtTax.Text = ((Convert.ToDecimal(txtTotal.Text) * Convert.ToDecimal(hdtxtper.Value)) / 100).ToString("0");
            }
        }
        try
        {
            BL_Sales.SalesID = hdSalesID.Value == "" ? 0 : Convert.ToInt32(hdSalesID.Value);
            BL_Sales.TableID = Convert.ToInt32(hdTableID.Value);
            BL_Sales.User = PSMSSession.UserID;
            BL_Sales.ItemID = Convert.ToInt32(hddItemID.Value);
            BL_Sales.Quantity = Convert.ToInt32(numpadoutput.Value);
            BL_Sales.SaleNo = hdSaleNo.Value == "" ? 0 : Convert.ToInt32(hdSaleNo.Value);
            BL_Sales.WaiterID = Convert.ToInt32(hfWaiterId.Value);
            BL_Sales.Discount = Convert.ToDecimal(txtDiscount.Text);
            BL_Sales.CashReceived = Convert.ToDecimal(txtCashReceived.Text);
            BL_Sales.CustomerID = Convert.ToInt32(hfCustomerId.Value);
            if (PSMSSession.IsTax == true)
            {
                BL_Sales.TaxPercentage = Convert.ToDecimal(hdtxtper.Value);
                BL_Sales.TaxName = TaxName.Text;
            }
            hdSaleNo.Value = BL_Sales.InsertUpdateTable_Delivery_Sales(BL_Sales).ToString();
            fillGrid();
            hdSalesID.Value = string.Empty;
        }
        catch (Exception ex)
        {
            JQ.ToastMsg(this.Page, "2", "Please enter quantity.", "bottom-right");
            JQ.ShowNumModal(this);
        }
    }
    protected void FlavorSave_Click(object sender, EventArgs e)
    {
        try
        {
            JQ.CloseModal(this, "ModalItemOrDeal");
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            BL_Sales.SalesID = hdSalesID.Value == "" ? 0 : Convert.ToInt32(hdSalesID.Value);
            BL_Sales.ItemID = Convert.ToInt32(hdfItemID.Value);
            BL_Sales.Quantity = Convert.ToInt32(txtQty.Text);
            BL_Sales.Discount = Convert.ToDecimal(txtDiscount.Text);
            BL_Sales.User = PSMSSession.UserID;
            BL_Sales.SaleNo = hdSaleNo.Value == "" ? 0 : Convert.ToInt32(hdSaleNo.Value);
            BL_Sales.CashReceived = Convert.ToDecimal(txtCashReceived.Text);
            BL_Sales.TableID = Convert.ToInt32(hdTableID.Value);
            BL_Sales.WaiterID = Convert.ToInt32(cmbWaiter.Text);
            BL_Sales.CustomerID = Convert.ToInt32(hfCustomerId.Value);
            var sales = BL_Sales.InsertUpdateTable_Delivery_Sales(BL_Sales);
            hdSaleNo.Value = sales.Rows[0][0].ToString();
            int sid = Convert.ToInt32(sales.Rows[0][1]);
            if (BL_Sales.SalesID > 0)
            {
                BL_Sales.SalesFlavorDelete(Convert.ToInt32(hdSalesID.Value), Convert.ToInt32(PSMSSession.UserID));
            }
            foreach (ListViewItem ItemList in lstItems.Items)
            {
                ListView ChildListView = ItemList.FindControl("lstFlavor") as ListView;
                int chkcount = ChildListView.Items.Where(x => (x.FindControl("chkflavor") as CheckBox).Checked == true).Count();
                foreach (ListViewItem item in ChildListView.Items)
                {
                    CheckBox rb = item.FindControl("chkflavor") as CheckBox;
                    if (rb.Checked == true)
                    {
                        HiddenField ItemID = (HiddenField)item.FindControl("ItemID");
                        HiddenField FlavorID = (HiddenField)item.FindControl("FlavorID");
                        SIF.SalesID = sid;
                        SIF.ItemID = Convert.ToInt32(ItemID.Value);
                        SIF.FlavorID = Convert.ToInt32(FlavorID.Value);
                        SIF.Quantity = Convert.ToDecimal(1.00 / chkcount);
                        SIF.UserID = PSMSSession.UserID;
                        SIF.InsertSalesItemFlavor(SIF);
                    }
                }
            }
            fillGrid();
            txtQty.Text = "";
        }
        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Your request has not been processed due to a temporary error.");
        }
    }
    public class Items
    {
        public int ItemID { get; set; }
        public string Name { get; set; }
        public List<Flavors> lstFlavor { get; set; }
    }
    public class Flavors
    {
        public int FlavorID { get; set; }
        public int ItemID { get; set; }
        public int Num { get; set; }
        public string FlavorName { get; set; }
        public bool Check { get; set; }
    }
    protected void btnMinus_Click(object sender, EventArgs e)
    {
        var total = int.Parse(txtQty.Text) - 1;
        if (total > 0)
        {
            txtQty.Text = total.ToString();
        }
        else
        {
            JQ.ShowStatusMsg(this.Page, "1", "You need to add quantity which is greater than zero.");
        }
    }
    protected void btnPlus_Click(object sender, EventArgs e)
    {
        var total = int.Parse(txtQty.Text) + 1;
        txtQty.Text = total.ToString();
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchCustomers(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["PSMS"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
              
                cmd.CommandText = " select * from [dbo].[Customers] where Name like  '%' +@SearchText+ '%' ";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        string item = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(sdr["Name"].ToString(), sdr["CustomerID"].ToString());
                        customers.Add(item);
                    }
                }
                conn.Close();
                return customers;
            }
        }
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchShift(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["PSMS"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            { 
                cmd.CommandText = " select * from [dbo].[Shift] where Name like  '%' +@SearchText+ '%' ";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> Shift = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        string item = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(sdr["Name"].ToString(), sdr["ShiftID"].ToString());
                        Shift.Add(item);
                    }
                }
                conn.Close();
                return Shift;
            }
        }
    }
    protected void CustomerSave_Click(object sender, EventArgs e)
    {
        try
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            CBL.CustomerID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
            CBL.Name = txtName.Text;
            CBL.PhoneNo = txtCell.Text;
            CBL.Address = txtAddress.Text;
            CBL.User = PSMSSession.UserID;
            CBL.Date = DateTime.Now;
            CBL.Active = Convert.ToBoolean(ckhActive.Checked);
            if (hdcell.Value != txtCell.Text)
            {
                if (CBL.CheckCustomerExist(txtCell.Text))
                {
                    JQ.ToastMsg(this.Page, "2", "Customer Already Exist.", "bottom-right");
                }
                else
                {
                    CBL.CustomerID = CBL.InsertUpdateCustomer(CBL);
                    hfCustomerId.Value = CBL.CustomerID.ToString();
                    if (grdItems.Rows.Count > 0)
                    {
                        txtCustomer_TextChanged(null, null);
                    }
                    hdID.Value = "";
                    txtAddress.Text = "";
                    txtName.Text = "";
                    txtCell.Text = "";
                    txtCustomer.Text = CBL.Name;
                    JQ.CloseModal(this, "ModalVendor");
                }
            }
            else
            {
                CBL.CustomerID = CBL.InsertUpdateCustomer(CBL);
                hfCustomerId.Value = CBL.CustomerID.ToString();
                if (grdItems.Rows.Count > 0)
                {
                    txtCustomer_TextChanged(null, null);
                }
                hdID.Value = "";
                txtAddress.Text = "";
                txtName.Text = "";
                txtCell.Text = "";
                txtCustomer.Text = CBL.Name;
                JQ.CloseModal(this, "ModalVendor");
            }
        }
        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Your request has not been processed due to a temporary error.");
        }
    }
    protected void txtCustomer_TextChanged(object sender, EventArgs e)
    {
        if (hfCustomerId.Value != "" && hfCustomerId.Value != "0")
        {
            BL_Sales.TableID = Convert.ToInt32(hdTableID.Value);
            BL_Sales.CustomerID = Convert.ToInt32(hfCustomerId.Value);
            BL_Sales.UpdateCustomer(BL_Sales);
        }
    }
    protected void DiscardSale_Click(object sender, EventArgs e)
    {
        int TableID = Convert.ToInt32(hdTableID.Value);
        BL_Sales.DeleteDinning(TableID);
        fillGrid(); 
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchWaiter(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["PSMS"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select * from [dbo].[Waiters] where Name like  '%' +@SearchText+ '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> Waiters = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        string Waiter = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(sdr["Name"].ToString(), sdr["WaiterID"].ToString());
                        Waiters.Add(Waiter);
                    }
                }
                conn.Close();
                return Waiters;
            }
        }
    }
}