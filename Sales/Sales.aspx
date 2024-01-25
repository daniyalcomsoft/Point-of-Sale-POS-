<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"  EnableEventValidation="false" AutoEventWireup="true" CodeFile="Sales.aspx.cs" Inherits="Sales_Sales" %>
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
         }
         function selectpic() {
             $(".selectpicker").selectpicker();
             if ($("[Id$=hdVkey]").val() == "True") {
                 $('[Id$=txtSearch]').keyboard({ open_speed: 0, close_speed: 0 });
             }
             $('[Id$=txtSearch]').caretToEnd();
         }       
         function printinv(SaleNo) {
             window.open('<%= ConfigurationManager.AppSettings["ProjectName"] %>/Sales/Sales.aspx', '_self');
             var winPrint = window.open('<%= ConfigurationManager.AppSettings["ProjectName"] %>/Rpts/Invoice.aspx?SaleNo=' + SaleNo + '', '_blank');
             winPrint.print();
         }
         function printKitinv() {
          
             var winPrint = window.open('<%= ConfigurationManager.AppSettings["ProjectName"] %>/Rpts/KitchenInvoice.aspx', '_blank');
            winPrint.print();
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
    </script>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hdVkey" />
            <asp:HiddenField runat="server" ID="hdDelivery" />
            <asp:HiddenField runat="server" ID="hdDineInn" />
            <asp:HiddenField runat="server" ID="hdTakeAway" />
            <div class="col-md-8">
                <div class="panel panel-default mgbot-10 ">
                    <div class="panel-body">
                        <div class="col-md-4">
                            <asp:HyperLink ID="TakeAwayID" NavigateUrl="Sales.aspx" Text="TakeAway" Enabled="false" Font-Underline="false" runat="server" Width="100%" CssClass="btn1 btn-small btn-primary waves-effect waves-light selectbtn mgtop4"> 
                            <i class="icon fa-male icon_custom" aria-hidden="true"></i>
                               TakeAway
                            </asp:HyperLink>
                        </div>
                        <div class="col-md-4">
                            <asp:HyperLink ID="DeliveryID" NavigateUrl="Delivery.aspx" Font-Underline="false" Width="100%" Text="Delivery" runat="server" CssClass="btn1 btn-small btn-primary waves-effect waves-light mgtop4"> 
                            <i class="icon fa-motorcycle icon_custom" aria-hidden="true"></i>
                                Delivery
                            </asp:HyperLink>
                        </div>
                        <div class="col-md-4">
                            <asp:HyperLink ID="DineInnID" NavigateUrl="Dining.aspx" Width="100%" Font-Underline="false" Text="DineInn" runat="server" CssClass="btn1 btn-small btn-primary waves-effect waves-light mgtop4"> 
                            <i class="icon fa-cutlery icon_custom" aria-hidden="true"></i>
                                Dine Inn
                            </asp:HyperLink>
                        </div>
                        <div class="col-md-4">
                            <div class="input-group ">
                                <asp:HiddenField ID="hfCustomerId" runat="server" />
                                <asp:TextBox ID="txtCustomer" placeholder="Search Customer" TabIndex="3" Width="60%" CssClass="form-control ui-autocomplete-input mgtop4" runat="server" />
                                <asp:AutoCompleteExtender ServiceMethod="SearchCustomers" MinimumPrefixLength="1"
                                    CompletionInterval="10" CompletionListCssClass="completionList"
                                    CompletionListItemCssClass="listItem"
                                    CompletionListHighlightedItemCssClass="itemHighlighted " EnableCaching="false" CompletionSetCount="10"
                                    TargetControlID="txtCustomer" ID="AutoCompleteExtender2" runat="server" FirstRowSelected="true" OnClientItemSelected="ClientCustomerSelected">
                                </asp:AutoCompleteExtender>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCustomer"
                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="Validate"></asp:RequiredFieldValidator>
                                <div class="input-group-append">
                                    <button type="button" style="width: 40%" data-toggle="modal" data-target="#ModalVendor" class="btn1 btn-small btn-primary waves-effect waves-light mgtop4" id="btnAddVendor">Customer</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <asp:HyperLink ID="btnDiscardSale" NavigateUrl="Sales.aspx" Width="100%" Font-Underline="false" Text="Discard Sale" runat="server" CssClass="btn1 btn-small btn-primary waves-effect waves-light mgtop4"> 
                            <i class="icon fa-refresh icon_custom" aria-hidden="true"></i>
                                Discard Sale
                            </asp:HyperLink>
                        </div>

                    </div>
                </div>

                <div class="col-md-2" style="padding-left: 0px">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h5 class="text-center">Categories</h5>                        
                            <asp:TextBox runat="server" ID="txtCSearch" CssClass="form-control" Width="100px" AutoPostBack="true" OnTextChanged="txtCSearch_TextChanged" placeholder="Search" />
                            <hr />
                            <div id="div_cat" style="height: 58vh; width:100px; overflow-y: scroll">
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
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">
                                <asp:Button runat="server" ID="btnItems" OnClick="btnItems_Click" CssClass="btn1 btn-small btn-primary waves-effect waves-light mgtop4" Width="13%" Text="Items" />
                                <asp:Button runat="server" ID="btnDeals" OnClick="btnDeals_Click" CssClass="btn1 btn-small btn-primary waves-effect waves-light mgtop4" Width="13%" Text="Deals" />
                                <asp:TextBox TabIndex="12" runat="server" ID="txtSearch" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged" CssClass="form-control virtualKeyboard" Width="70%" placeholder="Search" />
                            </div>
                            <hr />
                            <div id="div_itm" style="height: 62vh; overflow-y: auto">
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
                        <div id="div_itmdet" style="height: 58vh; overflow-y: auto">
                            <div class="GridWrapper table-responsive">
                                <asp:GridView runat="server" EmptyDataRowStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="grdItems" DataKeyNames="SalesTempID" CssClass="table table-striped table-bordered dataTable table-responsive table-hover">
                                    <EmptyDataTemplate>
                                        <h4>No Record Found</h4>
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:BoundField DataField="SalesTempID" SortExpression="SalesTempID" HeaderText="SalesTempID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="ItemID" SortExpression="ItemID" HeaderText="ItemID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Name" HeaderText="Item" SortExpression="Name" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                        <asp:BoundField DataField="Price" DataFormatString="{0:0}" HeaderText="Price" SortExpression="Price" />
                                        <asp:BoundField DataField="Total" DataFormatString="{0:0}" HeaderText="Total" SortExpression="Total" />
                                        <asp:TemplateField ItemStyle-Width="30%" HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Font-Size="35px" ToolTip="Edit" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("SalesTempID") %>' ID="btnEdit">
                                                         <i class="icon fa-edit icon_custom" style="font-size:30px" aria-hidden="true"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton runat="server" Font-Size="35px" ToolTip="Delete" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("SalesTempID") %>' ID="btnDelete">
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
                            <div class="col-md-4" runat="server">
                                <label class="control-label">Total</label>
                                <asp:TextBox runat="server" ReadOnly="true" Text="0" CssClass="form-control" ID="txtTotal" />
                            </div>
                            <div class="col-md-4" id="divtax" runat="server">
                                <asp:HiddenField runat="server" ID="hdtxtper" Value='<%# Eval("TaxPercentage")%>' />
                                <asp:Label ID="TaxName" runat="server" CssClass="labelclass" ForeColor="Black" />
                                <asp:TextBox runat="server" Text="0" ReadOnly="true" CssClass="form-control" ID="txtTax" />
                            </div>
                            <div class="col-md-4">
                                <label class="control-label">Discount</label>
                                <div class="input-group ">
                                    <asp:TextBox runat="server" Text="0" ReadOnly="true" Width="60%" OnTextChanged="txtDiscount_TextChanged" AutoPostBack="true" CssClass="form-control" ID="txtDiscount" />
                                    <div class="input-group-append">
                                        <asp:Button runat="server" ID="btnDiscount" Width="40%" OnClick="btnDiscount_Click" ValidationGroup="Validate" CssClass="btn1 btn-primary waves-effect waves-light pd04" Text="+" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label class="control-label">Net Total</label>
                                <asp:TextBox runat="server" ReadOnly="true" Text="0" CssClass="form-control" ID="txtnetTotal" />
                            </div>
                            <div class="col-md-4">
                                <label class="control-label">Cash Received</label>
                                <div class="input-group ">
                                    <asp:TextBox runat="server" CssClass="form-control" Width="60%" ReadOnly="true" Text="0" OnTextChanged="txtCashReceived_TextChanged" AutoPostBack="true" ID="txtCashReceived" />
                                    <div class="input-group-append">
                                        <asp:Button runat="server" Width="40%" ID="btnCashReceived" OnClick="btnCashReceived_Click" ValidationGroup="Validate" CssClass="btn1 btn-primary waves-effect waves-light pd04" Text="+" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label class="control-label">Return Amount</label>
                                <asp:TextBox runat="server" ReadOnly="true" Text="0" CssClass="form-control" ID="txtReturnAmount" />
                                <asp:HiddenField runat="server" ID="hdSaleNo" />
                            </div>
                            <div class="col-md-12">
                                <label class="control-label"></label>
                                <asp:Button runat="server" ID="btnInvoicePrint" Width="100%" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" OnClick="btnInvoicePrint_Click" ValidationGroup="Validate" CssClass="btn1 btn-primary waves-effect waves-light" Text="Pay & Print" />

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
                        <asp:HiddenField runat="server" ID="hdTempID" />
                        <asp:HiddenField runat="server" ID="hdItemID" />
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
    <%--Modal Item List Start Here--%>
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
                                        <asp:ListView ID="lstItems" runat="server" ItemPlaceholderID="itemPlaceholder">
                                            <LayoutTemplate>
                                                <div>
                                                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                                                </div>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <div class="col-md-12" style="font-size: 15px; color: #3498db; margin-top: 15px;">
                                                    <asp:Label ID="Name" Text='<%# Eval("Name") %>' runat="server" CssClass="labelclass" />
                                                </div>
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
                                            </ItemTemplate>
                                        </asp:ListView>
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
                                <asp:Button runat="server" UseSubmitBehavior="false" OnClientClick="this.disabled='true';HideModal('ModalItemOrDeal');" ID="FlavorSave" OnClick="FlavorSave_Click" ValidationGroup="ValidateFlavor" CssClass="btn btn-primary waves-effect waves-light" Height="37px" Text="Add" />
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
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
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
                                                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Style="height: 35px" Width="100%" placeholder="Name" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="ValidateCUS"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Cell # :</label>
                                            <div class="col-sm-7">
                                                <asp:TextBox runat="server" ID="txtCell" onkeypress="return isFloatNumber(this,event);" MaxLength="11" CssClass="form-control" Height="35px" Width="100%" placeholder="Cell #" />
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Address :</label>
                                            <div class="col-sm-7">
                                                <asp:TextBox runat="server" ID="txtAddress" TextMode="MultiLine" CssClass="form-control" Width="100%" placeholder="Address" />
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"></label>

                                            <div class="col-sm-7">
                                                <asp:CheckBox runat="server" ID="ckhActive" Checked="true" Text="&nbsp;&nbsp;Active" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <asp:Button runat="server" ID="CustomerSave" OnClick="CustomerSave_Click" ValidationGroup="ValidateCUS" CssClass="btn1 btn-primary waves-effect waves-light" Text="Save" Height="37px" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>