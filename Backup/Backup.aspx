<%@ Page Title="" Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Backup.aspx.cs" Inherits="Backup_Backup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <asp:Button  runat="server" ID="btnBackup" CssClass="btn1 btn-primary waves-effect waves-light " OnClick="btnBackup_Click" Text="Backup POS" />

</asp:Content>

