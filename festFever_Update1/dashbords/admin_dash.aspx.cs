using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashbords_admin_dash : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            NameLabel.Text = "Logged in as : " + Session["username"].ToString() +" (admin)";
        }
        catch (NullReferenceException)
        {
            Response.Redirect("../ErrorPage.aspx");
        }
    }
    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("../login/login_admin.aspx");
    }

    protected void addButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("../AddEvent.aspx");
    }

}