<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Catalog.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            height: 22px;
        }
        </style>
    <link rel="stylesheet" href="Catalog.css"/>
    </head>
<body>
    <form id="form1" runat="server">
     <header>
        <nav>
            <asp:LinkButton ID="StartPager" runat="server" onclick="StartPager_Click" CssClass="LinkButton">Головна</asp:LinkButton>
            <asp:LinkButton ID="RegisterPage" runat="server" onclick="RegisterPage_Click" CssClass="LinkButton">Зареєструватися</asp:LinkButton>
            <asp:LinkButton ID="CatalogPage" runat="server" onclick="CatalogPage_Click" CssClass="LinkButton">Каталог</asp:LinkButton>
            <asp:LinkButton ID="CabinetPage" runat="server" onclick="CabinetPage_Click" CssClass="LinkButton">Кабінет</asp:LinkButton>
        </nav>
    </header>
        <table cellspacing="1" width="100%">
            <tr>
                <td>
                    <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" OnClick="LinkButton4_Click">Все</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="LinkButton10" runat="server" ont-Bold="True" OnClick="LinkButton10_Click">Для лица</asp:LinkButton>
                </td>
                <td></td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
                        <tr>
                <td>
                    <asp:LinkButton ID="LinkButton20" runat="server" ont-Bold="True" OnClick="LinkButton20_Click">Для тела</asp:LinkButton>
                            </td>
                <td></td>
                <td>
                    &nbsp;</td>
            </tr>
                        <tr>
                <td>
                    <asp:LinkButton ID="LinkButton30" runat="server" ont-Bold="True" OnClick="LinkButton30_Click">Nivea</asp:LinkButton>
                            </td>
                <td></td>
                <td></td>
            </tr>
                                    <tr>
                <td class="auto-style1">
                    <asp:LinkButton ID="LinkButton40" runat="server" ont-Bold="True" OnClick="LinkButton40_Click">La Roche-Posay</asp:LinkButton>
                            </td>
                <td class="auto-style1"></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" OnClick="LinkButton5_Click">Bioderma</asp:LinkButton>
                </td>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:LinkButton ID="LinkButton6" runat="server" Font-Bold="True" OnClick="LinkButton6_Click">Vichy</asp:LinkButton>
                </td>
                <td class="auto-style1">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" SelectCommand="SELECT Product.id_product, Product.title, Product.price, Product.img_small, Company.name FROM Company INNER JOIN Product ON Company.id_company = Product.id_company"></asp:SqlDataSource>
                </td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td class="auto-style1">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_product" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:ImageField DataImageUrlField="img_small" HeaderText="Фото товара" ControlStyle-Width = "75" ControlStyle-Height = "75">
                            </asp:ImageField>
                            <asp:BoundField DataField="id_product" HeaderText="id_product" InsertVisible="False" ReadOnly="True" SortExpression="id_product" Visible="False" />
                            <asp:BoundField DataField="title" HeaderText="Название" SortExpression="title" />
                            <asp:BoundField DataField="price" HeaderText="Цена" SortExpression="price" />
                            <asp:BoundField DataField="name" HeaderText="Фирма-производитель" SortExpression="name" />
                            <asp:CommandField SelectText="Подробнее ..." ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                    
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_product" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                        <Columns>
                            <asp:ImageField DataImageUrlField="img_small" HeaderText="Фото товара" ControlStyle-Width = "75" ControlStyle-Height = "75">
                            </asp:ImageField>
                            <asp:BoundField DataField="id_product" HeaderText="id_product" InsertVisible="False" ReadOnly="True" SortExpression="id_product" Visible="False" />
                            <asp:BoundField DataField="title" HeaderText="Название" SortExpression="title" />
                            <asp:BoundField DataField="price" HeaderText="Цена" SortExpression="price" />
                            <asp:BoundField DataField="id_company" HeaderText="id_company" SortExpression="id_company" Visible="False" />
                            <asp:BoundField DataField="name" HeaderText="Фирма-производитель" SortExpression="name" />
                            <asp:CommandField SelectText="Подробнее ..." ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" SelectCommand="SELECT Product.id_product, Product.title, Product.price, Product.img_small, Product.id_company, Company.name FROM Company INNER JOIN Product ON Company.id_company = Product.id_company WHERE (Product.id_company = @id_company)">
                        <SelectParameters>
                            <asp:SessionParameter DbType="Int16" DefaultValue="1" Name="id_company" SessionField="id_company" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="id_product" DataSourceID="SqlDataSource3" Visible="false" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
                        <Columns>
                            <asp:ImageField DataImageUrlField="img_small" HeaderText="Фото товара" ControlStyle-Width = "75" ControlStyle-Height = "75">
<ControlStyle Height="75px" Width="75px"></ControlStyle>
                            </asp:ImageField>
                            <asp:BoundField DataField="id_product" HeaderText="id_product" SortExpression="id_product" InsertVisible="False" ReadOnly="True" Visible="False"/>
                            <asp:BoundField DataField="title" HeaderText="Название" SortExpression="title" />
                            <asp:BoundField DataField="price" HeaderText="Цена" SortExpression="price" />
                            <asp:BoundField DataField="img_small" HeaderText="img_small" SortExpression="img_small" Visible="false"/>
                            <asp:BoundField DataField="id_catalog" HeaderText="id_catalog" SortExpression="id_catalog" Visible="False"/>
                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" Visible="false"/>
                            <asp:BoundField DataField="name1" HeaderText="Фирма-произвдитель" SortExpression="name1" />
                            <asp:CommandField SelectText="Подробнее ..." ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" SelectCommand="SELECT Product.id_product, Product.title, Product.price, Product.img_small, Product.id_catalog, Catalog.name, Company.name AS name1 FROM Catalog INNER JOIN Product ON Catalog.id_catalog = Product.id_catalog INNER JOIN Company ON Product.id_company = Company.id_company WHERE (Product.id_catalog = @id_catalog)">
                        <SelectParameters>
                            <asp:SessionParameter DbType="Int16" DefaultValue="1" Name="id_catalog" SessionField="id_catalog" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
    </form>
</body>
</html>
