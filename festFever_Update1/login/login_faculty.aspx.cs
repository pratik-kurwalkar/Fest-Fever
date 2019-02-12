using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class login_login_faculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Faculty where Email=@email and Password=@password", con);
        cmd.Parameters.AddWithValue("email", TextBox1.Text);
        cmd.Parameters.AddWithValue("password", TextBox2.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (dt.Rows.Count > 0)
        {
            con.Open();
            SqlCommand cmdOne = new SqlCommand("select Name,ID from Faculty where Email=@email", con);
            cmdOne.Parameters.AddWithValue("email", TextBox1.Text);

            cmdOne.CommandType = CommandType.Text;
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Session["facname"] = dr["Name"].ToString();
                Session["id"] = dr["ID"].ToString();
            }
            Session["email"] = TextBox1.Text;
            Response.Redirect("../dashbords/faculty_dash.aspx");
            Session.RemoveAll();
        }
        else
        {
            //Label1.Text = "You're username and word is incorrect";
            //Label1.ForeColor = System.Drawing.Color.Red;
            //Response.Write("Wrong Username/Password!");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        }
    }
    protected void ButtonBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("login_faculty.aspx");
    }
    protected void ButtonHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}