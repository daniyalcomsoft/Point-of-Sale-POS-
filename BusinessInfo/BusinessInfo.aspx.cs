using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BusinessInfo_BusinessInfo : System.Web.UI.Page
{
    BusinessInfo_BLL BL = new BusinessInfo_BLL();
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "BusinessInfo/BusinessInfo.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "BusinessInfo/BusinessInfo.aspx" && view == true)
                {
                    fillForm();
                }
                else
                {
                    Response.Redirect("Default.aspx", false);
                }
            }
        }
    }
    public void selectinit()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), Guid.NewGuid().ToString(), "selectpic();", true);
    }
    public void fillForm()
    {
        var Company = BL.GetCompanyList();
        if (Company.Rows.Count > 0)
        {
            hdCID.Value = Company.Rows[0]["CompanyID"].ToString();
            txtCName.Text = Company.Rows[0]["CompanyName"].ToString();
            txtPhoneNo.Text = Company.Rows[0]["PhoneNo"].ToString();
            txtEmail.Text = Company.Rows[0]["EmailAddress"].ToString();
            txtAddress.Text = Company.Rows[0]["Address"].ToString();
            hdPicPath.Value = Company.Rows[0]["PicPath"].ToString();
            hdPicName.Value = Company.Rows[0]["PicName"].ToString();
            hdPicGuid.Value = Company.Rows[0]["PicGuid"].ToString();
            chkTakeAway.Checked = Convert.ToBoolean(Company.Rows[0]["EnableTakeAwayOnSale"]);
            chkDelivery.Checked = Convert.ToBoolean(Company.Rows[0]["EnableDeliveryOnSale"]);
            chkDinein.Checked = Convert.ToBoolean(Company.Rows[0]["EnableDineInnOnSale"]);
            chkVkey.Checked = Convert.ToBoolean(Company.Rows[0]["VirtualKeyboard"]);
            chkFK.Checked = Convert.ToBoolean(Company.Rows[0]["PrintForKitchen"]);
            chkIsTax.Checked = Convert.ToBoolean(Company.Rows[0]["IsTax"]);
            txtTaxName.Text = Company.Rows[0]["TaxName"].ToString();
            txtTaxPercentage.Text = Company.Rows[0]["TaxPercentage"].ToString();
            ShowImages.ImageUrl = string.IsNullOrEmpty(Company.Rows[0]["PicPath"].ToString()) ? "~/App_Images/question.png" : "~/" + Company.Rows[0]["PicPath"].ToString();
            chkIsTax_CheckedChanged(null, null);
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Sessions PSMSSession = (Sessions)Session["PSMSSession"];
            BL.CompanyID = hdCID.Value == "" ? 0 : Convert.ToInt32(hdCID.Value);
            BL.PicPath = hdPicPath.Value;
            BL.PicGuid = hdPicGuid.Value;
            BL.PicName = hdPicName.Value;
            BL.CompanyName = txtCName.Text;
            BL.PhoneNo = txtPhoneNo.Text;
            BL.EmailAddress = txtEmail.Text;
            BL.Address = txtAddress.Text;
            BL.User = PSMSSession.UserID;
            BL.VirtualKeyboard = chkVkey.Checked;
            BL.EnableDeliveryOnSale = chkDelivery.Checked;
            BL.EnableDineInnOnSale = chkDinein.Checked;
            BL.EnableTakeAwayOnSale = chkTakeAway.Checked;
            BL.PrintForKitchen = chkFK.Checked;
            BL.IsTax = chkIsTax.Checked;
            PSMSSession.IsTax = BL.IsTax;
            PSMSSession.TaxName = BL.TaxName;
            PSMSSession.TaxPercent = BL.TaxPercentage;
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
            if (chkIsTax.Checked)
            {
                if(!string.IsNullOrEmpty(txtTaxName.Text) && !string.IsNullOrEmpty(txtTaxPercentage.Text))
                {
                    BL.TaxName = txtTaxName.Text;
                    BL.TaxPercentage = Convert.ToDecimal(txtTaxPercentage.Text);
                    BL.InsertUpdateCompany(BL);
                    PSMSSession.VirtualKeyboard = chkVkey.Checked;
                    PSMSSession.PrintForKitchen = chkFK.Checked;
                    PSMSSession.EnableTakeAwayOnSale = chkTakeAway.Checked;
                    PSMSSession.EnableDeliveryOnSale = chkDelivery.Checked;
                    PSMSSession.EnableDineInnOnSale = chkDinein.Checked;
                    hdCID.Value = "";
                    fillForm();
                    JQ.ShowStatusMsg(this.Page, "1", "Company Saved Successfully.");
                }
              else
                {
                    JQ.ToastMsg(this.Page, "2", "TaxName or TaxPercentage is missing.", "bottom-right");
                }
            }
            else
            {
                BL.TaxName = null;
                BL.TaxPercentage = null;
                BL.InsertUpdateCompany(BL);
                PSMSSession.VirtualKeyboard = chkVkey.Checked;
                PSMSSession.PrintForKitchen = chkFK.Checked;
                PSMSSession.EnableTakeAwayOnSale = chkTakeAway.Checked;
                PSMSSession.EnableDeliveryOnSale = chkDelivery.Checked;
                PSMSSession.EnableDineInnOnSale = chkDinein.Checked;
                hdCID.Value = "";
                fillForm();
                JQ.ShowStatusMsg(this.Page, "1", "Company Saved Successfully.");
            }
        }
        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", "Your request has not been processed due to a temporary error.");
        }
    }
    protected void chkIsTax_CheckedChanged(object sender, EventArgs e)
    {
        if (chkIsTax.Checked == true)
        {
            txtTaxName.ReadOnly = false;
            txtTaxPercentage.ReadOnly = false;           
        }
        else
        {
            txtTaxName.ReadOnly = true;
            txtTaxPercentage.ReadOnly = true;
        }
    }
}