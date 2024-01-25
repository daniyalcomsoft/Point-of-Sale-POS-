<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SalesReturn.aspx.cs" Inherits="Sales_SalesReturn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script type="text/javascript">
        function printinv(SaleNo) {
          
            var winPrint = window.open('<%= ConfigurationManager.AppSettings["ProjectName"] %>/Rpts/Invoice.aspx?SaleNo=' + SaleNo + '', '_blank');
            winPrint.print();
        }

        function runScript(e) {
            if (e.keyCode == 13) {
                $("[Id$=btnSearch]").click();
            }
        }
        function selectpic() {
            $(".selectpicker").selectpicker();
        }
        function runScript1(e) {
            if (e.keyCode == 13) {
                $("[Id$=btnSearch]").click();
            }
            else
            {
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
    <div class="panel panel-bordered panel-primary">
                <div class="panel-heading form-group">
                    <h3 class="panel-title">Sale Return</h3>
                </div>
         <div class="panel-body">
               <div class="row">
                   <div class="col-md-12">
                   <asp:RequiredFieldValidator  runat="server" ControlToValidate="txtSearch"
                                             ErrorMessage="Required!" Display ="Dynamic" ForeColor="Red"  ValidationGroup="ValidateSerch" ></asp:RequiredFieldValidator> </div>  
                           <div class="col-sm-8 form-group">                             
                               <div class="bs-example">                                  
                                   <div class="btn-group">               
                                   <asp:TextBox runat="server" ID="txtSearch" onkeypress="return runScript1(event);"  CssClass="form-control" Width="100%" placeholder="Sale #"   />   
                                        </div>
                                <div class="btn-group">
                                     
                                   <asp:Button  runat="server" ID="btnSearch" ValidationGroup="ValidateSerch" CssClass="btn1 btn-primary waves-effect waves-light pull-right" OnClick="btnSearch_Click" Text="Search" />
                                </div>
                                <div class="btn-group">
                                     <asp:LinkButton runat="server" ID="btnClear" OnClick="btnClear_Click" Text="Clear" CssClass="btn btn-default pull-right"/> 
                                </div>
                           </div>                               
                           </div>
                       <div class="col-sm-4">
                       </div>                                      
                    </div>
        <div class="GridWrapper table-responsive" >
                                     <asp:GridView runat="server" ShowFooter="true"   EmptyDataRowStyle-HorizontalAlign="Center"  ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" ID="grd"  DataKeyNames="SalesID" CssClass="table table-striped table-bordered dataTable table-responsive table-hover" >
                                        <EmptyDataTemplate>
                                            <h4>No record found</h4>
                                        </EmptyDataTemplate>                                         
                                          <Columns>
                                              <asp:BoundField DataField="SalesID" SortExpression="SalesID" FooterStyle-CssClass="hide" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />                                                                                                                                                                                                                           
                                             <asp:BoundField DataField="Name" HeaderText="Item" SortExpression="Name" />
                                             <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                               <asp:BoundField DataField="SalesRate" HeaderText="Rate" SortExpression="SalesRate" />
                                               <asp:BoundField DataField="TotalAmount" HeaderText="Amount" SortExpression="TotalAmount" ItemStyle-HorizontalAlign="Right" />
                                               <asp:TemplateField ItemStyle-Width="15%" HeaderText="Action">
                                                 <ItemTemplate>   
                                                      <asp:LinkButton runat="server" ToolTip="Edit" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("SalesID") %>' ID="btnEdit" >
                                                         <i class="icon fa-edit icon_custom" aria-hidden="true"></i>
                                                     </asp:LinkButton>
                                                       <asp:LinkButton runat="server" ToolTip="Delete" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("SalesID") %>'   ID="btnDelete">
                                                         <i class="icon fa-trash-o icon_custom" aria-hidden="true"></i>
                                                       </asp:LinkButton>              
                                                     </ItemTemplate>
                                                   </asp:TemplateField>
                                         </Columns>
                                     </asp:GridView>
                                </div>
        </div>
        </div>
    </ContentTemplate></asp:UpdatePanel> 
    <!-- Modal Addd and Edit -->
    <div class="modal fade modal-primary" id="ModalVendor" aria-hidden="true"
        aria-labelledby="ModalVendor" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                 <asp:UpdatePanel ID="UpdatePanel4" runat="server"><ContentTemplate>
                <div class="modal-header">
                    <h4 class="modal-title">Sales Return</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div id="StatusMsgPopup">
                        </div>
                        <div class="col-sm-12">
                            <div class="form-horizontal" id="ModalAdd">                       
                                <div class="form-group">                                                                       
                                        <asp:HiddenField runat="server" ID="hdSaleID" />                                                                            
                                </div>       
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Quantity :</label>
                                    <div class="col-sm-7">
                                       <asp:HiddenField ID="hfQuantity" runat="server"  />
                                        <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-control" Width="100%" placeholder="Qunatity" />
                                          <asp:RequiredFieldValidator  runat="server" ControlToValidate="txtQuantity"
                                             ErrorMessage="Required!" Display ="Dynamic" ForeColor="Red"  ValidationGroup="Validate" ></asp:RequiredFieldValidator>
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
                            <asp:HiddenField runat="server" ID="hdSaleNo" />
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
</asp:Content>