using System;
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
    public partial class WebForm2 : System.Web.UI.Page
    {
        /*public Cart objCart;*/
        protected void Page_Load(object sender, EventArgs e)
        {
            Status();
            /*OpenBasket();*/
            Label1.Visible = false;
        }

        protected void Status()
        {
            string st = (string)Session["status"];
            switch (st)
            {
                case "1":
                    StartPager.Visible = false;
                    RegisterPage.Visible = false;
                    break;
                case "2":
                    StartPager.Visible = false;
                    RegisterPage.Visible = false;
                    break;
                case "":
                    CabinetPage.Visible = false;
                    /*Button4.Visible = false;
                    Button5.Visible = false;*/
                    break;
                case null:
                    CabinetPage.Visible = false;
                    /*Button4.Visible = false;
                    Button5.Visible = false;*/
                    break;
            }
        }

       /* protected void OpenBasket()
        {
            if (Session["Surname"] == null)
            {

            }
            else
            {
                Session["data"] = DateTime.Today.ToShortDateString(); //текущая дата
                if (Session["CountUnit"] == null)
                {
                    Cart objCart = new Cart();
                    Session["Cart"] = objCart;
                    Session["CountUnit"] = "-1";
                }
            }
        }*/

        protected void LinkButton1_Click(object sender, EventArgs e)  //Краткий просмотр
        {
            Response.Redirect("Catalog.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)  //Подробный просмотр
        {
            Response.Redirect("DetailedOfView.aspx");
        }

        /*protected void LinkButton3_Click(object sender, EventArgs e)   //Заказ товара
        {
            Response.Redirect("Basket.aspx");
        }*/

        /*protected void Button1_Click(object sender, EventArgs e)  //добавить в корзину
        {
            string st = (string)Session["status"];
            if (st == "1" || st == "2")
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["cosmetics"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                string sql = "SELECT amount FROM Product WHERE (id_product = " + Session["id_product"].ToString() + ")";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                SqlDataReader drKolvo = cmd.ExecuteReader();
                drKolvo.Read();
                int db_kolvo = Convert.ToInt16(drKolvo["amount"].ToString());
                if (db_kolvo == 0)  // проверяем количество, если = 0, то заказать не сможем
                {
                    Label1.Visible = true;
                    Button4.Enabled = false;

                }
                else
                {
                    Label1.Visible = false;
                    con.Close();
                    con.Open();
                    sql = "SELECT id_product, title, price FROM Product WHERE (id_product =" + Session["id_product"].ToString() + ")";
                    cmd = new SqlCommand(sql, con);
                    SqlDataReader drWebUser = cmd.ExecuteReader();
                    drWebUser.Read();
                    objCart = (Cart)Session["Cart"];
                    CartUnit objCartUnit = new CartUnit();
                    objCartUnit.id_product = drWebUser["id_product"].ToString();
                    objCartUnit.amount = "1";
                    objCartUnit.title = drWebUser["title"].ToString();
                    objCartUnit.price = drWebUser["price"].ToString();
                    objCartUnit.cost = drWebUser["price"].ToString();
                    objCart.Add(objCartUnit);
                    drWebUser.Close();
                    con.Close();
                    Session["Cart"] = objCart;
                    Session["CountUnit"] = objCart.Count.ToString();
                }

            }
            else
            {
                Response.Redirect("StartPage.aspx");
            }
        }*/


        protected void Button3_Click(object sender, EventArgs e)  //Оформить заказ
        {
            Response.Redirect("Basket.aspx");
        }
        protected void LinkButton5_Click(object sender, EventArgs e)   //Заказ товара
        {
            Response.Redirect("Cabinet.aspx");
        }
        public void LinkButton4_Click(object sender, EventArgs e)   //Заказ товара
        {
            Response.Redirect("StarPage.aspx");
        }
        protected void LinkButton6_Click(object sender, EventArgs e)   //Заказ товара
        {
            Response.Redirect("PageAdmin.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)   //Вернутся к просмотру товаров
        {
            Response.Redirect("Catalog.aspx");
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }
        protected void StartPager_Click(object sender, EventArgs e)  //Главная
        {
            Response.Redirect("StartPage.aspx");
        }
        protected void RegisterPage_Click(object sender, EventArgs e)  //RegisterPage
        {
            Response.Redirect("Registration.aspx");
        }
        protected void CabinetPage_Click(object sender, EventArgs e)  //Cabinet
        {
            Response.Redirect("Cabinet.aspx");
        }
        protected void CatalogPage_Click(object sender, EventArgs e)  //Catalog
        {
            Response.Redirect("Catalog.aspx");
        }








    }
}