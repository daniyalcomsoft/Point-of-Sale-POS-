<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"  EnableEventValidation="false" AutoEventWireup="true" CodeFile="Dining.aspx.cs" Inherits="Sales_Dinning" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <script src="../App_Script/js/jquery.caret.js"></script>
    <link href="../App_Script/css/CustomSale.css" rel="stylesheet" />
       <link href="../App_Script/css/jquery.virtual_keyboard.css" rel="stylesheet" />
      <link href="../App_Script/css/PlusMinusInput.css" rel="stylesheet" />
    <script src="../App_Script/js/jquery.virtual_keyboard.js"></script>
     <script src="../App_Script/js/MinusPlusInput.js"></script>    
     <script>    
         $(document).ready(function () {  
             $('footer').remove();
         });
         function selectpic() {
             $(".selectpicker").selectpicker();
             if ($("[Id$=hdVkey]").val() == "True") {
                 $('[Id$=txtSearch]').keyboard({ open_speed: 0, close_speed: 0 });
             }
             $('[Id$=txtSearch]').caretToEnd(); 
         }
          function printinv(SaleNo) {          
            var winPrint = window.open('<%= ConfigurationManager.AppSettings["ProjectName"] %>/Rpts/Invoice.aspx?SaleNo=' + SaleNo + '', '_blank');
            winPrint.print();
          }
         function printKitinv() {          
             var winPrint = window.open('<%= ConfigurationManager.AppSettings["ProjectName"] %>/Rpts/KitchenInvoice.aspx', '_blank');
            winPrint.print();
         }
             function runScript1(e) {
             if (e.keyCode == 13) {
                 $("[Id$=btnSearch]").click(); //jquery
             }
             else {
                 var charCode;
                 if (e.keyCode > 0) {
                     charCode = e.which || e.keyCode;
                 }
                 else if (typeof (e.charCode) != "undefined") {
                     charCode = e.which || e.keyCode;
                 }
                 if (charCode == 46)
                     return true
                 if (charCode > 31 && (charCode < 48 || charCode > 57))
                     return false;
                 return true;
             }
         }
         function checkflavors(sender, e) {
             e.IsValid = document.querySelector('.AcceptedAgreement input').checked;
         }         
          function ClientCustomerSelected(sender, e) {
             $get("<%=hfCustomerId.ClientID %>").value = e.get_value();
          }
         function isFloatNumber(e, t) {
             var n;
             var r;
             if (navigator.appName == "Microsoft Internet Explorer" || navigator.appName == "Netscape") {
                 n = t.keyCode;
                 r = 1;
                 if (navigator.appName == "Netscape") {
                     n = t.charCode;
                     r = 0
                 }
             } else {
                 n = t.charCode;
                 r = 0
             }
             if (r == 1) {
                 if (!(n >= 48 && n <= 57 || n == 46)) {
                     t.returnValue = false
                 }
             } else {
                 if (!(n >= 48 && n <= 57 || n == 0 || n == 46)) {
                     t.preventDefault()
                 }
             }
         }
         function ClientWaiterSelected(sender, e) {
             $get("<%=hfWaiterId.ClientID %>").value = e.get_value();
           }
       
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hdVkey" />
            <div class="col-md-8">
                <div class="panel panel-default mgbot-10">
                    <div class="panel-body">
                               <div class="col-md-4">
 <asp:HyperLink id="TakeAwayID" NavigateUrl="Sales.aspx" Text="TakeAway"  Font-Underline="false" runat="server" Width="100%" CssClass="btn1 btn-small btn-primary waves-effect waves-light  "> 
                            <i class="icon fa-male icon_custom" aria-hidden="true"></i>
                               TakeAway
                                </asp:HyperLink>
                </div>
                       <div class="col-md-4">
                              <asp:HyperLink id="DeliveryID" NavigateUrl="Delivery.aspx"  Font-Underline="false"  Width="100%" Text="Delivery" runat="server" CssClass="btn1 btn-small btn-primary waves-effect waves-light "> 
                            <i class="icon fa-motorcycle icon_custom" aria-hidden="true"></i>
                               Delivery
                                </asp:HyperLink>
                </div>
                       <div class="col-md-4">
                               <asp:HyperLink id="DineInnID" NavigateUrl="Dining.aspx" Enabled="false" Font-Underline="false"  Width="100%" Text="DineInn" runat="server" CssClass="btn1 btn-small btn-primary waves-effect waves-light selectbtn"> 
                            <i class="icon fa-cutlery icon_custom" aria-hidden="true"></i>
                                Dine Inn
                                </asp:HyperLink>          
                </div>

                         <div class="col-md-4">
                               <label class="col-sm-1 control-label" style="margin-top:9px; margin-left:-15px;">Waiter:</label>
                                   <div style="width:180px; margin-left:45px;">
                                <asp:TextBox runat="server" ID="cmbWaiter" TabIndex="0" data-live-search="true" CssClass="form-control mgtop4 selectpicker ui-autocomplete-input" OnSelectedIndexChanged="cmbWaiter_SelectedIndexChanged" placeholder="Waiter" />
                                       </div>
                              <asp:RequiredFieldValidator  runat="server" ControlToValidate="cmbWaiter"
                                             ErrorMessage="Required!" Display ="Dynamic" ForeColor="Red" ValidationGroup="Validate" Type="Integer"></asp:RequiredFieldValidator>
                              <asp:AutoCompleteExtender ServiceMethod="SearchWaiter" MinimumPrefixLength="1"
                                    CompletionInterval="10" CompletionListCssClass="completionList"
                                    CompletionListItemCssClass="listItem"
                                    CompletionListHighlightedItemCssClass="itemHighlighted " EnableCaching="false" CompletionSetCount="10"
                                    TargetControlID="cmbWaiter" ID="AutoCompleteExtender1" runat="server" FirstRowSelected="true" OnClientItemSelected="ClientWaiterSelected">
                                </asp:AutoCompleteExtender>
                                <asp:HiddenField ID="hfWaiterId" runat="server" />
                             </div>


                         <div class="col-md-4">
                               <asp:LinkButton OnClick="DiscardSale_Click" id="btnDiscardSale"   Width="100%" Font-Underline="false" Text="Discard Sale" runat="server" CssClass="btn1 btn-small btn-primary waves-effect waves-light mgtop4"> 
                            <i class="icon fa-refresh icon_custom" aria-hidden="true"></i>
                                Discard Sale
                                </asp:LinkButton>          
                </div>
                          <div class="col-md-4">
                                <asp:Button runat="server" ID="btnPrint" OnClick="btnPrint_Click" Width="100%" CssClass="btn1 btn-primary waves-effect waves-light mgtop4"  Text="KOT Print" />
                            </div>
                          <div class="col-md-4">
                         <div class="input-group ">
                                            <asp:HiddenField ID="hfCustomerId" runat="server" />                                  
                                <asp:TextBox ID="txtCustomer"  placeholder="Search Customer" TabIndex="3" Width="50%"  CssClass="form-control ui-autocomplete-input mgtop4" runat="server"  />                                                              
                                <asp:AutoCompleteExtender ServiceMethod="SearchCustomers" MinimumPrefixLength="1"
                                    CompletionInterval="10" CompletionListCssClass="completionList"
                                    CompletionListItemCssClass="listItem"
                                    CompletionListHighlightedItemCssClass="itemHighlighted " EnableCaching="false" CompletionSetCount="10"
                                    TargetControlID="txtCustomer" ID="AutoCompleteExtender2" runat="server" FirstRowSelected="true" OnClientItemSelected="ClientCustomerSelected">
                                </asp:AutoCompleteExtender>         
                                 <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCustomer"
                                             ErrorMessage="Required!" Display ="Dynamic" ForeColor="Red"  ValidationGroup="Validate" ></asp:RequiredFieldValidator>
            
                              <div class="input-group-append">
   <button type="button" style="width:50%" data-toggle="modal" data-target="#ModalVendor" class="btn1 btn-small btn-primary waves-effect waves-light mgtop4" id="btnAddVendor">Add Customer</button>
                             </div>
                             
                              </div>
                    </div>
                         <div class="col-md-4">
                           <button type="button" style="width:100%" data-toggle="modal" data-target="#ModalDiningTable" class="btn1 btn-small btn-primary waves-effect waves-light mgtop4" id="btnModalDiningTable">   <i class="icon fa-glass icon_custom" aria-hidden="true"></i> Dining Tables</button>
                        </div>
                         <div class="col-md-4 ">
                            
                                <label id="lbtablename" runat="server"  class="control-label mgtop4"></label>
                             
                             </div>
                              </div>
                </div>
                <div class="col-md-2" style="padding-left: 0px">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h5 class="text-center">Categories</h5>
                            <hr />
                            <asp:TextBox runat="server" ID="txtCSearch" CssClass="form-control" Width="100px" AutoPostBack="true" OnTextChanged="txtCSearch_TextChanged" placeholder="Search" />
                            <hr />
                            <div id="div_cat" style="height: 60vh; overflow-y: scroll">
                                <asp:ListView runat="server" ID="grd">
                                    <EmptyDataTemplate>
                                        <h3 class="text-center">No Category Found</h3>
                                    </EmptyDataTemplate>
                                    <ItemTemplate>
                                        <div class="col-md-12" style="padding-left: 0px; z-index: 99">
                                            <asp:LinkButton runat="server" Font-Underline="false" CommandName="Change" acid='<%# Eval("CategoryID") %>' CommandArgument='<%# Eval("CategoryID") %>' ID="ShowImages" OnCommand="ShowImages_Command" ToolTip='<%#Eval("CategoryName") %>'> 
                                             <div class="lstitm catitm tooltiptext">
                                              <img  src='<%# string.IsNullOrEmpty(Eval("PicPath").ToString()) ? ""+ConfigurationManager.AppSettings["ProjectName"]+"/App_Images/question.png" : ConfigurationManager.AppSettings["ProjectName"]+Eval("PicPath") %>'  />
                                               <p> <%#Eval("CategoryName") %></p>
                                               </div>
                                            </asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-10">
                    <div class="panel panel-default  mgbot-10">
                        <div class="panel-body">
                            <div class="form-inline">
                                <asp:Button runat="server" ID="btnItems" OnClick="btnItems_Click" CssClass="btn1 btn-small btn-primary waves-effect waves-light  mgtop4 " Width="13%"  Text="Items" />
                                <asp:Button runat="server" ID="btnDeals" OnClick="btnDeals_Click" CssClass="btn1 btn-small btn-primary waves-effect waves-light  mgtop4 " Width="13%"  Text="Deals" />
                                <asp:TextBox runat="server" ID="txtSearch" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged" CssClass="form-control " Width="70%"  placeholder="Search" />
                            </div>
                            <hr />
                            <div id="div_itm" style="height: 55vh; overflow-y: auto">
                                <asp:HiddenField runat="server" ID="hditmID" />
                                <asp:ListView runat="server" ID="lstview">
                                    <EmptyDataTemplate>
                                        <h3 class="text-center">No Item Found</h3>
                                    </EmptyDataTemplate>
                                    <ItemTemplate>
                                        <div class="col-md-2 col-sm-2" style="padding-left: 0px">
                                            <asp:LinkButton runat="server" Font-Underline="false" CommandName="Change" acid='<%# Eval("ItemID") %>' CommandArgument='<%# Eval("ItemID") %>' ID="ShowItems" OnCommand="ShowItems_Command" ToolTip='<%#Eval("Name") %>'> 
                                           <div class="lstitm catitm saitem tooltiptext">
                                             <img  src='<%# string.IsNullOrEmpty(Eval("PicPath").ToString()) ? ""+ConfigurationManager.AppSettings["ProjectName"]+"/App_Images/question.png" : ConfigurationManager.AppSettings["ProjectName"]+Eval("PicPath") %>'  />
                                              <p><%#Eval("Name") %><br />Rs.<%#Convert.ToDecimal(Eval("SaleRate")).ToString("##,###")%></p>
                                                </div> 
                                            </asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="padding-left: 0px;">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div id="div_itmdet" style="height: 55vh; overflow-y: auto">
                            <div class="GridWrapper table-responsive">
                                <asp:GridView runat="server" EmptyDataRowStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="grdItems" DataKeyNames="SalesID" CssClass="table table-striped table-bordered dataTable table-responsive table-hover">
                                    <EmptyDataTemplate>
                                        <h4>No record found</h4>
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField HeaderText="Print" HeaderStyle-Width="10%">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="ChkPrint" Enabled='<%# Convert.ToBoolean(Eval("IsPrint")) == true?false:true %>' Checked='<%# Eval("IsPrint") %>' />
                                                <asp:HiddenField runat="server" ID="hdsal" Value='<%# Eval("SalesID") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="SalesID" SortExpression="SalesID" HeaderText="SalesID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="ItemID" SortExpression="ItemID" HeaderText="ItemID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Name" HeaderText="Item" SortExpression="Name" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                        <asp:BoundField DataField="Price" DataFormatString="{0:0}" HeaderText="Price" SortExpression="Price" />
                                        <asp:BoundField DataField="Total" DataFormatString="{0:0}" HeaderText="Total" SortExpression="Total" />
                                        <asp:TemplateField ItemStyle-Width="30%" HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Font-Size="35px" ToolTip="Edit" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("SalesID") %>' ID="btnEdit">
                                                         <i class="icon fa-edit icon_custom" style="font-size:30px" aria-hidden="true"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton runat="server" Font-Size="35px" ToolTip="Delete" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("SalesID") %>' ID="btnDelete">
                                                         <i class="icon fa-times icon_custom"  style="font-size:33px;color:#ec2a2a" aria-hidden="true"></i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <hr />
                        <div class="form-group row">
                            <div class="col-md-4">
                                <label class="control-label">Total</label>
                                <asp:TextBox runat="server" ReadOnly="true" Text="0" class="form-control" ID="txtTotal" />
                            </div>
                      
                            <div class="col-md-4" id="divtax" runat="server">   
                                 <asp:HiddenField runat="server" ID="hdtxtper" Value='<%# Eval("TaxPercentage")%>'  />                       
                                <asp:Label ID="TaxName" Text='<%# Eval("TaxNamePercent").ToString()== string.Empty ? "Tax":Eval("TaxNamePercent") %>' runat="server" CssClass="labelclass" ForeColor="Black"/>                               
                                <asp:TextBox runat="server" Text="0" ReadOnly="true"  CssClass="form-control" ID="txtTax" />
                            </div>
                            <div class="col-md-4">
                                <label class="control-label">Discount</label>
                                    <div class="input-group ">
                                <asp:TextBox runat="server" Text="0" ReadOnly="true" Width="60%" OnTextChanged="txtDiscount_TextChanged" AutoPostBack="true" CssClass="form-control" ID="txtDiscount" />
                             <div class="input-group-append">
                                     <asp:Button runat="server" ID="btnDiscount" OnClick="btnDiscount_Click" ValidationGroup="Validate" Width="40%" CssClass="btn1 btn-primary waves-effect waves-light"  Text="+" />
                                     </div> 
                                        </div> 
                                    </div>   
                            <div class="col-md-4">
                                <label class="control-label">Net Total</label>
                                <asp:TextBox runat="server" ReadOnly="true" Text="0" class="form-control" ID="txtnetTotal" />
                            </div>
                               <div class="col-md-4">
                                <label class="control-label">Cash Received</label>
                                 <div class="input-group ">
                                    <asp:TextBox runat="server" CssClass="form-control" Width="60%" ReadOnly="true" Text="0" OnTextChanged="txtCashReceived_TextChanged" AutoPostBack="true" ID="txtCashReceived" />
                                    <div class="input-group-append">
                                                                <asp:Button runat="server" Width="40%" ID="btnCashReceived"  OnClick="btnCashReceived_Click" ValidationGroup="Validate"  CssClass="btn1 btn-primary waves-effect waves-light pd04" Text="+" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label class="control-label">Return Amount</label>
                                <asp:TextBox runat="server" ReadOnly="true" Text="0" class="form-control" ID="txtReturnAmount" />
                                <asp:HiddenField runat="server" ID="hdSaleNo" />
                            </div>
                              <div class="col-md-4">
                                <label class="control-label"></label>
                                    <asp:Button runat="server" ID="btnInvoicePrint" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" Width="100%" OnClick="btnInvoicePrint_Click" ValidationGroup="Validate" CssClass="btn1 btn-primary waves-effect waves-light"  Text="Bill Print" />
                                    </div>
                              <div class="col-md-8">
                                <label class="control-label"></label>
                                   <asp:Button runat="server" ID="btnPaid" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" Width="100%" OnClick="btnPaid_Click" ValidationGroup="validatewaiter" CssClass="btn1 btn-primary waves-effect waves-light" Text="Bill Paid" />
                                  </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <!-- Modal NumPad -->
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="easy-numpad-frame hide" id="easy-numpad-frame">
                <div class="easy-numpad-container">
                    <div class="easy-numpad-output-container">
                        <asp:HiddenField runat="server" ID="hdtxtType" />
                        <asp:HiddenField runat="server" ID="hdSalesID" />
                        <asp:HiddenField runat="server" ID="hddItemID" />
                        <input type="text" readonly="" runat="server" class="easy-numpad-output" id="numpadoutput" />
                    </div>
                    <div class="easy-numpad-number-container">
                        <table>
                            <tr>
                                <td><a href="7" onclick="easynum()">7</a></td>
                                <td><a href="8" onclick="easynum()">8</a></td>
                                <td><a href="9" onclick="easynum()">9</a></td>
                                <td><a href="Del" class="del" id="del" onclick="easy_numpad_del()">Del</a></td>
                            </tr>
                            <tr>
                                <td><a href="4" onclick="easynum()">4</a></td>
                                <td><a href="5" onclick="easynum()">5</a></td>
                                <td><a href="6" onclick="easynum()">6</a></td>
                                <td><a href="Clear" class="clear" id="clear" onclick="easy_numpad_clear()">Clear</a></td>
                            </tr>
                            <tr>
                                <td><a href="1" onclick="easynum()">1</a></td>
                                <td><a href="2" onclick="easynum()">2</a></td>
                                <td><a href="3" onclick="easynum()">3</a></td>
                                <td><a href="Cancel" class="cancel" id="cancel" onclick="easy_numpad_cancel()">Cancel</a></td>
                            </tr>
                            <tr>
                                <td colspan="2" onclick="easynum()"><a href="0">0</a></td>
                                <td onclick="easynum()"><a href=".">.</a></td>
                                <td>
                                    <asp:Button runat="server" ID="btnSave" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" OnClick="btnSave_Click" Width="100%" ValidationGroup="Validate" CssClass=" done numbtn" Text="Add Item" />
                                    <asp:Button runat="server" ID="btnAddDiscount" OnClick="btnAddDiscount_Click" Width="100%" ValidationGroup="Validate" CssClass=" done numbtn" Text="Add Discount" />
                                    <asp:Button runat="server" ID="btnAddCashReceived" OnClick="btnAddCashReceived_Click" Width="100%" ValidationGroup="Validate" CssClass=" done numbtn" Text="Add Cash" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <!-- Modal NumPad End-->
    <%--Modal Item LIst Start Here--%>
    <div class="modal fade modal-primary" id="ModalItemOrDeal" aria-hidden="true"
        aria-labelledby="ModalItemOrDeal" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <h4 class="modal-title">Flavors</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <asp:HiddenField runat="server" ID="hdfItemID" />                               
                                <div id="StatusMsgPopup3">
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-horizontal" id="ModalForm2">
                                        <div class="GridWrapper table-responsive">
                                            <asp:ListView ID="lstItems" runat="server" ItemPlaceholderID="itemPlaceholder">
                                                <LayoutTemplate>
                                                    <div>
                                                        <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                                                    </div>
                                                </LayoutTemplate>
                                                <ItemTemplate>
                                                    <div class="col-md-12" style=" font-size: 15px; color: #3498db; margin-top: 15px;">
                                                    <asp:Label ID="Name" Text='<%# Eval("Name") %>' runat="server" CssClass="labelclass" />
                                                         </div>
                                                    <div id="inner_result_container" runat="server">
                                                        <asp:ListView ID="lstFlavor" runat="server" ItemPlaceholderID="lstFlavorPlaceHolder" DataSource='<%# Eval("lstFlavor") %>'>
                                                            <LayoutTemplate>
                                                                <div>
                                                                    <asp:PlaceHolder runat="server" ID="lstFlavorPlaceHolder" />
                                                                </div>
                                                            </LayoutTemplate>
                                                            <ItemTemplate>
                                                                 <div class="col-md-3" style="line-height: 0.4;">
                                                                <asp:HiddenField runat="server" ID="ItemID" Value='<%# Eval("ItemID") %>' />
                                                                <asp:HiddenField runat="server" ID="FlavorID" Value='<%# Eval("FlavorID") %>' />
                                                            <asp:CheckBox ID="chkflavor" Checked='<%# Eval("Check") %>' CssClass='<%# "rdb"+Eval("ItemID").ToString()+"_"+Eval("Num").ToString() %> chkclass AcceptedAgreement ' Text='<%# Eval("FlavorName") %>' runat="server" ValidationGroup="flavcheckbox" />
                                                             </div>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                    </div>
                                                    <hr />
                                                </ItemTemplate>
                                            </asp:ListView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <asp:Button runat="server" ID="btnMinus" OnClick="btnMinus_Click" CssClass="button-minus" Text="-" />
                                    <asp:TextBox value="1" runat="server" ID="txtQty" CssClass="Qty form-control" placeholder="Quantity" onkeypress="return runScript1(event);" />
                                    <asp:Button runat="server" ID="btnPlus" OnClick="btnPlus_Click" CssClass="button-plus" Text="+" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtQty"
                                        ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="ValidateFlavor"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6 exitandsave">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <asp:Button runat="server" ID="FlavorSave" UseSubmitBehavior="false" OnClientClick="this.disabled='true'; HideModal('ModalItemOrDeal');" OnClick="FlavorSave_Click" ValidationGroup="ValidateFlavor" CssClass="btn btn-primary waves-effect waves-light" Height="37px" Text="Add" />
                            </div>
                        </div>
                    </ContentTemplate>

                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <%--Modal Item List End Here--%>
