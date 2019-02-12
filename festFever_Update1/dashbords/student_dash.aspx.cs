using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class dashbords_student_dash : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            NameLabel.Text = "Logged in as : " + Session["name"].ToString();
            studentData.SelectParameters["myname"].DefaultValue = Session["name"].ToString();
            studentData.DataBind();
            if (GridView1.Rows.Count == 0)
            {
                noLab.Visible = true;
                buttondel.Visible = false;
            }         
        }
        catch (NullReferenceException)
        {
            Response.Redirect("../ErrorPage.aspx");
        }
    }
 
    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("../login/login_student.aspx");
    }
    


    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Events.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Default.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("student_dash.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        GridViewRow rows = GridView1.SelectedRow;
        myLabel.Visible = true;
        myLab.Text = rows.Cells[0].Text;

    }

    protected void Del_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
        {
            con.Open();
            SqlCommand del = new SqlCommand("delete Registered where EventID=@i and StudentName=@stuname", con);
            del.Parameters.AddWithValue("i",Int32.Parse(myLab.Text));
            del.Parameters.AddWithValue("stuname",Session["name"].ToString());
            del.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "delModal();", true);

        }
    }

}