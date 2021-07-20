using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MsgMenu : System.Web.UI.Page
{
    int RecId = 1;
    int SendId = 2;

    string st = "";
    mydb db = new mydb();

    protected void Page_Load(object sender, EventArgs e)
    {
        //txtMsg.Focus();
        if (Session["UserId"] == null)
        {
            Response.Redirect("/Login.aspx");
        }
        if (!IsPostBack)
        {
           
            FillData();
            p.InnerHtml = Session["FullName"].ToString();
        }
    }

    void FillData()
    {
        
        GC.Collect();
        // UserId = 1
        // Rec = 2

        // UserId = 2
        // Rec = 1
        st = @"SELECT TblChat.Name,TblChat.ChatId,TblChat.Type, TblChat.SendId, TblChat.RecId, TblChat.Msg 
               FROM TblChat  WHERE (TblChat.SendId = " + Session["UserId"] + ") AND (TblChat.RecId = " + Request.QueryString["id"] + ") OR (TblChat.SendId = " + Request.QueryString["id"] + ") AND (TblChat.RecId = " + Session["UserId"] + ")";

        db.fill_rptr_ret_sqlda(st, rpt1); // For Filling Data
        db.dbClose();
        foreach (RepeaterItem item in rpt1.Items)
        {
            
            LinkButton lnkView = (LinkButton)item.FindControl("lnkView");
            HiddenField hfId = (HiddenField)item.FindControl("hfId");
            if (hfId.Value != "Normal")
            {
                lnkView.Visible = true;
            }
            else
            {
                lnkView.Visible = false;
            }
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        FillData();
        GC.Collect();
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        string msg = txtMsg.Text;
        if (ddl.SelectedItem.Text != "Normal")
        {
            // Do Encryption Part 
            msg = EncCS.Encrypt(msg); 
        }
        st = "Insert into tblChat(RecId,SendId,Msg,MsgDate,Type,Name) values ";
        st += "('" + Request.QueryString["id"] + "','" + Session["UserId"] + "','" + msg + "',GETDATE(),'" + ddl.SelectedItem.Text + "','" + Session["FullName"] + "')"; 
        db.ExeQuery(st); // Save into tblChat 

        txtMsg.Text = "";
        FillData();
    }

    protected void rpt1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        LinkButton lnkView = (LinkButton)e.Item.FindControl("lnkView");

        Response.Redirect("ViewTxtMsg.aspx?id=" + e.CommandArgument);
    }


}