
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User_BLL User = new User_BLL();
        //if (User.CheckUserExist())
        //{
            if (!IsPostBack)
            {
                txtUserName.Text = "";
                txtPassword.Text = "";
            }
        //}
        //else
        //{
        //    Response.Redirect("~/Expire.aspx");
        //}
    }
    [WebMethod]
    public static string LoginSubmit(string UserName, string Password)
    {
        string StatusLogin = "";
        User_BLL User = new User_BLL();
            RolePermission_BLL RP = new RolePermission_BLL();
            Sessions PSMS = new Sessions();
            DataTable dtUser = User.GetUserByUserName(UserName);
            if (dtUser.Rows.Count > 0)
            {
                var DTPassword = from SN in dtUser.AsEnumerable()
                                 where SN.Field<string>("UserName") == dtUser.Rows[0]["UserName"].ToString() && SN.Field<string>("Password") == EncryptDecrypt.Encrypt(Password)
                                 select SN;
                if (DTPassword != null && DTPassword.Count() != 0)
                {
                    dtUser = DTPassword.CopyToDataTable();
                    if (dtUser.Rows.Count > 0)
                    {
                        PSMS.RoleID = Convert.ToInt32(dtUser.Rows[0]["RoleID"]);
                        PSMS.UserID = Convert.ToInt32(dtUser.Rows[0]["UserID"]);
                        PSMS.RoleName = dtUser.Rows[0]["RoleName"].ToString();
                        PSMS.UserFullName = dtUser.Rows[0]["Name"].ToString();
                        PSMS.UserName = dtUser.Rows[0]["UserName"].ToString();
                        PSMS.PicName = dtUser.Rows[0]["PicName"].ToString();
                        PSMS.PicGuid = dtUser.Rows[0]["PicGuid"].ToString();
                        PSMS.PicPath = dtUser.Rows[0]["PicPath"].ToString();
                        PSMS.CompanyPhone = dtUser.Rows[0]["CompanyPhone"].ToString();
                        PSMS.CompanyEmail = dtUser.Rows[0]["CompanyEmail"].ToString();
                        PSMS.CompanyAddress = dtUser.Rows[0]["CompanyAddress"].ToString();
                        PSMS.CompanyName = dtUser.Rows[0]["CompanyName"].ToString();
                        PSMS.VirtualKeyboard = Convert.ToBoolean(dtUser.Rows[0]["VirtualKeyboard"]);
                        PSMS.PrintForKitchen = Convert.ToBoolean(dtUser.Rows[0]["PrintForKitchen"]);
                        PSMS.EnableDeliveryOnSale = Convert.ToBoolean(dtUser.Rows[0]["EnableDeliveryOnSale"]);
                        PSMS.EnableDineInnOnSale = Convert.ToBoolean(dtUser.Rows[0]["EnableDineInnOnSale"]);
                        PSMS.EnableTakeAwayOnSale = Convert.ToBoolean(dtUser.Rows[0]["EnableTakeAwayOnSale"]);
                        PSMS.IsTax = Convert.ToBoolean(dtUser.Rows[0]["IsTax"]);
                        PSMS.TaxName = dtUser.Rows[0]["TaxName"].ToString();
                        PSMS.TaxPercent = dtUser.Rows[0]["TaxPercentage"].ToString()=="" ? 0: Convert.ToDecimal(dtUser.Rows[0]["TaxPercentage"]);
                        PSMS.Permission = "Checked";
                        if (Convert.ToBoolean(dtUser.Rows[0]["RoleStatus"]) == true)
                        {
                            if (Convert.ToBoolean(dtUser.Rows[0]["UserStatus"]) == true)
                            {
                                PSMS.PermissionTable = RP.GetPagePermissionpPagesByRole(Convert.ToInt32(dtUser.Rows[0]["RoleID"]));
                                PSMS.MenuTable = RP.GetMenuByRoleID(Convert.ToInt32(dtUser.Rows[0]["RoleID"]));
                                HttpContext.Current.Session["PSMSSession"] = PSMS;
                                StatusLogin = "Login Successfully";
                            }
                            else
                            {
                                StatusLogin = "User not Active";
                            }
                        }
                        else
                        {
                            StatusLogin = "Role not Active";
                        }
                    }
                }
                else
                {
                    StatusLogin = "Invaild Password";
                }
            }
            else
            {
                StatusLogin = "Invaild Username";
            }
        return StatusLogin;
    }
}