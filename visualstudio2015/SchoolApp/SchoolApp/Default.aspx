<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SchoolApp.Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cascading Dropdowns in ASP.NET</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // On Country Change
            $("#<%= ddlCountries.ClientID %>").change(function () {
                var countryId = $(this).val();
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/GetStates",
                    data: JSON.stringify({ countryId: countryId }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var states = response.d;
                        $("#<%= ddlStates.ClientID %>").empty().append('<option value="">Select State</option>');
                        $.each(states, function (index, item) {
                            $("#<%= ddlStates.ClientID %>").append('<option value="' + item.Value + '">' + item.Text + '</option>');
                        });
                    }
                });
            });

            // On State Change
            $("#<%= ddlStates.ClientID %>").change(function () {
                var stateId = $(this).val();
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/GetCities",
                    data: JSON.stringify({ stateId: stateId }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var cities = response.d;
                        $("#<%= ddlCities.ClientID %>").empty().append('<option value="">Select City</option>');
                        $.each(cities, function (index, item) {
                            $("#<%= ddlCities.ClientID %>").append('<option value="' + item.Value + '">' + item.Text + '</option>');
                        });
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Cascading Dropdowns</h2>

            <!-- Country Dropdown -->
            <div class="form-group">
                <label>Country:</label>
                <asp:DropDownList ID="ddlCountries" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
            </div>

            <!-- State Dropdown -->
            <div class="form-group">
                <label>State:</label>
                <asp:DropDownList ID="ddlStates" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>

            <!-- City Dropdown -->
            <div class="form-group">
                <label>City:</label>
                <asp:DropDownList ID="ddlCities" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
    </form>
</body>
</html>
