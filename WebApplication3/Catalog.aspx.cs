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
using System.Web.Routing;


namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public Cart objCart;
        protected void Page_Load(object sender, EventArgs e)
        {
            Status();
            OpenBasket();
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
                    BascketPage.Visible = false;
                    break;
                case null:
                    CabinetPage.Visible = false;
                    BascketPage.Visible = false;
                    break;
            }
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
            GridView1.Visible = true;
            GridView2.Visible = false;
            GridView2.Visible = false;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Catalog.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedOfView.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Basket.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["id_product"] = GridView1.SelectedDataKey.Values["id_product"].ToString();
            Response.Redirect("DetailedOfView.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)  //Все
        {
            Session["id_company"] = null;
            GridView1.Visible = true;
            GridView2.Visible = false;
            GridView3.Visible = false;
        }

        protected void LinkButton5_Click(object sender, EventArgs e)  //Bioderma
        {
            Session["id_company"] = "1";
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView3.Visible = false;
        }

        protected void LinkButton6_Click(object sender, EventArgs e)  //Vichy
        {
            Session["id_company"] = "2";
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView3.Visible = false;
        }
        protected void LinkButton10_Click(object sender, EventArgs e)  //Для лица
        {
            Session["id_catalog"] = "1";
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = true;
        }
        protected void LinkButton20_Click(object sender, EventArgs e)  //Для тела
        {
            Session["id_catalog"] = "2";
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = true;
        }
        protected void LinkButton30_Click(object sender, EventArgs e)  //Nivea
        {
            Session["id_company"] = "3";
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView3.Visible = false;
        }
        protected void LinkButton40_Click(object sender, EventArgs e)  //La Roche-Posay
        {
            Session["id_company"] = "4";
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView3.Visible = false;
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["id_product"] = GridView2.SelectedDataKey.Values["id_product"].ToString();
            Response.Redirect("DetailedOfView.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("StarPage.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cabinet.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("PageAdmin.aspx");
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["id_product"] = GridView3.SelectedDataKey.Values["id_product"].ToString();
            Response.Redirect("DetailedOfView.aspx");
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
        protected void BascketPage_Click(object sender, EventArgs e)  //Basket
        {
            Response.Redirect("Basket.aspx");
        }
    }
}