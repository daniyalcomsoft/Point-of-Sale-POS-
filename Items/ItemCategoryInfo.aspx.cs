using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Items_ItemCategory : System.Web.UI.Page
{
    ItemCategory_BLL BL = new ItemCategory_BLL();
    Flavor_BLL FBL = new Flavor_BLL();
    CategoryFlavorMapping_BLL CFMBL = new CategoryFlavorMapping_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Items/ItemCategoryInfo.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Items/ItemCategoryInfo.aspx" && view == true)
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
        int CategoryID = Convert.ToInt32(hdDeleteID.Value);
        if (BL.CheckExistAndDelete(CategoryID))
        {
            fillGrid();
            btnSearch_Click(null, null);
            JQ.ShowStatusMsg(this.Page, "1", "Item Category Deleted Successfully.");
        }
        else
        {
            JQ.ShowStatusMsg(this.Page, "3", "Category is in Use.");
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
        grdItems.DataSource = BL.GetSearchItemCategoryList(DBNull.Value);
        grdItems.DataBind();       
    }
    protected void grdItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdItems.PageIndex = e.NewPageIndex;
        btnSearch_Click(null, null);
    }
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        var Item = BL.GetItemCategoryList(e.CommandArgument);
        if (Item.Rows.Count > 0)
        {        
            hdID.Value = Item.Rows[0]["CategoryID"].ToString();
            txtName.Text = Item.Rows[0]["CategoryName"].ToString();
            hdName.Value = Item.Rows[0]["CategoryName"].ToString();
            txtsort.Text = Item.Rows[0]["Sort"].ToString();
            ckhActive.Checked = Convert.ToBoolean(Item.Rows[0]["Active"]);
            hdPicPath.Value = Item.Rows[0]["PicPath"].ToString();
            hdPicName.Value = Item.Rows[0]["PicName"].ToString();
            hdPicGuid.Value = Item.Rows[0]["PicGuid"].ToString();
            JQ.ShowHideControl(this, "btnSave", true);
            JQ.ShowModal(this, "ModalItemCategory");
        }
    }
    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        var Item = BL.GetItemCategoryList(e.CommandArgument);
        if (Item.Rows.Count > 0)
        {
            txtName.Text = Item.Rows[0]["CategoryName"].ToString();
            txtsort.Text = Item.Rows[0]["Sort"].ToString();
            ckhActive.Checked = Convert.ToBoolean(Item.Rows[0]["Active"]);         
            JQ.ShowHideControl(this, "btnSave", false);
            JQ.ShowModal(this, "ModalItemCategory");
            JQ.disabledControl(this, "ModalItemCategory");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            BL.ItemCategoryID = hdID.Value == "" ? 0 : Convert.ToInt32(hdID.Value);
            BL.PicPath = hdPicPath.Value;
            BL.PicGuid = hdPicGuid.Value;
            BL.PicName = hdPicName.Value;
            BL.ItemCategory = txtName.Text;
            BL.Sort = string.IsNullOrEmpty(txtsort.Text) ? 0 : Convert.ToInt32(txtsort.Text);
            BL.Active = ckhActive.Checked;     
            BL.User = PSMSSession.UserID;
            string PicName = string.Empty;
            string PicPath = string.Empty;
            Guid g;
            g = Guid.NewGuid();
            if (imageUpload.PostedFile != null && imageUpload.PostedFile.FileName != "")
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
            if (hdName.Value != txtName.Text)
            {
                if (BL.CheckItemCategoryExist(txtName.Text))
                {
                    JQ.ToastMsg(this.Page, "2", "Item  Cateogry Already Exist.", "bottom-right");
                }
                else
                {
                    BL.InsertUpdateItemsCategory(BL);
                    hdID.Value = "";
                    hdName.Value = "";
                    fillGrid();
                    btnSearch_Click(null, null);
                    JQ.CloseModal(this, "ModalItemCategory");
                    JQ.ShowStatusMsg(this.Page, "1", "Item  Category Saved Successfully.");
                }
            }
            else
            {
                BL.InsertUpdateItemsCategory(BL);
                hdID.Value = "";
                hdName.Value = "";
                fillGrid();
                btnSearch_Click(null, null);
                JQ.CloseModal(this, "ModalItemCategory");
                JQ.ShowStatusMsg(this.Page, "1", "Item  Category Saved Successfully.");
            }
        }
        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Your request has not been processed due to a temporary error.");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        TextBox txtCategoryName = (TextBox)grdItems.HeaderRow.FindControl("txtCategoryName");
        if (string.IsNullOrEmpty(txtCategoryName.Text))
            fillGrid();
        else
        {
            grdItems.DataSource = BL.GetSearchItemCategoryList(string.IsNullOrEmpty(txtCategoryName.Text) ? (object)DBNull.Value : txtCategoryName.Text);
            grdItems.DataBind();

            setValues(txtCategoryName.Text);
        }
    }
    public void setValues(string sn)
    {
        TextBox txtCategoryName = (TextBox)grdItems.HeaderRow.FindControl("txtCategoryName");
        txtCategoryName.Text = sn;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        grdItems.DataSource = (DataTable)ViewState["ItemCategoryList"];
        grdItems.DataBind();
        fillGrid();
    }
    protected void ckhActive_CheckedChanged(object sender, EventArgs e)
    {
        if(!ckhActive.Checked)
        { emmsg.Visible = true; }
        else
        { emmsg.Visible = false; }
    }
    protected void FlavorSave_Click(object sender, EventArgs e)
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        CFMBL.DeleteFlavorOnCategory(Convert.ToInt32(hdCatID.Value));
        foreach (GridViewRow checkedRow in grdFlavor.Rows)
        {
            CheckBox cb = (CheckBox)checkedRow.FindControl("IsCheck");
            HiddenField hdsal = (HiddenField)checkedRow.FindControl("hdfal");
            if (cb.Checked == true)
            {
                CFMBL.FlavorID =Convert.ToInt32(checkedRow.Cells[0].Text);
                CFMBL.CategoryID = Convert.ToInt32(hdCatID.Value);
                CFMBL.InsertFlavorAgainstCategory(CFMBL);                                           
            }
            else
            {                 
            }
        }
        JQ.CloseModal(this, "ModalFlavor");
        Response.Redirect("ItemCategoryInfo.aspx");
    }
    protected void btnAddFlavor_Command(object sender, CommandEventArgs e)
    {
        hdCatID.Value = e.CommandArgument.ToString();
        JQ.ShowModal(this, "ModalFlavor");
        grdFlavor.DataSource = CFMBL.GetFlavorAndCategory(Convert.ToInt32(hdCatID.Value));
        grdFlavor.DataBind();
    }
}