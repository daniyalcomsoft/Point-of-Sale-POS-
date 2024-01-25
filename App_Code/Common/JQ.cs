using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for JQ
/// </summary>
public class JQ
{
    public JQ()
    {
        
    }
    public static void ShowDialog(Page page, string DivID)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "ShowDialog('" + DivID + "');", true);
    }
    public static void CloseDialog(Page page, string DivID)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "CloseDialog('" + DivID + "');", true);
    }
    public static void ShowModal(Page page, string DivID)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "ShowModal('" + DivID + "');", true);
    }
    public static void CloseModal(Page page, string DivID)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "HideModal('" + DivID + "');", true);
    }
    public static void RecallJS(Page page,string FunctionName)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(),FunctionName, true);
    }
    public static void ShowStatusMsg(Page page,string MsgType, string Msg)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "showStatusMsg('" + MsgType + "','" + Msg + "');", true);
    }
    public static void DatePicker(Page page)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "DateTimePicker();DatePicker();", true);
    }

    public static void MonthPicker(Page page)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "MonthPicker();", true);
    }
    public static void ShowStatusMsgPopup(Page page, string MsgType, string Msg)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "showStatusMsgPopup('" + MsgType + "','" + Msg + "');", true);
    }

    public static void ShowStatusMsgPopupFind(Page page, string MsgType, string Msg)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "showStatusMsgPopupFind('" + MsgType + "','" + Msg + "');", true);
    }

    public static void ShowStatusMsgFreeze(Page page, string MsgType, string Msg)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "showStatusMsgFreeze('" + MsgType + "','" + Msg + "');", true);
    }

    public static void ToastMsg(Page page, string MsgType, string Msg, string Position)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "ToastMsg('" + MsgType + "','" + Msg + "','" + Position + "');", true);
    }

    public static void disabledControl(Page page, string DivID)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "disabledModal('" + DivID + "');", true);
    }
    public static void enabledControl(Page page, string DivID)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "enabledModal('" + DivID + "');", true);
    }
    public static void ShowHideControl(Page page, string ControlID,bool Show)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "showhidecontrol('" + ControlID + "','" + Show + "');", true);
    }
    public static void ValidateIniti(Page page, string ControlID)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "validate('" + ControlID + "');", true);
    }
    public static void ShowNumModal(Page page)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "easy_numpad_open();", true);
    }
    public static void CloseNumModal(Page page)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "easy_numpad_close();", true);
    }
    public static void setYScrollposition(Page page,string div,string hdid)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "setYScrollposition('"+ div + "','"+ hdid + "');", true);
    }
    public static void setXScrollposition(Page page, string div, string hdid)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "setXScrollposition('" + div + "','" + hdid + "');", true);
    }
    public static void setActiveItem(Page page, string eleid,string divid)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "setActiveItem('" + eleid + "','" + divid + "');", true);
    }
    public static void SetCursorToTextEnd(Page page, string id)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "SetCursorToTextEnd('" + id + "');", true);
    }
    public static void VKeyboardinit(Page page)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "Keyboardinit();", true);
    }
    public static void ShowKeyboardModal(Page page)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "showKeyboard();", true);
    }
    public static void HideKeyboardModal(Page page)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "hideKeyboard();", true);
    }
}
