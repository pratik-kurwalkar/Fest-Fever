using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class registration_reg_student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            con.Open();

            SqlCommand verify = new SqlCommand("select * from Verification where Id='" + TextBox6.Text + "'", con);
            SqlDataReader dr = verify.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Close();
                SqlCommand cmd = new SqlCommand("insert into Students values (@enrollment, @name, @email, @mobile, @class, @branch, @coordinator, @password)", con);
                string coordinate = CheckBox1.Checked ? "Y" : "N";
                cmd.Parameters.AddWithValue("enrollment", TextBox6.Text);
                cmd.Parameters.AddWithValue("name", TextBox1.Text);
                cmd.Parameters.AddWithValue("email", TextBox2.Text);
                cmd.Parameters.AddWithValue("mobile", TextBox3.Text);
                cmd.Parameters.AddWithValue("class", DropDownList2.Text);
                cmd.Parameters.AddWithValue("branch", DropDownList1.Text);
                cmd.Parameters.AddWithValue("coordinator", coordinate);
                cmd.Parameters.AddWithValue("password", TextBox4.Text);

                SqlCommand check = new SqlCommand("SELECT * FROM Students WHERE Enrollment='" + TextBox6.Text + "'", con);
                SqlDataReader reader = check.ExecuteReader();
                if (reader.HasRows)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showExistModal();", true);
                }
                else
                {
                    reader.Close();
                    cmd.ExecuteNonQuery();

                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    //TextBox2.Focus();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
                }

            }
            else {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showVerifyModal();", true);
            }

    


        }
        catch (SqlException)
        {
            //Response.Write(exp);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showErrorModal();", true);
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("../login/login_student.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Default.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("reg_student.aspx");
    }

}
