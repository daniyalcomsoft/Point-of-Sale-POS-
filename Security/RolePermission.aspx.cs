using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Security_RolePermission : System.Web.UI.Page
{

    RolePermission_BLL Mod = new RolePermission_BLL();
    private int RoleID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null && Request.QueryString["Name"] != null)
            {
                RoleID = Convert.ToInt32(EncryptDecrypt.Decrypt(Request.QueryString["ID"]));
                string RoleName = EncryptDecrypt.Decrypt(Request.QueryString["Name"]);
                lblRoleName.Text = RoleName;
                BindAllGrid();
                GetModulPermission(RoleID);
                GetRolePagePermission(RoleID);
                hddRoleID.Value = RoleID.ToString();
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "TabActive", "TabActive();", true);
    }

    public void BindAllGrid()
    {
        GridAllModule.DataSource = Mod.GetAllModule(null); // All Module
        GridAllModule.DataBind();

        //GridBranchManagement.DataSource = Mod.GetAllPageByModuleID(1); // BranchManagement
        //GridBranchManagement.DataBind();
        GridBusiness.DataSource = Mod.GetAllPageByModuleID(1); //Business
        GridBusiness.DataBind();
        GridItems.DataSource = Mod.GetAllPageByModuleID(2); //Items
        GridItems.DataBind();
        GridSales.DataSource = Mod.GetAllPageByModuleID(5);
        GridSales.DataBind();
        GridReports.DataSource = Mod.GetAllPageByModuleID(7); //Reports
        GridReports.DataBind();
        GridBackup.DataSource = Mod.GetAllPageByModuleID(8); //Backup
        GridBackup.DataBind();
        GridSecurity.DataSource = Mod.GetAllPageByModuleID(9); // Setup
        GridSecurity.DataBind();
        GridCustomers.DataSource = Mod.GetAllPageByModuleID(14); // Setup
        GridCustomers.DataBind();
        GridExpense.DataSource = Mod.GetAllPageByModuleID(15); // Setup
        GridExpense.DataBind();




    }

    protected void chkAllSelect_CheckedChanged(object sender, EventArgs e)
    {
        hddTabID.Value = "LIAllModule";
        CheckBox chk = (CheckBox)sender;
        GridViewRow dr = (GridViewRow)chk.Parent.Parent;
        Label lblModID = (Label)dr.FindControl("lblModuleID");      
        CheckBox chkView = (CheckBox)dr.FindControl("ChkView");
        CheckApply(Convert.ToInt32(lblModID.Text), chkView.ID, chk.Checked);
      
    }

    protected void ChkView_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = (CheckBox)sender;
        GridViewRow dr = (GridViewRow)chk.Parent.Parent;
        Label lblModID = (Label)dr.FindControl("lblModuleID");
        CheckBox ChkSelected = (CheckBox)dr.FindControl("chkAllSelect");     
        CheckApply(Convert.ToInt32(lblModID.Text), chk.ID, chk.Checked);
    }

   
    protected void GridAllModule_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox chk = (CheckBox)e.Row.FindControl("ChkView") as CheckBox;
            ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(chk);
        }
    }

    private void CheckApply(int ModuleID, string CheckBoxName, bool IsCheck)
    {
        GridView Grid = GetGridName(ModuleID);
        for (int i = 0; i < Grid.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox)Grid.Rows[i].FindControl(CheckBoxName);
            chk.Checked = IsCheck;
        }
    }

    private GridView GetGridName(int ModuleID)
    {
        GridView Grid = null;

        //if (ModuleID == (int)1)
        //{
        //    Grid = GridBranchManagement;
        //}
        if (ModuleID == (int)1)
        {
            Grid = GridBusiness;
        }
        else if (ModuleID == (int)1)
        {
            Grid = GridBusiness;
        }
        else if (ModuleID == (int)2)
        {
            Grid = GridItems;
        }
        else if (ModuleID == (int)5)
        {
            Grid = GridSales;
        }
        else if (ModuleID == (int)7)
        {
            Grid = GridReports;
        }
        else if (ModuleID == (int)8)
        {
            Grid = GridBackup;
        }
        else if (ModuleID == (int)9)
        {
            Grid = GridSecurity;
        }
        else if (ModuleID == (int)14)
        {
            Grid = GridCustomers;
        }
        else if (ModuleID == (int)15)
        {
            Grid = GridExpense;
        }

        return Grid;
    }

  

    protected void lbtnSave_Click(object sender, EventArgs e)
    {
        if (SaveUserRolePermission(Convert.ToInt32(hddRoleID.Value)) == true)
        {
            JQ.ShowStatusMsg(this.Page, "1", "Permission Saved Successfully.");
        }
        else
        {

        }
    }

    private bool SaveUserRolePermission(int RoleID)
    {
        bool IsTrue = false;
        Sessions PSMSSession = (Sessions)Session["PSMSSession"];
        if (PSMSSession != null)
        {
            SqlConnection con = new SqlConnection(ConnectionString.PSMS);
            con.Open();
            SqlTransaction trans = con.BeginTransaction();
            try
            {
                Mod.DeletePagePermissionPagesByRole(RoleID, trans);
                Mod.DeleteModulePermissionByRoleID(RoleID, trans);
                InsertUpdateModulePermission(RoleID, trans, PSMSSession);                
                //InsertUpdateRolePagePermission(GridBranchManagement, RoleID, trans, PSMSSession);              
                InsertUpdateRolePagePermission(GridBusiness, RoleID, trans, PSMSSession);
                InsertUpdateRolePagePermission(GridItems, RoleID, trans, PSMSSession);
                InsertUpdateRolePagePermission(GridSales, RoleID, trans, PSMSSession);
                InsertUpdateRolePagePermission(GridReports, RoleID, trans, PSMSSession);
                InsertUpdateRolePagePermission(GridBackup, RoleID, trans, PSMSSession);
                InsertUpdateRolePagePermission(GridSecurity, RoleID, trans, PSMSSession);
                InsertUpdateRolePagePermission(GridCustomers, RoleID, trans, PSMSSession);
                InsertUpdateRolePagePermission(GridExpense, RoleID, trans, PSMSSession);
                trans.Commit();
                IsTrue = true;
            }
            catch (Exception)
            {
                trans.Rollback();
                IsTrue = false;

            }
        }
        return IsTrue;
    }

    #region InsertUpdateModulePermission
    private void InsertUpdateModulePermission(int RoleID, SqlTransaction Tran, Sessions Sess)
    {
        for (int i = 0; i < GridAllModule.Rows.Count; i++)
        {
         
            CheckBox ChkView = (CheckBox)GridAllModule.Rows[i].FindControl("ChkView");
          
                if (ChkView.Checked) 
                {
                    Mod.RoleID = RoleID;
                    Mod.ModuleID = Convert.ToInt32(((Label)GridAllModule.Rows[i].FindControl("lblModuleID")).Text);
                    Mod.Can_View = ChkView.Checked;
                    Mod.Can_Insert = ChkView.Checked;
                    Mod.Can_Update = ChkView.Checked;
                    Mod.Can_Delete = ChkView.Checked;
                    Mod.Active = true;
                    Mod.InsertUpdateModulePermissionByRoleID(Mod, Tran, Sess);

                }
           
        }
    }
    #endregion

    #region InsertUpdateRolePagePermission
    private void InsertUpdateRolePagePermission(GridView Grid, int RoleID, SqlTransaction Tran, Sessions Sess)
    {
        for (int i = 0; i < Grid.Rows.Count; i++)
        {
         
            CheckBox ChkView = (CheckBox)Grid.Rows[i].FindControl("ChkView");
          
                if (ChkView.Checked)
                {
                    Mod.RoleID = RoleID;
                    Mod.PageID = Convert.ToInt32(((Label)Grid.Rows[i].FindControl("lblPageID")).Text);
                    Mod.Can_View = ChkView.Checked;
                    Mod.Can_Insert = ChkView.Checked;
                    Mod.Can_Update = ChkView.Checked;
                    Mod.Can_Delete = ChkView.Checked;
                    Mod.Active = true;
                    Mod.InsertUpdatePagePermission(Mod, Tran, Sess);
                }
          
        }
    }
    #endregion

    private void GetModulPermission(int RoleID)
    {
        DataTable dt = Mod.GetModuleRightsByRoleID(RoleID);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            for (int j = 0; j < GridAllModule.Rows.Count; j++)
            {
                Label lblModulID = (Label)GridAllModule.Rows[j].FindControl("lblModuleID");
                if (lblModulID.Text == dt.Rows[i]["ModuleID"].ToString())
                {
                   
                    CheckBox ChkView = (CheckBox)GridAllModule.Rows[j].FindControl("ChkView");
                    ChkView.Checked = Convert.ToBoolean(dt.Rows[i]["Can_View"]);
                  
                }
                else
                {
                   
                }
            }
        }
    }

    private void GetRolePagePermission(int RoleID)
    {
        DataTable dt = Mod.GetPagePermissionpPagesByRole(RoleID);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            bool Continue;                      
            Continue = SetRolePagePermissionOnGrid(GridBusiness, dt.Rows[i]);
            if (Continue)
                continue;
            Continue = SetRolePagePermissionOnGrid(GridItems, dt.Rows[i]);
            if (Continue)
                continue;          
            Continue = SetRolePagePermissionOnGrid(GridSales, dt.Rows[i]);
            if (Continue)
                continue;
            Continue = SetRolePagePermissionOnGrid(GridReports, dt.Rows[i]);
            if (Continue)
                continue;
            Continue = SetRolePagePermissionOnGrid(GridBackup, dt.Rows[i]);
            if (Continue)
                continue;
            Continue = SetRolePagePermissionOnGrid(GridSecurity, dt.Rows[i]);
            if (Continue)
                continue;
            Continue = SetRolePagePermissionOnGrid(GridCustomers, dt.Rows[i]);
            if (Continue)
                continue;
            Continue = SetRolePagePermissionOnGrid(GridExpense, dt.Rows[i]);
            if (Continue)
                continue;


        }
    }

    private bool SetRolePagePermissionOnGrid(GridView Grid, DataRow Drow)
    {
        for (int i = 0; i < Grid.Rows.Count; i++)
        {
            Label lblPageID = (Label)Grid.Rows[i].FindControl("lblPageID");
            if (lblPageID.Text == Drow["PageID"].ToString())
            {
              
                CheckBox ChkView = (CheckBox)Grid.Rows[i].FindControl("ChkView");
                ChkView.Checked = Convert.ToBoolean(Drow["Can_View"]);
               

                return true;
            }
        }
        return false;
    }

    protected void chkAll_CheckedChanged(object sender, EventArgs e)
    {
        hddTabID.Value = "LIAllModule";
        CheckBox chk = (CheckBox)sender;
        foreach (GridViewRow AllModule in GridAllModule.Rows)
        {
          
            ((CheckBox)AllModule.FindControl("ChkView")).Checked = chk.Checked;
          
        }

      
        //foreach (GridViewRow AllModule in GridBranchManagement.Rows)
        //{
          
        //    ((CheckBox)AllModule.FindControl("ChkView")).Checked = chk.Checked;
           
        //}
       
        foreach (GridViewRow AllModule in GridBusiness.Rows)
        {
         
            ((CheckBox)AllModule.FindControl("ChkView")).Checked = chk.Checked;
           
        }
        foreach (GridViewRow AllModule in GridItems.Rows)
        {

            ((CheckBox)AllModule.FindControl("ChkView")).Checked = chk.Checked;

        }        
        foreach (GridViewRow AllModule in GridSales.Rows)
        {

            ((CheckBox)AllModule.FindControl("ChkView")).Checked = chk.Checked;

        }
        foreach (GridViewRow AllModule in GridReports.Rows)
        {

            ((CheckBox)AllModule.FindControl("ChkView")).Checked = chk.Checked;

        }
        foreach (GridViewRow AllModule in GridBackup.Rows)
        {

            ((CheckBox)AllModule.FindControl("ChkView")).Checked = chk.Checked;

        }
        foreach (GridViewRow AllModule in GridSecurity.Rows)
        {

            ((CheckBox)AllModule.FindControl("ChkView")).Checked = chk.Checked;

        }
        foreach (GridViewRow AllModule in GridCustomers.Rows)
        {

            ((CheckBox)AllModule.FindControl("ChkView")).Checked = chk.Checked;

        }
        foreach (GridViewRow AllModule in GridExpense.Rows)
        {

            ((CheckBox)AllModule.FindControl("ChkView")).Checked = chk.Checked;

        }
    }
}