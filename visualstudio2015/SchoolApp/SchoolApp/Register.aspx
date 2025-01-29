<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolApp.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h2 class="text-center">Register</h2>
            <div class="panel panel-default">
                <div class="panel-body">
                    
                    <div class="form-group">
                        <label for="txtUsername">Username:</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtEmail">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter Email"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtPassword">Password:</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtConfirmPassword">Confirm Password:</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Re-enter Password"></asp:TextBox>
                    </div>
                    <!-- Display Menus in a Table -->
                        <div class="form-group">
                            <h4>Available Menus</h4>
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Menu ID</th>
                                        <th>Menu Name</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptMenu" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("menu_id") %></td>
                                                <td><%# Eval("menuname") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>

                    <!-- Register Button as LinkButton -->
                    <div class="form-group text-center">
                        <asp:LinkButton ID="btnRegister" runat="server" CssClass="btn btn-success btn-lg" OnClick="btnRegister_Click" >
                            Register
                        </asp:LinkButton>
                    </div>

                    <div class="text-center">
                        <a href="Login.aspx">Already have an account? Login</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
