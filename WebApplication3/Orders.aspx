<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="WebApplication3.Orders" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" title="Кабинет"/>
    <link rel="stylesheet" href="Orders.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        <nav>
            <asp:LinkButton ID="StartPage" runat="server" onclick="StartPage_Click" CssClass="LinkButton">Главная</asp:LinkButton>
            <asp:LinkButton ID="Catalog" runat="server" OnClick="Catalog_Click" CssClass="LinkButton">Каталог</asp:LinkButton>
            <asp:LinkButton ID="Registr" runat="server" onclick="Registr_Click" CssClass="LinkButton">Регистрация</asp:LinkButton>
            <asp:LinkButton ID="Cab" runat="server" onclick="Cab_Click" CssClass="LinkButton">Кабинет</asp:LinkButton>
            <asp:LinkButton ID="Ord" runat="server" OnClick="Ord_Click" CssClass="LinkButton">Заказы</asp:LinkButton>
        </nav>
    </header>
<table cellpadding="0" cellspacing="0" class="style1" width="100%">
        <tr>
            <td>
                <asp:Literal ID="Literal1" runat="server" Visible="false"></asp:Literal>
&nbsp;<asp:Literal ID="Literal2" runat="server" Visible="false"></asp:Literal>
&nbsp;<asp:Literal ID="Literal3" runat="server" Visible="false"></asp:Literal>
&nbsp;<asp:Literal ID="Literal4" runat="server" Visible="false"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style7"></td>
            <td class="auto-style5"></td>
            </tr>
    </table>
     <table>
         <tr>
             <td class="auto-style9">
                </td>
             <td class="auto-style8">
                 <div class="catalog">
                 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="number" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" HorizontalAlign="Left"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None" Width="832px">
                    <AlternatingRowStyle BorderStyle="None" />
                     <Columns>
                         <asp:BoundField DataField="number" HeaderText="№" InsertVisible="False" ReadOnly="True" SortExpression="number" />
                         <asp:BoundField DataField="data" HeaderText="Дата" SortExpression="data" />
                         <asp:BoundField DataField="name" HeaderText="Статус" SortExpression="name" />
                         <asp:BoundField DataField="Expr1" HeaderText="Имя" SortExpression="Expr1" />
                         <asp:BoundField DataField="surname" HeaderText="Фамилия" SortExpression="surname" />
                         <asp:BoundField DataField="middlename" HeaderText="Отчество" SortExpression="middlename" />
                         <asp:BoundField DataField="phone" HeaderText="Телефон" SortExpression="phone" />
                         <asp:CommandField SelectText="Товары..." ShowSelectButton="True"/>
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
                     </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" SelectCommand="SELECT Receipt.number, Receipt.data, Receipt_status.name, Client.name AS Expr1, Client.surname, Client.middlename, Client.phone FROM Receipt INNER JOIN Receipt_status ON Receipt.id_receipt_status = Receipt_status.id_receipt_status INNER JOIN Client ON Receipt.id_client = Client.id_client WHERE (Client.id_client = @id_client)">
                    <SelectParameters>
                        <asp:SessionParameter Name="id_client" SessionField="id_client" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
             </td>
         </tr>
     </table>
    </form>
</body>
</html>
