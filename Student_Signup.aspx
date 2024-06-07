<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Student_Signup.aspx.cs" Inherits="Tutor_Management_System.Student_Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Script/Style.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
  
    <div class="container" id="boxShadow">
        <br />
        <div class="row">
            <div class="col-md-12">

            <h1 class="jumbotron bg-primary text-white text-center">Student SignUp</h1>
                 
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:TextBox ID="NameTextBox" CssClass="form-control" placeholder="Enter Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="NameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required"></asp:RequiredFieldValidator> 
                <br />

                <asp:TextBox ID="FatherNameTextBox" CssClass="form-control" placeholder="Enter Father Name" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ControlToValidate="FatherNameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="FatherName is Required"></asp:RequiredFieldValidator> 
                <br />

                <asp:TextBox ID="SurnameTextBox" CssClass="form-control" placeholder="Enter Surname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="SurNameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="SurName is Required"></asp:RequiredFieldValidator> 
                <br />
                <asp:DropDownList ID="GenderDropDownList" CssClass="form-control"  runat="server">
                    <asp:ListItem>Select-Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Famale</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="Select-Gender" ControlToValidate="GenderDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="Gender is Required"></asp:RequiredFieldValidator> 
                <br />


                <asp:TextBox ID="AgeTextBox" CssClass="form-control" placeholder="Enter Age" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="AgeTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator5" runat="server" ErrorMessage="Age is Required"></asp:RequiredFieldValidator>

                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age should be within 5 to 30" 
                    ControlToValidate="AgeTextBox" Display="Dynamic" ForeColor="#FF0000" MaximumValue="30" MinimumValue="5" SetFocusOnError="True" 
                    Type="Integer"></asp:RangeValidator>
                <br />

                <%--<asp:DropDownList ID="CountryDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>--%>
                <asp:DropDownList ID="CountryDropDownList" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged">
                </asp:DropDownList>

                <asp:RequiredFieldValidator InitialValue="Select-Country" ControlToValidate="CountryDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator6" runat="server" ErrorMessage="Country is Required"></asp:RequiredFieldValidator> 
              <%--  <asp:TextBox ID="CountryTextBox" CssClass="form-control" placeholder="Enter Country" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="CountryTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator6" runat="server" ErrorMessage="Country is Required"></asp:RequiredFieldValidator> --%>
                <br />


            </div>
            <div class="col-md-4">
                 <asp:DropDownList ID="CityDropDownList" CssClass="form-control"  runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="Select-City" ControlToValidate="CityDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator7" runat="server" ErrorMessage="City is Required"></asp:RequiredFieldValidator> 
                <%--<asp:TextBox ID="CityTextBox" CssClass="form-control" placeholder="Enter City" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="CityTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator7" runat="server" ErrorMessage="City is Required"></asp:RequiredFieldValidator> --%>
                <br />

                <asp:TextBox ID="AddressTextBox" TextMode="MultiLine" Rows="4" Columns="20" CssClass="form-control" placeholder="Enter Address" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="AddressTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator8" runat="server" ErrorMessage="Address is Required"></asp:RequiredFieldValidator> 
                <br />
                 <asp:TextBox ID="StandardTextBox"  CssClass="form-control" placeholder="Enter Standard" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="StandardTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator9" runat="server" ErrorMessage="Standard is Required"></asp:RequiredFieldValidator> 
                <br />

              
                <asp:DropDownList ID="GoingToDropDownList" CssClass="form-control"  runat="server">
                    <asp:ListItem>Select-GoingTo</asp:ListItem>
                    <asp:ListItem>Primary School</asp:ListItem>
                    <asp:ListItem>High School</asp:ListItem>
                    <asp:ListItem>College</asp:ListItem>
                    <asp:ListItem>Diploma</asp:ListItem>
                    <asp:ListItem>Madrasa</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                 <asp:RequiredFieldValidator InitialValue="Select-GoingTo" ControlToValidate="GoingToDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator10" runat="server" ErrorMessage="GoinTo is Required"></asp:RequiredFieldValidator> 
                <br />

                 <asp:TextBox ID="SubjectTextBox"  CssClass="form-control" placeholder="Enter Subject" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ControlToValidate="SubjectTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator11" runat="server" ErrorMessage="Subject is Required"></asp:RequiredFieldValidator>
                <br />



            </div>
            <div class="col-md-4">
                 <asp:TextBox ID="ContactTextBox"  CssClass="form-control" placeholder="Enter Contact Number" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ControlToValidate="ContactTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator12" runat="server" ErrorMessage="Contact is Required"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="TuitionTypeDropDownList" CssClass="form-control"  runat="server">
                    <asp:ListItem>Select-TuitionType</asp:ListItem>
                    <asp:ListItem>Online</asp:ListItem>
                    <asp:ListItem>Physical</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="Select-TuitionType" ControlToValidate="TuitionTypeDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator13" runat="server" ErrorMessage="TuitionType is Required"></asp:RequiredFieldValidator> 
                <br />

                <asp:DropDownList ID="TutorPreferredDropDownList" CssClass="form-control"  runat="server">
                    <asp:ListItem>Select-TutorPreferred</asp:ListItem>
                    <asp:ListItem>Under Graduate</asp:ListItem>
                    <asp:ListItem>Graduate</asp:ListItem>
                    <asp:ListItem>Masters</asp:ListItem>
                     <asp:ListItem>PHD</asp:ListItem>
                     <asp:ListItem>Other</asp:ListItem>
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator InitialValue="Select-TutorPreferred" ControlToValidate="TutorPreferredDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator14" runat="server" ErrorMessage="TutorPreferred is Required"></asp:RequiredFieldValidator> 
                <br />

                
                 <asp:TextBox ID="UsernameTextBox"  CssClass="form-control" placeholder="Enter Username" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="UsernameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator15" runat="server" ErrorMessage="Username is Required"></asp:RequiredFieldValidator>
                <br />
                
                 <asp:TextBox ID="PasswordTextBox" TextMode="Password"  CssClass="form-control" placeholder="Enter Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="PasswordTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator16" runat="server" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator  ControlToValidate="PasswordTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter Strong Password"
                    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"></asp:RegularExpressionValidator>

                <br />
                
                 <asp:TextBox ID="ConfirmPasswordTextBox" TextMode="Password"  CssClass="form-control" placeholder="Re-Enter Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="ConfirmPasswordTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator17" runat="server" ErrorMessage="ConfirmPassword is Required"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="ConfirmPasswordTextBox" ControlToCompare="PasswordTextBox" SetFocusOnError="true"
                    ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Both Password must be Identical"></asp:CompareValidator>
                <br />

            </div>

        </div>

        <br />
        <div class="row">
            <div class="col-md-6 mx-auto">
                <asp:Button ID="StudentSignUpButton" runat="server" Text="SignUp" CssClass="btn btn-primary btn-block" OnClick="StudentSignUpButton_Click" />
              
            </div>
          
        </div>
        <br />
        <div class="row">
           <div class="col-md-6 mx-auto text-center">
               <a href="Student_Signup.aspx" class="btn btn-success">SignUp As Student</a>
               <a href="Tutor_Signup.aspx" class="btn btn-info">SignUp As Tutor</a>

        </div>
        </div>
        <br />

    </div>


    <br />



</asp:Content>
