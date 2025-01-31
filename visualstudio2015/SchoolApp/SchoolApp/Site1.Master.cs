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

        //private void LoadMenu()
        //{
        //    try
        //    {
        //        conStr();
        //        con.Open();
        //        cmd.Connection = con;
        //        cmd.CommandText = "SELECT menu_id, menuname FROM menus ORDER BY menuname ASC";

        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);

        //        rptMenu.DataSource = dt;
        //        rptMenu.DataBind();
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('Database Error: " + ex.Message + "');</script>");
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //}

        private void LoadMenu()
        {
            try
            {
                conStr();
                con.Open();
                cmd.Connection = con;

                // Fetch Parent Menus (menus without parent_id)
                cmd.CommandText = "SELECT menu_id, menuname FROM menus1 WHERE parent_id IS NULL ORDER BY menuname ASC";
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dtParent = new DataTable();
                da.Fill(dtParent);

                List<MenuItem> menuList = new List<MenuItem>();

                foreach (DataRow row in dtParent.Rows)
                {
                    MenuItem parentMenu = new MenuItem
                    {
                        MenuId = Convert.ToInt32(row["menu_id"]),
                        MenuName = row["menuname"].ToString(),
                        SubMenus = GetSubMenus(Convert.ToInt32(row["menu_id"])) // Fetch Submenus
                    };
                    menuList.Add(parentMenu);
                }

                rptMenu.DataSource = menuList;
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


        // Method to Fetch Child Menus
        private List<MenuItem> GetSubMenus(int parentId)
        {
            List<MenuItem> subMenuList = new List<MenuItem>();

            try
            {
                SqlCommand subCmd = new SqlCommand("SELECT menu_id, menuname FROM menus1 WHERE parent_id = @ParentId ORDER BY menuname ASC", con);
                subCmd.Parameters.AddWithValue("@ParentId", parentId);

                SqlDataAdapter da = new SqlDataAdapter(subCmd);
                DataTable dtChild = new DataTable();
                da.Fill(dtChild);

                foreach (DataRow row in dtChild.Rows)
                {
                    subMenuList.Add(new MenuItem
                    {
                        MenuId = Convert.ToInt32(row["menu_id"]),
                        MenuName = row["menuname"].ToString()
                    });
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Database Error: " + ex.Message + "');</script>");
            }

            return subMenuList;
        }


        public class MenuItem
        {
            public int MenuId { get; set; }
            public string MenuName { get; set; }
            public List<MenuItem> SubMenus { get; set; } = new List<MenuItem>();
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