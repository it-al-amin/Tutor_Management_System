using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Text.RegularExpressions;
using System.Data;
using System.Configuration;

namespace Tutor_Management_System
{
    public partial class Tutor_Signup : System.Web.UI.Page
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
                CountryDropDownList.Items.Insert(0, selectedIte);

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
        private bool IsValidPassword(string pass)
        {
            // Regular expression for validating an PASSWORD
            string pattern = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
            return Regex.IsMatch(pass, pattern);
        }
        private bool IsValidEmail(string pass)
        {
            // Regular expression for validating an PASSWORD
            string pattern = @"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
            return Regex.IsMatch(pass, pattern);
        }
        protected void ResetField()
        {
            NameTextBox.Text = "";
            SurnameTextBox.Text = "";
            GenderDropDownList.SelectedValue = "Select-Gender";
            AgeTextBox.Text = "";
            EmailTextBox.Text = "";
            MaritalStatusDropDownList.SelectedValue = "Select-Marital_Status";
            CountryDropDownList.SelectedItem.Text = "Select-Country";
            CityDropDownList.SelectedItem.Text = "Select-City";
            AddressTextBox.Text = "";
            QualificationDropDownList.SelectedItem.Text = "";
            DegreeTextBox.Text = "";
            ExperienceDropDownList.SelectedValue = "Select-Experience";
            ContactTextBox.Text = "Select-Contact";
            UsernameTextBox.Text = "";
            PasswordTextBox.Text = "";

        }
        protected void TutorSignUpButton_Click(object sender, EventArgs e)
        {
            string connectionString = cs;
            string readQuery = "SELECT * FROM tutor_signup WHERE username = @username";
            string insertQuery = "INSERT INTO tutor_signup(tutor_name, surname, gender, age, email, marital_status,country, city, address, qualification, degree, experience, contact,username, password) VALUES (@tutor_name,@surname, @gender, @age, @email, @marital_status, @country, @city, @address, @qualification, @degree, @experience, @contact, @username, @password)";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand checkUserCmd = new SqlCommand(readQuery, con);
                SqlCommand insertCmd = new SqlCommand(insertQuery, con);

                if (ValidateAndAddParameters(insertCmd, out int checkValidityCount))
                {
                    checkUserCmd.Parameters.AddWithValue("@username", UsernameTextBox.Text);
                    con.Open();
                    SqlDataReader dr = checkUserCmd.ExecuteReader();

                    bool userExists = dr.HasRows;
                    con.Close();

                    if (checkValidityCount == 15 && !userExists)
                    {
                        con.Open();
                        try
                        {
                            int result = insertCmd.ExecuteNonQuery();
                            if (result > 0)
                            {
                                ResetField();
                                ShowAlert("Success", "You have Registered Successfully!", "success");
                            }
                            else
                            {
                                ShowAlert("Failure", "Registration Failed ..Please Try Again!", "error");
                            }
                        }
                        catch (Exception ex)
                        {
                            LogError(insertCmd, ex);
                            ShowAlert("Error", "An error occurred. Please try again later.", "error");
                        }
                        finally
                        {
                            con.Close();
                        }
                    }
                    else
                    {
                        if (userExists)
                        {
                            ShowAlert("Failure", "Invalid User!", "error");
                        }
                        else
                        {
                            ShowAlert("Failure", "DB Connection is Failed!", "error");
                        }
                    }
                }
            }
        }

        private bool ValidateAndAddParameters(SqlCommand cmd, out int checkValidityCount)
        {
            checkValidityCount = 0;

            if (!string.IsNullOrWhiteSpace(NameTextBox.Text))
            {
                cmd.Parameters.AddWithValue("@tutor_name", NameTextBox.Text);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(NameTextBox);
                return false;
            }

            if (!string.IsNullOrWhiteSpace(SurnameTextBox.Text))
            {
                cmd.Parameters.AddWithValue("@surname", SurnameTextBox.Text);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(SurnameTextBox);
                return false;
            }

            if (GenderDropDownList.SelectedValue != "Select-Gender")
            {
                cmd.Parameters.AddWithValue("@gender", GenderDropDownList.SelectedValue);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(GenderDropDownList);
                return false;
            }

            if (int.TryParse(AgeTextBox.Text, out int age) && age >= 20 && age <= 60)
            {
                cmd.Parameters.AddWithValue("@age", age);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(AgeTextBox);
                return false;
            }

            if (!string.IsNullOrWhiteSpace(EmailTextBox.Text) && IsValidEmail(EmailTextBox.Text))
            {
                cmd.Parameters.AddWithValue("@email", EmailTextBox.Text);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(EmailTextBox);
                return false;
            }

            if (MaritalStatusDropDownList.SelectedValue != "Select-Marital_Status")
            {
                cmd.Parameters.AddWithValue("@marital_status", MaritalStatusDropDownList.SelectedValue);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(MaritalStatusDropDownList);
                return false;
            }

            if (CountryDropDownList.SelectedValue != "Select-Country")
            {
                cmd.Parameters.AddWithValue("@country", CountryDropDownList.SelectedItem.Text);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(CountryDropDownList);
                return false;
            }

            if (CityDropDownList.SelectedValue != "Select-City")
            {
                cmd.Parameters.AddWithValue("@city", CityDropDownList.SelectedItem.Text);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(CityDropDownList);
                return false;
            }

            if (!string.IsNullOrWhiteSpace(AddressTextBox.Text))
            {
                cmd.Parameters.AddWithValue("@address", AddressTextBox.Text);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(AddressTextBox);
                return false;
            }

            if (QualificationDropDownList.SelectedValue != "Select-Qualification")
            {
                cmd.Parameters.AddWithValue("@qualification", QualificationDropDownList.SelectedValue);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(QualificationDropDownList);
                return false;
            }

            if (!string.IsNullOrWhiteSpace(DegreeTextBox.Text))
            {
                cmd.Parameters.AddWithValue("@degree", DegreeTextBox.Text);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(DegreeTextBox);
                return false;
            }

            if (ExperienceDropDownList.SelectedValue != "Select-Experience")
            {
                cmd.Parameters.AddWithValue("@experience", ExperienceDropDownList.SelectedValue);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(ExperienceDropDownList);
                return false;
            }

            if (!string.IsNullOrWhiteSpace(ContactTextBox.Text))
            {
                cmd.Parameters.AddWithValue("@contact", ContactTextBox.Text);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(ContactTextBox);
                return false;
            }

            if (!string.IsNullOrWhiteSpace(UsernameTextBox.Text))
            {
                cmd.Parameters.AddWithValue("@username", UsernameTextBox.Text);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(UsernameTextBox);
                return false;
            }

            if (!string.IsNullOrWhiteSpace(PasswordTextBox.Text) && IsValidPassword(PasswordTextBox.Text))
            {
                cmd.Parameters.AddWithValue("@password", PasswordTextBox.Text);
                checkValidityCount++;
            }
            else
            {
                Page.SetFocus(PasswordTextBox);
                return false;
            }

            return true;
        }

        private void ShowAlert(string title, string message, string type)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", $"Swal.fire('{title}', '{message}', '{type}')", true);
        }

        private void LogError(SqlCommand cmd, Exception ex)
        {
            // Log the exception details including the command text and parameters
            string errorDetails = $"Error: {ex.Message}\nCommand Text: {cmd.CommandText}\nParameters:";
            foreach (SqlParameter param in cmd.Parameters)
            {
                errorDetails += $"\n{param.ParameterName}: {param.Value}";
            }
            // Implement your logging mechanism here, e.g., log to a file or database
            Console.WriteLine(errorDetails);
            // You can also use a logging library like log4net or NLog for more advanced logging
        }


    }
}