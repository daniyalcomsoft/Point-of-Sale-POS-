<%@ Page Title="" Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
        .box-pad{
            padding-bottom: 4px;
        }
        .page{
            background-color:#f3f4f5 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">   
    <div class="page-content container-fluid">
          <div class="col-md-9" ></div>
          <div class="col-md-3" >
                               <asp:HyperLink id="SalesID" NavigateUrl="Sales/Sales.aspx"  Width="100%" Font-Underline="false" Text="Sales" runat="server" CssClass="btn1 btn-small btn-primary waves-effect waves-light mgtop4 "> 
                            <i class="icon fa-money icon_custom" aria-hidden="true"></i>
                                Sales
                                </asp:HyperLink>          
                </div>
        <br />
        <h3 style="font-family: system-ui;">Sales Summary</h3>
        <div class="row">     
            <div class="col-xl-3 col-md-3 info-panel form-group">
                <div class="card card-shadow">
                    <div class="card-block bg-white p-20 box-pad">
                        <button type="button" class="btn btn-floating btn-sm btn-warning">
                            <i class="icon fa-th"></i>
                        </button>
                        <span class="ml-15 font-weight-400">Today Sales Amount</span>
                        <div class="content-text text-center mb-0">
                            <i class="text-danger icon wb-triangle-up font-size-20"></i>
                            <span runat="server" id="TodaySalesAmount" class="font-size-40 font-weight-100">PKR 0</span>
                            <p class="blue-grey-400 font-weight-100 m-0">Today Sales Amount</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-3 info-panel form-group">
                <div class="card card-shadow">
                    <div class="card-block bg-white p-20 box-pad">
                        <button type="button" class="btn btn-floating btn-sm btn-primary">
                            <i class="icon fa-clock-o"></i>
                        </button>
                        <span class="ml-15 font-weight-400">Total Sales Today</span>
                        <div class="content-text text-center mb-0">
                            <i class="text-danger icon wb-triangle-up font-size-20"></i>
                            <span runat="server" id="TodayItemSales" class="font-size-40 font-weight-100">0</span>
                            <p class="blue-grey-400 font-weight-100 m-0">Total Sales Today</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-3 info-panel form-group">
                <div class="card card-shadow">
                    <div class="card-block bg-white p-20 box-pad">
                        <button type="button" class="btn btn-floating btn-sm btn-success">
                            <i class="icon fa-check"></i>
                        </button>
                        <span class="ml-15 font-weight-400">Discount Today</span>
                        <div class="content-text text-center mb-0">
                            <i class="text-danger icon wb-triangle-up font-size-20"></i>
                            <span runat="server" id="DiscountToday" class="font-size-40 font-weight-100">PKR</span>
                            <p class="blue-grey-400 font-weight-100 m-0">Total Discount Today</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-3 info-panel form-group">
                <div class="card card-shadow">
                    <div class="card-block bg-white p-20 box-pad">
                        <button type="button" class="btn btn-floating btn-sm btn-danger">
                            <i class="icon fa-tags"></i>
                        </button>
                        <span class="ml-15 font-weight-400">Total Sales Today</span>
                        <div class="content-text text-center mb-0">
                            <i class="text-success icon wb-triangle-down font-size-20"></i>
                            <span runat="server" id="TotalSaleAmountToday" class="font-size-40 font-weight-100">PKR</span>
                            <p class="blue-grey-400 font-weight-100 m-0">Total Sales Today</p>
                        </div>
                    </div>
                </div>
            </div>
                </div>
        
        <div class="row">
            <div class="col-xl-3 col-md-3 info-panel form-group">
                <div class="card card-shadow">
                    <div class="card-block bg-white p-20 box-pad">
                        <button type="button" class="btn btn-floating btn-sm btn-info">
                            <i class="icon fa-th"></i>
                        </button>
                        <span class="ml-15 font-weight-400">Yesterday Sales Amount</span>
                        <div class="content-text text-center mb-0">
                            <i class="text-danger icon wb-triangle-up font-size-20"></i>
                            <span runat="server" id="YesterdaySalesAmount" class="font-size-40 font-weight-100">PKR 0</span>
                            <p class="blue-grey-400 font-weight-100 m-0">Yesterday Total Sales Amount</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-3 info-panel form-group">
                <div class="card card-shadow">
                    <div class="card-block bg-white p-20 box-pad">
                        <button type="button" class="btn btn-floating btn-sm btn-danger">
                            <i class="icon fa-clock-o"></i>
                        </button>
                        <span class="ml-15 font-weight-400">Total Sales Yesterday</span>
                        <div class="content-text text-center mb-0">
                            <i class="text-danger icon wb-triangle-up font-size-20"></i>
                            <span runat="server" id="YesterdayItemSales" class="font-size-40 font-weight-100">0</span>
                            <p class="blue-grey-400 font-weight-100 m-0">Total Sales Yesterday</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-3 info-panel form-group">
                <div class="card card-shadow">
                    <div class="card-block bg-white p-20 box-pad">
                        <button type="button" class="btn btn-floating btn-sm btn-warning">
                            <i class="icon fa-check"></i>
                        </button>
                        <span class="ml-15 font-weight-400">Discount Yesterday</span>
                        <div class="content-text text-center mb-0">
                            <i class="text-danger icon wb-triangle-up font-size-20"></i>
                            <span runat="server" id="DiscountYesterday" class="font-size-40 font-weight-100">PKR</span>
                            <p class="blue-grey-400 font-weight-100 m-0">Total Discount Yesterday</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-3 info-panel form-group">
                <div class="card card-shadow">
                    <div class="card-block bg-white p-20 box-pad">
                        <button type="button" class="btn btn-floating btn-sm btn-success">
                            <i class="icon fa-tags"></i>
                        </button>
                        <span class="ml-15 font-weight-400">Total Sales Yesterday</span>
                        <div class="content-text text-center mb-0">
                            <i class="text-success icon wb-triangle-down font-size-20"></i>
                            <span runat="server" id="TotalSaleAmountYesterday" class="font-size-40 font-weight-100">PKR</span>
                            <p class="blue-grey-400 font-weight-100 m-0">Total Sales Yesterday</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  
    </div>
</asp:Content>