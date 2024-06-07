<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Student_Login.aspx.cs" Inherits="Tutor_Management_System.Student_Login" %>
 <asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Script/Style.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%= ResolveUrl("~/dist/sweetalert2.min.css") %>" rel="stylesheet" type="text/css" />
    <script src="<%= ResolveUrl("~/dist/sweetalert2.min.js") %>" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

      <div class="container">
            <div class="row">
               
                <div class="col-md-4 mx-auto" id="boxShadow">
                    <br />
                    <div class="jumbotron text-center text-white bg-primary">
                        
                        <h2>Student Login</h2>
                    </div>

                    <asp:TextBox ID="UserNameTxt" runat="server" placeholder="Enter UserName" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="UserNameTxt" ForeColor="Red" SetFocusOnError="true" display="Dynamic" 
                        ID="RequiredFieldValidator1" runat="server" ErrorMessage="UserName is Required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="PasswordTxt" TextMode="Password" runat="server" placeholder="Enter Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="PasswordTxt" ForeColor="Red" SetFocusOnError="true" display="Dynamic" 
                        ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="Student_LoginBtn" runat="server" Text="Login"  CssClass="btn btn-primary btn-block" OnClick="Student_LoginBtn_Click"  />
                      <div class="text-center">

                          <a href="Tutor_Login.aspx" class="text-center">LogIn As Tutor</a>
                      </div>     
                 
                    <br />
                </div>
               


            </div>

     <%--       <br />
        <div class="row">
           <div class="col-md-4 mx-auto text-center">
                    <a href="tutor/Tutor_Login.aspx" class="btn btn-success">Sign In As Tutor</a>
                    <a href="student/Student_Login.aspx" class="btn btn-info">Sign In As Student</a>
                     <a href="admin/Admin_Login.aspx" class="btn btn-info">Sign In As Admin</a>
               
        </div>
        </div>

        <br />--%>
        </div>
    <br />
</asp:Content>
