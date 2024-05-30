<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Student_Signup.aspx.cs" Inherits="Tutor_Management_System.Student_Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <div class="container">

        <div class="row">
            <div class="col-md-12">

            <h1 class="jumbotron bg-primary text-white text-center">Student SignUp</h1>
                 
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:TextBox ID="NameTextBox" CssClass="form-control" placeholder="Enter Name" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="FatherNameTextBox" CssClass="form-control" placeholder="Enter Father Name" runat="server"></asp:TextBox><br />

                <asp:TextBox ID="SurnameTextBox" CssClass="form-control" placeholder="Enter Surname" runat="server"></asp:TextBox><br />
                <asp:DropDownList ID="GenderDropDownList" CssClass="form-control"  runat="server">
                    <asp:ListItem>Select-Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Famale</asp:ListItem>
                </asp:DropDownList><br />


                <asp:TextBox ID="AgeTextBox" CssClass="form-control" placeholder="Enter Age" runat="server"></asp:TextBox><br />

                <asp:TextBox ID="CountryTextBox" CssClass="form-control" placeholder="Enter Country" runat="server"></asp:TextBox><br />


            </div>
            <div class="col-md-4">
                <asp:TextBox ID="CityTextBox" CssClass="form-control" placeholder="Enter City" runat="server"></asp:TextBox><br />

                <asp:TextBox ID="AddressTextBox" TextMode="MultiLine" Rows="4" Columns="20" CssClass="form-control" placeholder="Enter Address" runat="server"></asp:TextBox><br />
                 <asp:TextBox ID="StandardTextBox"  CssClass="form-control" placeholder="Enter Standard" runat="server"></asp:TextBox><br />

              
                <asp:DropDownList ID="GoingToDropDownList" CssClass="form-control"  runat="server">
                    <asp:ListItem>Select-GoingTo</asp:ListItem>
                    <asp:ListItem>Primary School</asp:ListItem>
                    <asp:ListItem>High School</asp:ListItem>
                    <asp:ListItem>College</asp:ListItem>
                    <asp:ListItem>Diploma</asp:ListItem>
                    <asp:ListItem>Madrasa</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList><br />

                 <asp:TextBox ID="SubjectTextBox"  CssClass="form-control" placeholder="Enter Subject" runat="server"></asp:TextBox><br />



            </div>
            <div class="col-md-4">
                 <asp:TextBox ID="ContactTextBox"  CssClass="form-control" placeholder="Enter Contact Number" runat="server"></asp:TextBox><br />
                <asp:DropDownList ID="TuitionTypeDropDownList" CssClass="form-control"  runat="server">
                    <asp:ListItem>Select-TuitionType</asp:ListItem>
                    <asp:ListItem>Online</asp:ListItem>
                    <asp:ListItem>Physical</asp:ListItem>
                </asp:DropDownList><br />

                <asp:DropDownList ID="TutorPreferredDropDownList" CssClass="form-control"  runat="server">
                    <asp:ListItem>Select-TutorPreferred</asp:ListItem>
                    <asp:ListItem>Under Graduate</asp:ListItem>
                    <asp:ListItem>Graduate</asp:ListItem>
                    <asp:ListItem>Masters</asp:ListItem>
                     <asp:ListItem>PHD</asp:ListItem>
                     <asp:ListItem>Other</asp:ListItem>
                 </asp:DropDownList><br />

                
                 <asp:TextBox ID="UsernameTextBox"  CssClass="form-control" placeholder="Enter Username" runat="server"></asp:TextBox><br />
                
                 <asp:TextBox ID="PasswordTextBox"  CssClass="form-control" placeholder="Enter Password" runat="server"></asp:TextBox><br />
                
                 <asp:TextBox ID="ConfirmPasswordTextBox"  CssClass="form-control" placeholder="Re-Enter Password" runat="server"></asp:TextBox><br />

            </div>
        </div>

    </div>


    <br />



</asp:Content>
