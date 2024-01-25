<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"  CodeFile="ItemDetailReport.aspx.cs" Inherits="Reports_ProductDetailReport" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {
            selectpic();
        });
        function selectpic() {
            $(".selectpicker").selectpicker();
        }
        function ClientItemCategorySelected(sender, e) {
             $get("<%=hfCategoryId.ClientID %>").value = e.get_value();
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
                        <label class="col-sm-1 control-label" style="margin-top:9px; margin-left:-15px;">Category:</label>
                            <asp:TextBox runat="server" ID="cmbCategory" TabIndex="0" CssClass="form-control mgtop4 selectpicker ui-autocomplete-input" placeholder="All Categories" />
                                <asp:RequiredFieldValidator  runat="server" ControlToValidate="cmbCategory"
                                             ErrorMessage="Required!" Display ="Dynamic" ForeColor="Red"  InitialValue="0" ValidationGroup="Validate" Type="Integer"></asp:RequiredFieldValidator>
                              <asp:AutoCompleteExtender ServiceMethod="SearchItemCategory" MinimumPrefixLength="1"
                                    CompletionInterval="10" CompletionListCssClass="completionList"
                                    CompletionListItemCssClass="listItem"
                                    CompletionListHighlightedItemCssClass="itemHighlighted " EnableCaching="false" CompletionSetCount="10"
                                    TargetControlID="cmbCategory" ID="AutoCompleteExtender1" runat="server" FirstRowSelected="true" OnClientItemSelected="ClientItemCategorySelected">
                                </asp:AutoCompleteExtender>
                                <asp:HiddenField ID="hfCategoryId" runat="server" />
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




