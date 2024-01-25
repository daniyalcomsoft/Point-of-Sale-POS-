using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Expire : System.Web.UI.Page
{
    User_BLL BL = new User_BLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        lbmsg.InnerText = "";
        if (BL.AddUserKey(txtkey.Text))
        {
            lbmsg.InnerText = "You have been successfully registered.";
        }
        else
        {
            lbmsg.InnerText = "Your License key is invalid.";
           
        }
    }
}