<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

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
                        <h2 class="page-header">Register Here</h2>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <label>Name</label>
                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <label>Mob</label>
                        <asp:TextBox runat="server" ID="txtMob" CssClass="form-control"></asp:TextBox>
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
                        <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
