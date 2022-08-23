<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="WebApplication3.Orders" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" title="Кабинет">
    <title></title>
<link rel="stylesheet" href="Orders.css" />
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
                     <div class="form">
                         <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="number" DataSourceID="SqlDataSource2" CssClass="table" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HorizontalAlign="Left" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None" Width="832px">
                             <AlternatingRowStyle BorderStyle="None" />
                             <Columns>
                                 <asp:BoundField DataField="number" HeaderText="№" ItemStyle-CssClass="number" InsertVisible="False" ReadOnly="True" SortExpression="number" />
                                 <asp:BoundField DataField="data" HeaderText="Дата" ItemStyle-CssClass="number" SortExpression="data" />
                                 <asp:BoundField DataField="name" HeaderText="Статус" ItemStyle-CssClass="number" SortExpression="name" />
                                 <asp:BoundField DataField="Expr1" HeaderText="Имя" ItemStyle-CssClass="number" SortExpression="Expr1" />
                                 <asp:BoundField DataField="surname" HeaderText="Фамилия" ItemStyle-CssClass="number" SortExpression="surname" />
                                 <asp:BoundField DataField="middlename" HeaderText="Отчество" ItemStyle-CssClass="number" SortExpression="middlename" />
                                 <asp:BoundField DataField="phone" HeaderText="Телефон" ItemStyle-CssClass="number" SortExpression="phone" />
                                 <asp:CommandField SelectText="Товары..." ItemStyle-CssClass="number" ShowSelectButton="True" />
                             </Columns>
                             <EditRowStyle BackColor="#2461BF" />
                             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#202020" />
                             <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#202020" />
                             <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                             <RowStyle BackColor="#EFF3FB" />
                             <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                             <SortedAscendingCellStyle BackColor="#F5F7FB" />
                             <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                             <SortedDescendingCellStyle BackColor="#E9EBEF" />
                             <SortedDescendingHeaderStyle BackColor="#4870BE" />

                         </asp:GridView>
                     </div>
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
