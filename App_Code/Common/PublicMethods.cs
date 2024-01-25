using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using SQLHelper;
using System.Web.UI;
using System.Globalization;

/// <summary>
/// Summary description for PublicMethods
/// </summary>
public class PM
{
    public static void Bind_GridView(GridView GridViewName, DataTable DataSource)
    {
        GridViewName.DataSource = DataSource;
        GridViewName.DataBind();
    }
   
    public static void Bind_DropDown(DropDownList ComboboxName, string SpName, string DataTextField, string DataValueField)
    {
        DataTable dt = new DataTable();
        dt = SqlHelper.ExecuteDataset(ConnectionString.PSMS, SpName).Tables[0];
        ComboboxName.DataTextField = DataTextField;
        ComboboxName.DataValueField = DataValueField;
        DataRow row = dt.NewRow();
        row[DataTextField] = "--Please Select---";
        row[DataValueField] = 0;
        dt.Rows.InsertAt(row, 0);
        ComboboxName.DataSource = dt;
        ComboboxName.DataBind();
        ComboboxName.SelectedIndex = 0;
    }
    public static void Bind_DropDownNoSelect(DropDownList ComboboxName, DataTable DataSource, string DataTextField, string DataValueField)
    {
        DataTable dt = new DataTable();
        dt = DataSource;
        ComboboxName.DataTextField = DataTextField;
        ComboboxName.DataValueField = DataValueField;       
        ComboboxName.DataSource = dt;
        ComboboxName.DataBind();
        ComboboxName.SelectedIndex = 0;
    }
    public static void Bind_DropDown(DropDownList ComboboxName, DataTable DataSource, string DataTextField, string DataValueField)
    {
        DataTable dt = new DataTable();
        dt = DataSource;
        ComboboxName.DataTextField = DataTextField;
        ComboboxName.DataValueField = DataValueField;
        DataRow row = dt.NewRow();
        row[DataTextField] = "--Please Select---";
        row[DataValueField] = 0;
        dt.Rows.InsertAt(row, 0);
        ComboboxName.DataSource = dt;
        ComboboxName.DataBind();
        ComboboxName.SelectedIndex = 0;
    }
    public static void Bind_DropDownALL(DropDownList ComboboxName, DataTable DataSource, string DataTextField, string DataValueField)
    {
        DataTable dt = new DataTable();
        dt = DataSource;
        ComboboxName.DataTextField = DataTextField;
        ComboboxName.DataValueField = DataValueField;
        DataRow row = dt.NewRow();
        row[DataTextField] = "All";
        row[DataValueField] = 0;
        dt.Rows.InsertAt(row, 0);
        ComboboxName.DataSource = dt;
        ComboboxName.DataBind();
        ComboboxName.SelectedIndex = 0;
    }

    public static void Bind_DropDown(DropDownList ComboboxName, DataTable DataSource)
    {
        DataTable dt = new DataTable();
        dt = DataSource;
        ComboboxName.DataValueField = dt.Columns[0].ColumnName;
        ComboboxName.DataTextField = dt.Columns[1].ColumnName;
        DataRow row = dt.NewRow();
        row[dt.Columns[1].ColumnName] = "--Please Select--";
        row[dt.Columns[0].ColumnName] = 0;
        dt.Rows.InsertAt(row, 0);
        ComboboxName.DataSource = dt;
        ComboboxName.DataBind();
        ComboboxName.SelectedIndex = 0;
    }
    public static void ToastMsg(Page page, string MsgType, string Msg, string Position)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "ToastMsg('" + MsgType + "','" + Msg + "','" + Position + "');", true);
    }

    public static bool CheckInt(object value)
    {
        int parseVal;
        return ((value == null) || (value == DBNull.Value)) ? false : int.TryParse(value.ToString(), out parseVal) ? true : false;
    }
    public static bool Checklong(object value)
    {
        long parseVal;
        return ((value == null) || (value == DBNull.Value)) ? false : long.TryParse(value.ToString(), out parseVal) ? true : false;
    }
    public static bool CheckDouble(object value)
    {
        double parseVal;
        return ((value == null) || (value == DBNull.Value)) ? false : double.TryParse(value.ToString(), out parseVal) ? true : false;
    }

    public static bool Checkdecimal(object value)
    {
        decimal parseVal;
        return ((value == null) || (value == DBNull.Value)) ? false : decimal.TryParse(value.ToString(), out parseVal) ? true : false;
    }

    public static bool CheckDateTime(object value)
    {
        DateTime parseVal;
        return ((value == null) || (value == DBNull.Value)) ? false : DateTime.TryParseExact(value.ToString(),"MM/dd/yyyy",CultureInfo.InvariantCulture,
            DateTimeStyles.None, out parseVal) ? true : false;
    }
}