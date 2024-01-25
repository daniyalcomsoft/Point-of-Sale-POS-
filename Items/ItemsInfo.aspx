<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ItemsInfo.aspx.cs" Inherits="Items_ItemsInfo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            selectpic();
            $('#btnAddItem').click(function () {
                $('#ModalItem').find('input,textarea').not(':button,:submit,:checkbox').val('');
                $('#ModalItem').find('select').val('0');
                showhidecontrol('btnSave', true);
                enabledModal('ModalItem');
                $('.selectpicker').selectpicker('refresh');
            });
            $('#btnAddDeal').click(function () {
                $('#ModalDeal').find('input,textarea').not(':button,:submit,:checkbox').val('');
                $('#ModalDeal').find('select').val('0');
                showhidecontrol('btnDealSave', true);
                enabledModal('ModalDeal');
                $('.selectpicker').selectpicker('refresh');
                $("[Id$=grdDealItems]").find("tr").remove();
                $("[Id$=btnLabelGroup]").css("display", "block");
            });
        });
        function runScript(e) {
            if (e.keyCode == 13) {
                $("[Id$=btnSearch]").click();
            }
        }
        function selectpic() {
            $(".selectpicker").selectpicker();
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
         function ClientLocationSelected(sender, e) {
             $get("<%=hfCategoryId.ClientID %>").value = e.get_value();
         }
         function ItemsSelected(sender, e) {
             $get("<%=hfItemID.ClientID %>").value = e.get_value();
           }
    </script>
     <style>
        .ptext {
        white-space: nowrap;
        overflow: scroll;
        text-overflow: ellipsis;
    }
     .completionList1 {

    position: absolute;
    top: 100%;
    left: 0;
    z-index: 9999999999 !important;   
    float: left;
    min-width: 160px;
    padding: 5px 0;
    margin: 2px 0 0;
    list-style: none;
    font-size: 14px;
    text-align: left;
    background-color: #ffffff;
    border: 1px solid #cccccc;
    border: 1px solid rgba(0, 0, 0, 0.15);
    border-radius: 4px;
    -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
    background-clip: padding-box;
    height:500px;
        } 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                $(document).ready(function () {
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function EndRequestHandler(sender, args) {
                        $('#btnAddItem').click(function () {
                            $('#ModalItem').find('input,select,textarea').not(':button,:submit,:checkbox').val('');
                            $('#ModalItem').find('select').val('0');
                            showhidecontrol('btnSave', true);
                            enabledModal('ModalItem');
                            $('.selectpicker').selectpicker('refresh');
                        });
                        $('#btnAddDeal').click(function () {
                            $('#ModalDeal').find('input,select,textarea').not(':button,:submit,:checkbox').val('');
                            $('#ModalDeal').find('select').val('0');
                            showhidecontrol('btnDealSave', true);
                            enabledModal('ModalDeal');
                            $('.selectpicker').selectpicker('refresh');
                            $("[Id$=grdDealItems]").find("tr").remove();
                            $("[Id$=btnLabelGroup]").css("display", "block");
                        });
                    }
                });
            </script>
            <div class="panel panel-bordered panel-primary">
                <div class="panel-heading form-group">
                    <h3 class="panel-title">Items</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-8 form-group">
                            <div class="bs-example">
                                <div class="btn-group">
                                    <asp:Button runat="server" ID="btnSearch" CssClass="btn1 btn-primary waves-effect waves-light pull-right" OnClick="btnSearch_Click" Text="Search" />
                                </div>
                                <div class="btn-group">
                                    <asp:LinkButton runat="server" ID="btnClear" OnClick="btnClear_Click" Text="Clear" CssClass="btn btn-default pull-right" />
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="bs-example  pull-right">
                                <div class="btn-group">
                                    <button type="button" data-toggle="modal" data-target="#ModalDeal" class="btn1 btn-primary " id="btnAddDeal">Add Deal</button>
                                </div>
                                <div class="btn-group">
                                    <button type="button" data-toggle="modal" data-target="#ModalItem" class="btn btn-primary " id="btnAddItem">Add Item</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="GridWrapper table-responsive">
                        <asp:GridView runat="server" EmptyDataRowStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="grdItems" OnPageIndexChanging="grdItems_PageIndexChanging" AllowPaging="true" PageSize="10" DataKeyNames="ItemID" CssClass="table table-striped table-bordered dataTable table-responsive table-hover">
                            <EmptyDataTemplate>
                                <h4>No record found</h4>
                            </EmptyDataTemplate>
                            <Columns>

                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ImageUrl='<%# string.IsNullOrEmpty(Eval("PicPath").ToString()) ? "~/App_Images/question.png" : "~/"+Eval("PicPath") %>' Width="40" Height="40px" />

                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField SortExpression="CounterName">
                                    <HeaderTemplate>
                                        <bold>Counter Name</bold>
                                        <asp:TextBox runat="server" onkeypress="return runScript(event);" CssClass="form-control" ID="txtCounterName" placeholder="Counter Name"></asp:TextBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("CounterName") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField SortExpression="Name">
                                    <HeaderTemplate>
                                        <bold>Item Name</bold>
                                        <asp:TextBox runat="server" onkeypress="return runScript(event);" CssClass="form-control" ID="txtName" placeholder="Item Name"></asp:TextBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("Name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField SortExpression="CategoryName">
                                    <HeaderTemplate>
                                        <bold>Category Name</bold>
                                        <asp:TextBox runat="server" onkeypress="return runScript(event);" CssClass="form-control" ID="txtCategoryName" placeholder="Category Name"></asp:TextBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("CategoryName") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField SortExpression="PurchaseRate">
                                    <HeaderTemplate>
                                        <bold>Purchase Rate</bold>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("PurchaseRate") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField SortExpression="SaleRate">
                                    <HeaderTemplate>
                                        <bold>Sale Rate</bold>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("SaleRate") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" DataField="Active" HeaderText="Active" SortExpression="Active" />


                                <asp:TemplateField ItemStyle-Width="20%" HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ToolTip="View" OnCommand="btnView_Command" CommandArgument='<%# Eval("ItemID") %>' ID="btnView">
                                                                 <i class="icon fa-eye icon_custom" aria-hidden="true"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ToolTip="Edit" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("ItemID") %>' ID="btnEdit">
                                                                 <i class="icon fa-edit icon_custom" aria-hidden="true"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ToolTip="Delete" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("ItemID") %>' ID="btnDelete">
                                                                 <i class="icon fa-trash-o icon_custom"  aria-hidden="true"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ToolTip="Map Flavor" OnCommand="btnAddFlavorAgainsItem_Command" CommandArgument='<%# Eval("ItemID") %>' ID="btnAddFlavorAgainsItem">
                                                                 <i class="icon fa fa-cutlery icon_custom" aria-hidden="true"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="GridPager" HorizontalAlign="Right" />
                            <PagerSettings FirstPageText="First" PageButtonCount="5" LastPageText="Last" Mode="NumericFirstLast" NextPageText="Next" Position="Bottom" PreviousPageText="Previous" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="modal fade modal-primary" id="ModalItem" aria-hidden="true"
        aria-labelledby="ModalItem" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                            <h4 class="modal-title">Item</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div id="StatusMsgPopup">
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-horizontal" id="ModalForm">

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Counter :</label>
                                            <div class="col-sm-7">
                                                <asp:DropDownList runat="server" ID="cmbCounter" TabIndex="0" data-live-search="true" CssClass="form-control selectpicker" Width="100%" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cmbCounter"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" InitialValue="0" ValidationGroup="Validate" Type="Integer"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-3">Category :</label>
                                            <div class="col-sm-7">
                                                <asp:TextBox ID="cmbCategory" placeholder="Category" Width="100%" CssClass="form-control ui-autocomplete-input" runat="server" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cmbCategory"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="Validate"></asp:RequiredFieldValidator>
                                                <asp:AutoCompleteExtender ServiceMethod="SearchCategory" MinimumPrefixLength="1"
                                                    CompletionInterval="10" CompletionListCssClass="completionList1 ptext"
                                                    CompletionListItemCssClass="listItem"
                                                    CompletionListHighlightedItemCssClass="itemHighlighted " EnableCaching="false" CompletionSetCount="10"
                                                    TargetControlID="cmbCategory" ID="AutoCompleteExtender1" runat="server" FirstRowSelected="true" OnClientItemSelected="ClientLocationSelected">
                                                </asp:AutoCompleteExtender>
                                                <asp:HiddenField ID="hfCategoryId" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Item Name :</label>
                                            <div class="col-sm-7">
                                                <asp:HiddenField runat="server" ID="hdID" />
                                                <asp:HiddenField runat="server" ID="hdName" />
                                                <asp:HiddenField runat="server" ID="hdPicPath" />
                                                <asp:HiddenField runat="server" ID="hdPicGuid" />
                                                <asp:HiddenField runat="server" ID="hdPicName" />
                                                <asp:TextBox runat="server" ID="txtName" TabIndex="2" CssClass="form-control" Width="100%" placeholder="Item Name" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="Validate"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Purchase Rate :</label>
                                            <div class="col-sm-7">
                                                <asp:TextBox runat="server" ID="txtPurchaseRate" TabIndex="4" onkeypress="return onlyNumbersWithDot(event);" CssClass="form-control" Width="100%" placeholder="Purchase Rate" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPurchaseRate"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="Validate"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Sale Rate :</label>
                                            <div class="col-sm-7">
                                                <asp:TextBox runat="server" ID="txtSaleRate" TabIndex="4" onkeypress="return onlyNumbersWithDot(event);" CssClass="form-control" Width="100%" placeholder="Sale Rate" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSaleRate"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="Validate"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Sort :</label>
                                            <div class="col-sm-7">
                                                <asp:TextBox runat="server" ID="txtsorting" TabIndex="5" CssClass="form-control" onkeypress="return isFloatNumber(this,event);" Width="100%" placeholder="Sort" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"></label>

                                            <div class="col-sm-3">
                                                <asp:CheckBox runat="server" ID="ckhActive" Checked="true" Text="&nbsp;&nbsp;Active" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-ms-3 battan" style="padding-left: 65px;">
                                                <asp:FileUpload ID="imageUpload" runat="server" />
                                                <br />
                                                <br />
                                                <asp:Image ID="foodImages" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" ValidationGroup="Validate" CssClass="btn1 btn-primary waves-effect waves-light" Text="Save" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnSave" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <div class="modal fade modal-primary" id="ModalDeal" aria-hidden="true"
        aria-labelledby="ModalDeal" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                    <h4 class="modal-title">Deal</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div id="StatusMsgsPopup">
                        </div>
                        <div class="col-sm-12">
                            <div class="form-horizontal" id="ModalForms">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Deal Name :</label>
                                            <div class="col-sm-7">
                                                <asp:HiddenField runat="server" ID="hdDealID" />
                                                <asp:HiddenField runat="server" ID="hdDealName" />
                                                <asp:HiddenField runat="server" ID="hdDealPicPath" />
                                                <asp:HiddenField runat="server" ID="hdDealPicGuid" />
                                                <asp:HiddenField runat="server" ID="hdDealPicName" />
                                                <asp:TextBox runat="server" ID="txtDealName" TabIndex="2" CssClass="form-control" Width="100%" placeholder="Deal Name" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDealName"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="ValidationDeal"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Purchase Rate :</label>
                                            <div class="col-sm-7">
                                                <asp:TextBox runat="server" ID="txtDealPurchaseRate" TabIndex="4" onkeypress="return onlyNumbersWithDot(event);" CssClass="form-control" Width="100%" placeholder="Deal Purchase Rate" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDealPurchaseRate"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="ValidationDeal"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Sale Rate :</label>
                                            <div class="col-sm-7">
                                                <asp:TextBox runat="server" ID="txtDealSaleRate" TabIndex="5" onkeypress="return onlyNumbersWithDot(event);" CssClass="form-control" Width="100%" placeholder="Deal Sale Rate" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDealSaleRate"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="ValidationDeal"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Sort :</label>
                                            <div class="col-sm-7">
                                                <asp:TextBox runat="server" ID="txtDealSort" TabIndex="5" CssClass="form-control" onkeypress="return isFloatNumber(this,event);" Width="100%" placeholder="Deal Sort" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"></label>
                                            <div class="col-sm-3">
                                                <asp:CheckBox runat="server" ID="ckhDealActive" Checked="true" Text="&nbsp;&nbsp;Active" />
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <div class="form-group">
                                    <div class="col-ms-3 battan" style="padding-left: 65px;">
                                        <asp:FileUpload ID="imageUploadDeal" runat="server" />
                                    </div>
                                </div>
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <div style="background-color: #3498db;">
                                            <h4 class="deals" style="color: white; padding: 5px;">Deal Items</h4>
                                        </div>
                                        <div class="form-group" id="btnLabelGroup" runat="server">
                                            <label class="col-sm-3 control-label" id="btnLabel" runat="server">Item Name :</label>
                                             <div class="col-sm-4">
                                                <asp:TextBox ID="cmbItem"  placeholder="Item" TabIndex="0" Width="100%" CssClass="form-control ui-autocomplete-input" runat="server">
                                                </asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cmbItem"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="ValidationDeal"></asp:RequiredFieldValidator>
                                                <asp:AutoCompleteExtender ServiceMethod="SearchItem" MinimumPrefixLength="1"
                                                    CompletionInterval="10" CompletionListCssClass="completionList1 ptext"
                                                    CompletionListItemCssClass="listItem"
                                                    CompletionListHighlightedItemCssClass="itemHighlighted " EnableCaching="false" CompletionSetCount="10"
                                                    TargetControlID="cmbItem" ID="AutoCompleteExtender2" runat="server" FirstRowSelected="true" OnClientItemSelected="ItemsSelected">
                                                </asp:AutoCompleteExtender>
                                                <asp:HiddenField ID="hfItemID" runat="server" />
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox runat="server" ID="txtQuantity" TabIndex="6" onkeypress="return onlyNumbersWithDot(event);" CssClass="form-control btn-group-xs" Width="100%" placeholder="Quantity" />
                                                   <asp:RequiredFieldValidator runat="server" ControlToValidate="txtQuantity"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="ValidationDeal"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:Button runat="server" ID="btnAddDealItem" OnClick="btnAddDealItem_Click" CssClass="btn1 btn-primary waves-effect waves-light" Text="ADD" />
                                            </div>
                                        </div>

                                        <div class="col-8">
                                            <div class="GridWrapper table-responsive">
                                                <asp:GridView runat="server" EmptyDataRowStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="grdDealItems" DataKeyNames="ItemID" CssClass="table table-striped table-bordered dataTable table-responsive table-hover">
                                                    <EmptyDataTemplate>
                                                        <h4>No record found</h4>
                                                    </EmptyDataTemplate>
                                                    <Columns>
                                                        <asp:BoundField DataField="ItemID" SortExpression="ItemID" HeaderText="Code" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                                        <asp:BoundField DataField="SaleRate" HeaderText="SaleRate" SortExpression="SaleRate" />
                                                        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                                        <asp:TemplateField ItemStyle-Width="20%" HeaderText="Action">
                                                            <ItemTemplate>
                                                                <asp:LinkButton runat="server" ToolTip="Delete" OnCommand="btnDealDelete_Command" CommandArgument='<%# Eval("ItemID") %>' ID="btnDealDelete">
                                                         <i class="icon fa-trash-o icon_custom"  aria-hidden="true"></i>
                                                                </asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>

                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <div class="modal-footer">
                            <asp:LinkButton runat="server" ID="btnClosed" OnClick="btnClosed_Click" Text="Close" CssClass="btn btn-default" />

                            <asp:Button runat="server" ID="btnDealSave" OnClick="btnDealSave_Click" ValidationGroup="ValidationDeal" CssClass="btn1 btn-primary waves-effect waves-light" Text="Save" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnDealSave" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <div class="modal fade modal-primary" id="ModalConfirmation" aria-hidden="true"
        aria-labelledby="ModalConfirmation" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <h4 class="modal-title">Confirmation</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div id="Div1">
                                </div>
                                <div class="col-sm-12">
                                    <asp:HiddenField runat="server" ID="hdDeleteID" />
                                    <label>Are you sure you want to delete this record?</label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                            <asp:Button runat="server" ID="btnConfirmation" OnClick="btnConfirmation_Click" CssClass="btn1 btn-primary waves-effect waves-light" Text="Yes" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <div class="modal fade modal-primary" id="ModalFlavor" aria-hidden="true"
        aria-labelledby="ModalFlavor" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                            <h4 class="modal-title">Flavors</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <asp:HiddenField runat="server" ID="hdItemID" />
                                <div id="StatusMsgPopup2">
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-horizontal" id="ModalForm1">
                                        <label class="control-label">Show On Sale :</label>
                                        <asp:DropDownList runat="server" ID="cmbFlavorAgainstItem" TabIndex="0" data-live-search="true" CssClass="form-control selectpicker" Width="100%">
                                            <asp:ListItem Text="Category & Items Flavors" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Only Items Flavors" Value="1"></asp:ListItem>
                                        </asp:DropDownList>
                                        <div class="GridWrapper table-responsive" style="margin-top: 12px">
                                            <asp:GridView runat="server" EmptyDataRowStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="grdFlavor" DataKeyNames="FlavorID" CssClass="table table-striped table-bordered dataTable table-responsive table-hover">
                                                <EmptyDataTemplate>
                                                    <h4>No record found</h4>
                                                </EmptyDataTemplate>
                                                <Columns>
                                                    <asp:BoundField DataField="FlavorID" SortExpression="FlavorID" HeaderText="FlavorID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                                    <asp:TemplateField HeaderText="Check" HeaderStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="IsCheck" Checked='<%# Convert.ToBoolean(Eval("IsCheck")) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="FlavorName" HeaderText="Flavor" SortExpression="FlavorName" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <asp:Button runat="server" ID="FlavorSaveAgItem" OnClick="FlavorSaveAgItem_Click" CssClass="btn1 btn-primary waves-effect waves-light" Text="Save" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnSave" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>