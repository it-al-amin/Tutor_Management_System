﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tutor_Management_System.admin
{
    public partial class Admin_Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"]==null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            else
            {
                Response.Redirect("View_Contact.aspx");
            }
           
        }
    }
}