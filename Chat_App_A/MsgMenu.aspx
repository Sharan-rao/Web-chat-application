<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MsgMenu.aspx.cs" Inherits="MsgMenu" %>

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
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="form-horizontal">
                <div class="form-group">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel panel-heading">
                                <h2>Chat Menu</h2>
                                <p id="p" runat="server"></p>
                            </div>
                            <div class="panel panel-body">

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:Repeater ID="rpt1" runat="server" OnItemCommand="rpt1_ItemCommand">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="HfVal" runat="server" Value='<%#Eval("ChatId") %>' />
                                                <div class="alert alert-info ">
                                                    <%--Message will shown here--%>
                                                    <asp:Label ID="divMsg" Text='<%#Eval("Msg")%>' runat="server"></asp:Label>
                                                    <p>
                                                        <i>
                                                            <%--Sender name will shown here--%>
                                                            <asp:Label ID="lblName" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                                        </i>
                                                    </p>
                                                    <asp:HiddenField ID="hfId" runat="server" Value='<%#Eval("Type") %>' />
                                                    <p>
                                                        <i>
                                                            <%--Link Button for viewing encrypted msg--%>
                                                            <asp:LinkButton Text="View" CommandName="View" ID="lnkView" runat="server" CommandArgument='<%#Eval("ChatId") %>'></asp:LinkButton>
                                                        </i>
                                                    </p>

                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:TextBox CssClass="form-control" ID="txtMsg" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <br />

                                        <asp:DropDownList CssClass="form-control col-md-4" ID="ddl" runat="server">
                                            <asp:ListItem>Normal</asp:ListItem>
                                            <asp:ListItem>Encrypt</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary" Text="Send" OnClick="btnSend_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:Timer ID="Timer1" runat="server" Interval="4000" OnTick="Timer1_Tick">
        </asp:Timer>
    </form>
</body>
</html>
