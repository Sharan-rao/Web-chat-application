using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Drawing;
using System.Web.SessionState;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
//using Microsoft.Office.Interop.Excel;
/// <summary>
/// Summary description for mydb
/// </summary>
public class mydb
{
    List<ListItem> list = new List<ListItem>();
    SqlDataAdapter sqlda;
    SqlCommand cm;
    public SqlConnection db;
    string cn = "";
    public static DataSet ds = new DataSet();
    SqlDataReader dr;
    int x;
    public mydb()
    {
        try
        {
            // cn = ConfigurationManager.AppSettings["con"];
            //db = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=" + HttpContext.Current.Server.MapPath("~/App_Data/") + "OnlineFood.mdf;Integrated Security=True;User Instance=True");
            //db = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\liberty\Documents\karthik.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
            //db = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\liberty\Documents\event.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
            db = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HP\Documents\Chat-APP.mdf;Integrated Security=True;Connect Timeout=30");
            if (db.State == ConnectionState.Open)
            {
                db.Close();
            }
            db.Open();
        }
        catch (Exception) { }
    }
    public void dbClose()
    {
        if (db.State == ConnectionState.Open)
        {
            db.Close();
        }
    }

    
    public int ExeQuery(string st)
    {
        try
        {
            if (db.State == ConnectionState.Closed)
            {
                db.Open();
            }
            cm = new SqlCommand(st, db);
            x = cm.ExecuteNonQuery();
        }
        catch (Exception ex) { }
        return x;

    }

    public SqlDataReader fill_dropdown(string st, DropDownList drop)
    {
        try
        {
            if (db.State == ConnectionState.Closed)
            {
                db.Open();
            }
            cm = new SqlCommand(st, db);
            dr = cm.ExecuteReader();
            if (dr.HasRows == true)
            {
                while (dr.Read() == true)
                {
                    if (dr[0].ToString().Trim() != "" || dr[0].ToString().Trim().Length != 0)
                    {
                        drop.Items.Add(dr[0].ToString().Trim());
                    }
                }

            }
            dr.Dispose();
        }
        catch (Exception) { }
        return dr;

    }

    public SqlDataReader readall(string st)
    {
        try
        {
            if (db.State == ConnectionState.Closed)
            { db.Open(); }
            cm = new SqlCommand(st, db);
            dr = cm.ExecuteReader();

        }
        catch (Exception) { }
        return dr;

    }
    public SqlDataAdapter fill_rptr_ret_sqlda(string st, Repeater r1)
    {
        try
        {
            cm = new SqlCommand(st, db);
            sqlda = new SqlDataAdapter(cm);
            ds = new DataSet();
            ds.Tables.Clear();
            sqlda.Fill(ds, "tbl");
            r1.DataSource = null;
            r1.DataBind();
            r1.DataSource = ds.Tables["tbl"];
            r1.DataBind();
            db.Close();

        }
        catch (Exception ex) { }
        return sqlda;
    }
    
    public void fill_drop_with_id(string st, DropDownList drop)
    {
        try
        {
            if (db.State == ConnectionState.Closed)
            { db.Open(); }
            cm = new SqlCommand(st, db);
            dr = cm.ExecuteReader();
            //try
            //{
            list.Clear();
            drop.Items.Clear();
            //}
            //catch (Exception ex) { } 
            while (dr.Read() == true)
            {
                if (dr[1].ToString() != "" || dr[1].ToString().Length != 0)
                {
                    list.Add(new ListItem(dr[1].ToString(), dr[0].ToString()));
                }
            }
            drop.DataSource = list;
            drop.DataTextField = "Text";
            drop.DataValueField = "Value";
            drop.DataBind();
            drop.Items.Insert(0, "Select");
            dr.Dispose();

        }
        catch (Exception) { }
        db.Close();
    }
  
}