<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="SchoolApp.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2 class="text-center">School Management Dashboard</h2>
        <hr />

        <div class="row">
            <!-- Student Management -->
            <div class="col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading text-center">Student Management</div>
                    <div class="panel-body">
                        <ul class="list-unstyled">
                            <li><a href="ManageStudents.aspx">View All Students</a></li>
                            <li><a href="AddStudent.aspx">Add New Student</a></li>
                            <li><a href="StudentAttendance.aspx">Student Attendance</a></li>
                            <li><a href="StudentPerformance.aspx">Student Performance</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Teacher Management -->
            <div class="col-md-4">
                <div class="panel panel-success">
                    <div class="panel-heading text-center">Teacher Management</div>
                    <div class="panel-body">
                        <ul class="list-unstyled">
                            <li><a href="ManageTeachers.aspx">View All Teachers</a></li>
                            <li><a href="AddTeacher.aspx">Add New Teacher</a></li>
                            <li><a href="TeacherSchedule.aspx">Teacher Schedules</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Academic Records -->
            <div class="col-md-4">
                <div class="panel panel-info">
                    <div class="panel-heading text-center">Academic Records</div>
                    <div class="panel-body">
                        <ul class="list-unstyled">
                            <li><a href="Subjects.aspx">Subjects & Syllabus</a></li>
                            <li><a href="Exams.aspx">Exam Schedules</a></li>
                            <li><a href="Results.aspx">Results & Reports</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <br />

       <%-- <div class="text-center">
            <a href="Logout.aspx" class="btn btn-danger">Logout</a>
        </div>--%>
    </div>
</asp:Content>
