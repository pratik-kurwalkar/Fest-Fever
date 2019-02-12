using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            NameLabel.Text = "Logged in as : " + Session["username"].ToString() + " (admin)";
        }
        catch (NullReferenceException)
        {
            Response.Redirect("ErrorPage.aspx");
        }
    }
    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("login/login_admin.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("AddEvent.aspx");
    }
    protected void DashButton_Click(object sender, EventArgs e)
    {

        Response.Redirect("dashbords/admin_dash.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
    protected void addEvent_Click(object sender, EventArgs e)
    {

        try
        {
           

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Events values (@id, @name, @co, @fac, @des, @start, @end)", con);
            SqlCommand ids = new SqlCommand("select top 1 Id from Events order by Id desc", con);
            SqlDataReader reader = ids.ExecuteReader();
            while (reader.Read())
            {
                int myint = Int32.Parse(reader["Id"].ToString())+1;
                forId.Text = myint.ToString();
                
            }
            reader.Close();

            cmd.Parameters.AddWithValue("id", forId.Text);
            cmd.Parameters.AddWithValue("name", e_name.Text);
            cmd.Parameters.AddWithValue("co", e_co.Text);
            cmd.Parameters.AddWithValue("fac", e_fac.Text);
            cmd.Parameters.AddWithValue("des", e_desciption.Text);
            cmd.Parameters.AddWithValue("start", e_start.SelectedDate);
            cmd.Parameters.AddWithValue("end", e_end.SelectedDate);
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        }
        catch (SqlException exp)
        {
           Response.Write(exp);
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showErrorModal();", true);
        }
    }
}