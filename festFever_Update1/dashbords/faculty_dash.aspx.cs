using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class dashbords_faculty_dash : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            NameLabel.Text = "Logged in as : " + Session["facname"].ToString();

            coordData.SelectParameters["myname"].DefaultValue = Session["facname"].ToString();
            coordData.DataBind();
            if (GridView2.Rows.Count == 0)
            {
                colabel.Visible = true;
                buttondel.Visible = false;
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Events where EventFaculty = @coname  ", con);
                cmd.Parameters.AddWithValue("coname", Session["facname"].ToString());
                SqlDataReader reader = cmd.ExecuteReader();
                if (!reader.HasRows)
                {
                    colabel.Text = "<h2 class='text-center text-danger'>Not arranging any event!</h2>";
                    colabel.Visible = true;
                    buttondel.Visible = false;
                }
                while (reader.Read())
                {
                    e_id.Visible = true;
                    e_id_acutual.Text = reader["Id"].ToString();
                    e_name.Visible = true;
                    e_name_acutual.Text = reader["EventName"].ToString();
                    e_fac.Visible = true;
                    e_fac_acutual.Text = reader["EventCoordinator"].ToString();
                    e_start.Visible = true;
                    e_start_acutual.Text = reader["EventStart"].ToString();
                    e_end.Visible = true;
                    e_end_acutual.Text = reader["EventEnd"].ToString();
                    e_reg.Visible = true;
                }
            }

        }
        catch (NullReferenceException)
        {
            Response.Redirect("../ErrorPage.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("../Default.aspx");
    }
    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("../login/login_faculty.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        GridViewRow rows = GridView2.SelectedRow;
        myLabel.Visible = true;
        myLab.Text = rows.Cells[0].Text;
    }

    protected void Del_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
        {
            con.Open();
            SqlCommand del = new SqlCommand("delete Registered where EventID=@i and StudentName=@stuname", con);
            del.Parameters.AddWithValue("i", Int32.Parse(e_id_acutual.Text));
            del.Parameters.AddWithValue("stuname",myLab.Text);
            del.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "delModal();", true);

        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Default.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("faculty_dash.aspx");
    }
}