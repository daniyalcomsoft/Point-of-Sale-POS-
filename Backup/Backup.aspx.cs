using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Backup_Backup : System.Web.UI.Page
{
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
                if (dtRole.Rows[row]["PageUrl"].ToString() == "Backup/Backup.aspx")
                {
                    pageName = dtRole.Rows[row]["PageUrl"].ToString();
                    view = Convert.ToBoolean(dtRole.Rows[row]["Can_View"].ToString());
                    break;
                }
            }
            if (dtRole.Rows.Count > 0)
            {
                if (pageName == "Backup/Backup.aspx" && view == true)
                {
                   
                }
                else
                {
                    Response.Redirect("Default.aspx", false);
                }
            }
        }       
    }
    public void getBackup()
    {
            SqlConnection con = new SqlConnection();
            SqlCommand sqlcmd = new SqlCommand();
            con.ConnectionString = ConnectionString.PSMS;
            Guid g;
            g = Guid.NewGuid();

        System.Data.SqlClient.SqlConnectionStringBuilder builder = new System.Data.SqlClient.SqlConnectionStringBuilder(con.ConnectionString);

        con.Open();
                sqlcmd = new SqlCommand("backup database "+ builder.InitialCatalog + " to disk='" + ConfigurationManager.AppSettings["BackupFolder"] + "\\"+ builder.InitialCatalog + "_" + g + ".bak'", con);
                sqlcmd.ExecuteNonQuery();
                con.Close();
    }
    protected void btnBackup_Click(object sender, EventArgs e)
    {
        try
        {
            getBackup();
            JQ.ShowStatusMsg(this.Page, "1", "Backup Created Successfully.");
        }
        catch (Exception ex)
        {
            JQ.ShowStatusMsg(this.Page, "2", ex.Message);
        }
    }
}