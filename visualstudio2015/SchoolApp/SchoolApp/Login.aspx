<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SchoolApp.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Login Form -->
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <h2 class="text-center">Login</h2>
            <div class="panel panel-default">
                <div class="panel-body">
                    
                    <div class="form-group">
                        <label for="txtUsername">Username:</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtPassword">Password:</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                    </div>

                    <!-- Login Button as LinkButton -->
                    <div class="form-group text-center">
                        <asp:LinkButton ID="btnLogin" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnLogin_Click" >
                            Login
                        </asp:LinkButton>
                    </div>

                    <div class="text-center">
                        <a href="Register.aspx">Don't have an account? Register</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
