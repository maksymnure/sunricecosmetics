<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication3.Registration" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Главная</title>
    <link rel="stylesheet" href="Registration.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        <nav>
            <asp:LinkButton ID="StartPager" runat="server" onclick="StartPager_Click" CssClass="LinkButton">Головна</asp:LinkButton>
            <asp:LinkButton ID="RegisterPage" runat="server" onclick="RegisterPage_Click" CssClass="LinkButton">Зареєструватися</asp:LinkButton>
            <asp:LinkButton ID="CabinetPage" runat="server" onclick="CabinetPage_Click" CssClass="LinkButton">Кабінет</asp:LinkButton>
        </nav>
    </header>
        <div class="form">
            <h2>Реєстрація</h2>
                <div class="inputBox">
                    <asp:TextBox ID="TextBoxLogin" runat="server" placeholder="Логін" CssClass="InputArea"></asp:TextBox>
                </div>
                <div class="inputBox">
                    <asp:Button ID="CheckLogin" runat="server" Text="Перевірити логін" CssClass="Button" onclick="CheckLogin_Click"/>
                    <asp:Label ID="LabelCheck" runat="server" CssClass="Label"></asp:Label>
                </div>

                <div class="inputBox">
                    <asp:TextBox ID="TextBoxPassword" runat="server" placeholder="Пароль" TextMode="Password" CssClass="InputArea"></asp:TextBox>
                </div>

                 <div class="inputBox">
                    <asp:TextBox ID="TextBoxSurName" runat="server" placeholder="Призвище" CssClass="InputArea"></asp:TextBox>
                </div>

                <div class="inputBox">
                     <asp:TextBox ID="TextBoxName" runat="server" placeholder="Ім'я" CssClass="InputArea"></asp:TextBox>
                </div>

                <div class="inputBox">
                     <asp:TextBox ID="TextBoxMiddleName" runat="server" placeholder="По-батькові" CssClass="InputArea"></asp:TextBox>
                </div>
                
                <div class="inputBox">
                    <asp:TextBox ID="TextBoxPhone" runat="server" placeholder="Мобільний номер" CssClass="InputArea"></asp:TextBox>
                </div>
                
                <div class="inputBox">
                    <asp:TextBox ID="TextBoxCity" runat="server" placeholder="Місто" CssClass="InputArea"></asp:TextBox>
                </div>

                <div class="inputBox">
                    <asp:DropDownList ID="DropDownListY" runat="server" CssClass="style9Element">
                    <asp:ListItem>Рік</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2009</asp:ListItem>
                    <asp:ListItem>2008</asp:ListItem>
                    <asp:ListItem>2007</asp:ListItem>
                    <asp:ListItem>2006</asp:ListItem>
                    <asp:ListItem>2005</asp:ListItem>
                    <asp:ListItem>2004</asp:ListItem>
                    <asp:ListItem>2003</asp:ListItem>
                    <asp:ListItem>2002</asp:ListItem>
                    <asp:ListItem>2001</asp:ListItem>
                    <asp:ListItem>2000</asp:ListItem>
                    <asp:ListItem>1999</asp:ListItem>
                    <asp:ListItem>1998</asp:ListItem>
                    <asp:ListItem>1997</asp:ListItem>
                    <asp:ListItem>1996</asp:ListItem>
                    <asp:ListItem>1995</asp:ListItem>
                    <asp:ListItem>1994</asp:ListItem>
                    <asp:ListItem>1993</asp:ListItem>
                    <asp:ListItem>1992</asp:ListItem>
                    <asp:ListItem>1991</asp:ListItem>
                    <asp:ListItem>1990</asp:ListItem>
                    <asp:ListItem>1989</asp:ListItem>
                    <asp:ListItem>1988</asp:ListItem>
                    <asp:ListItem>1987</asp:ListItem>
                    <asp:ListItem>1986</asp:ListItem>
                    <asp:ListItem>1985</asp:ListItem>
                    <asp:ListItem>1984</asp:ListItem>
                    <asp:ListItem>1983</asp:ListItem>
                    <asp:ListItem>1982</asp:ListItem>
                    <asp:ListItem>1981</asp:ListItem>
                    <asp:ListItem>1980</asp:ListItem>
                    <asp:ListItem>1979</asp:ListItem>
                    <asp:ListItem>1978</asp:ListItem>
                    <asp:ListItem>1977</asp:ListItem>
                    <asp:ListItem>1976</asp:ListItem>
                    <asp:ListItem>1975</asp:ListItem>
                    <asp:ListItem>1974</asp:ListItem>
                    <asp:ListItem>1973</asp:ListItem>
                    <asp:ListItem>1972</asp:ListItem>
                    <asp:ListItem>1971</asp:ListItem>
                    <asp:ListItem>1970</asp:ListItem>
                    <asp:ListItem>1969</asp:ListItem>
                    <asp:ListItem>1968</asp:ListItem>
                    <asp:ListItem>1967</asp:ListItem>
                    <asp:ListItem>1966</asp:ListItem>
                    <asp:ListItem>1965</asp:ListItem>
                    <asp:ListItem>1964</asp:ListItem>
                    <asp:ListItem>1963</asp:ListItem>
                    <asp:ListItem>1962</asp:ListItem>
                    <asp:ListItem>1961</asp:ListItem>
                    <asp:ListItem>1960</asp:ListItem>
                    <asp:ListItem>1959</asp:ListItem>
                    <asp:ListItem>1958</asp:ListItem>
                    <asp:ListItem>1957</asp:ListItem>
                    <asp:ListItem>1956</asp:ListItem>
                    <asp:ListItem>1955</asp:ListItem>
                    <asp:ListItem>1954</asp:ListItem>
                    <asp:ListItem>1953</asp:ListItem>
                    <asp:ListItem>1952</asp:ListItem>
                    <asp:ListItem>1951</asp:ListItem>
                    <asp:ListItem>1950</asp:ListItem>
                    <asp:ListItem>1949</asp:ListItem>
                    <asp:ListItem>1948</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownListMonth" runat="server" 
                    CssClass="style9Element">
                    <asp:ListItem>Місяць</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownListDay" runat="server" CssClass="style9Element">
                    <asp:ListItem>День</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                </asp:DropDownList>
                </div>
                
            <div class="ButtomInput">
                <asp:Button ID="Register" runat="server" Text="Зареєструватися" onclick="Register_Click" CssClass="Button"/>
            </div>
            <div class="divProblem">
                <asp:Label ID="Label1" runat="server" CssClass="Problem"></asp:Label>
            </div>
      </div>
    </form>
</body>
</html>