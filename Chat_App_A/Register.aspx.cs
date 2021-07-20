using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        mydb db = new mydb();
        int x = 0;
        string Pass = EncCS.Encrypt(txtPassword.Text);

        // Insert Statement 
        string st = "Insert into TblUsers(FullName,Mob,EmailId,Password) ";
        st += " values ('" + txtName.Text + "','" + txtMob.Text + "','" + txtEmailId.Text + "','" + Pass + "')";
        x = db.ExeQuery(st); // For Saving Data into sql server and return type will integer
        if (x > 0)
        {
            // Redirect to login.aspx;
            Response.Redirect("/Login.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "<script>alert('Try again')</script>", false);
        }

    }
}