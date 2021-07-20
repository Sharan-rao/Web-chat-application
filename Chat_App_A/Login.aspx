<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Src="~/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <style>
        body, html {
            font-family: 'Times New Roman', Times, serif !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:UserMenu runat="server" ID="UserMenu" />
        <br />
        <br />
        <br />
        <br />
        <div class="container ">
            <div class="form-horizontal col-md-offset-3">
                <div class="form-group">
                    <div class="col-md-12">
                        <h2 class="page-header">Login Here</h2>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <label>Email-Id</label>
                        <asp:TextBox runat="server" ID="txtEmailId" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <label>Password</label>
                        <asp:TextBox TextMode="Password" runat="server" ID="txtPassword" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <asp:Button CssClass="btn btn-primary form-control" ID="btnSubmit" runat="server" Text="Login" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
