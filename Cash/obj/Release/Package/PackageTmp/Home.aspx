<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Cash.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&family=Titillium+Web:wght@600&display=swap" rel="stylesheet">
    <style>
        .text-style {
            font-family: 'Oswald';
        }
        .lableName{
            font-family: 'Titillium Web'
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row col-md-5 col-md-offset-3">
                <div class="panel panel-success">
                    <div class="panel-heading text-center font-weight-bold">
                        <h1 class="text-style">Login</h1>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <asp:Label ID="lblUsername" runat="server" Text="Username" CssClass="lableName"></asp:Label><br />
                            <asp:TextBox ID="txtUserName" runat="server" placeholder="Username" CssClass="form-control" EnableViewState="false"  ControlToValidate="TextBox1" ></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="lableName"></asp:Label><br />
                            <asp:TextBox ID="txtPassword" runat="server" placeholder="Username" CssClass="form-control" TextMode="Password" ></asp:TextBox>
                        </div>
                        <div class="form-group col-md-offset-4">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success" Width="150px" OnClick="btnLogin_Click" />
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </form>
</body>
</html>
