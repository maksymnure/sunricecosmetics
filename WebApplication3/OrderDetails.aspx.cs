using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Furniture
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void Status()
        {
            string st = (string)Session["status"];
            switch (st)
            {
                case "1":

                    break;
                case "2":
                    break;
                case "":
                    break;
                case null:
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
        }
        protected void Registr_Click(object sender, EventArgs e)   //регистрация
        {
            Response.Redirect("Registration.aspx");
        }
        protected void Cab_Click(object sender, EventArgs e)  //Кабинет 
        {
            Response.Redirect("Cabinet.aspx");
        }

        protected void PageAdmin_Click(object sender, EventArgs e)  //Для админа
        {
            Response.Redirect("PageAdmin.aspx");
        }

        protected void StartPage_Click(object sender, EventArgs e)  //Главная
        {
            Response.Redirect("StartPage.aspx");
        }
        protected void Catalog_Click(object sender, EventArgs e) //Каталог
        {
            Response.Redirect("Catalog.aspx");
        }
        protected void Ord_Click(object sender, EventArgs e)
        {
            Response.Redirect("Orders.aspx");
        }

        decimal totalPrice = 0;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Это умножит цену на штуку и прибавит ее к окончательной сумме. 
                totalPrice += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "price")) * Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "quantity"));
                Label1.Text = Convert.ToString(totalPrice); 
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("StartPage.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Catalog.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cabinet.aspx");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["number"] = GridView2.SelectedDataKey.Values["number"].ToString();
            Response.Redirect("OrderDetails.aspx");
        }
    }
}