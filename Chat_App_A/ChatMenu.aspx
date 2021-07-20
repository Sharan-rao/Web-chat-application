<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChatMenu.aspx.cs" Inherits="ChatMenu" %>

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
        <div class="container">
            <div class="form-horizontal">
                <div class="form-group">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel panel-heading">
                                <h2>User Menu</h2>
                            </div>
                            <div class="panel panel-body">
                                <asp:Repeater ID="rpt1" runat="server">
                                    <ItemTemplate>
                                        <div class="alert alert-success">
                                            <%--To Get Values from DataBase we user <%#Eval("UserId") %>--%>

                                            <a href='MsgMenu.aspx?id=<%#Eval("UserId") %>'>
                                                <p><i><%#Eval("FullName") %></i></p>
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
