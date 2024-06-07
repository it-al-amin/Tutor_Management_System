<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="View_Contact.aspx.cs" Inherits="Tutor_Management_System.admin.View_Contact" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />
    <div class="row">
        <div class="col-md-12">

           <h1 class="jumbotron bg-dark text-white text-center"> VIEW CONTACT DETAILS</h1>
        </div>

    </div>
     <br />
    <div class="row">
        <div class="col-md-4">

            <div class="input-group">

                    
                   <asp:TextBox ID="SearchText" runat="server" class="form-control" type="text" placeholder="Search Contact"></asp:TextBox>
                    <div class="input-group-append">
                        <button id="SearchBtn" runat="server" onserverClick="SearchBtn_ServerClick" class="btn btn-secondary" type="button">
                            <i class="fas fa-search"></i>

                        </button>
                  </div>
        </div>

    </div>
        </div>
        <br />

    <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-striped table-dark" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField HeaderText="ID">
              <ItemTemplate>
                
                  <asp:Label ID="LabelID" runat="server" Text='<%#Bind("id") %>'></asp:Label>

              </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="NAME">
                 <ItemTemplate>
                
                  <asp:Label ID="LabelName" runat="server" Text='<%#Bind("name") %>'></asp:Label>

              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EMAIL">
                 <ItemTemplate>
                
                  <asp:Label ID="LabelEmail" runat="server" Text='<%#Bind("email") %>'></asp:Label>

              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SUBJECT">
                 <ItemTemplate>
                
                  <asp:Label ID="LabelSubject" runat="server" Text='<%#Bind("subject") %>'></asp:Label>

              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MESSAGE">
                 <ItemTemplate>
                
                  <asp:Label ID="LabelMessage" runat="server" Text='<%#Bind("message") %>'></asp:Label>

              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
    <ItemTemplate>
        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Are you sure you want to delete this data?')" 
                        runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" 
                        CssClass="btn btn-danger text-white"></asp:LinkButton>
    </ItemTemplate>
</asp:TemplateField>
        </Columns>
      </asp:GridView>
 
</asp:Content>
