<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserMenu.ascx.cs" Inherits="UserMenu" %>
<style>
    .anc:hover {
        background: #fff !important;
        color: #000 !important;
    }

    .anc, .anc:active {
        color: #fff !important;
        font-size: 13px;
        font-family: 'Century Gothic';
    }

    .lis:active {
        color: #fff !important;
        font-size: 18px;
        font-family: 'Century Gothic';
    }

    .navbar-inverse, .navbar-inverse:focus {
        background: rgba(247, 92, 33, 0.95);
        border: rgba(247, 92, 33, 0.95);
        box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
        height: 80px;
        padding-top: 15px;
    }

    .dropdown-toggle:active, .dropdown-toggle:focus {
        background: rgba(247, 92, 33, 0.95) !important;
    }

    .navbar-brand {
        font-size: 18px;
        color: #fff !important;
        font-family: 'Century Gothic';
        text-transform: uppercase;
    }

    .childmenu {
        font-size: 20px;
        font-family: 'Century Gothic';
        color: #fff !important;
    }
</style>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <%--<a class="navbar-brand" href="#">MONEY MANAGEMENT</a>--%>
            <a class="navbar-brand" href="#">Chat App</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav pull-right">
                <%if (Session["AdminId"] != null)
                  { %>
                <li class="dropdown">
                    <a class="dropdown-toggle childmenu " data-toggle="dropdown" href="#">Add
                        <span class="glyphicon glyphicon-plus"></span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="anc" style="color: #000 !important; font-size: 12px;" href="AddType.aspx"><i class="glyphicon glyphicon-plus"></i>Add Type</a>
                        </li>
                        <li>
                            <a class="anc " style="color: #000 !important; font-size: 12px;" href="AddInsurance.aspx"><i class="glyphicon glyphicon-list"></i>Add InsuranceDetails</a>
                        </li>
                        <li>
                            <a class="anc " style="color: #000 !important; font-size: 12px;" href="ViewFeedBack.aspx"><i class="glyphicon glyphicon-list"></i>View FeedBack</a>
                        </li>

                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle childmenu " data-toggle="dropdown" href="#">View
                        <span class="glyphicon glyphicon-eye-open"></span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="anc" style="color: #000 !important; font-size: 12px;" href="RequestDetails.aspx"><i class="glyphicon glyphicon-list"></i>ViewRequest</a>
                        </li>
                        <li>
                            <a class="anc" style="color: #000 !important; font-size: 12px;" href="UserDetails.aspx"><i class="glyphicon glyphicon-log-out"></i>UserDetails</a>
                        </li>
                        <li>
                            <a class="anc" style="color: #000 !important; font-size: 12px;" href="ViewCardDetails.aspx"><i class="glyphicon glyphicon-log-out"></i>View PanCard Details</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="anc" href="Logout.aspx"><i class="glyphicon glyphicon-log-out"></i>Logout</a>
                </li>

                <%}
                  else if (Session["UserId"] != null)
                  { %>
                <li>
                    <a class="anc" href="ChatMenu.aspx"><i class="glyphicon glyphicon-envelope"></i>ChatMenu</a>
                </li>
                <li>
                    <a class="anc" href="Logout.aspx"><i class="glyphicon glyphicon-user"></i>Logout</a>
                </li>
                <%}
                  else
                  { %>
                <li>
                    <a class="anc" href="Register.aspx"><i class="glyphicon glyphicon-user"></i>Register</a>
                </li>
                <li>
                    <a class="anc" href="Login.aspx"><i class="glyphicon glyphicon-lock"></i>Login</a>
                </li>
                <%} %>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    $.noConflict();
</script>
