<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
    <title>Point of Sale | Login</title>
    <link rel="shortcut icon" href="favicon.PNG" />   
    <!-- Stylesheets -->
    <link rel="stylesheet" href="App_Script/global/css/bootstrap.min09a2.css?v2.1.0" />
    <link rel="stylesheet" href="App_Script/global/css/bootstrap-extend.min09a2.css?v2.1.0" />
    <link rel="stylesheet" href="App_Script/assets/css/site.min09a2.css?v2.1.0" />
    <link href="App_Script/css/Custom.css" rel="stylesheet" />
    <link href="App_Script/css/jquery.toast.css" rel="stylesheet" />
    <link href="App_Script/css/jquery.toast.min.css" rel="stylesheet" />
    <link href="App_Script/css/validation.css" rel="stylesheet" />
    <!-- Skin tools -->
    <link href="App_Script/assets/skins/cyan.css" rel="stylesheet" />
    <!-- Plugins -->
    <link rel="stylesheet" href="App_Script/global/vendor/animsition/animsition.min09a2.css?v2.1.0" />
    <link rel="stylesheet" href="App_Script/global/vendor/asscrollable/asScrollable.min09a2.css?v2.1.0" />
    <link rel="stylesheet" href="App_Script/global/vendor/switchery/switchery.min09a2.css?v2.1.0" />
    <link rel="stylesheet" href="App_Script/global/vendor/intro-js/introjs.min09a2.css?v2.1.0" />
    <link rel="stylesheet" href="App_Script/global/vendor/slidepanel/slidePanel.min09a2.css?v2.1.0" />
    <link rel="stylesheet" href="App_Script/global/vendor/flag-icon-css/flag-icon.min09a2.css?v2.1.0" />
    <link rel="stylesheet" href="App_Script/global/vendor/waves/waves.min09a2.css?v2.1.0" />
    <!-- Page -->
    <link rel="stylesheet" href="App_Script/assets/css/pages/login-v3.min09a2.css?v2.1.0" />
    <link href="App_Script/css/ladda-themeless.min.css" rel="stylesheet" />
    <!-- Fonts -->
    <link rel="stylesheet" href="App_Script/global/fonts/material-design/material-design.min09a2.css?v2.1.0" />
    <link rel="stylesheet" href="App_Script/global/fonts/brand-icons/brand-icons.min09a2.css?v2.1.0" />
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:400,400italic,700' />
    <!--[if lt IE 9]>
    <!-- Scripts -->
    <script src="App_Script/global/vendor/modernizr/modernizr.min.js"></script>
    <script src="App_Script/global/vendor/breakpoints/breakpoints.min.js"></script>
    <script type="text/javascript">
        Breakpoints();
  </script>
    <style type="text/css">
        .loading-indicator
        {
            height: 80px;
            width: 80px;
            background: url('./App_Images/ajax-loader.gif');
            background-repeat: no-repeat;
            background-position: center center;
        }
        
        .loading-indicator-overlay
        {
            background-color: #FFFFFF;
            opacity: 0.6;
            filter: alpha(opacity = 60);
        }
        .site-skintools
        {
            display: none;
        }
        .Error
        {
            top: -1px !important;
            margin-right: 0px !important;
        }
        .Success
        {
            top: -1px !important;
            margin-right: 0px !important;
        }
         .Footer {
            color: thistle;
        }
         .Footer a {
            color: thistle;
            margin-left:0px !important;
            font-weight:bold;
        }
          .Footer a:hover {
            color: white;
           
        }
          .page-login-v3:before {
    position: fixed;
    top: 0;
    left: 0;
    content: '';
    width: 100%;
    height: 100%;
    background-position: center top;
    -webkit-background-size: cover;
    background-size: cover;
    z-index: -1;
    background: #3498db;
    background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJod…EiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
    background-image: -webkit-linear-gradient(top,#3498db 0,#3498db 100%);
    background-image: -o-linear-gradient(top,#3498db 0,#3498db 100%);
    background-image: -webkit-gradient(linear,left top,left bottom,from(#3498db),to(#3498db));
    background-image: linear-gradient(to bottom,#3498db 0,#3498db 100%);
    background-repeat: repeat-x;
     filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff3949ab', endColorstr='#ff283593', GradientType=0);
}

         .tryBase p{
             color: white;
         }

    </style>
</head>
    <%----%>
<body class="page-login-v3 layout-full" >
    <form id="form1" runat="server">
    <!-- Page -->
    <div class="page animsition vertical-align text-center" data-animsition-in="fade-in"
        data-animsition-out="fade-out">
        <div class="page-content vertical-align-middle">
       
            <div class="panel">
                <div class="panel-body">
                    <div class="brand">
                        <img class="brand-img img-responsive" style="margin-top: 0px; margin-left: 0px;" src="App_Images/CSlogo.png" alt="..." />
                         <%--<h2 class="brand-text font-size-16">Restaurant Point Of Sale System</h2>--%>
                    </div>
                    <div class="form-group form-material floating">
                        <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" Width="100%"
                            Require="Enter Your User Name" ValidateName="Login" ValidateType="TextBox" />
                        <label class="floating-label">
                            User Name</label>
                       
                    </div>
                    
                    <div class="form-group form-material floating">
                        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control"
                            Width="100%" Require="Enter Your Password" ValidateName="Login" ValidateType="TextBox" />
                        <label class="floating-label">
                            Password</label>
                       
                    </div>
                    <button class="btn btn-primary btn-block btn-lg margin-top-40 ladda-button" id="btnLogin"
                        type="button" data-style="expand-left">
                        <span class="ladda-label">Login</span>
                    </button>
                </div>
            </div>
          
             <div class="Footer text-center" >
			Powered by <b><a  href="http://webtechsolution.com.pk" target="_blank" class="text-black"> Webtech Solutions. Pvt (Ltd) </a></b><br/>
			All rights reserved.	
		</div>
        </div>
    </div>
    <!-- End Page -->
    <!-- Core  -->
    <script src="App_Script/global/vendor/jquery/jquery.min.js"></script>
    <script src="App_Script/global/vendor/bootstrap/bootstrap.min.js"></script>
    <script src="App_Script/global/vendor/animsition/animsition.min.js"></script>
    <script src="App_Script/global/vendor/asscroll/jquery-asScroll.min.js"></script>
    <script src="App_Script/global/vendor/mousewheel/jquery.mousewheel.min.js"></script>
    <script src="App_Script/global/vendor/asscrollable/jquery.asScrollable.all.min.js"></script>
    <script src="App_Script/global/vendor/ashoverscroll/jquery-asHoverScroll.min.js"></script>
    <script src="App_Script/global/vendor/waves/waves.min.js"></script>
    <!-- Plugins -->
    <script src="App_Script/global/vendor/switchery/switchery.min.js"></script>
    <script src="App_Script/global/vendor/intro-js/intro.min.js"></script>
    <script src="App_Script/global/vendor/screenfull/screenfull.min.js"></script>
    <script src="App_Script/global/vendor/slidepanel/jquery-slidePanel.min.js"></script>
    <!-- Plugins For This Page -->
    <script src="App_Script/global/vendor/jquery-placeholder/jquery.placeholder.min.js"></script>
    <!-- Scripts -->
    <script src="App_Script/global/js/core.min.js"></script>
    <script src="App_Script/assets/js/site.min.js"></script>
    <script src="App_Script/assets/js/sections/menu.min.js"></script>
    <script src="App_Script/assets/js/sections/menubar.min.js"></script>
    <script src="App_Script/assets/js/sections/sidebar.min.js"></script>
    <script src="App_Script/global/js/configs/config-colors.min.js"></script>
    <script src="App_Script/assets/js/configs/config-tour.min.js"></script>
    <script src="App_Script/global/js/components/asscrollable.min.js"></script>
    <script src="App_Script/global/js/components/animsition.min.js"></script>
    <script src="App_Script/global/js/components/slidepanel.min.js"></script>
    <script src="App_Script/global/js/components/switchery.min.js"></script>
    <script src="App_Script/global/js/components/tabs.min.js"></script>
    <script src="App_Script/global/js/components/jquery-placeholder.min.js"></script>
    <script src="App_Script/global/js/components/material.min.js"></script>
    <script src="App_Script/js/jquery.toast.js"></script>
    <script src="App_Script/js/jquery.toast.min.js"></script>
    <script src="App_Script/js/Custom_toast.js"></script>
    <script src="App_Script/js/CustomFunction.js"></script>
    <script src="Modal/Login/Login.js"></script>
    <script src="App_Script/js/ShowLoading.min.js"></script>
    <script src="App_Script/js/validation.js"></script>
    <script type="text/javascript">
        (function (document, window, $) {
            'use strict';

            var Site = window.Site;
            $(document).ready(function () {
                Site.run();
                $('#btnLogin').click(function (e) {
                    var Revalidate = validate("Login");
                    if (Boolean(Revalidate) == true) {
                        var UserName = $("[Id$=txtUserName]").val();
                        var Password = $("[Id$=txtPassword]").val();
                      
                       OnSubmit(UserName, Password);
                    }
                });

                localStorage.removeItem("remark.materialiconbar.skinTools");
            });
        })(document, window, jQuery);

        $(document).ajaxStart(function () {
            jQuery("#btnLogin").showLoading();
        });

        $(document).ajaxComplete(function () {
            jQuery("#btnLogin").hideLoading();
        });
        </script>
    </form>
</body>
</html>