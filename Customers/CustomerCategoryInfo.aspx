<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerCategoryInfo.aspx.cs"  MasterPageFile="~/MasterPage.master"  Inherits="Customers_CustomerCategory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('#btnAddItem').click(function () {
                $('#ModalCustomerCategory').find('input,textarea').not(':button,:submit,:checkbox').val('');
                $('#ModalCustomerCategory').find('select').val('0');
                showhidecontrol('btnSave', true);
                enabledModal('ModalItem');
            })
        });
        function runScript(e) {
            if (e.keyCode == 13) {
                $("[Id$=btnSearch]").click(); //jquery

            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
        <script type="text/javascript">
            $(document).ready(function () {
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                function EndRequestHandler(sender, args) {
                    $('#btnAddItem').click(function () {
                        $('#ModalCustomerCategory').find('input,select,textarea').not(':button,:submit,:checkbox').val('');
                        $('#ModalCustomerCategory').find('select').val('0');
                        showhidecontrol('btnSave', true);
                        enabledModal('ModalCustomerCategory');
                    });

                }
            });
            </script>
          <div class="panel panel-bordered panel-primary">
                <div class="panel-heading form-group">
                    <h3 class="panel-title">Customer Category</h3>
                </div>

                <div class="panel-body">
                     <div class="row">
                           <div class="col-sm-8 form-group">
                                <div class="col-sm-6 form-group">
                             <asp:TextBox runat="server" ID="txtSearch" onkeypress="return runScript(event);" CssClass="form-control" Width="100%" placeholder="Search"  />  </div>
                              <div class="bs-example">
                                <div class="btn-group">
                                    <asp:Button  runat="server" ID="btnSearch" CssClass="btn1 btn-primary waves-effect waves-light pull-right" OnClick="btnSearch_Click" Text="Search" />
                                </div>
                                <div class="btn-group">
                                     <asp:LinkButton runat="server" ID="btnClear" OnClick="btnClear_Click" Text="Clear" CssClass="btn btn-default pull-right"/> 
                                </div>
                           </div>
                           </div>
                        <div class="col-sm-4 form-group">
                          <button type="button"  data-toggle="modal" data-target="#ModalCustomerCategory" class="btn btn-primary pull-right" id="btnAddItem">Add Customer Category</button>
                        </div>
                    </div>
                      <div class="GridWrapper table-responsive">
                                     <asp:GridView runat="server" EmptyDataRowStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="grdItems" OnPageIndexChanging="grdItems_PageIndexChanging" AllowPaging="true" PageSize="10" DataKeyNames="CustomerCategoryID" CssClass="table table-striped table-bordered dataTable table-responsive table-hover" >
                                        <EmptyDataTemplate>
                                            <h4>No record found</h4>
                                        </EmptyDataTemplate>
                                          <Columns>
                                             <asp:BoundField DataField="CustomerCategoryID" SortExpression="CustomerCategoryID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                              <asp:BoundField DataField="CustomerCategoryID" ItemStyle-Width="10%" SortExpression="CustomerCategoryID" HeaderText="Code" />
                                             <asp:BoundField DataField="CategoryName" HeaderText="Category"  SortExpression="CategoryName" />
                                                    
                                                                                                                                                                         
                                              <asp:TemplateField ItemStyle-Width="20%" HeaderText="Action"  >
                                                 <ItemTemplate>
                                                     <asp:LinkButton runat="server" ToolTip="View" OnCommand="btnView_Command" CommandArgument='<%# Eval("CustomerCategoryID") %>'   ID="btnView" >
                                                         <i class="icon fa-eye icon_custom" aria-hidden="true"></i>
                                                     </asp:LinkButton>
                                                       <asp:LinkButton runat="server" ToolTip="Edit" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("CustomerCategoryID") %>'  ID="btnEdit" >
                                                         <i class="icon fa-edit icon_custom" aria-hidden="true"></i>
                                                     </asp:LinkButton>
                                                          <asp:LinkButton runat="server" ToolTip="Delete" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("CustomerCategoryID") %>'  ID="btnDelete" >
                                                         <i class="icon fa-trash-o icon_custom"  aria-hidden="true"></i>
                                                     </asp:LinkButton>
                                                     </ItemTemplate>
                                                   </asp:TemplateField>

                                            
                                               
                                         </Columns>
                                            <PagerStyle CssClass="GridPager" HorizontalAlign="Right" />
                        <PagerSettings  FirstPageText="First" PageButtonCount="5"  LastPageText="Last" Mode="NumericFirstLast" NextPageText="Next" Position="Bottom" PreviousPageText="Previous" />
                                     </asp:GridView>

                                </div>

                </div>
            </div>
   </ContentTemplate></asp:UpdatePanel>
 <!-- Modal -->
    <div class="modal fade modal-primary" id="ModalCustomerCategory" aria-hidden="true"
        aria-labelledby="ModalCustomerCategory" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                 <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                <div class="modal-header">
                    <h4 class="modal-title">Customer Category</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div id="StatusMsgPopup">
                        </div>
                        <div class="col-sm-12">
                            <div class="form-horizontal" id="ModalForm">
                                
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Category Name :</label>
                                    <div class="col-sm-9">
                                        <asp:HiddenField runat="server" ID="hdID" />
                                        
                                         <asp:HiddenField runat="server" ID="hdName" />
                                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control"  Width="100%" placeholder="Category Name"  />
                                     <asp:RequiredFieldValidator  runat="server" ControlToValidate="txtName"
                                             ErrorMessage="Required!" Display ="Dynamic" ForeColor="Red"  ValidationGroup="Validate" ></asp:RequiredFieldValidator>
                                         </div>
                                </div>
                               
                            
                             
                    
                                 
                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                   <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" ValidationGroup="Validate"  CssClass="btn1 btn-primary waves-effect waves-light"  Text="Save" />
                </div>
             </ContentTemplate></asp:UpdatePanel>
            </div>
        </div>
    </div>
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
             
    <!-- End Modal -->
</asp:Content>


