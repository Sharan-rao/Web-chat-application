using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChatMenu : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("/Login.aspx");
        }

        if (!IsPostBack)
        {
            st = "Select * from tblUsers where UserId!=" + Session["UserId"] + "";
            // To bind the values from database to repeater control
            db.fill_rptr_ret_sqlda(st, rpt1); 
        }
    }
}