using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolApp
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        // Database objects
        SqlConnection con;
        SqlCommand cmd;

        // Simple MenuItem model
        public class MenuItem
        {
            public int MenuId { get; set; }
            public string MenuName { get; set; }
            public List<MenuItem> SubMenus { get; set; } = new List<MenuItem>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMenu();
            }
        }

        // Loads parent menus and binds the repeater
        private void LoadMenu()
        {
            try
            {
                // Initialize connection using the connection string from web.config.
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolAppConnection"].ConnectionString);
                con.Open();

                // Retrieve parent menus (where parent_id is null)
                string sqlParent = "SELECT menu_id, menuname FROM menus1 WHERE parent_id IS NULL ORDER BY menuname ASC";
                cmd = new SqlCommand(sqlParent, con);

                DataTable dtParent = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dtParent);
                }

                // Build a list of parent menu objects
                List<MenuItem> menuList = new List<MenuItem>();
                foreach (DataRow row in dtParent.Rows)
                {
                    int parentId = Convert.ToInt32(row["menu_id"]);
                    string parentName = row["menuname"].ToString();

                    MenuItem parentMenu = new MenuItem
                    {
                        MenuId = parentId,
                        MenuName = parentName,
                        // Fetch child menus for each parent menu
                        SubMenus = GetSubMenus(parentId)
                    };

                    menuList.Add(parentMenu);
                }

                // Bind the list to the outer repeater
                rptMenu.DataSource = menuList;
                rptMenu.DataBind();
            }
            catch (Exception ex)
            {
                // Display error message
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
            finally
            {
                if (con != null) con.Close();
            }
        }

        // Returns child menu items for a given parent menu
        private List<MenuItem> GetSubMenus(int parentId)
        {
            List<MenuItem> subMenuList = new List<MenuItem>();

            try
            {
                string sqlChild = "SELECT menu_id, menuname FROM menus1 WHERE parent_id = @ParentId ORDER BY menuname ASC";
                using (SqlCommand subCmd = new SqlCommand(sqlChild, con))
                {
                    subCmd.Parameters.AddWithValue("@ParentId", parentId);

                    DataTable dtChild = new DataTable();
                    using (SqlDataAdapter da = new SqlDataAdapter(subCmd))
                    {
                        da.Fill(dtChild);
                    }

                    foreach (DataRow row in dtChild.Rows)
                    {
                        subMenuList.Add(new MenuItem
                        {
                            MenuId = Convert.ToInt32(row["menu_id"]),
                            MenuName = row["menuname"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                // Display error message for child menu retrieval issues
                Response.Write("<script>alert('Child Menu Error: " + ex.Message + "');</script>");
            }

            return subMenuList;
        }

        // This event binds the inner (child) repeater for each parent menu item.
        protected void rptMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Cast the current data item to your MenuItem model
                MenuItem parentMenu = (MenuItem)e.Item.DataItem;
                // Find the inner repeater for submenus
                Repeater rptSubMenu = (Repeater)e.Item.FindControl("rptSubMenu");
                // Bind the child menu list to the inner repeater
                rptSubMenu.DataSource = parentMenu.SubMenus;
                rptSubMenu.DataBind();
            }
        }

        // Button event to go to Login page
        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        // Button event to go to Register page
        protected void lnkRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}
