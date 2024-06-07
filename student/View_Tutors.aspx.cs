using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace Tutor_Management_System.student
{
    public partial class View_Tutors : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;//get connectionString and store this in cs variable;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["student_username"] == null)
            {
                Response.Redirect("~/Student_Login.aspx");
            }
            if (!IsPostBack)
            {

                BindRepeater();
            }
        }
        void BindRepeater()
        {
            SqlConnection con = new SqlConnection(cs);
            String query = "select * from tutor_signup";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);//store data in sda
            DataTable dt = new DataTable();
            sda.Fill(dt);//fill this data in object of DataTable
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        protected void SearchBtn_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            String query = "select * from tutor_signup where tutor_name like '%"+SearchText.Text+ "%'  or country like '%" + SearchText.Text + "%' " +
                "or city like '%" + SearchText.Text + "%' or degree like'%" + SearchText.Text + "%' or experience like'%" + SearchText.Text + "%' or" +
                " qualification like '%" + SearchText.Text + "%' or gender like '%" + SearchText.Text + "%'";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);//store data in sda
            DataTable dt = new DataTable();
            sda.Fill(dt);//fill this data in object of DataTable
            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('No Records Found')</script>");
                Repeater1.DataSource = null;
                Repeater1.DataBind();
            }
        }
    }
}