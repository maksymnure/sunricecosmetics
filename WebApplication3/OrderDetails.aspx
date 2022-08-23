<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="Furniture.OrderDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="OrderDetails.css"/>
    <style type="text/css">
        .auto-style1 {
            width: 8px;
        }
        .auto-style2 {
            width: 535px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
        <nav>
            <asp:LinkButton ID="Catalog" runat="server" OnClick="Catalog_Click" CssClass="LinkButton">Каталог</asp:LinkButton>
            <asp:LinkButton ID="Cab" runat="server" onclick="Cab_Click" CssClass="LinkButton">Кабінет</asp:LinkButton>
            <asp:LinkButton ID="Ord" runat="server" OnClick="Ord_Click" CssClass="LinkButton">Замовлення</asp:LinkButton>
        </nav>
    </header>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style18">
                    &nbsp;</td>
                <td class="auto-style20">
                    &nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" SelectCommand="SELECT Receipt.number, Product.title, Receipt_has_product.quantity, Product.price, Receipt_has_product.price FROM Receipt INNER JOIN Receipt_has_product ON Receipt.number = Receipt_has_product.id_receipt INNER JOIN Product ON Receipt_has_product.id_product = Product.id_product WHERE (Receipt.number = @number)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="number" SessionField="number" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 500px;" class="auto-style2">
                    </td>
                <td class="auto-style10">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="number" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="805px" Height="184px">
                        <Columns>
                            <asp:BoundField DataField="number" HeaderText="№" InsertVisible="False" ReadOnly="True" SortExpression="number" />
                            <asp:BoundField DataField="title" HeaderText="Название" SortExpression="title" />
                            <asp:BoundField DataField="quantity" HeaderText="Количество" SortExpression="quantity" />
                            <asp:BoundField DataField="price" HeaderText="Цена" SortExpression="price" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            </table>
        <div>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
