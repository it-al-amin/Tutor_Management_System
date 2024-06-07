<%@ Page Title="" Language="C#" MasterPageFile="~/student/Student_Dashboard.Master" AutoEventWireup="true" CodeBehind="View_Tutors.aspx.cs" Inherits="Tutor_Management_System.student.View_Tutors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--we use repeater control to view data from database--%>
    <br />
    <div class="row">
         <div class="col-md-12">

           <h1 class="jumbotron bg-dark text-white text-center"> TUTORS DATA</h1>



        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-4">

            <div class="input-group">

                    
                   <asp:TextBox ID="SearchText" runat="server" class="form-control" type="text" placeholder="Search Tutor"></asp:TextBox>
                    <div class="input-group-append">
                        <button id="SearchBtn" runat="server" onserverclick="SearchBtn_ServerClick" class="btn btn-secondary" type="button">
                            <i class="fas fa-search"></i>

                        </button>
                  </div>
        </div>

    </div>
        </div>
        <br />
    <div class="row">

        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="col-md-4">
                    <div class="card bg-dark text-white text-center">
                        <div class="card-header">
                            <small style="font-size: 15px; color: steelblue;">Name</small><br />
                            <h3>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("tutor_name")%>'></asp:Label>
                            </h3>

                        </div>
                        <div class="card-body">

                            <h5>
                                <small style="font-size: 15px; color: steelblue;">Email</small><br />
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("email")%>'></asp:Label><br />
                                <small style="font-size: 15px; color: steelblue;">Country</small><br />
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("country")%>'></asp:Label><br />
                                <small style="font-size: 15px; color: steelblue;">City</small><br />
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("city")%>'></asp:Label><br />
                                <%-- <asp:Label ID="Label5" runat="server" Text='<%# Bind("degree")%>'></asp:Label>--%>
                                <small style="font-size: 15px; color: steelblue;">Experience</small><br />
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("experience")%>'></asp:Label><br />
                                <small style="font-size: 15px; color: steelblue;">Contact</small><br />
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("contact")%>'></asp:Label><br />
                            </h5>
                        </div>
                        <div class="card-footer">
                            <small style="font-size: 15px; color: steelblue;">Qualification</small><br />
                            <h4>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("degree")%>'></asp:Label>
                            </h4>

                        </div>
                    </div>
                    <br />

                </div>

            </ItemTemplate>

        </asp:Repeater>


    </div>

</asp:Content>
