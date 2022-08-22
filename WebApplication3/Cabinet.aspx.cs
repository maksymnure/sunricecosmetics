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

namespace WebApplication3
{
    public partial class Cabinet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Registration();
            /*OpenCabinet();*/
        }


       protected void OpenCabinet() 
        {
            /*Literal1.Text = Session["surname"].ToString();
            Literal2.Text = Session["name"].ToString();
            Literal3.Text = Session["middlename"].ToString();   */                
        }
        
        protected void Registration()
        {
            string st = (string)Session["status"];
            if (st == null || st == "")
            {
                Response.Redirect("StarPage.aspx");
            }
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
                    break;
                case null:
                    break;
            }
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["status"] = null;
            string st = (string)Session["status"];
            Response.Redirect("StartPage.aspx");
        }
    }
}