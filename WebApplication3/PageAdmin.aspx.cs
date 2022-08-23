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

namespace Furniture
{
    public partial class PageAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Registration();
        }

        protected void Registration()
        {
            string st = (string)Session["status"];
            switch (st)
            {
                case "1":
                    PageAdmine.Visible = true;
                    Cab.Visible = true;
                    Ord.Visible = false;
                    break;
                case "2":
                    PageAdmine.Visible = false;
                    Cab.Visible = true;
                    Ord.Visible = false;
                    break;
                case "":
                    PageAdmine.Visible = false;
                    Cab.Visible = false;
                    Ord.Visible = false;
                    break;
                case null:
                    PageAdmine.Visible = false;
                    Cab.Visible = false;
                    Ord.Visible = false;
                    break;
            }
        }
        protected void Cab_Click(object sender, EventArgs e)  //Кабинет 
        {
            Response.Redirect("Cabinet.aspx");
        }

        protected void PageAdmine_Click(object sender, EventArgs e)  //Для админа
        {
            Response.Redirect("PageAdmin.aspx");
        }

        protected void Catalog_Click(object sender, EventArgs e) //Каталог
        {
            Response.Redirect("Catalog.aspx");
        }
        protected void Ord_Click(object sender, EventArgs e)
        {
            Response.Redirect("Orders.aspx");
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["number"] = GridView1.SelectedDataKey.Values["number"].ToString();
            Response.Redirect("OrderDetails.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Catalog.aspx");
        }
    }
}