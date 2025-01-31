using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace SchoolApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('Username and Password cannot be empty!');</script>");
                return;
            }

            // Connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["SchoolAppConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                //string query = "SELECT username FROM tbl_users WHERE username = @username AND password = @password";

                string query = LoadSqlQuery("LoginQuery");
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);

                    con.Open();
                    object result = cmd.ExecuteScalar();

                    if (result != null) // Successful login
                    {
                        Session["Username"] = username;
                        Response.Redirect("Homepage.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Username or Password!');</script>");
                    }
                }
            }
        }



        // Method to load SQL query from XML file
        private string LoadSqlQuery(string queryId)
        {
            string filePath = Server.MapPath("~/App_Data/SqlQueries.xml");

            if (File.Exists(filePath))
            {
                XDocument xmlDoc = XDocument.Load(filePath);
                XElement queryElement = xmlDoc.Descendants("query")
                                             .FirstOrDefault(q => q.Attribute("id")?.Value == queryId);

                if (queryElement != null)
                {
                    return queryElement.Value;
                }
            }

            return null; // Return null if query is not found
        }
    }
}