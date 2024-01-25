using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Configuration;
public partial class MasterPage : System.Web.UI.MasterPage
{
   
    string PageUrl = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        //User_BLL User = new User_BLL();
        //if (User.CheckUserExist())
        //{
            if (!IsPostBack)
            {
                if (Session["PSMSSession"] != null)
            {
                Sessions PSMSSession = (Sessions)Session["PSMSSession"];
               
                if (PSMSSession.PermissionTable.Rows.Count > 0)
                {
                    CheckAllowedPages();
                }
                else
                {
                    PM.ToastMsg(this.Page, Constants.Information, "User not allowed permission", Constants.bottom_right);
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        FillMenu();
        JQ.DatePicker(this.Page);
        JQ.MonthPicker(this.Page);
        //}
        //else
        //{

        //    Response.Redirect("~/Expire.aspx");

        //}

    }

    private void CheckAllowedPages()
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        if (PSMSSession.Permission != null)
        {
            PageUrl = Request.Url.Segments.Last();

            DataRow[] dr = PSMSSession.PermissionTable.Select("PageUrl like '%" + PageUrl.ToString() + "%'");
            if (dr.Length > 0)
            {
                if (true)
                {
                    PSMSSession.Can_Insert = dr.Length > 0 ? Convert.ToBoolean(dr[0]["Can_Insert"]) : false;
                    PSMSSession.Can_Update = dr.Length > 0 ? Convert.ToBoolean(dr[0]["Can_Update"]) : false;
                    PSMSSession.Can_Delete = dr.Length > 0 ? Convert.ToBoolean(dr[0]["Can_Delete"]) : false;
                    PSMSSession.Can_View = dr.Length > 0 ? Convert.ToBoolean(dr[0]["Can_View"]) : false;
                }
                else
                {
                    Response.Redirect("" + PSMSSession.PageRefrence.ToString() + "");
                }
            }
        }
    }

    private void FillMenu()
    {
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        if (PSMSSession != null)
        {
            bname.InnerText = PSMSSession.CompanyName;
            DImage.ImageUrl = string.IsNullOrEmpty(PSMSSession.PicPath) ? "~/App_Images/question.png" : "~/" + PSMSSession.PicPath;
            DataTable dtMenu = PSMSSession.MenuTable;
            string json = JsonConvert.SerializeObject(dtMenu, Formatting.Indented);
            hdnMenu.Value = json;
            hdnMenuLink.Value = ConfigurationManager.AppSettings["webroot"];
        }
    }

}