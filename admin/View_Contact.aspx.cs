using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Tutor_Management_System.admin
{
    public partial class View_Contact : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;//get connectionString and store this in cs variable;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)//admin login is not complete then redirect to admin login page 
            {
                Response.Redirect("Admin_Login.aspx");
            }

            if (!IsPostBack)//if our page load at first time
            {
                BindGridView();
            }
        }
        void BindGridView()
        {
             SqlConnection con = new SqlConnection(cs);
             String query = "select * from contact_tbl";
             SqlDataAdapter sda = new SqlDataAdapter(query,con);//store data in sda
             DataTable dt = new DataTable();
             sda.Fill(dt);//fill this data in object of DataTable
             GridView1.DataSource = dt;
             GridView1.DataBind(); 
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];//which row click come to row 
            Label ItemId = (Label)row.FindControl("LabelID");
            string Id = ItemId.Text;
            SqlConnection con = new SqlConnection(cs);
            String query = "delete from contact_tbl where id=@id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Id);
            con.Open();
            int a=cmd.ExecuteNonQuery();//WE USE IT FOR INSERT ,UPPDATE OR,DELETE 
            if(a>0)
            {
                Response.Write("<script>alert('Data has been Deleted Successfully!!')</script>");
                BindGridView();
            }
            else
            {
                Response.Write("<script>alert('Something went wrong!!')</script>");
            }
            con.Close();


        }

        protected void SearchBtn_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            String query = "select * from contact_tbl where name like '%" + SearchText.Text + "%'  or subject like '%" + SearchText.Text + "%' ";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);//store data in sda
            DataTable dt = new DataTable();
            sda.Fill(dt);//fill this data in object of DataTable
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                //Response.Write("<script>alert('No Records Found')</script>");
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire( 'Failure', 'No Records Found', 'error')", true);//get alert method in js
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }
    }
}