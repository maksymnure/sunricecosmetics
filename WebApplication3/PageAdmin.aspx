<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageAdmin.aspx.cs" Inherits="Furniture.PageAdmin" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Главная</title>
    <link rel="stylesheet" href="PageAdmin.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        <nav>
            <asp:LinkButton ID="Catalog" runat="server" OnClick="Catalog_Click" CssClass="LinkButton">Каталог</asp:LinkButton>
            <asp:LinkButton ID="Cab" runat="server" onclick="Cab_Click" CssClass="LinkButton">Кабінет</asp:LinkButton>
            <asp:LinkButton ID="Ord" runat="server" OnClick="Ord_Click" CssClass="LinkButton">Замовлення</asp:LinkButton>
            <asp:LinkButton ID="PageAdmine" runat="server" onclick="PageAdmine_Click" CssClass="LinkButton">Для адміністратора</asp:LinkButton>
            
        </nav>
    </header>
    <div class="main">
                 <div class="form">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" DeleteCommand="DELETE FROM [Receipt] WHERE [number] = @number" InsertCommand="INSERT INTO [Receipt] ([id_receipt_status], [id_client]) VALUES (@id_receipt_status, @id_client)" SelectCommand="SELECT Receipt.number, Client.surname, Client.name, Receipt.adress as 'Адрес', Client.phone, Receipt.data, Receipt.id_receipt_status, Client.id_client FROM Receipt INNER JOIN Client ON Receipt.id_client = Client.id_client" UpdateCommand="UPDATE [Receipt] SET [id_receipt_status] = @id_receipt_status, [id_client] = @id_client WHERE [number] = @number">
                    <DeleteParameters>
                        <asp:Parameter Name="number" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_receipt_status" Type="Int32" />
                        <asp:Parameter Name="id_client" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_receipt_status" Type="Int32" />
                        <asp:Parameter Name="id_client" Type="Int32" />
                        <asp:Parameter Name="number" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="number,id_client" CssClass="table" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="number" HeaderText="№" InsertVisible="False" ReadOnly="True" SortExpression="number" ItemStyle-CssClass="number"><ItemStyle CssClass="number"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="surname" HeaderText="Фамилия" ReadOnly="True" SortExpression="surname" ItemStyle-CssClass="number" ><ItemStyle CssClass="number"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="name" HeaderText="Имя" ReadOnly="True" SortExpression="name" ItemStyle-CssClass="number"><ItemStyle CssClass="number"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Адрес" HeaderText="Адрес доставки" ReadOnly="True" SortExpression="Адрес" ItemStyle-CssClass="number"><ItemStyle CssClass="number"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="phone" HeaderText="Телефон" ReadOnly="True" SortExpression="phone" ItemStyle-CssClass="number"><ItemStyle CssClass="number"></ItemStyle></asp:BoundField>
                        <asp:BoundField DataField="data" DataFormatString="{0:d}" HeaderText="Дата заказа" SortExpression="data" ItemStyle-CssClass="number"><ItemStyle CssClass="number"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Статус" SortExpression="id_receipt_status">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="id_receipt_status" SelectedValue='<%# Bind("id_receipt_status", "{0}") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="id_receipt_status" SelectedValue='<%# Bind("id_receipt_status", "{0}") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_client" HeaderText="id_client" InsertVisible="False" ReadOnly="True" SortExpression="id_client" Visible="False" />
                        <asp:CommandField CancelText="Отмена" EditText="Редактировать" SelectText="Товары..." ItemStyle-CssClass="number" ShowEditButton="True" ShowSelectButton="True" UpdateText="Подтвердить" >
<ItemStyle CssClass="number"></ItemStyle>
                        </asp:CommandField>
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" SelectCommand="SELECT [id_receipt_status], [name] FROM [Receipt_status]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="Delivery" runat="server" ConnectionString="<%$ ConnectionStrings:cosmetics %>" SelectCommand="SELECT [id_delivery], [name] FROM [Delivery]"></asp:SqlDataSource>
            </div>
    </div>
</form>
</body>
</html>
