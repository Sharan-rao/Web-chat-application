<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewTxtMsg.aspx.cs" Inherits="ViewTxtMsg" %>

<%@ Register Src="~/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:UserMenu runat="server" ID="UserMenu" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="container">
            <div class="panel panel-primary">
                <div class="panel panel-heading">
                    <h3>Encrypt Msg</h3>
                </div>
                <div class="panel panel-body">
                    <div class="col-md-4">
                        <asp:TextBox CssClass="form-control" ID="txtOTP" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnSend" runat="server" Text="Get OTP" CssClass="btn btn-primary" OnClick="btnSend_Click" />
                    </div>
                    <br />
                    <br />
                    <div id="divPanel" runat="server">
                        <div class="alert alert-info">
                            <p>
                                <asp:Label ID="lblEncMsg" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="alert alert-info">
                            <p>
                                <asp:Label ID="lblNonEnc" runat="server"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
