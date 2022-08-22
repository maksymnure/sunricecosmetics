<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Catalog.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            <asp:LinkButton ID="BascketPage" runat="server" onclick="BascketPage_Click" CssClass="LinkButton">Кошик</asp:LinkButton>
        </nav>
    </header>
    <div class="main">
        <div class="Filter">
            <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" OnClick="LinkButton4_Click">Все</asp:LinkButton>
            <asp:LinkButton ID="LinkButton10" runat="server" ont-Bold="True" OnClick="LinkButton10_Click">Для лица</asp:LinkButton>
            <asp:LinkButton ID="LinkButton20" runat="server" ont-Bold="True" OnClick="LinkButton20_Click">Для тела</asp:LinkButton>
            <asp:LinkButton ID="LinkButton30" runat="server" ont-Bold="True" OnClick="LinkButton30_Click">Nivea</asp:LinkButton>
            <asp:LinkButton ID="LinkButton40" runat="server" ont-Bold="True" OnClick="LinkButton40_Click">La Roche-Posay</asp:LinkButton>
            <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" OnClick="LinkButton5_Click">Bioderma</asp:LinkButton>
        <asp:LinkButton ID="LinkButton6" runat="server" Font-Bold="True" OnClick="LinkButton6_Click">Vichy</asp:LinkButton>
        </div>

        <div class="catalog">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_product" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="636px">
            <Columns>
                            <asp:ImageField DataImageUrlField="img_small" HeaderText="Фото товара" ControlStyle-Width = "75" ControlStyle-Height = "75">
                            </asp:ImageField>
                            <asp:BoundField DataField="id_product" HeaderText="id_product" InsertVisible="False" ReadOnly="True" SortExpression="id_product" Visible="False" />
                            <asp:BoundField DataField="title" HeaderText="Название" SortExpression="title" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="300px" />
                            <asp:BoundField DataField="price" HeaderText="Цена" SortExpression="price" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="300px" />
                            <asp:BoundField DataField="name" HeaderText="Фирма-производитель" SortExpression="name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="300px" />
                            <asp:CommandField SelectText="Переглянути ..." ShowSelectButton="True" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="300px" />
                        </Columns>
                        <FooterStyle BackColor="#EBECF0" ForeColor="Black" />
                        <HeaderStyle BackColor="#EBECF0" Font-Bold="True" ForeColor="#202020" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_product" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="636px">
                        <Columns>
                            <asp:ImageField DataImageUrlField="img_small" HeaderText="Фото товара" ControlStyle-Width = "75" ControlStyle-Height = "75">
                            </asp:ImageField>
                            <asp:BoundField DataField="id_product" HeaderText="id_product" InsertVisible="False" ReadOnly="True" SortExpression="id_product" Visible="False" />
                            <asp:BoundField DataField="title" HeaderText="Название" SortExpression="title" />
                            <asp:BoundField DataField="price" HeaderText="Цена" SortExpression="price" />
                            <asp:BoundField DataField="id_company" HeaderText="id_company" SortExpression="id_company" Visible="False" />
                            <asp:BoundField DataField="name" HeaderText="Фирма-производитель" SortExpression="name" />
                            <asp:CommandField SelectText="Переглянути ..." ShowSelectButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#EBECF0" ForeColor="Black" />
                        <HeaderStyle BackColor="#EBECF0" Font-Bold="True" ForeColor="#202020" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="id_product" DataSourceID="SqlDataSource3" Visible="false"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None" Width="636px" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
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
                            <asp:BoundField DataField="name1" HeaderText="Фирма-производитель" SortExpression="name1" />
                            <asp:CommandField SelectText="Переглянути ..." ShowSelectButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#EBECF0" ForeColor="Black" />
                        <HeaderStyle BackColor="#EBECF0" Font-Bold="True" ForeColor="#202020" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" SelectCommand="SELECT Product.id_product, Product.title, Product.price, Product.img_small, Company.name FROM Company INNER JOIN Product ON Company.id_company = Product.id_company"></asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" SelectCommand="SELECT Product.id_product, Product.title, Product.price, Product.img_small, Product.id_company, Company.name FROM Company INNER JOIN Product ON Company.id_company = Product.id_company WHERE (Product.id_company = @id_company)">
                        <SelectParameters>
                            <asp:SessionParameter DbType="Int16" DefaultValue="1" Name="id_company" SessionField="id_company" />
                        </SelectParameters>
                    </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" SelectCommand="SELECT Product.id_product, Product.title, Product.price, Product.img_small, Product.id_catalog, Catalog.name, Company.name AS name1 FROM Catalog INNER JOIN Product ON Catalog.id_catalog = Product.id_catalog INNER JOIN Company ON Product.id_company = Company.id_company WHERE (Product.id_catalog = @id_catalog)">
                        <SelectParameters>
                            <asp:SessionParameter DbType="Int16" DefaultValue="1" Name="id_catalog" SessionField="id_catalog" />
                        </SelectParameters>
                    </asp:SqlDataSource>
            <tr>
                <td>
                   
                <td>
            </tr>
            </div>
        </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
