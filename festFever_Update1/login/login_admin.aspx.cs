using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class login_login_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Admin where Username=@username and Password=@password", con);
        cmd.Parameters.AddWithValue("username", TextBox1.Text);
        cmd.Parameters.AddWithValue("password", TextBox2.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (dt.Rows.Count > 0)
        {
            con.Open();
            SqlCommand cmdOne = new SqlCommand("select Username,Password from Admin where Username=@username", con);
            cmdOne.Parameters.AddWithValue("username", TextBox1.Text);

            cmdOne.CommandType = CommandType.Text;
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Session["username"] = dr["Username"].ToString();
            }
            Session["username"] = TextBox1.Text;
            Response.Redirect("../dashbords/admin_dash.aspx");
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
        Response.Redirect("login_admin.aspx");
    }
    protected void ButtonHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}