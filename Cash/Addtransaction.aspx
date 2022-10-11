<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addtransaction.aspx.cs" Inherits="Cash.Addtransaction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&family=Titillium+Web:wght@600&display=swap" rel="stylesheet" />
    <style>
        .text-style {
            font-family: 'Oswald';
        }

        .lableName {
            font-family: 'Titillium Web'
        }

        .ddlfont-family {
            font-family: 'Josefin Sans';
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row col-md-5 col-md-offset-3">
                <div class="panel panel-body">
                    <div class="form-group">
                        <asp:Label ID="lblLedgerName" Text="Ledger Name" runat="server" CssClass="lableName"></asp:Label>
                        <asp:DropDownList ID="ddlAddLedgerName" runat="server" CssClass="form-control  ddlfont-family" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="ddlAddLedgerName_Cahnged"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblSubLedgerName" Text="Subledger Name" runat="server" CssClass="lableName"></asp:Label>
                        <asp:DropDownList ID="ddlAddSubledger" runat="server" CssClass="form-control ddlfont-family"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblTransType" Text="TransType" runat="server" CssClass="lableName"></asp:Label>
                        <asp:DropDownList ID="ddlTransType" runat="server" CssClass="form-control  ddlfont-family" Width="100%"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblAmount" Text="Amount" runat="server" CssClass="lableName"></asp:Label>
                        <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" Width="100%" data-bind="value:txtAmount"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtAmount" runat="server"
                            ErrorMessage="Only Numbers allowed" ValidationExpression="^\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">

                        <asp:Label ID="lblRemarks" Text="Remarks" runat="server" CssClass="lableName"></asp:Label>
                        <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-offset-5">
                        <asp:Button runat="server" Text="Save" CssClass="btn btn-primary" ID="btnSave" OnClick="btnSave_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-primary" OnClick="btnBack_Click" />
                    </div>
                </div>

            </div>

        </div>
    </form>
</body>
</html>
