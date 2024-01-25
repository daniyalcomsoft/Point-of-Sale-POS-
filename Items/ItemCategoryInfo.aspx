<%@ Page Language="C#" AutoEventWireup="true"   MasterPageFile="~/MasterPage.master" CodeFile="ItemCategoryInfo.aspx.cs" Inherits="Items_ItemCategory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('#btnAddItem').click(function () {
                $('#ModalItemCategory').find('input,textarea').not(':button,:submit,:checkbox').val('');
                $('#ModalItemCategory').find('select').val('0');
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
                    $('#btnAddItem').click(function () {
                        $('#ModalItemCategory').find('input,select,textarea').not(':button,:submit,:checkbox').val('');
                        $('#ModalItemCategory').find('select').val('0');
                        showhidecontrol('btnSave', true);
                        enabledModal('ModalItemCategory');
                    });
                }
            });
            </script>
          <div class="panel panel-bordered panel-primary">
                <div class="panel-heading form-group">
                    <h3 class="panel-title">Item Category</h3>
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
                          <button type="button"  data-toggle="modal" data-target="#ModalItemCategory" class="btn btn-primary pull-right" id="btnAddItem">Add Item Category</button>
                        </div>
                    </div>
                    <div class="GridWrapper table-responsive">
                        <asp:GridView runat="server" EmptyDataRowStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="grdItems" OnPageIndexChanging="grdItems_PageIndexChanging" AllowPaging="true" PageSize="10" DataKeyNames="CategoryID" CssClass="table table-striped table-bordered dataTable table-responsive table-hover">
                            <EmptyDataTemplate>
                                <h4>No record found</h4>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField HeaderText="Image" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ImageUrl='<%# string.IsNullOrEmpty(Eval("PicPath").ToString()) ? "~/App_Images/question.png" : "~/"+Eval("PicPath") %>' Width="40" Height="40px" />

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
                                <asp:BoundField DataField="Sort" HeaderText="Sort" SortExpression="Sort" ItemStyle-Width="10%"/>
                                <asp:CheckBoxField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" DataField="Active" ItemStyle-Width="10%" HeaderText="Active" SortExpression="Active" />
                                <asp:TemplateField ItemStyle-Width="15%" HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ToolTip="View" OnCommand="btnView_Command" CommandArgument='<%# Eval("CategoryID") %>' ID="btnView">
                                                         <i class="icon fa-eye icon_custom" aria-hidden="true"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ToolTip="Edit" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("CategoryID") %>' ID="btnEdit">
                                                         <i class="icon fa-edit icon_custom" aria-hidden="true"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ToolTip="Delete" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("CategoryID") %>' ID="btnDelete">
                                                         <i class="icon fa-trash-o icon_custom"  aria-hidden="true"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ToolTip="Map Flavor" OnCommand="btnAddFlavor_Command" CommandArgument='<%# Eval("CategoryID") %>' ID="btnAddFlavor">
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
   </ContentTemplate></asp:UpdatePanel>

    <div class="modal fade modal-primary" id="ModalItemCategory" aria-hidden="true"
        aria-labelledby="ModalItemCategory" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                 <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                    <h4 class="modal-title">Item Category</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div id="StatusMsgPopup">
                        </div>
                        <div class="col-sm-12">
                            <div class="form-horizontal" id="ModalForm">
                                
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Category Name :</label>
                                    <div class="col-sm-7">
                                        <asp:HiddenField runat="server" ID="hdID" />
                                          <asp:HiddenField runat="server" ID="hdPicPath" />
                                         <asp:HiddenField runat="server" ID="hdPicGuid" />
                                         <asp:HiddenField runat="server" ID="hdPicName" />
                                         <asp:HiddenField runat="server" ID="hdName" />
                                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control"  Width="100%" placeholder="Category Name"  />
                                     <asp:RequiredFieldValidator  runat="server" ControlToValidate="txtName"
                                             ErrorMessage="Required!" Display ="Dynamic" ForeColor="Red"  ValidationGroup="Validate" ></asp:RequiredFieldValidator>
                                         </div>
                                </div>
                                </div>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" >Sort :</label>
                                    <div class="col-sm-7">
                                        <asp:TextBox runat="server" ID="txtsort" CssClass="form-control" Type="number" Width="100%" placeholder="Sort" />
                                    </div>
                                </div>
                                </div>                                  
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    
                                      <div class="col-sm-7">
                                        <asp:CheckBox runat="server" ID="ckhActive" Checked="true" OnCheckedChanged="ckhActive_CheckedChanged" AutoPostBack="true" Text="&nbsp;&nbsp;Active"   />
                                          <br />
                                          <em id="emmsg" visible="false" runat="server">Note: If you inactive category then the related items mapping will be remove.</em>
                                      </div>
                                </div>     
                            <br />
                           <br />
                                 <div class="form-group">   
                                     <div class="col-ms-3 battan" style="padding-left:65px;">                    
                                       <asp:FileUpload ID="imageUpload" runat="server" />                               
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
                     <Triggers>                
                    <asp:PostBackTrigger ControlID="btnSave" />
                 </Triggers>
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

     <div class="modal fade modal-primary" id="ModalFlavor" aria-hidden="true"
        aria-labelledby="ModalFlavor" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                 <asp:UpdatePanel ID="UpdatePanel4" runat="server"><ContentTemplate>
                <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                    <h4 class="modal-title">Flavors</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                         <asp:HiddenField runat="server" ID="hdCatID" />
                        <div id="StatusMsgPopup2">
                        </div>
                        <div class="col-sm-12">
                            <div class="form-horizontal" id="ModalForm1">                                
                            <div class="GridWrapper table-responsive">
                                    <asp:GridView runat="server" EmptyDataRowStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="grdFlavor" DataKeyNames="FlavorID" CssClass="table table-striped table-bordered dataTable table-responsive table-hover" >
                                        <EmptyDataTemplate>
                                            <h4>No record found</h4>
                                        </EmptyDataTemplate>
                                         <Columns>
                                               <asp:BoundField DataField="FlavorID" SortExpression="FlavorID" HeaderText="FlavorID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/> 
                                              <asp:TemplateField HeaderText="Check" HeaderStyle-Width="10%">
                                                            <ItemTemplate>
                                                                <asp:CheckBox runat="server" ID="IsCheck"   Checked='<%# Convert.ToBoolean(Eval("IsCheck")) %>' />                                                               
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                                                      
                                             <asp:BoundField DataField="FlavorName" HeaderText="Flavor"  SortExpression="FlavorName" />                                                                                                                              
                                         </Columns>                                       
                                    </asp:GridView>
                               </div>                                 
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                   <asp:Button runat="server" ID="FlavorSave" OnClick="FlavorSave_Click"  CssClass="btn1 btn-primary waves-effect waves-light"  Text="Save" />
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

