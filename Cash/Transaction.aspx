<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="Cash.Transaction" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#Fromdatepicker").datepicker({ dateFormat: 'dd-mm-yy' }).val();
        });
        $(function () {
            $("#Todatepicker").datepicker({ dateFormat: 'dd-mm-yy' }).val();
        });
    </script>
    <style>
        .mydatagrid {
            width: 80%;
            border: solid 2px black;
            min-width: 80%;
            overflow: scroll;
            max-height: 100px;
        }

        .header {
            background-color: #646464;
            font-family: Arial;
            color: White;
            border: none 0px transparent;
            height: 25px;
            text-align: center;
            font-size: 16px;
        }

        .rows {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: left;
            border: none 0px transparent;
        }

            .rows:hover {
                background-color: #ff8000;
                font-family: Arial;
                color: #fff;
                text-align: left;
            }

        .selectedrow {
            background-color: #ff8000;
            font-family: Arial;
            color: #fff;
            font-weight: bold;
            text-align: left;
        }

        .mydatagrid a /** FOR THE PAGING ICONS **/ {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            color: #000;
            text-decoration: none;
            font-weight: bold;
        }

            .mydatagrid a:hover /** FOR THE PAGING ICONS HOVER STYLES**/ {
                background-color: #000;
                color: #fff;
            }

        .mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
            background-color: #c9c9c9;
            color: #000;
            padding: 5px 5px 5px 5px;
        }

        .pager {
            background-color: #646464;
            font-family: Arial;
            color: black;
            height: 30px;
            text-align: left;
        }

        .mydatagrid td {
            padding: 5px;
        }

        .mydatagrid th {
            padding: 5px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row col-md-11 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table width="100%" class="table">
                            <tr>
                                <td>
                                    <asp:Label ID="lblFromDate" runat="server" Text="From Date"></asp:Label>
                                </td>
                                <td>
                                    <input type="text" id="Fromdatepicker" class="col-xs-10" runat="server" />

                                </td>
                                <td>
                                    <asp:Label ID="lblToDate" runat="server" Text="To Date"></asp:Label>
                                </td>
                                <td>
                                    <input type="text" id="Todatepicker" class="col-xs-10" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblLedgerName" runat="server" Text="Ledger Name"></asp:Label>
                                </td>
                                <td>
                                    <%--<asp:TextBox ID="txtLedger" runat="server" CssClass="col-xs-10"></asp:TextBox>--%>
                                    <asp:DropDownList ID="ddlLedgerName" runat="server" CssClass="form-control  ddlfont-family" Width="100%"></asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="lblSubLedgerName" runat="server" Text="Sub Ledger"></asp:Label>
                                </td>
                                <td>
                                    <%-- <asp:TextBox ID="txtSubLedger" runat="server" CssClass="col-xs-10"></asp:TextBox>--%>
                                    <asp:DropDownList ID="ddlSubledger" runat="server" CssClass="form-control ddlfont-family"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" align="center">
                                    <asp:Button runat="server" Text="Search" CssClass="btn btn-primary" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:GridView ID="gvExpenses" runat="server" Width="100%" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                        HeaderStyle-CssClass="header" RowStyle-CssClass="rows">

                                        <EmptyDataTemplate>
                                            No Records to Dispaly
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:TemplateField HeaderText="TransactionNo">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="TransactionNo" runat="server" Text='<%# Bind("TransactionNo") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="TransactionDate" HeaderText="TransactionDate" />
                                            <asp:BoundField DataField="LedgerName" HeaderText="LedgerName" />
                                            <asp:BoundField DataField="SubLedgerName" HeaderText="SubLedgerName" />
                                            <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                            <asp:BoundField DataField="Indicator" HeaderText="Indicator" />
                                        </Columns>

                                    </asp:GridView>
                                </td>

                            </tr>
                            <tr align="center">
                                <td colspan="4">

                                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                                    <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-primary" />

                                </td>
                            </tr>
                            <tr align="center">
                                <td colspan="4">

                                    <%-- <asp:Chart ID="Chart1" runat="server">
                                        <Series>
                                            <asp:Series ChartType="StackedColumn" Name="Series1">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>--%>

                                </td>
                            </tr>
                        </table>

                    </div>
                </div>

            </div>


        </div>
    </form>
</body>
</html>
