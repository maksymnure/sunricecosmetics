using System;
using System.Collections;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Web.Configuration;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        public Cart objCart;
        public void Page_Load(object sender, EventArgs e)
        {
            string id = Convert.ToString(Session["id_client"]);
            if (id == null || id == "")
            {
                Response.Redirect("Catalog.aspx");
            }
            // Первой загружается WebForm1.aspx 
            // Если первыми загружать WebForm2.aspx или WebForm3.aspx 
            // значение переменной сессии id будет равно null
            // и произойдет переход к стартовой WebForm1.aspx 
            // Если первой была загружена WebForm1.aspx 
            // то переменные сессии не равны null, загрузка происходит с заполнением литералов
            Literal7.Visible = false;  //Информация о заказе БД
            Literal8.Visible = false;  //Сумма заказа БД
            GridView2.Visible = false;            
            if (Session["CountUnit"] == null || Session["CountUnit"].ToString() == "-1" ||
                Session["CountUnit"].ToString() == "0")
            {
                GridView1.Visible = false;
                Literal5.Text = "В Вашей корзине заказа нет товаров";
                Button1.Visible = false;
                Literal6.Visible = false;                
            }
            else 
            {
                objCart = (Cart)Session["Cart"];
                GridView1.DataSource = objCart;
                GridView1.DataBind();
                Literal5.Text = "Ваша корзина заказа";
                Button1.Visible = true;
                Literal6.Visible = true;  ////Сумма корзины заказа 
                decimal cost = 0.00m;
                foreach (CartUnit obj in objCart)
                {
                    cost = cost + Convert.ToDecimal(obj.cost);
                }
                Literal6.Text = "Сумма заказа: " + cost.ToString("0.00");
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)  //Краткий просмотр
        {
            Response.Redirect("Catalog.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)  //Подробный просмотр
        {
            Response.Redirect("DetailedOfView.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)   //Заказ товара
        {
            Response.Redirect("Basket.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        int kolvo = 0;
        public void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            objCart = (Cart)Session["Cart"];
            int Count = Convert.ToUInt16(objCart.Count);
            decimal cost = 1.00m;
            if (e.CommandName == "ButtonGr1")   //увеличить
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["cosmetics"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                string sql = "SELECT amount FROM Product WHERE (id_product = " + Session["id_product"].ToString() + ")";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                SqlDataReader drKolvo = cmd.ExecuteReader();
                drKolvo.Read();
                int db_kolvo = Convert.ToInt16(drKolvo["amount"].ToString());
                int index = Convert.ToInt32(e.CommandArgument);
                int k = 0;
                if (Convert.ToInt16(objCart[index].amount) >= db_kolvo)  // проверяем количество, если = 0, то заказать не сможем
                {
                    k = Convert.ToInt16(objCart[index].amount);

                }
                else if (Convert.ToInt16(objCart[index].amount) <= db_kolvo)
                {
                    k = Convert.ToInt16(objCart[index].amount) + 1;
                }

                kolvo = k;
                objCart[index].amount = Convert.ToString(k);
                cost = cost * Convert.ToDecimal(objCart[index].price);
                cost = (decimal)(cost * k);
                cost = Math.Round(cost, 2);
                objCart[index].cost = cost.ToString("0.00");
                cost = 0.00m;
                foreach (CartUnit obj in objCart)
                {
                    cost = cost + Convert.ToDecimal(obj.cost);
                }
                Literal6.Text = "Сумма заказа: " + cost.ToString("0.00");
            }
            if (e.CommandName == "ButtonGr2")  //уменьшить
            {
                int index = Convert.ToInt32(e.CommandArgument);                
                int k = Convert.ToInt16(objCart[index].amount);
                if (k > 1)
                {
                    k = k - 1;
                    objCart[index].amount = Convert.ToString(k);
                    cost = cost * Convert.ToDecimal(objCart[index].price);
                    cost = (decimal)(cost * k);
                    cost = Math.Round(cost, 2);
                    objCart[index].cost = cost.ToString("0.00");
                    cost = 0.00m;
                    foreach (CartUnit obj in objCart)
                    {
                        cost = cost + Convert.ToDecimal(obj.cost);
                    }
                    Literal6.Text = "Сумма заказа: " + cost.ToString("0.00");
                }
            }
            if (e.CommandName == "ButtonGr3")  //удалить
            {                
                int index = Convert.ToInt32(e.CommandArgument);             
                objCart.RemoveAt(index);
                Count = Convert.ToUInt16(objCart.Count);
                Session["CountUnit"] = Count.ToString();
                if (Count <= 0)
                {
                    Literal5.Text = "В Вашей корзине заказа нет товаров";
                    Button1.Visible = false;
                    GridView1.Visible = false;
                }       
            }
            GridView1.DataSource = objCart;
            GridView1.DataBind();
            Session["Cart"] = objCart;
        }
        protected void Button1_Click(object sender, EventArgs e)  //Оформить заказ
        {
            var adres = adress.Text;
            Literal7.Visible = true;
            Literal8.Visible = true;
            string connectionString = WebConfigurationManager.ConnectionStrings["cosmetics"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            //id_zakaz не указываем, т.к. этот ключ имееет свойство AutoIncrement
            string sql = "INSERT INTO Receipt (data, id_client, id_receipt_status, adress) VALUES (@data, @id_client, @id_receipt_status, @adress)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
            //id  клиента хранится в сесии, это id_student
            cmd.Parameters.Add("@id_client", SqlDbType.Int, 4);
            cmd.Parameters["@id_client"].Value = Convert.ToInt16(Session["id_client"]);
            cmd.Parameters.Add("@data", SqlDbType.DateTime);
            cmd.Parameters["@data"].Value = DateTime.Today.ToShortDateString(); //текущая дата;
            cmd.Parameters.Add("@id_receipt_status", SqlDbType.Int, 4);
            cmd.Parameters["@id_receipt_status"].Value = 1;
            cmd.Parameters.Add("@adress", SqlDbType.VarChar, 50);
            cmd.Parameters["@adress"].Value = adres;

            con.Open();
            //заносим запись в таблицу Zakaz
            cmd.ExecuteNonQuery();
            sql = "SELECT TOP (1) number FROM Receipt WHERE (id_client = ";
            sql = sql + Session["id_client"].ToString() + ")";
            sql = sql + " ORDER BY number DESC";
            cmd = new SqlCommand(sql, con);
            //Получаем id заказа
            //создаем объект SqlDataReader и читаем в него значение ключа id_zakaz
            SqlDataReader drZakazID = cmd.ExecuteReader();
            drZakazID.Read();
            //сохраняем значение ключа id_zakaz в сессии
            Session["number"] = drZakazID["number"].ToString();             
            drZakazID.Close();
            //Заносим данные корзины в таблицу Shopping_Cart, зная значение id_zakaz
            sql = "INSERT INTO Receipt_has_product (id_receipt, id_product, quantity) VALUES (@id_receipt,@id_product,@quantity); UPDATE Product SET amount -= @kolvo WHERE id_product = @id_product";
            //Данные в таблицу Shopping_Cart заносим с помощью цикла foreach
            //итератор цикла foreach - объект obj класса CartUnit
            //объекты класса CartUnit находятся в объекте objCart класса-коллекции Cart
            //цикл foreach последовательно проссматиривает все объекты obj коллекции objCart
            foreach (CartUnit obj in objCart)
            {
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add("@id_receipt", SqlDbType.Int, 4);
                cmd.Parameters["@id_receipt"].Value = Convert.ToInt16(Session["number"]);
                cmd.Parameters.Add("@id_product", SqlDbType.Int, 4);
                cmd.Parameters["@id_product"].Value = Convert.ToInt16(obj.id_product);
                cmd.Parameters.Add("@quantity", SqlDbType.Int, 4);
                cmd.Parameters["@quantity"].Value = Convert.ToInt16(obj.amount);
                cmd.Parameters.Add("kolvo", SqlDbType.Int, 4);
                cmd.Parameters["Kolvo"].Value = Convert.ToInt16(obj.amount);
                cmd.ExecuteNonQuery();
            } 
            con.Close();
            GridView2.Visible = true;
            GridView2.DataBind();
            decimal cost = 0.00m;
            foreach (CartUnit obj in objCart)
            {
                cost = cost + Convert.ToDecimal(obj.cost);
            }
            Literal7.Text = "Ваш заказ оформлен. Дата заказа:" + Session["data"].ToString() +
                "   Номер заказа:" + Session["number"].ToString(); 
            Literal8.Text = "Сумма заказа: " + cost.ToString("0.00");
        }
        protected void OpenBasket()
        {
            if (Session["Surname"] == null)
            {
            }
            else
            {

                Session["data"] = DateTime.Today.ToShortDateString(); //текущая дата
            }
            // Не отображаем Literal7 и Literal8
            Literal7.Visible = false;  //Информация о заказе БД
            Literal8.Visible = false;  //Сумма заказа БД
            // Не отображаем GridView2
            GridView2.Visible = false;  //инф. о заказе из БД
            // Проверяем, есть ли в корзине товары
            if (Session["CountUnit"] == null || Session["CountUnit"].ToString() == "-1")
            {
                // условия «Товаров в корзине нет» выполнены 
                // Прячем GridView1, Literal5 Button1 Literal6
                // Пишем, что товаров в корзине нет
                // Прячем кнопку «Оформить заказ»
                // Прячем литерал Literal6 (информация об общей сумме заказа)
            }
            else
            {
                // условия «Товаров в корзине нет» не выполнены
                // Читаем данные в объект-коллекцию objCart из сессии Session["Cart"]
                objCart = (Cart)Session["Cart"];
                // подключаем источник данных objCart к GridView1
                GridView1.DataSource = objCart;
                // обновляем объект GridView1
                GridView1.DataBind();
                // Пишем, что товары в корзине есть
                Literal5.Text = "Ваша корзина заказов";
                // Делаем доступной кнопку «Оформить заказ»
                // Отображаем литерал Literal6 (информация об общей сумме заказа)
                // Объявляем переменную cost для расчета общей суммы заказа
                decimal cost = 0.00m;
                // Объявляем цикл foreach
                // итератор цикла – объект obj класса CartUnit
                // находящийся (IN) в объекте коллекции objCart
                // цикл foreach просматривает все объекты obj, входящие в коллекцию objCart
                foreach (CartUnit obj in objCart)
                {
                    // Суммируем поля cost всех объектов obj, входящих в коллекцию objCart
                    // сохраняем в переменной cost
                    cost = cost + Convert.ToDecimal(obj.cost);
                }
                // Выводим в литерале Literal6 полученную сумму с 2-мя значащими цифрами после запятой
                Literal6.Text = "Сумма заказа: " + cost.ToString("0.00");
            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("StarPage.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cabinet.aspx");
        }

        protected void CatalogPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Catalog.aspx");
        }
        protected void CabinetPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cabinet.aspx");
        }
    }
}