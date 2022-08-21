<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="WebApplication3.StartPage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Главная</title>
    <link rel="stylesheet" href="StartPage.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        <nav>
            <asp:LinkButton ID="StartPager" runat="server" onclick="StartPager_Click" CssClass="LinkButton">Главная</asp:LinkButton>
        </nav>
    </header>
        <div class="form">
            <h2>Login</h2>
                <div class="inputBox">
                    <label>Username</label><br/>
                    <asp:TextBox ID="TextBoxLogin" runat="server" CssClass="InputArea"></asp:TextBox>
                </div>
                <div class="inputBox">
                    <label>Password</label><br/>
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="InputArea">Klass</asp:TextBox>
                </div>
            <div class="ButtomInput">
                <asp:Button ID="Button1" runat="server" Text="Вход" onclick="Button1_Click" CssClass="Button"/>
            </div>
            <div class="divProblem">
                <asp:Label ID="Label1ms" runat="server" CssClass="Problem"></asp:Label>
            </div>
      </div>
    </form>
</body>
</html>