<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ExpenseReport.aspx.cs" Inherits="Rpts_ExpenseReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <script>    
         $(document).ready(function () {  
             selectpic();
         });
         function selectpic() {
             $(".selectpicker").selectpicker();
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
     <div class="row">
        <div class="col-md-2"> </div>
          <div class="col-md-3">
               <label class="control-label">From Date :</label> 
                 <asp:TextBox runat="server" ID="Datefrom" TabIndex="2" CssClass="form-control datetimepicker" Width="100%" placeholder="ExpenseDate" />
              </div>
          <div class="col-md-3"> 
               <label class="control-label">To Date :</label>
                 <asp:TextBox runat="server" ID="Dateto" TabIndex="2" CssClass="form-control datetimepicker" Width="100%" placeholder="ExpenseDate" />
              </div>
         <div class="col-md-3">
              <label class="control-label">Expense Category :</label>
                <asp:DropDownList runat="server" ID="cmbCategory" data-live-search="true" CssClass="form-control selectpicker"  Width="100%" OnTextChanged="cmbCategory_TextChanged"  AutoPostBack="true" />
          </div>
         <br />
        <div class="col-sm-12">
            <div class="col-md-2">
                      </div>
              <div class="col-md-3">
                  <label class="control-label">Sub Type :</label>
                    <asp:DropDownList runat="server" ID="cmbsubtype"  data-live-search="true"  CssClass="form-control selectpicker"  Width="100%"  />
              </div>
          <div class="col-md-1" >
              <br />
              <asp:Button runat="server" ID="btnSearch" CssClass="btn1 btn-primary waves-effect waves-light" ValidationGroup="Validate" OnClick="btnSearch_Click" Text="Search" />
          </div>
             </div>
         </div>
         <div class="col-md-2"> </div>
    <div class="form-group"></div>
      <div class="row">
        <div class="col-md-2"> </div>
        <div class="col-md-8"> 
<rsweb:ReportViewer  ID="ReportViewer1"  Height="620px" class="rptwhite" Width="100%"  runat="server" ></rsweb:ReportViewer></div>
         <div class="col-md-2"> </div>
        </div>
  </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>








