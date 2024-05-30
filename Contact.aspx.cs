using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
//we use store procedure 
namespace Tutor_Management_System
{
    public partial class Contact : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;//get connectionString and store this in cs variable;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void ResetContact()
        {
            NameTextBox.Text = "";
            EmailTextBox.Text = "";
            SubjectDropDownList.SelectedValue = "Select";
            MessageTextBox.Text = "";
        }
        private bool IsValidEmail(string email)
        {
            // Regular expression for validating an email address
            string pattern = @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
            return Regex.IsMatch(email, pattern);
        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            String sp = "spContact_Insert";//strore procedure name //instead of sql query
            SqlCommand cmd = new SqlCommand(sp,con);
            cmd.CommandType = CommandType.StoredProcedure;//it do to understand that is store procedure
            int checkValidityCount = 0;
            if (NameTextBox.Text != "")
            {
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@name", NameTextBox.Text);
            }
            else
            {
                Page.SetFocus(NameTextBox);
            }
            if(EmailTextBox.Text != ""&& IsValidEmail(EmailTextBox.Text))
            {
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@email", EmailTextBox.Text);
            }
            else
            {
                Page.SetFocus(EmailTextBox);
            }
            if (SubjectDropDownList.SelectedValue != "Select")
            {
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@subject", SubjectDropDownList.SelectedItem.ToString());
            }
            else
            {
                Page.SetFocus(SubjectDropDownList);
            }
            if (MessageTextBox.Text != "")
            {
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@message", MessageTextBox.Text);
            }
            else
            {
                Page.SetFocus(MessageTextBox);
            }
            if (checkValidityCount == 4)
            {
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    //Response.Write("<script>alert('Form ha s been submitted successfully')</script>");
                    //Response.Write("<script>SuccessContact();</script>");
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "SuccessContact();", true);//get alert method in js
                    ResetContact();
                }
                else
                {
                    //Response.Write("<script>alert('Form has been failed to insert')</script>");
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ErrorContact();", true);//get alert method in js

                }
                con.Close();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ErrorContact();", true);//get alert method in js
            }
          
        }
    }
}