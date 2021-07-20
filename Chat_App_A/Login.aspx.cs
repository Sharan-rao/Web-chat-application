using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        mydb db = new mydb();
        SqlDataReader dr;


        // This object is used to chk wheather data is present or not
        string st = "Select  * from tblUsers where EmailId='" + txtEmailId.Text + "' and Password='" + EncCS.Encrypt(txtPassword.Text) + "'";
        dr = db.readall(st); // To Read Data 
        if (dr.Read())
        {
            // Session is used for passing value from one page to another 
            // 
            Session["UserId"] = dr["UserId"].ToString();
            Session["FullName"] = dr["FullName"].ToString();

            Response.Redirect("/ChatMenu.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "<script>alert('EmailId or Password')</script>", false);
        }
    }
}