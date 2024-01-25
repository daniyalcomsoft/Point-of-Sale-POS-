using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Items_ItemsInfo : System.Web.UI.Page
{
    Items_BLL BL = new Items_BLL();
    DealItem_BLL DBL = new DealItem_BLL();
    ItemsFlavorMapping_BLL IFM = new ItemsFlavorMapping_BLL();
    static DataTable diTable;
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Items/ItemsInfo.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Items/ItemsInfo.aspx" && view == true)
                {
                    fillGrid();
                    PM.Bind_DropDown(cmbCounter, new Counter_BLL().GetCounterList(null), "CounterName", "CounterID");
                    var cta = new ItemCategory_BLL().GetItemCategoryList(null);

                    var dtt = new ItemCategory_BLL().CategoryNameForCash(null);
                    if (dtt.Rows.Count > 0)
                    {
                        cmbCategory.Text = dtt.Rows[0]["CategoryName"].ToString();
                        hfCategoryId.Value = dtt.Rows[0]["CategoryID"].ToString();
                    }

                    var dt = new Items_BLL().ItemNameForCash(null);
                    if (dt.Rows.Count > 0)
                    {
                        cmbItem.Text = dt.Rows[0]["Name"].ToString();
                        hfItemID.Value = dt.Rows[0]["ItemID"].ToString();
                    }
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
        grdItems.DataSource = BL.GetSearchItemList((object)DBNull.Value, (object)DBNull.Value, (object)DBNull.Value);
        grdItems.DataBind();
    }
    protected void grdItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdItems.PageIndex = e.NewPageIndex;
        btnSearch_Click(null, null);
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var Item = BL.GetSItemList(e.CommandArgument);
        if (Item.Rows.Count > 0)
            {
        if (Item.Rows[0]["Type"].ToString() == "Item")
        {        
                hdName.Value = Item.Rows[0]["Name"].ToString();
                hdID.Value = Item.Rows[0]["ItemID"].ToString();
                txtName.Text = Item.Rows[0]["Name"].ToString();
                cmbCounter.SelectedValue = Item.Rows[0]["CounterID"].ToString() == "" ? "0" : Item.Rows[0]["CounterID"].ToString();
                cmbCategory.Text = Item.Rows[0]["CategoryName"].ToString();
                txtPurchaseRate.Text = Item.Rows[0]["PurchaseRate"].ToString();
                txtSaleRate.Text = Item.Rows[0]["SaleRate"].ToString();
                txtsorting.Text = Item.Rows[0]["Sort"].ToString();
                ckhActive.Checked = Convert.ToBoolean(Item.Rows[0]["Active"]);
                hdPicPath.Value = Item.Rows[0]["PicPath"].ToString();
                hdPicName.Value = Item.Rows[0]["PicName"].ToString();
                hdPicGuid.Value = Item.Rows[0]["PicGuid"].ToString();
                JQ.ShowHideControl(this, "btnSave", true);
                JQ.ShowModal(this, "ModalItem");
                fillGrid();            
        }
        else
        {          
                hdDealName.Value = Item.Rows[0]["Name"].ToString();
                hdDealID.Value = Item.Rows[0]["ItemID"].ToString();
                txtDealName.Text = Item.Rows[0]["Name"].ToString();              
                txtDealPurchaseRate.Text = Item.Rows[0]["PurchaseRate"].ToString();
                txtDealSaleRate.Text = Item.Rows[0]["SaleRate"].ToString();
                txtDealSort.Text = Item.Rows[0]["Sort"].ToString();                                         
                ckhDealActive.Checked = Convert.ToBoolean(Item.Rows[0]["Active"]);
                grdDealItems.DataSource = diTable = DBL.DealBasedItems(e.CommandArgument);
                grdDealItems.DataBind();                
                hdDealPicPath.Value = Item.Rows[0]["PicPath"].ToString();
                hdDealPicName.Value = Item.Rows[0]["PicName"].ToString();
                hdDealPicGuid.Value = Item.Rows[0]["PicGuid"].ToString();
                btnLabelGroup.Style.Add("display", "block;");
                JQ.ShowHideControl(this, "btnDealSave", true);
                JQ.enabledControl(this, "ModalDeal");
                JQ.ShowModal(this, "ModalDeal");
                txtQuantity.Text = "";
                cmbItem.Text = "0";
                fillGrid();
            }
        }
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        hdDeleteID.Value = e.CommandArgument.ToString();
        JQ.ShowModal(this, "ModalConfirmation");
    }
    protected void btnConfirmation_Click(object sender, EventArgs e)
    {
        BL.CheckExistAndDelete(Convert.ToInt32(hdDeleteID.Value));
        JQ.ShowStatusMsg(this.Page, "1", "Counter Deleted Successfully!");
        fillGrid();
        hdDeleteID.Value = "";
        JQ.CloseModal(this, "ModalConfirmation");
    }    
    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        var Item = BL.GetSItemList(e.CommandArgument);
        if(Item.Rows[0]["Type"].ToString() == "Item")
        {
            if (Item.Rows.Count > 0)
            {
                txtName.Text = Item.Rows[0]["Name"].ToString();
                cmbCounter.SelectedValue = Item.Rows[0]["CounterID"].ToString();
                cmbCategory.Text = Item.Rows[0]["CategoryName"].ToString();
                txtPurchaseRate.Text = Item.Rows[0]["PurchaseRate"].ToString();
                txtSaleRate.Text = Item.Rows[0]["SaleRate"].ToString();
                txtsorting.Text = Item.Rows[0]["Sort"].ToString();
                ckhActive.Checked = Convert.ToBoolean(Item.Rows[0]["Active"]);
                JQ.ShowHideControl(this, "btnSave", false);
                JQ.ShowModal(this, "ModalItem");
                JQ.disabledControl(this, "ModalItem");               
            }
        }
        else
        {
            if (Item.Rows.Count > 0)
            {
                txtDealName.Text = Item.Rows[0]["Name"].ToString();               
                txtDealPurchaseRate.Text = Item.Rows[0]["PurchaseRate"].ToString();
                txtDealSaleRate.Text = Item.Rows[0]["SaleRate"].ToString();
                txtDealSort.Text = Item.Rows[0]["Sort"].ToString();
                ckhDealActive.Checked = Convert.ToBoolean(Item.Rows[0]["Active"]);
                grdDealItems.DataSource = diTable = DBL.DealBasedItems(e.CommandArgument);
                grdDealItems.DataBind();
                JQ.ShowHideControl(this, "btnDealDelete", false);
                btnLabelGroup.Style.Add("display", "none;");
                JQ.ShowHideControl(this, "btnDealSave", false);                
                JQ.ShowModal(this, "ModalDeal");
                JQ.disabledControl(this, "ModalDeal");
                txtQuantity.Text = "";
                cmbItem.Text = "0";               
            }
        }      
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        BL.ItemID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
            BL.PicPath = hdPicPath.Value;
            BL.PicGuid = hdPicGuid.Value;
            BL.PicName = hdPicName.Value;
            BL.Name = txtName.Text;
            BL.Sort =  string.IsNullOrEmpty(txtsorting.Text) ? 0 : Convert.ToInt32(txtsorting.Text); 
            BL.Type = "Item";
            BL.Active = Convert.ToBoolean(ckhActive.Checked);       
            BL.User = PSMSSession.UserID;
            BL.CounterID = Convert.ToInt16(cmbCounter.SelectedValue);
            BL.CategoryID = Convert.ToInt32(hfCategoryId.Value);           
            string PicName = string.Empty;            
            string PicPath = string.Empty;
            Guid g;
            g = Guid.NewGuid();
            if (imageUpload.PostedFile != null && imageUpload.PostedFile.FileName != "" )
            {
                if (imageUpload.PostedFile != null && imageUpload.PostedFile.ContentLength > 0)
                {
                    PicName = imageUpload.PostedFile.FileName;
                    string targetFolderTemp = Server.MapPath("~/App_Images/GalleryTemp");
                    bool folderExistsTemp = Directory.Exists(targetFolderTemp);
                    if (!folderExistsTemp)
                        Directory.CreateDirectory(targetFolderTemp);
                    string targetPathTemp = Path.Combine(targetFolderTemp, g.ToString() + Path.GetExtension(imageUpload.PostedFile.FileName));
                    imageUpload.PostedFile.SaveAs(targetPathTemp);
                    string targetFolder = Server.MapPath("~/App_Images/Gallery");
                    bool folderExists = Directory.Exists(targetFolder);
                    if (!folderExists)
                        Directory.CreateDirectory(targetFolder);
                    System.Drawing.Bitmap Thumbnail = CreateThumbnailImage.CreateThumbnail(targetPathTemp, 200, 200);
                    Thumbnail.MakeTransparent();
                    string SaveAsThumbnail = System.IO.Path.Combine(targetFolder, g.ToString() + Path.GetExtension(imageUpload.PostedFile.FileName));
                    Thumbnail.Save(SaveAsThumbnail);
                    Thumbnail.Dispose();
                    bool TempExists = System.IO.File.Exists(targetPathTemp);
                    if (TempExists)
                        System.IO.File.Delete(targetPathTemp);
                    BL.PicPath = "/App_Images/Gallery/" + g.ToString() + Path.GetExtension(imageUpload.PostedFile.FileName);
                    BL.PicGuid = g.ToString();
                    BL.PicName = imageUpload.PostedFile.FileName;
                }                
            }                      
            BL.Date = DateTime.Now;
        try {
        BL.PurchaseRate = Convert.ToDecimal(txtPurchaseRate.Text);
        BL.SaleRate = Convert.ToDecimal(txtSaleRate.Text);
             }
        catch(Exception ex)
        {
            BL.PurchaseRate = 0;
                BL.SaleRate = 0;
        }        
            if (hdName.Value != txtName.Text)
            {
                if (BL.CheckItemExist(txtName.Text))
                {
                    JQ.ToastMsg(this.Page, "2", "Item Already Exist.", "bottom-right");
                }
                else
                {
                    BL.InsertUpdateItems(BL);
                    hdID.Value = "";
                    hdName.Value = "";
                    fillGrid();
                    btnSearch_Click(null, null);
                    //PM.Bind_DropDown(cmbItem, new Items_BLL().GetJustItem());
                    JQ.CloseModal(this, "ModalItem");
                    JQ.ShowStatusMsg(this.Page, "1", "Item Saved Successfully.");
                }
            }
            else
            {
                BL.InsertUpdateItems(BL);
                hdID.Value = "";
                hdName.Value = "";
                fillGrid();
                btnSearch_Click(null, null);
                //PM.Bind_DropDown(cmbItem, new Items_BLL().GetJustItem());
                JQ.CloseModal(this, "ModalItem");
                JQ.ShowStatusMsg(this.Page, "1", "Item Saved Successfully.");
            }
        }
        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Your request has not been processed due to a temporary error.");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        TextBox txtName = (TextBox)grdItems.HeaderRow.FindControl("txtName");
        TextBox txtCounterName = (TextBox)grdItems.HeaderRow.FindControl("txtCounterName");
        TextBox txtCategoryName = (TextBox)grdItems.HeaderRow.FindControl("txtCategoryName");
        if (string.IsNullOrEmpty(txtName.Text) && string.IsNullOrEmpty(txtCounterName.Text) && string.IsNullOrEmpty(txtCategoryName.Text))
            fillGrid();
        else
        {
            grdItems.DataSource = BL.GetSearchItemList(string.IsNullOrEmpty(txtName.Text) ? (object)DBNull.Value : txtName.Text,
                string.IsNullOrEmpty(txtCounterName.Text) ? (object)DBNull.Value : txtCounterName.Text,
                string.IsNullOrEmpty(txtCategoryName.Text) ? (object)DBNull.Value : txtCategoryName.Text);
            grdItems.DataBind();

            setValues(txtName.Text, txtCounterName.Text, txtCategoryName.Text);
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        setValues(string.Empty, string.Empty, string.Empty);
        btnSearch_Click(null, null);
    }
    public void setValues(string sn, string sd, string ot)
    {
        TextBox txtName = (TextBox)grdItems.HeaderRow.FindControl("txtName");
        TextBox txtCounterName = (TextBox)grdItems.HeaderRow.FindControl("txtCounterName");
        TextBox txtCategoryName = (TextBox)grdItems.HeaderRow.FindControl("txtCategoryName");
        txtName.Text = sn;
        txtCounterName.Text = sd;
        txtCategoryName.Text = ot;
    }
    protected void cmbUOM_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtPurchaseRate.Focus();
    }
    protected void cmbCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtName.Focus();
    }
    protected void btnDealSave_Click(object sender, EventArgs e)
    {
        try
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            BL.ItemID = hdDealID.Value == "" ? 0 : Convert.ToInt32(hdDealID.Value);
            BL.PicPath = hdDealPicPath.Value;
            BL.PicGuid = hdDealPicGuid.Value;
            BL.PicName = hdDealPicName.Value;
            BL.Name = txtDealName.Text;
            BL.Sort = string.IsNullOrEmpty(txtDealSort.Text) ? 0 : Convert.ToInt32(txtDealSort.Text);
            BL.Type = "Deal";
            BL.Active = Convert.ToBoolean(ckhDealActive.Checked);
            BL.User = PSMSSession.UserID;
            BL.CategoryID = null;

            string PicName = string.Empty;
            string PicPath = string.Empty;
            Guid g;
            g = Guid.NewGuid();
            if (imageUploadDeal.PostedFile != null && imageUploadDeal.PostedFile.FileName != "")
            {
                if (imageUploadDeal.PostedFile != null && imageUploadDeal.PostedFile.ContentLength > 0)
                {
                    PicName = imageUploadDeal.PostedFile.FileName;
                    string targetFolderTemp = Server.MapPath("~/App_Images/GalleryTemp");
                    bool folderExistsTemp = Directory.Exists(targetFolderTemp);
                    if (!folderExistsTemp)
                        Directory.CreateDirectory(targetFolderTemp);
                    string targetPathTemp = Path.Combine(targetFolderTemp, g.ToString() + Path.GetExtension(imageUploadDeal.PostedFile.FileName));
                    imageUploadDeal.PostedFile.SaveAs(targetPathTemp);
                    string targetFolder = Server.MapPath("~/App_Images/Gallery");
                    bool folderExists = Directory.Exists(targetFolder);
                    if (!folderExists)
                        Directory.CreateDirectory(targetFolder);
                    System.Drawing.Bitmap Thumbnail = CreateThumbnailImage.CreateThumbnail(targetPathTemp, 200, 200);
                    Thumbnail.MakeTransparent();
                    string SaveAsThumbnail = System.IO.Path.Combine(targetFolder, g.ToString() + Path.GetExtension(imageUploadDeal.PostedFile.FileName));
                    Thumbnail.Save(SaveAsThumbnail);
                    Thumbnail.Dispose();
                    bool TempExists = System.IO.File.Exists(targetPathTemp);
                    if (TempExists)
                        System.IO.File.Delete(targetPathTemp);
                    BL.PicPath = "/App_Images/Gallery/" + g.ToString() + Path.GetExtension(imageUploadDeal.PostedFile.FileName);
                    BL.PicGuid = g.ToString();
                    BL.PicName = imageUploadDeal.PostedFile.FileName;
                }
            }

            BL.Date = DateTime.Now;
            try
            {
                BL.PurchaseRate = Convert.ToDecimal(txtDealPurchaseRate.Text);
                BL.SaleRate = Convert.ToDecimal(txtDealSaleRate.Text);
            }
            catch (Exception ex)
            {
                BL.PurchaseRate = 0;
                BL.SaleRate = 0;
            }

            if (hdDealName.Value != txtDealName.Text)
            {
                if (BL.CheckItemExist(txtDealName.Text))
                {
                    JQ.ToastMsg(this.Page, "2", "Deal Already Exist.", "bottom-right");
                }
                else
                {
                    if (grdDealItems.Rows.Count > 0)
                    {
                        BL.ItemID = BL.InsertUpdateItems(BL);
                        DBL.DeleteDealItems(BL.ItemID);

                        foreach (GridViewRow row in grdDealItems.Rows)
                        {
                            DBL.DealID = BL.ItemID;
                            DBL.ItemID = Convert.ToInt32(row.Cells[0].Text);
                            DBL.Quantity = Convert.ToInt32(row.Cells[2].Text);
                            DBL.Date = DateTime.Now;
                            DBL.User = PSMSSession.UserID;
                            DBL.InsertUpdateDealItems(DBL);
                        }
                        hdDealID.Value = "";
                        hdDealName.Value = "";
                        fillGrid();
                        btnSearch_Click(null, null);
                        ClearRight();
                        JQ.CloseModal(this, "ModalDeal");
                        JQ.ShowStatusMsg(this.Page, "1", "Deal Saved Successfully.");
                        ClearTableGridView(diTable);
                    }
                    else
                    {
                        JQ.ShowStatusMsg(this.Page, "2", "please insert at least one item.");
                    }
                }
            }
            else
            {
                if (grdDealItems.Rows.Count > 0)
                {
                    BL.InsertUpdateItems(BL);
                    DBL.DeleteDealItems(BL.ItemID);
                    foreach (GridViewRow row in grdDealItems.Rows)
                    {
                        DBL.DealID = BL.ItemID;
                        DBL.ItemID = Convert.ToInt32(row.Cells[0].Text);
                        DBL.Quantity = Convert.ToInt32(row.Cells[2].Text);
                        DBL.Date = DateTime.Now;
                        DBL.User = PSMSSession.UserID;
                        DBL.InsertUpdateDealItems(DBL);
                    }
                    hdDealID.Value = "";
                    hdDealName.Value = "";
                    fillGrid();
                    btnSearch_Click(null, null);
                    ClearRight();
                    JQ.CloseModal(this, "ModalDeal");
                    JQ.ShowStatusMsg(this.Page, "1", "Deal Saved Successfully.");
                    ClearTableGridView(diTable);

                }
                else
                {
                    JQ.ShowStatusMsg(this.Page, "2", "please insert at least one item.");
                }
            }
        }
        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Your request has not been processed due to a temporary error.");
        }
    }
    protected void btnAddDealItem_Click(object sender, EventArgs e)
    {
        CreateDealItemTable();
    }    
    private void CreateDealItemTable()
    {
        try
        {
            if (!string.IsNullOrEmpty(cmbItem.Text) && !string.IsNullOrEmpty(txtQuantity.Text))
            {
                if (diTable == null)
                {
                    diTable = new DataTable("DealItem");
                    // Add Columns 
                    diTable.Columns.Add("ItemID", typeof(int));
                    diTable.PrimaryKey = new DataColumn[] { diTable.Columns["ItemID"] };
                    diTable.Columns.Add("Name", typeof(string));
                    diTable.Columns.Add("Quantity", typeof(int));
                    diTable.Columns.Add("SaleRate", typeof(decimal));
                    diTable.Columns.Add("Amount", typeof(decimal));
                }
                // Add Data Row
                DataRow dr = diTable.NewRow();
                dr["ItemID"] = hfItemID.Value;
                dr["Name"] = cmbItem.Text;
                dr["Quantity"] = txtQuantity.Text;
                dr["SaleRate"] = BL.GetSaleRates(cmbItem.Text);
                dr["Amount"] = ((Convert.ToInt32((txtQuantity.Text))) * (BL.GetSaleRates(cmbItem.Text)));
                diTable.Rows.Add(dr);
                grdDealItems.DataSource = diTable;
                grdDealItems.DataBind();
            }
            else
            {
                JQ.ToastMsg(this.Page, "2", "Item Name or Quantity is missing.", "bottom-right");
            }
        }
        catch
        {
            JQ.ToastMsg(this.Page, "2", "Item Already Exist.", "bottom-right");
        }      
    }
    private void ClearRight()
    {            
        txtDealName.Text = "";
        txtDealPurchaseRate.Text = "";
        txtDealSaleRate.Text = "";
        txtDealSort.Text = "";
        txtQuantity.Text = "";  
    }
    protected void btnDealDelete_Command(object sender, CommandEventArgs e)
    {
        DataRow row = diTable.Select("ItemID = " + e.CommandArgument).FirstOrDefault();
        diTable.Rows.Remove(row);
        diTable.AcceptChanges();
        grdDealItems.DataSource = diTable;
        grdDealItems.DataBind();
    }
    protected void btnClosed_Click(object sender, EventArgs e)
    {
        if (diTable != null)
        {
            ClearTableGridView(diTable);
            JQ.CloseModal(this, "ModalDeal");
        }
        else
        {
            JQ.CloseModal(this, "ModalDeal");
        }                   
    }
    private void ClearTableGridView(DataTable diTable)
    {
        if (diTable.Rows.Count>0)
        { 
            diTable.Clear();
            grdDealItems.DataSource = diTable;
            grdDealItems.DataBind();
        }
    }
    protected void btnAddFlavorAgainsItem_Command(object sender, CommandEventArgs e)
    {
        hdItemID.Value = e.CommandArgument.ToString();
        JQ.ShowModal(this, "ModalFlavor");
        grdFlavor.DataSource = ViewState["FlavorAgainstCategory"] = IFM.GetFlavorAndItem(Convert.ToInt32(hdItemID.Value));
        grdFlavor.DataBind();
    }
    protected void FlavorSaveAgItem_Click(object sender, EventArgs e)
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        IFM.DeleteFlavorOnItem(Convert.ToInt32(hdItemID.Value));
        if (cmbFlavorAgainstItem.SelectedValue == "0")
        {
            IFM.ShowOnlyItemsFlavor = false;
        }
        else
        {
            IFM.ShowOnlyItemsFlavor = true;
        }
        foreach (GridViewRow checkedRow in grdFlavor.Rows)
        {
            CheckBox cb = (CheckBox)checkedRow.FindControl("IsCheck");
            HiddenField hdsal = (HiddenField)checkedRow.FindControl("hdfal");
            if (cb.Checked == true)
            {
                IFM.FlavorID = Convert.ToInt32(checkedRow.Cells[0].Text);
                IFM.ItemID = Convert.ToInt32(hdItemID.Value);                
                IFM.InsertFlavorAgainstItems(IFM);
            }
            else
            {
            }
        }
        JQ.CloseModal(this, "ModalFlavor");
        Response.Redirect("ItemsInfo.aspx");
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchCategory(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["PSMS"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select * from [dbo].[ItemCategory] where CategoryName like  '%' +@SearchText+ '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> ItemCategory = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        string Category = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(sdr["CategoryName"].ToString(), sdr["CategoryID"].ToString());
                        ItemCategory.Add(Category);
                    }
                }
                conn.Close();
                return ItemCategory;
            }
        }
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchItem(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["PSMS"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select * from [dbo].[Items] where Name like  '%' +@SearchText+ '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> Items = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        string Item = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(sdr["Name"].ToString(), sdr["ItemID"].ToString());
                        Items.Add(Item);
                    }
                }
                conn.Close();
                return Items;
            }
        }
    }
}