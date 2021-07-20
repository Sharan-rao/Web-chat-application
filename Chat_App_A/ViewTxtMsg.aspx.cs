using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewTxtMsg : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserId"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            st = "Select * from tblChat where ChatId=" + Request.QueryString["Id"];
            dr = db.readall(st);
            if (dr.Read())
            {
                string msg = dr["Msg"].ToString();
                lblNonEnc.Text = "<b>Non-Encrypted Msg:</b>" + EncCS.Decrypt(msg);
                lblEncMsg.Text = "<b>Encrypted Msg:</b>" + msg;
                divPanel.Visible = false;
            }
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        int Id = Convert.ToInt32(Session["UserId"]);
        if (btnSend.Text == "Get OTP")
        {
            Random rNo = new Random();
            int x = 0;
            int Rn = rNo.Next(1000, 9999);
            st = "Update tblUsers set OTP='" + Rn + "' where UserId=" + Id;
            x = db.ExeQuery(st);
            if (x > 0)
            {
                st = "Select * from tblUsers where UserId=" + Id;
                dr = db.readall(st);
                if (dr.Read())
                {
                    string Body = "<b>OTP Details:</b> " + Rn;
                    EmailClass.SendEmailId(dr["EmailId"].ToString(), "OTP Details", Body);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "<script>alert('OTP has to email-id')</script>", false);
                    btnSend.Text = "Submit";
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "<script>alert('Try Again')</script>", false);
            }
        }
        else
        {
            st = "Select * from tblUsers where UserId=" + Id + " and OTP='" + txtOTP.Text + "'";
            dr = db.readall(st);
            if (dr.Read())
            {
              // mydb.ExpDate();
                divPanel.Visible = true;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "<script>alert('Invalid OTP')</script>", false);
            }
        }
    }
}