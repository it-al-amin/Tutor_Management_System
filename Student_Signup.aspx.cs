using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Text.RegularExpressions;
using System.Data;

namespace Tutor_Management_System
{
    public partial class Student_Signup : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;//get connectionString and store this in cs variable;
        private void cityBindDDL(int country_id)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from city where c_id=@country_id";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@country_id", country_id);
            DataTable data = new DataTable();
            sda.Fill(data);
            CityDropDownList.DataSource = data;
            CityDropDownList.DataTextField = "city_name";
            CityDropDownList.DataValueField = "city_id";
            CityDropDownList.DataBind();
            ListItem selectedIte = new ListItem("Select-City", "Select-City");
            selectedIte.Selected = true;
            CityDropDownList.Items.Insert(0, selectedIte);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(cs);
                string query = "select * from country";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                CountryDropDownList.DataSource = data;
                CountryDropDownList.DataTextField = "country_name";
                CountryDropDownList.DataValueField = "country_id";
                CountryDropDownList.DataBind();
                ListItem selectedIte = new ListItem("Select-Country", "Select-Country");
                selectedIte.Selected = true;
                CountryDropDownList.Items.Insert(0,selectedIte);

                int id = -1; // Default value when "Select-Country" is selected
                cityBindDDL(id);
            }
        }
        protected void CountryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CountryDropDownList.SelectedItem != null)
            {
               
                string selectedValue = CountryDropDownList.SelectedValue;

                if (selectedValue != "Select-Country")
                {
                    int countryId = int.Parse(selectedValue);
                    cityBindDDL(countryId);
                }
                else
                {
                    int id = -1;
                    cityBindDDL(id);
                }
            }
        }
        private void ResetField()
        {
            NameTextBox.Text = "";
            FatherNameTextBox.Text = "";
            SurnameTextBox.Text = "";
            GenderDropDownList.SelectedValue = "Select-Gender";
            AgeTextBox.Text = "";
            CountryDropDownList.SelectedValue = "Select-Country";
            CityDropDownList.SelectedValue = "Select-City";
            AddressTextBox.Text = "";
            StandardTextBox.Text = "";
            GoingToDropDownList.SelectedValue = "Select-GoingTo";
            SubjectTextBox.Text = "";
            ContactTextBox.Text = "";
            TuitionTypeDropDownList.SelectedValue = "Select-TuitionType";
            TutorPreferredDropDownList.SelectedValue = "Select-TutorPreferred";
            UsernameTextBox.Text = "";
            PasswordTextBox.Text = "";
        }
        private bool IsValidPassword(string pass)
        {
            // Regular expression for validating an PASSWORD
            string pattern = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
            return Regex.IsMatch(pass, pattern);
        }
        protected void StudentSignUpButton_Click(object sender, EventArgs e)
        {
           
            SqlConnection con = new SqlConnection(cs);
            string readQuery = "select * from student_signup where username=@username";
            String query = "insert into student_signup values" +
                "(@student_name,@father_name,@surname,@gender,@age,@country," +
                "@city,@address,@standard,@goingto,@subject,@contact_number," +
                "@tuition_type,@tutorprefer,@username,@password)";
            
            SqlCommand cmd = new SqlCommand(query, con);
            SqlCommand cmd1 = new SqlCommand(readQuery, con);
            int checkValidityCount = 0,i=0;
            int[] ar = new int[25];
            if (NameTextBox.Text != "")
            {
                checkValidityCount++;
                ar[i++] = 1;
                cmd.Parameters.AddWithValue("@student_name", NameTextBox.Text);
            }
            else
            {
                Page.SetFocus(NameTextBox);
            }
            if (FatherNameTextBox.Text != "")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@father_name",FatherNameTextBox.Text);
            }
            else
            {
                Page.SetFocus(FatherNameTextBox);
            }
            if (SurnameTextBox.Text!="")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@surname", SurnameTextBox.Text);
            }
            else
            {
                Page.SetFocus(SurnameTextBox);
            }
            if (GenderDropDownList.SelectedValue != "Select-Gender")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@gender", GenderDropDownList.Text);
            }
            else
            {
                Page.SetFocus(GenderDropDownList);
            }
               int age=Convert.ToInt32(AgeTextBox.Text);
          
                if (age >= 5 && age <= 30)
                {
                ar[i++] = 1;
                checkValidityCount++;
                    cmd.Parameters.AddWithValue("@age", age);
                }
                else
                {
                    // Handle the case where the age is out of the valid range
                    Page.SetFocus(AgeTextBox);
                }
           
            if (CountryDropDownList.SelectedValue != "Select-Country")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@country", CountryDropDownList.SelectedItem.Text);
            }
            else
            {
                Page.SetFocus(CountryDropDownList);
            }
            if (CityDropDownList.SelectedValue!="Select-City")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@city", CityDropDownList.SelectedItem.Text);
            }
            else
            {
                Page.SetFocus(CityDropDownList);
            }
            if (AddressTextBox.Text != "")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@address", AddressTextBox.Text);
            }
            else
            {
                Page.SetFocus(AddressTextBox);
            }
            if (StandardTextBox.Text != "")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@standard", StandardTextBox.Text);
            }
            else
            {
                Page.SetFocus(StandardTextBox);
            }
            if (GoingToDropDownList.SelectedValue != "Select-GoingTo")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@goingto", GoingToDropDownList.SelectedValue);
            }
            else
            {
                Page.SetFocus(GoingToDropDownList);
            }
            if (SubjectTextBox.Text != "")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@subject", SubjectTextBox.Text);
            }
            else
            {
                Page.SetFocus(SubjectTextBox);
            }
            if (ContactTextBox.Text != "")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@contact_number", ContactTextBox.Text);
            }
            else
            {
                Page.SetFocus(ContactTextBox);
            }
            if (TuitionTypeDropDownList.SelectedValue != "Select-TuitionType")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@tuition_type", TuitionTypeDropDownList.SelectedValue);
            }
            else
            {
                Page.SetFocus(TuitionTypeDropDownList);
            }
            if (TutorPreferredDropDownList.SelectedValue != "Select-TutorPreferred")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@tutorprefer", TutorPreferredDropDownList.SelectedValue);
            }
            else
            {
                Page.SetFocus(TutorPreferredDropDownList);
            }
            if (UsernameTextBox.Text != "")
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@username", UsernameTextBox.Text);
            }
            else
            {
                Page.SetFocus(UsernameTextBox);
            }
            if (PasswordTextBox.Text != ""&& IsValidPassword(PasswordTextBox.Text.ToString()))
            {
                ar[i++] = 1;
                checkValidityCount++;
                cmd.Parameters.AddWithValue("@password", PasswordTextBox.Text);
            }
            else
            {
                Page.SetFocus(PasswordTextBox);
            }
            string name = UsernameTextBox.Text;
            cmd1.Parameters.AddWithValue("@username", UsernameTextBox.Text);
            con.Open();
             SqlDataReader dr = cmd1.ExecuteReader();//check username is already exist or not
            if (!dr.HasRows)
            {
                name = "";
            }
            con.Close();
            if (checkValidityCount == 16&&name=="")
            {
                con.Open();
                try
                {
                    int a = cmd.ExecuteNonQuery();

                    if (a > 0)
                    {
                        ResetField();
                        //Response.Write("<script>alert('You have Registered Successfully!')</script>");
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire( 'Success', 'You have Registered Successfully!!', 'success')", true);//get alert method in js
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire( 'Failure', 'Registration Failed ..Please Try Again!', 'error')", true);//get alert method in js
                                                                                                                                                                         //Response.Write("<script>alert('Registration Failed ..Please Try Again!')</script>");
                    }

                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                    Console.WriteLine(ex);
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                if (name!= "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire( 'Failure', 'Invalid User!', 'error')", true);//get alert method in js
                   // Response.Write("<script>alert('Invalid User!')</script>");

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire( 'Failure', 'DB Connection is Failed!', 'error')", true);//get alert method in js
                   // Response.Write("<script>alert('DB Connection is Failed!')</script>");
                }
            }
        }
    }
}