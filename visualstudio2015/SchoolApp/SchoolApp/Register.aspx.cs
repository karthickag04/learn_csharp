using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolApp
{
    public partial class Register : System.Web.UI.Page
    {

        // Database connection
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();

        // Connection string method
        public void conStr()
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SchoolAppConnection"].ConnectionString;
        }

        private void LoadMenu()
        {
            try
            {
                conStr();
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "SELECT menu_id, menuname FROM menus ORDER BY menuname ASC";

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptMenu.DataSource = dt;
                rptMenu.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Database Error: " + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMenu();
            }

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // Password match validation
            if (password != confirmPassword)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return;
            }


            try
            {
                conStr();  // Call the connection string method
                con.Open(); // Open database connection

                // Check if the username or email already exists
                cmd.Connection = con;
                //cmd.CommandText = "SELECT COUNT(1) FROM tbl_login WHERE username=@uname OR email=@uemail";
                cmd.CommandText = "SELECT COUNT(1) FROM tbl_users WHERE username=@uname OR email=@uemail";

                cmd.Parameters.Clear();  // Clear previous parameters
                cmd.Parameters.AddWithValue("@uname", username);
                cmd.Parameters.AddWithValue("@uemail", email);

                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count > 0)
                {
                    Response.Write("<script>alert('Username or Email already exists!');</script>");
                    return;
                }

                // Insert new user into the database
                cmd.CommandText = "INSERT INTO tbl_users (username, email, password) VALUES (@uname, @uemail, @pass)";

                //cmd.CommandText = "INSERT INTO tbl_login (username, email, password) VALUES (@uname, @uemail, @pass)";
                cmd.Parameters.Clear(); // Clear parameters before inserting new values
                cmd.Parameters.AddWithValue("@uname", username);
                cmd.Parameters.AddWithValue("@uemail", email);
                cmd.Parameters.AddWithValue("@pass", password);  // Use hashing in real applications

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Write("<script>alert('Registration Successful! Redirecting to Home Page...');</script>");
                    Response.Redirect("Login.aspx"); // Redirect after successful registration
                }
                else
                {
                    Response.Write("<script>alert('Error in registration. Try again.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Database Error: " + ex.Message + "');</script>");
            }
            finally
            {
                con.Close(); // Close database connection
            }

            
        }
    }
}