<%--    Modal Customer--%>
      <div class="modal fade modal-primary" id="ModalVendor" aria-hidden="true"
        aria-labelledby="ModalVendor" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                 <asp:UpdatePanel ID="UpdatePanel4" runat="server"><ContentTemplate>
                <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                    <h4 class="modal-title">Customer</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div id="StatusMsgPopup">
                        </div>
                        <div class="col-sm-12">
                            <div class="form-horizontal" id="ModalForm">
                              
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Name :</label>
                                    <div class="col-sm-7">
                                        <asp:HiddenField runat="server" ID="hdID" />
                                        <asp:HiddenField runat="server" ID="hdcell" />
                                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Height="35px"  Width="100%" placeholder="Name" />
                                     <asp:RequiredFieldValidator  runat="server" ControlToValidate="txtName"
                                             ErrorMessage="Required!" Display ="Dynamic" ForeColor="Red"  ValidationGroup="ValidateCus" ></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />          
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Cell # :</label>
                                    <div class="col-sm-7">
                                        <asp:TextBox runat="server" ID="txtCell" onkeypress="return isFloatNumber(this,event);" CssClass="form-control" Height="35px" Width="100%" placeholder="Cell #" />
                                    </div>
                                </div>
                                <br />                             
                                 <div class="form-group">
                                    <label class="col-sm-3 control-label">Address :</label>
                                    <div class="col-sm-7">
                                        <asp:TextBox runat="server" ID="txtAddress" TextMode="MultiLine" CssClass="form-control" Height="35px" Width="100%" placeholder="Address" />
                                    </div>
                                </div>
                                  <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    
                                      <div class="col-sm-7">
                                        <asp:CheckBox runat="server" ID="ckhActive" Checked="true" Text="&nbsp;&nbsp;Active"   />
                                    </div>
                                </div>                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                   <asp:Button runat="server" ID="CustomerSave" OnClick="CustomerSave_Click" ValidationGroup="ValidateCus" CssClass="btn1 btn-primary waves-effect waves-light"  Text="Save" Height="37px"/>
                </div>
             </ContentTemplate></asp:UpdatePanel>
            </div>
        </div>
    </div>
  <div class="modal fade modal-primary" id="ModalDiningTable" aria-hidden="true"
        aria-labelledby="ModalDiningTable" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                            <h4 class="modal-title">Dining Tables</h4>
                        </div>
                        <div class="modal-body">
                            <div class="col-md-12">
                              <div class="form-inline" style="display: flex; align-items: center; ">
                                   
                            <div id="div_table" class="">
                                <asp:HiddenField runat="server" ID="hdTableID" />

                                <asp:ListView runat="server" ID="grdtable">
                                    <EmptyDataTemplate>
                                        <h3 class="text-center">No Table Found</h3>
                                    </EmptyDataTemplate>
                                    <ItemTemplate>
                                          <div class="col-lg-2 col-md-3 col-sm-6">
                                        <div class="item">
                                            <asp:LinkButton runat="server" Font-Underline="false" CommandName="Change" acid='<%# Eval("TableID") %>' CommandArgument='<%# Eval("TableID")+","+Eval("TableName") %>' ID="ShowTable" OnCommand="ShowTable_Command" ToolTip='<%#Eval("TableName") %>'> 
                                             <div class="lstitm catitm saitem tbitem tooltiptext">
                                             <img  src='<%# Convert.ToBoolean(Eval("IsUse")) ?  ""+ConfigurationManager.AppSettings["ProjectName"]+"/App_Images/food.png" :  ""+ConfigurationManager.AppSettings["ProjectName"]+"/App_Images/nofood.png" %>'  />
                                             <p> <%#Eval("TableName") %></p>
                                              </div> 
                                            </asp:LinkButton>
                                        </div>
                                              </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                                </div>
                        </div>
                        <div class="modal-footer">
                          <div class="modal-footer">
                   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
                            </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>