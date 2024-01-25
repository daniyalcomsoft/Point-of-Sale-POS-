<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DealItem.aspx.cs"  MasterPageFile="~/MasterPage.master"Inherits="Rpts_DealItem" %>
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
    <style>
         .btsearch{
            margin-top:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:updatepanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>

     <div class="row">
           <div class="col-md-2"> </div>          
          <div class="col-md-6">
              <label class="control-label">Deal :</label>
                <asp:DropDownList runat="server" ID="cmbDeal"  data-live-search="true"  CssClass="form-control selectpicker"  Width="100%"  />
          </div>
  
           <div class="col-md-2"> 
               <br />
               <asp:Button runat="server"  ID="btnSearch" CssClass="btn1 btn-primary waves-effect waves-light btsearch" OnClick="btnSearch_Click" OnClientClick="return validate('Validate');"  Text="Search" />
                                     
           </div>
           <div class="col-md-2"> </div>
     </div>
     <div class="form-group"></div>
    <div class="row">
        <div class="col-md-2"> </div>
        <div class="col-md-8"> 
<rsweb:ReportViewer  ID="ReportViewer1"  Height="820px"  Width="105%"  runat="server" ></rsweb:ReportViewer></div>
         <div class="col-md-2"> </div>
        </div>
                </ContentTemplate>
       </asp:updatepanel>
</asp:Content>





