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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        // Database connection
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();

        // Connection string method
        public void conStr()
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SchoolAppConnection"].ConnectionString;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMenu();
            }
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


        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");

        }

        protected void lnkRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}