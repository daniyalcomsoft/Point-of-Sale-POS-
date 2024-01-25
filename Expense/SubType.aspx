<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SubType.aspx.cs" Inherits="Expense_SubType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {
            $('#btnAddUser').click(function () {
                $('#ModalExpenseType').find('input,select,textarea').not(':button,:submit').val('');
                $('#ModalExpenseType').find('select').val('0');
                enabledModal('ModalExpenseType');
                showhidecontrol('btnSave', true);
                $('.selectpicker').selectpicker('refresh');
            })
        });
        function selectpic() {
            $(".selectpicker").selectpicker();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
          <script type="text/javascript">
              $(document).ready(function () {
                  Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                  function EndRequestHandler(sender, args) {
                      $('#btnAddUser').click(function () {
                          $('#ModalExpenseType').find('input,select,textarea').not(':button,:submit').val('');
                          $('#ModalExpenseType').find('select').val('0');
                          enabledModal('ModalExpenseType');
                          showhidecontrol('btnSave', true);
                          $('.selectpicker').selectpicker('refresh');
                      });
                  }
              });
            </script>
          <div class="panel panel-bordered panel-primary">
                <div class="panel-heading form-group">
                    <h3 class="panel-title">Sub Type</h3>
                </div>
                <div class="panel-body">
                     <div class="row">
                           <div class="col-sm-8 form-group">
                              <div class="bs-example">
                                <div class="btn-group">
                                    <asp:Button  runat="server" ID="btnSearch" CssClass="btn1 btn-primary waves-effect waves-light pull-right" OnClick="btnSearch_Click" Text="Search" />
                                </div>
                                <div class="btn-group">
                                     <asp:LinkButton runat="server" ID="btnClear" onclick="btnClear_Click" Text="Clear" CssClass="btn btn-default pull-right"/> 
                                </div>
                           </div>
                           </div>
                        <div class="col-sm-4 form-group">
                          <button type="button"  data-toggle="modal" data-target="#ModalExpenseType" class="btn btn-primary pull-right" id="btnAddUser">Add Sub Type</button>
                        </div>
                    </div>
                    <div class="GridWrapper table-responsive">
                        <asp:GridView runat="server" EmptyDataRowStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="grd" OnPageIndexChanging="grd_PageIndexChanging" AllowPaging="true" PageSize="10" DataKeyNames="SubType" CssClass="table table-striped table-bordered dataTable table-responsive table-hover">
                            <EmptyDataTemplate>
                                <h4>No record found</h4>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField SortExpression="ExpenseType">
                                    <HeaderTemplate>
                                        <bold>Expense Type</bold>
                                        <asp:TextBox runat="server" onkeypress="return runScript(event);" CssClass="form-control" ID="txtExpenseType" placeholder="Expense Type"></asp:TextBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("ExpenseType") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField SortExpression="SubType">
                                    <HeaderTemplate>
                                        <bold>Sub Type</bold>
                                        <asp:TextBox runat="server" onkeypress="return runScript(event);" CssClass="form-control" ID="txtSubType" placeholder="Sub Type"></asp:TextBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("SubType") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="15%" HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ToolTip="View" OnCommand="btnView_Command" CommandArgument='<%# Eval("SubTypeID") %>' ID="btnView">
                                                         <i class="icon fa-eye icon_custom" aria-hidden="true"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ToolTip="Edit" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("SubTypeID") %>' ID="btnEdit">
                                                         <i class="icon fa-edit icon_custom"  aria-hidden="true"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ToolTip="Delete" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("SubTypeID") %>' ID="btnDelete">
                                                         <i class="icon fa-trash-o icon_custom"  aria-hidden="true"></i>
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
   </ContentTemplate></asp:UpdatePanel>
    <div class="modal fade modal-primary" id="ModalConfirmation" aria-hidden="true"
        aria-labelledby="ModalConfirmation" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                 <asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>
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
                   <asp:Button runat="server" ID="btnConfirmation" OnClick="btnConfirmation_Click"  CssClass="btn1 btn-primary waves-effect waves-light"  Text="Yes" />
                </div>
             </ContentTemplate></asp:UpdatePanel>
            </div>
        </div>
    </div>  

    <div class="modal fade modal-primary" id="ModalExpenseType" aria-hidden="true"
        aria-labelledby="ModalUserRole" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                 <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                    <h4 class="modal-title">Sub Type</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div id="StatusMsgPopup">
                        </div>
                        <div class="col-sm-12">
                            <div class="form-horizontal" id="ModalForm">                                
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Expense Type :</label>
                                    <div class="col-sm-7">
                                        <asp:DropDownList runat="server" ID="cmbExpenseType" data-live-search="true" CssClass="form-control selectpicker" Width="100%" />
                                        <asp:RequiredFieldValidator  runat="server" ControlToValidate="cmbExpenseType"
                                             ErrorMessage="Required!" Display ="Dynamic"  ForeColor="Red" InitialValue="0"   ValidationGroup="Validate" ></asp:RequiredFieldValidator>
                                    </div>
                                </div>         
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Sub Type :</label>
                                    <div class="col-sm-7">
                                      <asp:HiddenField runat="server" ID="hdID" />
                                        <asp:TextBox runat="server" ID="txtSubType" CssClass="form-control"  Width="100%" placeholder="Sub Type"  />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                   <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" ValidationGroup="Validate" CssClass="btn1 btn-primary waves-effect waves-light"  Text="Save" />
                </div>
             </ContentTemplate></asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>