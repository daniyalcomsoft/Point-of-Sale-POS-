<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SaleDetails.aspx.cs" Inherits="Sales_SaleDetails" %>

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
        function onlynum(e) {
                 var charCode;
                 if (e.keyCode > 0) {
                     charCode = e.which || e.keyCode;
                 }
                 else if (typeof (e.charCode) != "undefined") {
                     charCode = e.which || e.keyCode;
                 }
                 if (charCode == 46) {
                     return true
                 }
                 if (charCode > 31 && (charCode < 48 || charCode > 57))
                     return false;
                 return true;
             }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
    <div class="panel panel-bordered panel-primary">
                <div class="panel-heading form-group">
                    <h3 class="panel-title">Sale List</h3>
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
                    </div>
        <div class="GridWrapper table-responsive" >
                                     <asp:GridView runat="server" OnRowDataBound="grd_RowDataBound" EmptyDataRowStyle-HorizontalAlign="Center" OnPageIndexChanging="grd_PageIndexChanging" AllowPaging="true" PageSize="10" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" ID="grd"  DataKeyNames="SaleNo" CssClass="table table-striped table-bordered dataTable table-responsive table-hover" >
                                        <EmptyDataTemplate>
                                            <h4>No record found</h4>
                                        </EmptyDataTemplate>
                                          <Columns>
                                               <asp:TemplateField SortExpression="SaleNo">
                                    <HeaderTemplate>
                                         <bold>Sale No</bold>
                                        <asp:TextBox runat="server" onkeypress="return runScript(event);" CssClass="form-control" ID="txtSaleNo" placeholder=" Sale #" ></asp:TextBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                       <%# Eval("SaleNo").ToString().PadLeft(6,'0') %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                               <asp:TemplateField SortExpression="SaleDate">
                                    <HeaderTemplate>
                                         <bold>Sale Date</bold>
                                        <asp:TextBox runat="server" onkeypress="return runScript(event);" CssClass="form-control datetimepicker" ID="txtSaleDate" placeholder="Sales Date" ></asp:TextBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                       <%# Eval("SaleDate") == null ? "" : Convert.ToDateTime(Eval("SaleDate")).ToShortDateString() %>
                                    </ItemTemplate>
                                </asp:TemplateField>      
                                               
                                                       <asp:TemplateField SortExpression="OrderType">
                                    <HeaderTemplate>
                                         <bold>Order Type</bold>
                                        <asp:TextBox runat="server" onkeypress="return runScript(event);" CssClass="form-control" ID="txtOrderType" placeholder="Order Type" ></asp:TextBox>                                        
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                       <%# Eval("OrderType") %>                                       
                                    </ItemTemplate>
                                </asp:TemplateField>    
                                              
                                                                        
                                               <asp:TemplateField SortExpression="TotalAmount">
                                    <HeaderTemplate>                                    
                                         <bold>Total</bold>  
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                       <%# Eval("TotalAmount") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                               <asp:TemplateField SortExpression="Discount" >
                                    <HeaderTemplate>
                                   <bold>Discount</bold>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("Discount") %>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                              <asp:TemplateField SortExpression="NetAmount">
                                    <HeaderTemplate>
                                   <bold>Net Amount</bold>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("NetAmount") %>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                              <asp:TemplateField SortExpression="Status">
                                    <HeaderTemplate>
                                   <bold>Status</bold>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbstatus" Text='<%# Eval("Status") %>' ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                               <asp:TemplateField ItemStyle-Width="15%" HeaderText="Action"  >
                                                 <ItemTemplate>   
                                                      <asp:LinkButton runat="server" ToolTip="View" OnCommand="btnView_Command" CommandArgument='<%# Eval("SaleNo") %>'   ID="btnView" >
                                                         <i class="icon fa-eye icon_custom" aria-hidden="true"></i>
                                                     </asp:LinkButton>   
                                                    
                                                       <asp:LinkButton runat="server" ToolTip="Print" OnCommand="btnPrint_Command" CommandArgument='<%# Eval("SaleNo")  %>' ID="btnPrint">
                                                         <i class="icon fa-print icon_custom" aria-hidden="true"></i>
                                                       </asp:LinkButton>
                                                     
                                                       <asp:LinkButton runat="server" ToolTip="Paid" OnCommand="btnPaid_Command" CommandArgument='<%# Eval("SaleNo")  %>' ID="btnPaid">
                                                         <i class="icon fa-check-square-o  icon_custom" aria-hidden="true"></i>
                                                       </asp:LinkButton> 
                                                     
                                                     <asp:LinkButton runat="server" ToolTip="Delete" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("SaleNo") %>'  ID="btnDelete" >
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
      <div class="modal fade modal-primary" id="ModalView" aria-hidden="true"
        aria-labelledby="ModalView" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <h4 class="modal-title">Sales Details</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-horizontal" id="ModalForm">
                                        <asp:Label runat="server" ID="lbreq" Font-Bold="true" Text=""></asp:Label>
                                          <div class="GridWrapper table-responsive">
                                     <asp:GridView runat="server" EmptyDataRowStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="true"  AutoGenerateColumns="False" ID="grddetail" DataKeyNames="SaleNo" CssClass="table table-striped table-bordered dataTable table-responsive table-hover" >
                                        <EmptyDataTemplate>
                                            <h4>No record found</h4>
                                        </EmptyDataTemplate>
                                          <Columns>                                                                                        
                                               <asp:BoundField DataField="SaleNo" HeaderText="SaleNo"  SortExpression="SaleNo" />
                                            <asp:BoundField DataField="Name" HeaderText="Name"  SortExpression="Name" />
                                               <asp:BoundField DataField="Quantity"  HeaderText="Quantity"  SortExpression="Quantity" />  
                                              <asp:BoundField DataField="SalesRate"  HeaderText="SalesRate"  SortExpression="SalesRate" />  
                                              <asp:BoundField DataField="Total" HeaderText="Total"  SortExpression="Total" />                                                  
                                         </Columns>
                                     </asp:GridView>
                                </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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



