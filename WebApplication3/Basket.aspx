<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Basket.aspx.cs" Inherits="WebApplication1.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>   
   
    <style type="text/css">
        .auto-style1
        {
            height: 22px;
            font-weight: 700;
        }
        .auto-style2 {
            height: 22px;
        }
        .auto-style3 {
            width: 20%;
        }
        .auto-style4 {
            height: 22px;
            width: 20%;
        }
        .auto-style5 {
            height: 22px;
            font-weight: 700;
            width: 20%;
        }

    </style>
    <link rel="stylesheet" href="Bascket.css"/>
    </head>
<body>
    <form id="form1" runat="server">
            <header>
        <nav>
            <asp:LinkButton ID="CatalogPage" runat="server" onclick="CatalogPage_Click" CssClass="LinkButton">Каталог</asp:LinkButton>
            <asp:LinkButton ID="CabinetPage" runat="server" onclick="CabinetPage_Click" CssClass="LinkButton">Кабінет</asp:LinkButton>
        </nav>
    </header>
        <table cellspacing="1" width="100%">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td width="65%"> &nbsp;</td>
                <td width="20%">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style2"></td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td>
                    <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns = "False" DataKeyNames="id_product" EmptyDataText="В Вашей корзине заказа нет выбранных товаров" OnRowCommand="GridView1_RowCommand" style="font-weight: 700">
                        <Columns>
                            <asp:BoundField DataField="id_product" HeaderText="Код товара" />
                            <asp:BoundField DataField="title"  HeaderText="Шифр товара"/>
                            <asp:BoundField DataField="price" HeaderText="Цена за ед."/>
                            <asp:BoundField DataField="amount" HeaderText="Количество ед." />                            
                            <asp:BoundField DataField="cost" HeaderText="Стоимость" />
                            <asp:ButtonField ButtonType="Button" CommandName="ButtonGr1" HeaderText="Изменить количество" Text="Увеличить +">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
                            <asp:ButtonField ButtonType="Button" CommandName="ButtonGr2" HeaderText="Изменить количество" Text="Уменьшить -">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
                            <asp:ButtonField ButtonType="Button" CommandName="ButtonGr3" HeaderText="Удалить из корзины" Text="Удалить">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td align="center" style="font-weight: 700">
                    <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                </td>
                <td>&nbsp;</td>

            </tr>
 
                        <tr>
                <td></td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td></td>
            </tr>

                        <tr>
                            
                <td></td>
                <td class="auto-style3"><asp:Label ID="AdressDelivery" runat="server" Text="Введите адрес доставки"></asp:Label>             <tr>
                </td>
                 <td></td>
                <td class="auto-style3"><asp:TextBox ID="adress" runat="server"/></td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Оформить заказ" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style1">
                    <asp:Literal ID="Literal7" runat="server"></asp:Literal>
                    </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style1">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_receipt,id_product" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="id_receipt" HeaderText="№ заказа" ReadOnly="True" SortExpression="id_receipt" />
                            <asp:BoundField DataField="data" DataFormatString="{0:d}" HeaderText="Дата" SortExpression="data" />
                            <asp:BoundField DataField="id_product" HeaderText="Код товара" ReadOnly="True" SortExpression="id_product" />
                            <asp:BoundField DataField="title" HeaderText="Наименование" SortExpression="title" />
                            <asp:BoundField DataField="name" HeaderText="Фирма изготовитель" SortExpression="name" />
                            <asp:BoundField DataField="price" HeaderText="Цена за ед." SortExpression="price" />
                            <asp:BoundField DataField="quantity" HeaderText="Количество" SortExpression="quantity" />
                        </Columns>
                    </asp:GridView>
                    </td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td></td>
                <td class="auto-style3">&nbsp;</td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td style="font-weight: 700">
                    <asp:Literal ID="Literal8" runat="server"></asp:Literal>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" SelectCommand="SELECT Receipt.data, Receipt_has_product.id_receipt, Receipt_has_product.id_product, Product.title, Product.price, Company.name, Receipt_has_product.quantity FROM Receipt INNER JOIN Receipt_has_product ON Receipt.number = Receipt_has_product.id_receipt AND Receipt.number = Receipt_has_product.id_receipt INNER JOIN Product ON Receipt_has_product.id_product = Product.id_product INNER JOIN Company ON Product.id_company = Company.id_company WHERE (Receipt_has_product.id_receipt = @number)">
                        <SelectParameters>
                            <asp:SessionParameter Name="number" SessionField="number" DbType="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
