<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="Tutor_Management_System.admin.Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Admin Login</title>
    <link href="~/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link  href="~/dist/sweetalert2.min.css"  rel="stylesheet"/>
    <link  href="~/Script/Style.css" rel="stylesheet"/>
    <script src="../dist/sweetalert2.min.js"></script>
</head>
<body>
    <br />
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
               
                <div class="col-md-4 mx-auto" id="boxShadow">
                    <br />

                    <div class="jumbotron text-center text-white bg-primary">
                        
                        <h2>Admin Login</h2>
                    </div>

                    <asp:TextBox ID="UserNameTxt" runat="server" placeholder="Enter UserName" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="UserNameTxt" ForeColor="Red" SetFocusOnError="true" display="Dynamic" 
                        ID="RequiredFieldValidator1" runat="server" ErrorMessage="UserName is Required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="PasswordTxt" TextMode="Password" runat="server" placeholder="Enter Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="PasswordTxt" ForeColor="Red" SetFocusOnError="true" display="Dynamic" 
                        ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="LoginBtn" runat="server" Text="Login"  CssClass="btn btn-primary btn-block" OnClick="LoginBtn_Click"/>
                    <br />

                </div>
               


            </div>

        </div>
    </form>
    <script src="../assets/vendor/jquery/jquery.min.css"></script>
    <script src="../assets/vendor/bootstrap/bootstrap.min.css"></script>
</body>
</html>
