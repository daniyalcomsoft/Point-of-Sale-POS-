<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HighestItemSaleReport.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="Rpts_HighestItemSaleReport" %>
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
           function ClientICategorySelected(sender, e) {
             $get("<%=hdCategoryID.ClientID %>").value = e.get_value();
           }
         function ClientItemSelected(sender, e) {
             $get("<%=hdItemID.ClientID %>").value = e.get_value();
         }
          function AutoCompleteExtender1_OnClientPopulating(sender, args) {
           
             sender.set_contextKey($('#<%=hdCategoryID.ClientID %>').val());
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
               
                 <asp:TextBox runat="server" ID="FromDate" TabIndex="2" CssClass="form-control datetimepicker" Width="100%" placeholder="From Date" />
         
                               </div>
             <div class="col-md-3">
                   <label class="control-label">To Date :</label>
               
                 <asp:TextBox runat="server" ID="ToDate" TabIndex="2"  CssClass="form-control datetimepicker" Width="100%" placeholder="End Date" />
                   </div>     

   
      <div class="col-md-3">
                        <label class="control-label">Item Category :</label>
                            <asp:TextBox runat="server" ID="txtCategory" TabIndex="0" CssClass="form-control mgtop4 selectpicker ui-autocomplete-input" OnTextChanged="txtCategory_TextChanged" AutoPostBack="true" placeholder="All Categories" />
                              <asp:AutoCompleteExtender ServiceMethod="SearchItemCategory" MinimumPrefixLength="1"
                                    CompletionInterval="10" CompletionListCssClass="completionList"
                                    CompletionListItemCssClass="listItem"
                                    CompletionListHighlightedItemCssClass="itemHighlighted " EnableCaching="false" CompletionSetCount="10"
                                    TargetControlID="txtCategory" ID="AutoCompleteExtender1" runat="server" FirstRowSelected="true" OnClientItemSelected="ClientICategorySelected">
                                </asp:AutoCompleteExtender>
                                <asp:HiddenField ID="hdCategoryID" runat="server" />
                        </div>
               </div>
    <div class="col-sm-12">
                  <div class="col-md-2">
                      </div>
          <div class="col-md-3">
                        <label class="control-label">Items :</label>
                            <asp:TextBox runat="server" ID="txtItem" TabIndex="0" CssClass="form-control mgtop4 selectpicker ui-autocomplete-input" placeholder="All Items" />
                              <asp:AutoCompleteExtender ServiceMethod="SearchItem" MinimumPrefixLength="1" UseContextKey="true"
                                    CompletionInterval="10" CompletionListCssClass="completionList"
                                    CompletionListItemCssClass="listItem"
                                    CompletionListHighlightedItemCssClass="itemHighlighted " EnableCaching="false" CompletionSetCount="10"
                                  OnClientPopulating="AutoCompleteExtender1_OnClientPopulating"
                                    TargetControlID="txtItem" ID="AutoCompleteExtender3" runat="server" FirstRowSelected="true" OnClientItemSelected="ClientItemSelected">
                                </asp:AutoCompleteExtender> 
                                <asp:HiddenField ID="hdItemID" runat="server" />
                        </div>
            
             </div> <div class="col-sm-12">
                  <div class="col-md-2">
                      </div>
                   <div class="col-md-2">
             <asp:RadioButton runat="server" CssClass="radio-custom" GroupName="AB" ID="rdSale" Checked="true" Text="Sale" />
                <asp:RadioButton runat="server" CssClass="radio-custom" GroupName="AB" ID="rdQty"   Text="Qty"/>
                
          </div>        
           <div class="col-md-1"> 
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


