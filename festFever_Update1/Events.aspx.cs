using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Events : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        con.Open();
        try
        {
            NameLabel.Text = "Logged in as : " + Session["name"].ToString();
            LoginButton.Visible = false;
            LogoutButton.Visible = true;
            DashButton.Visible = true;
        }
        catch (Exception) {

        }

        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            con.Open();

            SqlCommand verify = new SqlCommand("select * from Registered where EventID='"+Int32.Parse(myLab.Text)+"' and StudentName='"+Session["name"].ToString()+"'", con);
            SqlDataReader dr = verify.ExecuteReader();
            if (!dr.HasRows)
            {
                dr.Close();
                SqlCommand cmd = new SqlCommand("insert into Registered values (@id, @name, @branch, @class)", con);
                cmd.Parameters.AddWithValue("id", Int32.Parse(myLab.Text));
                cmd.Parameters.AddWithValue("name", Session["name"].ToString());
                cmd.Parameters.AddWithValue("branch", Session["branch"].ToString());
                cmd.Parameters.AddWithValue("class", Session["class"].ToString());
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
            }
            else {
                dr.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alreadyModal();", true);
            }
        }
        catch (NullReferenceException)
        {
            Response.Redirect("login/login_student.aspx");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        GridViewRow rows = GridView1.SelectedRow;
        myLabel.Visible = true;
        myLab.Text = rows.Cells[0].Text;

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("login/login_student.aspx");
    }
    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Events.aspx");
    }
    protected void ButtonBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Events.aspx");
    }
    protected void ButtonHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void dashButton_Click(object sender, EventArgs e)
    {
        if (Session["coord"].ToString().Trim().Equals("Y"))
        {
            Response.Redirect("dashbords/coordinator_dash.aspx");
        }
        else
        {
            Response.Redirect("dashbords/student_dash.aspx");
        }
    }
}