<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BusinessInfo.aspx.cs" Inherits="BusinessInfo_BusinessInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            <style>
                label {
                    color: black;
                    font-weight: bold;
                }
                .GeneralSetting{
                    margin-left: 35%;
                    font-family: monospace;
                    font-weight: bold;
                }
                .SalesSetting{
                    margin-left: 40%;
                    font-family: monospace;
                    font-weight: bold;
                }
            </style>
            <div class="panel panel-bordered panel-primary">
                <div class="panel-heading form-group">
                    <h3 class="panel-title">Business Info</h3>
                </div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="panel-body">
                            <div class="form-horizontal" id="ModalForm">
                                <div class="col-sm-12 form-group">
                                    <div class="col-sm-6">
                                        <h4 class="GeneralSetting">General Setting</h4>
                                        <hr />
                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <label class="control-label">Business Name :</label>
                                                <asp:HiddenField runat="server" ID="hdCID" />
                                                <asp:HiddenField runat="server" ID="hdPicPath" />
                                                <asp:HiddenField runat="server" ID="hdPicGuid" />
                                                <asp:HiddenField runat="server" ID="hdPicName" />
                                                <asp:TextBox runat="server" ID="txtCName" TabIndex="2" CssClass="form-control" Width="100%" placeholder="Company Name" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCName"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="Validate"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="col-sm-6">
                                                <label class="control-label">Phone No :</label>
                                                <asp:TextBox runat="server" ID="txtPhoneNo" TabIndex="3" CssClass="form-control" onkeypress="return isFloatNumber(this,event);" MaxLength="11" Width="100%" placeholder="Phone No" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhoneNo"
                                                    ErrorMessage="Required!" Display="Dynamic" ForeColor="Red" ValidationGroup="Validate"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-sm-12">
                                                <label class="control-label">Email :</label>
                                                <asp:TextBox runat="server" ID="txtEmail" TabIndex="4" CssClass="form-control" Width="100%" placeholder="Email Address" />
                                            </div>

                                            <div class="col-sm-12">
                                                <label class="control-label">Address :</label>
                                                <asp:TextBox runat="server" ID="txtAddress" TabIndex="5" CssClass="form-control" TextMode="MultiLine" Width="100%" placeholder="Address" />
                                            </div>

                                            <div class="col-sm-6 battan" style="padding-left: 16px; margin-top: 30px;">
                                                <asp:FileUpload ID="imageUpload" runat="server" />
                                                <asp:Image ID="foodImages" runat="server" />
                                            </div>

                                            <div class="col-sm-6">
                                                <asp:Image runat="server" Height="88px" ID="ShowImages" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <h4 class="SalesSetting">Sales Setting</h4>
                                        <hr />
                                        <div class="form-group">
                                            <div class="col-sm-6" style="padding-left: 7%;">
                                                <asp:CheckBox runat="server" ID="chkTakeAway" Checked="true" Text="&nbsp;&nbsp;Enable TakeAway on Sales" />
                                          </div>
                                            <div class="col-sm-6" style="padding-left: 7%;">
                                               <label class="control-label">فعال کریں سیلز کیلئے۔ TakeAway</label>
                                          </div>
                                            <div class="col-sm-6" style="padding-left: 7%;">
                                                <asp:CheckBox runat="server" ID="chkDelivery" Checked="true" Text="&nbsp;&nbsp;Enable Delivery on Sales" />
                                            </div>
                                             <div class="col-sm-6" style="padding-left: 7%;">
                                               <label class="control-label">فعال کریں سیلز کیلئے۔ Delivery</label>
                                          </div>
                                            <div class="col-sm-6" style="padding-left: 7%;">
                                                <asp:CheckBox runat="server" ID="chkDinein" Checked="true" Text="&nbsp;&nbsp;Enable Dine-In on Sales" />
                                            </div>
                                            <div class="col-sm-6" style="padding-left: 7%;">
                                               <label class="control-label">فعال کریں سیلز کیلئے۔ Dine-In</label>
                                          </div>
                                            <div class="col-sm-6" style="padding-left: 7%;">
                                                <asp:CheckBox runat="server" ID="chkFK" Checked="true" Text="&nbsp;&nbsp;Print KOT Slip " />
                                            </div>
                                            <div class="col-sm-6" style="padding-left: 7%;">
                                               <label class="control-label">پرچی پرنٹ کریں۔ KOT</label>
                                          </div>
                                            <div class="col-sm-6" style="padding-left: 7%;">
                                                <asp:CheckBox runat="server" ID="chkVkey" Checked="true" Text="&nbsp;&nbsp;Show Virtual Keyboard on Sales" />
                                            </div>  
                                            <div class="col-sm-6" style="padding-left: 7%;">
                                               <label class="control-label">سیلز پر ورچوئل کی بورڈ دکھائیں۔</label>
                                          </div>                                         
                                             <div class="col-sm-6" style="padding-left: 7%;">
                                                 <asp:CheckBox runat="server" ID="chkIsTax" AutoPostBack="true" OnCheckedChanged="chkIsTax_CheckedChanged" Text="&nbsp;&nbsp;Tax Enabled" />
                                            </div>
                                               <div class="col-sm-6" style="padding-left: 7%;">
                                               <label class="control-label">فعال کریں۔ Tax</label>
                                          </div> 
                                            <br />
                                              <div class="col-sm-4" style="margin-left: 5%;">
                                                <asp:TextBox runat="server" ID="txtTaxName" CssClass="form-control" Width="100%" placeholder="Tax Name " />
                                            </div>
                                            <br />
                                              <div class="col-sm-4" style="margin-left: 16%;">
                                                <asp:TextBox runat="server" ID="txtTaxPercentage" CssClass="form-control" Width="100%" onkeypress="return isFloatNumber(this,event);" placeholder="Tax Percentage" />
                                            </div>
                                        </div>
                                             <div class="col-sm-12"  >
                                            <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" ValidationGroup="Validate" CssClass="btn1 btn-primary waves-effect waves-light pull-right" Text="Save" />
                                        </div>
                                    </div>
                                </div>
                                 
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnSave" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>