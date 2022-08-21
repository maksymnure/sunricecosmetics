﻿using System;
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
    public partial class StartPage : System.Web.UI.Page
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
                    break;
                case "2":
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["cosmetics"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string sql = "SELECT id_client, name, surname, middlename, id_client_status, login, password FROM Client WHERE (login = N'";
            sql = sql + TextBoxLogin.Text.Trim() + "') AND (password = N'";
            sql = sql + TextBoxPassword.Text.Trim() + "')";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader drWebUser = cmd.ExecuteReader();
            if (drWebUser.HasRows)
            {
                drWebUser.Read();
                Session["id_client"] = drWebUser["id_client"].ToString();
                Session["login"] = drWebUser["login"].ToString();
                Session["password"] = drWebUser["password"].ToString();
                Session["surname"] = drWebUser["surname"].ToString();
                Session["name"] = drWebUser["name"].ToString().Trim();
                Session["middlename"] = drWebUser["middlename"].ToString();
                Session["status"] = drWebUser["id_client_status"].ToString();
                Label1ms.Text = "";
                drWebUser.Close();
                con.Close();
                Registration();
            }
            else
            {
                drWebUser.Close();
                con.Close();
                Label1ms.Text = "Неверный логин или пароль";
            }
        }
    }
}