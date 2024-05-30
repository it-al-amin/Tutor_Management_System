using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
namespace Tutor_Management_System.admin
{
    public partial class Admin_Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;//get connectionString and store this in cs variable;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void ResetLogin()
        {
            UserNameTxt.Text = "";
            PasswordTxt.Text = "";
          
        }
        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            String query = "select * from admin_login where username=@username and password=@password";//strore procedure name //instead of sql query
            SqlCommand cmd = new SqlCommand(query, con);
            int checkValidityCount = 0;
            if (UserNameTxt.Text != "")
            {
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@username", UserNameTxt.Text);
            }
            else
            {
                Page.SetFocus(UserNameTxt);
            }
            if (PasswordTxt.Text != "")
            {
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@password", PasswordTxt.Text);
            }
            else
            {
                Page.SetFocus(PasswordTxt);
            }
            if (checkValidityCount == 2)
            {
                ResetLogin();
                con.Open();
                SqlDataReader dr= cmd.ExecuteReader();
                if (dr.HasRows)
                {

                    //Response.Write("<script>alert('Login successfull');</script>");
                   // ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire( 'Success', 'Login Successfull!', 'success')", true);//get alert method in js

                    Session["admin_username"]= UserNameTxt.Text;
                    Response.Redirect("Admin_Index.aspx");
                }
                else
                {

                    // Response.Write("<script>alert('UserName or Password is incorrect');</script>");
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire( 'Failure', 'Username or Password is Incorrect', 'error')", true);//get alert method in js
                }
                con.Close();
            }
            else
            {

            }
        }
    }
}