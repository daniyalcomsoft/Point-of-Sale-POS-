<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SaleReturnDetailReport.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="Rpts_SaleReturnDetailReport" %>
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
     <div class="row ">
         
         
                 <asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>
         <div class="col-sm-12">


         
         <div class="col-md-2"> 
             </div>
           <div class="col-md-3"> 
                <label class="control-label">From Date :</label>
               
                 <asp:TextBox runat="server" ID="txtDatefrom" TabIndex="2" CssClass="form-control datetimepicker" Width="100%" placeholder="From Date" />
         
                               </div>
             <div class="col-md-3">
                   <label class="control-label">To Date :</label>
               
                 <asp:TextBox runat="server" ID="txtDateto" TabIndex="2"  CssClass="form-control datetimepicker" Width="100%" placeholder="End Date" />
     
                   </div>  
                <div class="col-md-3"> 
               <br />
               <asp:Button runat="server"  ID="btnSearch" CssClass="btn1 btn-primary waves-effect waves-light btsearch" OnClick="btnSearch_Click" OnClientClick="return validate('Validate');"  Text="Search" />                                     
           </div>     
               </div>

           </ContentTemplate>
                     </asp:UpdatePanel>
     </div>
     <div class="form-group"></div>
    <div class="row">
        <div class="col-md-2"> </div>
        <div class="col-md-8"> 
<rsweb:ReportViewer  ID="ReportViewer1"  Height="820px"  Width="105%"  runat="server" ></rsweb:ReportViewer></div>
         <div class="col-md-2"> </div>
        </div>

</asp:Content>


