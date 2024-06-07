<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Tutor_Signup.aspx.cs" Inherits="Tutor_Management_System.Tutor_Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="<%= ResolveUrl("~/Script/Style.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <br />
  
    <div class="container" id="boxShadow">
        <br />
        <div class="row">
            <div class="col-md-12">

            <h1 class="jumbotron bg-primary text-white text-center">Tutor SignUp</h1>
                 
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:TextBox ID="NameTextBox" CssClass="form-control" placeholder="Enter Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="NameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required"></asp:RequiredFieldValidator> 
                <br />

                <asp:TextBox ID="SurnameTextBox" CssClass="form-control" placeholder="Enter Surname" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ControlToValidate="SurNameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="SurName is Required"></asp:RequiredFieldValidator> 
                <br />

                <asp:DropDownList ID="GenderDropDownList" CssClass="form-control"  runat="server">
                    <asp:ListItem>Select-Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Famale</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="Select-Gender" ControlToValidate="GenderDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="Gender is Required"></asp:RequiredFieldValidator> 
                <br />


                <asp:TextBox ID="AgeTextBox" CssClass="form-control" placeholder="Enter Age" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="AgeTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator5" runat="server" ErrorMessage="Age is Required"></asp:RequiredFieldValidator>

                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age should be within 20 to 60" 
                    ControlToValidate="AgeTextBox" Display="Dynamic" ForeColor="#FF0000" MaximumValue="60" MinimumValue="20" SetFocusOnError="True" 
                    Type="Integer"></asp:RangeValidator>
                <br />
                <asp:TextBox ID="EmailTextBox" CssClass="form-control" placeholder="Enter Email" runat="server"></asp:TextBox>
               
                     <asp:RegularExpressionValidator  ControlToValidate="EmailTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Valid Email"
                    ValidationExpression="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"></asp:RegularExpressionValidator>
                  <asp:RequiredFieldValidator ControlToValidate="EmailTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
                <br />
                 <asp:DropDownList ID="MaritalStatusDropDownList" CssClass="form-control"  runat="server">
                    <asp:ListItem>Select-Marital_Status</asp:ListItem>
                    <asp:ListItem>Single</asp:ListItem>
                    <asp:ListItem>Married</asp:ListItem>
                     <asp:ListItem>Engaged</asp:ListItem>
                      <asp:ListItem>Divorced</asp:ListItem>
                     <asp:ListItem>Separated</asp:ListItem>
                      <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="Select-Marital_Status" ControlToValidate="MaritalStatusDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator18" runat="server" ErrorMessage="Marital_Status is Required"></asp:RequiredFieldValidator> 
                <br />
             

            </div>
            <div class="col-md-4">
                   <%--<asp:DropDownList ID="CountryDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>--%>
               <asp:DropDownList ID="CountryDropDownList" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged">
                </asp:DropDownList>

                <asp:RequiredFieldValidator InitialValue="Select-Country" ControlToValidate="CountryDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator6" runat="server" ErrorMessage="Country is Required"></asp:RequiredFieldValidator> 
              <%--  <asp:TextBox ID="CountryTextBox" CssClass="form-control" placeholder="Enter Country" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="CountryTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator6" runat="server" ErrorMessage="Country is Required"></asp:RequiredFieldValidator> --%>
                <br />

                 <asp:DropDownList ID="CityDropDownList" CssClass="form-control"  runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="Select-City" ControlToValidate="CityDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator7" runat="server" ErrorMessage="City is Required"></asp:RequiredFieldValidator> 
                <%--<asp:TextBox ID="CityTextBox" CssClass="form-control" placeholder="Enter City" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="CityTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator7" runat="server" ErrorMessage="City is Required"></asp:RequiredFieldValidator> --%>
                <br />

                <asp:TextBox ID="AddressTextBox" TextMode="MultiLine" Rows="6" Columns="20" CssClass="form-control" placeholder="Enter Address" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="AddressTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator8" runat="server" ErrorMessage="Address is Required"></asp:RequiredFieldValidator> 
                <br />
                 

              
                <asp:DropDownList ID="QualificationDropDownList" CssClass="form-control"  runat="server">
                    <asp:ListItem>Select-Qualification</asp:ListItem>
                    <asp:ListItem>Under Graduate</asp:ListItem>
                    <asp:ListItem>Graduate</asp:ListItem>
                    <asp:ListItem>Masters</asp:ListItem>
                    <asp:ListItem>Mphil</asp:ListItem>
                    <asp:ListItem>PHD</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                 <asp:RequiredFieldValidator InitialValue="Select-Qualification" ControlToValidate="QualificationDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator10" runat="server" ErrorMessage="Qualification is Required"></asp:RequiredFieldValidator> 
                <br />

                 
                 

            </div>
            <div class="col-md-4">
                <asp:TextBox ID="DegreeTextBox"  CssClass="form-control" placeholder="Enter Degree" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ControlToValidate="DegreeTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator11" runat="server" ErrorMessage="Degree is Required"></asp:RequiredFieldValidator>
                <br />
                  <asp:DropDownList ID="ExperienceDropDownList" CssClass="form-control"  runat="server">
                    <asp:ListItem>Select-Experience</asp:ListItem>
                    <asp:ListItem>1 year</asp:ListItem>
                    <asp:ListItem>2 year</asp:ListItem>
                    <asp:ListItem>3 year</asp:ListItem>
                    <asp:ListItem>4 year</asp:ListItem>
                    <asp:ListItem>5+ year</asp:ListItem>
                     <asp:ListItem>10+ year</asp:ListItem>
                </asp:DropDownList>
                 <asp:RequiredFieldValidator InitialValue="Select-Experience" ControlToValidate="ExperienceDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator9" runat="server" ErrorMessage="Experience is Required"></asp:RequiredFieldValidator> 
                <br />
                 <asp:TextBox ID="ContactTextBox"  CssClass="form-control" placeholder="Enter Contact Number" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ControlToValidate="ContactTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" 
                    ID="RequiredFieldValidator12" runat="server" ErrorMessage="Contact is Required"></asp:RequiredFieldValidator>
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
                <asp:Button ID="TutorSignUpButton" runat="server" Text="SignUp" CssClass="btn btn-primary btn-block" OnClick="TutorSignUpButton_Click" />
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
