using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tutor_Management_System.tutor
{
    public partial class View_Students : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;//get connectionString and store this in cs variable;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tutor_username"] == null)
            {
                Response.Redirect("~/Tutor_Login.aspx");
            }
            if (!IsPostBack)
            {

                BindRepeater();
            }
        }
        void BindRepeater()
        {
            SqlConnection con = new SqlConnection(cs);
            String query = "select * from student_signup";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);//store data in sda
            DataTable dt = new DataTable();
            sda.Fill(dt);//fill this data in object of DataTable
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        protected void SearchBtn_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            String query = "select * from student_signup where student_name like '%" + SearchText.Text + "%'  or country like '%" + SearchText.Text + "%' " +
                "or city like '%" + SearchText.Text + "%' or subject like'%" + SearchText.Text + "%' or standard like'%" + SearchText.Text + "%' or" +
                " goingto like '%" + SearchText.Text + "%' or gender like '%" + SearchText.Text + "%' or tuition_type like '%" + SearchText.Text + "%' or" +
                " tutorprefer like '%" + SearchText.Text + "%'";
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