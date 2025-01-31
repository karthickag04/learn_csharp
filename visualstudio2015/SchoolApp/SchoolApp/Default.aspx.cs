using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolApp
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCountries();
            }
        }

        private void LoadCountries()
        {
            string query = "SELECT id, name FROM countries";
            ddlCountries.DataSource = GetData(query);
            ddlCountries.DataTextField = "name";
            ddlCountries.DataValueField = "id";
            ddlCountries.DataBind();
            ddlCountries.Items.Insert(0, new ListItem("Select Country", ""));
        }

        [WebMethod]
        public static List<ListItem> GetStates(int countryId)
        {
            string query = "SELECT id, name FROM states WHERE country_id = @countryId";
            return GetDropdownData(query, countryId);
        }

        [WebMethod]
        public static List<ListItem> GetCities(int stateId)
        {
            string query = "SELECT id, name FROM cities WHERE state_id = @stateId";
            return GetDropdownData(query, stateId);
        }

        private static List<ListItem> GetDropdownData(string query, int id)
        {
            List<ListItem> items = new List<ListItem>();
            string connectionString = ConfigurationManager.ConnectionStrings["SchoolAppConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@countryId", id);
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            items.Add(new ListItem
                            {
                                Value = reader["id"].ToString(),
                                Text = reader["name"].ToString()
                            });
                        }
                    }
                }
            }
            return items;
        }

        private DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["SchoolAppConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        dt.Load(reader);
                    }
                }
            }
            return dt;
        }
    }
}
