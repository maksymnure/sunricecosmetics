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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fReg();
        }

        protected void fReg()
        {
            string st = (string)Session["status"];
            switch (st)
            {
                case "1":
                    break;
                case "2":
                    break;
                case "":
                    CabinetPage.Visible = false;
                    break;
                case null:
                    CabinetPage.Visible = false;
                    break;
            }
        }
        
        public void LoginDB(ref int login)
        {
            login = 0;
            string connectionString = WebConfigurationManager.ConnectionStrings["cosmetics"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string sql = "SELECT login FROM Client WHERE (login = N'" + TextBoxLogin.Text + "')";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader drWebUser = cmd.ExecuteReader();
            if (drWebUser.HasRows)
            {
                login = 1;
                TextBoxLogin.Text = "";
                LabelCheck.Text = "Введите другой логин";
                LabelCheck.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                login = 0;
                LabelCheck.Text = "Login OK";
                LabelCheck.ForeColor = System.Drawing.Color.Green;
            }
            drWebUser.Close();
        }

        protected void CheckLogin_Click(object sender, EventArgs e)   //Проверить логин
        {            
            int login = 1;
            LoginDB(ref login);
        }

        protected void Register_Click(object sender, EventArgs e) //Зарегистрироваться
        {
            int login = 1;
            LoginDB(ref login);
            if (login == 1) { Response.Redirect("Registration.aspx"); }
            string connectionString = WebConfigurationManager.ConnectionStrings["cosmetics"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string sql = "INSERT INTO Client (name, surname, middlename, birthday, city, phone, login, password, id_client_status) ";
            sql = sql + "VALUES (@name, @surname, @middlename, @birthday, @city, @phone, @login, @password, 1)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50);
            cmd.Parameters["@name"].Value = TextBoxName.Text.Trim();
            cmd.Parameters.Add("@surname", SqlDbType.NVarChar, 50);
            cmd.Parameters["@surname"].Value = TextBoxSurName.Text.Trim();
            cmd.Parameters.Add("@middlename", SqlDbType.NVarChar, 50);
            cmd.Parameters["@middlename"].Value = TextBoxMiddleName.Text.Trim();
            string sdt = (string)DropDownListDay.SelectedItem.Value + "." + (string)DropDownListMonth.SelectedItem.Value + "." +
            (string)DropDownListY.SelectedItem.Value;
            DateTime dt = Convert.ToDateTime(sdt);
            cmd.Parameters.Add("@birthday", SqlDbType.DateTime);
            cmd.Parameters["@birthday"].Value = dt;
            cmd.Parameters.Add("@city", SqlDbType.NVarChar, 50);
            cmd.Parameters["@city"].Value = TextBoxCity.Text.Trim();
            cmd.Parameters.Add("@phone", SqlDbType.BigInt);
            cmd.Parameters["@phone"].Value = TextBoxPhone.Text.Trim();
            cmd.Parameters.Add("@login", SqlDbType.NVarChar, 50);
            cmd.Parameters["@login"].Value = TextBoxLogin.Text.Trim();
            cmd.Parameters.Add("@password", SqlDbType.NVarChar, 50);
            cmd.Parameters["@password"].Value = TextBoxPassword.Text.Trim();
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Session["login"] = TextBoxLogin.Text.Trim();
                Session["password"] = TextBoxPassword.Text.Trim();
                Session["surname"] = TextBoxSurName.Text.Trim();
                Session["name"] = TextBoxName.Text.Trim();
                Session["middlename"] = TextBoxMiddleName.Text.Trim();
                Session["status"] = 1.ToString();
            }
            finally
            {
                sql = "";
                sql = "SELECT id_client FROM Client WHERE (login = N'";
                sql = sql + Session["login"].ToString() + "') AND (password = N'" + Session["password"].ToString() + "')";
                cmd = new SqlCommand(sql, con);
                SqlDataReader drWebUser = cmd.ExecuteReader();
                drWebUser.Read();
                Session["id_client"] = drWebUser["id_client"].ToString().Trim();
                drWebUser.Close();
                con.Close();
                Response.Redirect("StartPage.aspx");
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
    }
}