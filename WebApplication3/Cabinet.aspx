<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cabinet.aspx.cs" Inherits="WebApplication3.Cabinet" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Главная</title>
    <link rel="stylesheet" href="Cabinet.css"/>
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
            <asp:LinkButton ID="Orders" runat="server" onclick="OrdersPage_Click" CssClass="LinkButton">Замовлення</asp:LinkButton>
            <asp:LinkButton ID="AdminPage" runat="server" onclick="AdminPage_Click" CssClass="LinkButton">Для адміністратора</asp:LinkButton>
        </nav>
    </header>
        <div class="form">
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:cosmetics %>" 
                    DeleteCommand="DELETE FROM [Client] WHERE [id_client] = @original_id_client AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([surname] = @original_surname) OR ([surname] IS NULL AND @original_surname IS NULL)) AND (([middlename] = @original_middlename) OR ([middlename] IS NULL AND @original_middlename IS NULL)) AND (([birthday] = @original_birthday) OR ([birthday] IS NULL AND @original_birthday IS NULL)) AND (([city] = @original_city) OR ([city] IS NULL AND @original_city IS NULL)) AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL)) AND (([login] = @original_login) OR ([login] IS NULL AND @original_login IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL))" 
                    InsertCommand="INSERT INTO [Client] ([name], [surname], [middlename], [birthday], [city], [phone], [login], [password]) VALUES (@name, @surname, @middlename, @birthday, @city, @phone, @login, @password)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [id_client], [name], [surname], [middlename], [birthday], [city], [phone], [login], [password] FROM [Client] WHERE ([id_client] = @id_client)" 
                    UpdateCommand="UPDATE [Client] SET [name] = @name, [surname] = @surname, [middlename] = @middlename, [birthday] = @birthday, [city] = @city, [phone] = @phone, [login] = @login, [password] = @password WHERE [id_client] = @original_id_client AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([surname] = @original_surname) OR ([surname] IS NULL AND @original_surname IS NULL)) AND (([middlename] = @original_middlename) OR ([middlename] IS NULL AND @original_middlename IS NULL)) AND (([birthday] = @original_birthday) OR ([birthday] IS NULL AND @original_birthday IS NULL)) AND (([city] = @original_city) OR ([city] IS NULL AND @original_city IS NULL)) AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL)) AND (([login] = @original_login) OR ([login] IS NULL AND @original_login IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id_client" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_surname" Type="String" />
                        <asp:Parameter Name="original_middlename" Type="String" />
                        <asp:Parameter DbType="Date" Name="original_birthday" />
                        <asp:Parameter Name="original_city" Type="String" />
                        <asp:Parameter Name="original_phone" Type="Int64" />
                        <asp:Parameter Name="original_login" Type="String" />
                        <asp:Parameter Name="original_password" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="surname" Type="String" />
                        <asp:Parameter Name="middlename" Type="String" />
                        <asp:Parameter DbType="Date" Name="birthday" />
                        <asp:Parameter Name="city" Type="String" />
                        <asp:Parameter Name="phone" Type="String" />
                        <asp:Parameter Name="login" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="id_client" SessionField="id_client" 
                            Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="surname" Type="String" />
                        <asp:Parameter Name="middlename" Type="String" />
                        <asp:Parameter DbType="Date" Name="birthday" />
                        <asp:Parameter Name="city" Type="String" />
                        <asp:Parameter Name="phone" Type="String" />
                        <asp:Parameter Name="login" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="original_id_client" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_surname" Type="String" />
                        <asp:Parameter Name="original_middlename" Type="String" />
                        <asp:Parameter DbType="Date" Name="original_data_r" />
                        <asp:Parameter Name="original_login" Type="String" />
                        <asp:Parameter Name="original_password" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            

        <div class="inputBox">
        <asp:FormView runat="server" DataKeyNames="id_client" DataSourceID="SqlDataSource1" Height="252px">
            <EditItemTemplate>
                <asp:Label ID="nameLabel1" CssClass="Label1" runat="server">Ім'я</asp:Label>
                <br />
                <asp:TextBox ID="nameTextBox"  CssClass="InputArea" runat="server" Text='<%# Bind("name") %>' />
                <br />
                surname:
                <asp:TextBox ID="surnameTextBox"  CssClass="InputArea" runat="server" Text='<%# Bind("surname") %>' />
                <br />
                middlename:
                <asp:TextBox ID="middlenameTextBox"  CssClass="InputArea" runat="server" Text='<%# Bind("middlename") %>' />
                <br />
                birthday:
                <asp:TextBox ID="birthdayTextBox"  CssClass="InputArea" runat="server" Text='<%# Bind("birthday") %>' />
                <br />
                city:
                <asp:TextBox ID="cityTextBox" CssClass="InputArea" runat="server" Text='<%# Bind("city") %>' />
                <br />
                phone:
                <asp:TextBox ID="phoneTextBox" CssClass="InputArea" runat="server" Text='<%# Bind("phone") %>' />
                <br />
                login:
                <asp:TextBox ID="loginTextBox" CssClass="InputArea" runat="server" Text='<%# Bind("login") %>' />
                <br />
                password:
                <asp:TextBox ID="passwordTextBox" CssClass="InputArea" runat="server" Text='<%# Bind("password") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Обновить" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:Label ID="nameLabel1" CssClass="Label1" runat="server">Ім'я</asp:Label>
                <br />
                <asp:TextBox ID="nameTextBox"  CssClass="InputArea" runat="server" Text='<%# Bind("name") %>' />
                <br />
                surname:
                <asp:TextBox ID="surnameTextBox"  CssClass="InputArea" runat="server" Text='<%# Bind("surname") %>' />
                <br />
                middlename:
                <asp:TextBox ID="middlenameTextBox"  CssClass="InputArea" runat="server" Text='<%# Bind("middlename") %>' />
                <br />
                birthday:
                <asp:TextBox ID="birthdayTextBox"  CssClass="InputArea" runat="server" Text='<%# Bind("birthday") %>' />
                <br />
                city:
                <asp:TextBox ID="cityTextBox"  CssClass="InputArea" runat="server" Text='<%# Bind("city") %>' />
                <br />
                phone:
                <asp:TextBox ID="phoneTextBox"  CssClass="InputArea" runat="server" Text='<%# Bind("phone") %>' />
                <br />
                login:
                <asp:TextBox ID="loginTextBox"  CssClass="InputArea" runat="server" Text='<%# Bind("login") %>' />
                <br />
                password:
                <asp:TextBox ID="passwordTextBox"  CssClass="InputArea" runat="server" Text='<%# Bind("password") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Вставка" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="nameLabel1" CssClass="Label1" runat="server">Ім'я:</asp:Label>
                
                <asp:Label ID="nameLabel"  CssClass="InputArea" runat="server" Text='<%# Bind("name") %>' />
                <br />
                <br />
                <asp:Label ID="surnameLabel1" CssClass="Label1" runat="server">Призвище:</asp:Label>
                <asp:Label ID="surnameLabel"  CssClass="InputArea" runat="server" Text='<%# Bind("surname") %>' />
                <br />
                <br />
                <asp:Label ID="middlenameLabel1" CssClass="Label1" runat="server">По-батькові:</asp:Label>
                <asp:Label ID="middlenameLabel"  CssClass="InputArea" runat="server" Text='<%# Bind("middlename") %>' />
                <br />
                <br />
                <asp:Label ID="birthdayLabel1" CssClass="Label1" runat="server">День народження:</asp:Label>
                <asp:Label ID="birthdayLabel"  CssClass="InputArea" runat="server" Text='<%# Bind("birthday") %>' />
                <br />
                <br />
                <asp:Label ID="cityLabel1" CssClass="Label1" runat="server">Місто:</asp:Label>
                <asp:Label ID="cityLabel"  CssClass="InputArea" runat="server" Text='<%# Bind("city") %>' />
                <br />
                <br />
                <asp:Label ID="phoneLabel1" CssClass="Label1" runat="server">Телефон:</asp:Label>
                <asp:Label ID="phoneLabel"  CssClass="InputArea" runat="server" Text='<%# Bind("phone") %>' />
                <br />
                <br />
                <asp:Label ID="LoginLabel1" CssClass="Label1" runat="server">Логін:</asp:Label>
                <asp:Label ID="loginLabel"  CssClass="InputArea" runat="server" Text='<%# Bind("login") %>' />
                <br />
                <br />
                <asp:Label ID="passwordLabel1" CssClass="Label1" runat="server">Пароль:</asp:Label>
                <asp:Label ID="passwordLabel"  CssClass="InputArea" runat="server" Text='<%# Bind("password") %>' />
                <br />
                <br />
                <br />
                <asp:LinkButton ID="EditButton" CssClass="Button" runat="server" CausesValidation="False" CommandName="Edit" Text="Правка" />
                &nbsp;<!--<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Удалить" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Создать" />-->
            </ItemTemplate>
        </asp:FormView>
        </div>
                <div class="inputBox">
            <asp:Button ID="Exit" runat="server" CssClass="Button" OnClick="Button1_Click" Text="Вихід" />
            </div>
            </div>
    </form>
</body>
</html>
