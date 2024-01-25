<%@ Page Language="C#" AutoEventWireup="true"   MasterPageFile="~/MasterPage.master" CodeFile="Table.aspx.cs" Inherits="Table_Table" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('#btnAddTable').click(function () {
                $('#ModalTable').find('input,textarea').not(':button,:submit,:checkbox').val('');
                $('#ModalTable').find('select').val('0');
                showhidecontrol('btnSave', true);
                enabledModal('ModalItem');
            })
        });
        function runScript(e) {
            if (e.keyCode == 13) {
                $("[Id$=btnSearch]").click(); 
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
                    $('#btnAddTable').click(function () {
                        $('#ModalTable').find('input,select,textarea').not(':button,:submit,:checkbox').val('');
                        $('#ModalTable').find('select').val('0');
                        showhidecontrol('btnSave', true);
                        enabledModal('ModalTable');
                    });
                }
            });
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
          <div class="panel panel-bordered panel-primary">
                <div class="panel-heading form-group">
                    <h3 class="panel-title">Table Info</h3>
                </div>
                <div class="panel-body">
                     <div class="row">
                           <div class="col-sm-8 form-group">
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
                          <button type="button"  data-toggle="modal" data-target="#ModalTable" class="btn btn-primary pull-right" id="btnAddTable">Add Table</button>
                        </div>
                    </div>
                      <div class="GridWrapper table-responsive">
                                     <asp:GridView runat="server" EmptyDataRowStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="grdItems" OnPageIndexChanging="grdItems_PageIndexChanging" AllowPaging="true" PageSize="10" DataKeyNames="TableID" CssClass="table table-striped table-bordered dataTable table-responsive table-hover" >
                                        <EmptyDataTemplate>
                                            <h4>No record found</h4>
                                        </EmptyDataTemplate>
                                          <Columns>

                                              <asp:TemplateField SortExpression="Table">
                                    <HeaderTemplate>
                                        <bold>Table Name</bold>
                                        <asp:TextBox runat="server" onkeypress="return runScript(event);" CssClass="form-control" ID="txtTable" placeholder="Table Name"></asp:TextBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("TableName") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                              <asp:TemplateField SortExpression="Sort">
                                    <HeaderTemplate>
                                        <bold>Sort</bold>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("Sort") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                             <asp:CheckBoxField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" DataField="Active" HeaderText="Active" SortExpression="Active" />     
                                                                                                                                                                         
                                              <asp:TemplateField ItemStyle-Width="20%" HeaderText="Action"  >
                                                 <ItemTemplate>
                                                     <asp:LinkButton runat="server" ToolTip="View" OnCommand="btnView_Command" CommandArgument='<%# Eval("TableID") %>'   ID="btnView" >
                                                         <i class="icon fa-eye icon_custom" aria-hidden="true"></i>
                                                     </asp:LinkButton>
                                                       <asp:LinkButton runat="server" ToolTip="Edit" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("TableID") %>'  ID="btnEdit" >
                                                         <i class="icon fa-edit icon_custom" aria-hidden="true"></i>
                                                     </asp:LinkButton>
                                                         <asp:LinkButton runat="server" ToolTip="Delete" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("TableID") %>'  ID="btnDelete" >
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

    <div class="modal fade modal-primary" id="ModalTable" aria-hidden="true"
        aria-labelledby="ModalTable" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                 <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                    <h4 class="modal-title">Table Info</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div id="StatusMsgPopup">
                        </div>
                        <div class="col-sm-12">
                            <div class="form-horizontal" id="ModalForm">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" >Table :</label>
                                    <div class="col-sm-7">
                                          <asp:HiddenField runat="server" ID="hdID" />
                                        <asp:HiddenField runat="server" ID="hdName" />
                                        <asp:TextBox runat="server" ID="txtTable" CssClass="form-control" Width="100%" placeholder="Table" />
                                    <asp:RequiredFieldValidator  runat="server" ControlToValidate="txtTable"
                                             ErrorMessage="Required!" Display ="Dynamic" ForeColor="Red"  ValidationGroup="Validate" ></asp:RequiredFieldValidator>
                                         </div>
                                </div>
                               <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" >Sort :</label>
                                    <div class="col-sm-7">
                                        <asp:TextBox runat="server" ID="txtsort" Text="0" CssClass="form-control" onkeypress="return isFloatNumber(this,event);" Width="100%" placeholder="Sort" />
                                    </div>
                                </div>
                                   </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    
                                      <div class="col-sm-3">
                                        <asp:CheckBox runat="server" ID="ckhActive" Checked="true" Text="&nbsp;&nbsp;Active"   />
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
             </ContentTemplate>                    
                 </asp:UpdatePanel>
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
                           <label>Are you sure you want to delete this record ?</label>
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

</asp:Content>