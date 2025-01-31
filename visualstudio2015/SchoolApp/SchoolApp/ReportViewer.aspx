<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportViewer.aspx.cs" Inherits="SchoolApp.ReportViewer" %>


<%@ Register Assembly="Microsoft.ReportViewer.WebForms" 
     Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>SSRS Report Viewer</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" 
            Width="100%" Height="600px" ProcessingMode="Remote">
        </rsweb:ReportViewer>
    </form>
</body>
</html>
