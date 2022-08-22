<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" enableSessionState="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        .auto-style1
        {
            height: 22px;
        }
        .auto-style2 {
            width: 10px;
        }
        .auto-style3 {
            height: 22px;
            width: 10px;
        }
    </style>
    <link rel="stylesheet" href="DetailedOfView.css"/>
    
</head>
<body>
    <form id="form1" runat="server">
             <header>
        <nav>
            <asp:LinkButton ID="StartPager" runat="server" onclick="StartPager_Click" CssClass="LinkButton">Головна</asp:LinkButton>
            <asp:LinkButton ID="RegisterPage" runat="server" onclick="RegisterPage_Click" CssClass="LinkButton">Зареєструватися</asp:LinkButton>
            <asp:LinkButton ID="CatalogPage" runat="server" onclick="CatalogPage_Click" CssClass="LinkButton">Каталог</asp:LinkButton>
            <asp:LinkButton ID="CabinetPage" runat="server" onclick="CabinetPage_Click" CssClass="LinkButton">Кабінет</asp:LinkButton>
            <asp:LinkButton ID="BascketPage" runat="server" onclick="BascketPage_Click" CssClass="LinkButton">Кошик</asp:LinkButton>
        </nav>
    </header>
        <table cellspacing="1" width="100%">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="3">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" SelectCommand="SELECT Product.id_product, Product.title, Product.price, product.img_big, Product.description, Company.name FROM Product INNER JOIN Company ON Product.id_company = Company.id_company WHERE (Product.id_product = @id_product)">
                        <SelectParameters>
                            <asp:SessionParameter DbType="Int16" DefaultValue="1" Name="id_product" SessionField="id_product" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1"></td>
                <td class="auto-style1"></td>
                <td class="auto-style1" colspan="3">
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id_product" DataSourceID="SqlDataSource1" Height="50px" style="margin-top: 0px" Width="125px" OnPageIndexChanging="DetailsView1_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <Fields>
                            <asp:ImageField DataImageUrlField="img_big" HeaderText="Фото товара">
                            </asp:ImageField>
                            <asp:BoundField DataField="id_product" HeaderText="id_product" InsertVisible="False" ReadOnly="True" SortExpression="id_product" Visible="False" />
                            <asp:BoundField DataField="title" HeaderText="Название" SortExpression="title" />
                            <asp:BoundField DataField="price" HeaderText="Цена" SortExpression="price" />
                            <asp:BoundField DataField="description" HeaderText="Описание" SortExpression="description" />
                            <asp:BoundField DataField="name" HeaderText="Фирма-производитель" SortExpression="name" />
                        </Fields>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:DetailsView>
                </td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1"></td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">
                    &nbsp;<asp:Button ID="Button4" runat="server" Text="Добавить в корзину" OnClick="Button1_Click" />
                </td>
                <td class="auto-style1">
                    <asp:Button ID="Button5" runat="server" OnClick="Button3_Click" Text="Оформить заказ" />
                </td>
                <td class="auto-style1">
                    <asp:Button ID="Button6" runat="server" Text="Вернутся к просмотру товаров" OnClick="Button2_Click" />
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Извините, товара нет в наличии"></asp:Label>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1"></td>
                <td class="auto-style1" colspan="3"></td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1" colspan="3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
