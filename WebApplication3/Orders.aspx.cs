using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Literal1.Text = Session["surname"].ToString();
            Literal2.Text = Session["name"].ToString();
            Literal3.Text = Session["middlename"].ToString();
            Literal4.Text = Session["id_client"].ToString();
            Status();
        }

        protected void Status()
        {
            string st = (string)Session["status"];
            if (st == null || st == "")
            {
                Response.Redirect("StartPage.aspx");
            }
            switch (st)
            {
                case "1":
                    Registr.Visible = false;
                    Cab.Visible = true;
                    Ord.Visible = false;
                    break;
                case "2":
                    Registr.Visible = false;
                    Cab.Visible = true;
                    Ord.Visible = false;
                    break;
                case "":
                    Cab.Visible = false;
                    Ord.Visible = false;
                    Registr.Visible = true;
                    break;
                case null:
                    Cab.Visible = false;
                    Ord.Visible = false;
                    Registr.Visible = true;
                    break;
            }
        }
        protected void Registr_Click(object sender, EventArgs e)   //регистрация
        {
            Response.Redirect("Registration.aspx");
        }
        protected void Cab_Click(object sender, EventArgs e)  //Кабинет 
        {
            Response.Redirect("Cabinet.aspx");
        }

        protected void Catalog_Click(object sender, EventArgs e) //Каталог
        {
            Response.Redirect("Catalog.aspx");
        }
        protected void Ord_Click(object sender, EventArgs e) //Заказы
        {
            Response.Redirect("Orders.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["number"] = GridView2.SelectedDataKey.Values["number"].ToString();
            Response.Redirect("OrderDetails.aspx");
        }
    }
}