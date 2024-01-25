<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="KitchenInvoice.aspx.cs" Inherits="Rpts_KitchenInvoice" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice</title>
  

</head>
    
<body  >
   
    
    <form runat="server">

   
       <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
    <div class="row">
        <div class="col-md-2"> </div>
        <div class="col-md-8"> 
<rsweb:ReportViewer  ID="ReportViewer1"  Height="620px"  Width="100%"  runat="server" ></rsweb:ReportViewer></div>
         <div class="col-md-2"> </div>
        </div>
    </form>
        
</body>
    
</html>